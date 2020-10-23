<!DOCTYPE html>
<html lang="en">
<?php
    if (session_status() == PHP_SESSION_NONE) {
        session_start();
    }

    $login = "MYNTS_SOLUSINDO";
    $password = "PassMYNTS99";
    $merchantID = "936005030000048555";
    $storeID = "ID2020081400023";
    $posID = "A01";

    include('layouts/head.php');
    include('config.php');
    include("qrcode.php");
    
    $config = new Config();
    $conn = new mysqli($config->local()[0], $config->local()[1], $config->local()[2], $config->local()[3]);
// echo "<pre>";
// print_r($_POST);
// die;
    $ttlamount = 0;
    $type = $_POST["category"];

    if($type == 1){
        //ORDER PPOB
        $ttlamount = $_POST['price'];

        $_SESSION["order"]["id_pelanggan"] = $_POST['id_pelanggan'];
        $_SESSION["order"]["id_detail"] = $_POST['id_detail'];
        $_SESSION["order"]["ttlamount"] = $_POST['price'];
        $_SESSION["order"]["category"] = $_POST['category'];
        $_SESSION["order"]["code"] = $_POST['code'];
        $_SESSION["order"]["method"] = $_POST['method'];
    }else{
        //ORDER MIE
        $data_order = $_POST["item"];

        foreach($data_order as $item){
            $ttlamount += ($item["ext_price"] != 0)? $item["ext_price"] + $item["price"] : $item["price"];
        }

        $_SESSION["order"]["id_detail"] = $_POST['id_detail'];
        $_SESSION["order"]["item"] = $_POST['item'];
        $_SESSION["order"]["ttlamount"] = $ttlamount;
        $_SESSION["order"]["category"] = $_POST['category'];
    }
    $pos = $_SESSION["order"]["position"];

    // TESTING
    $nobu_resp = generate_qris($ttlamount, $pos);
    // END TESTING
    // $nobu_resp = generate_qris($ttlamount, $pos);
    $transactionNo = $nobu_resp["data"]->transactionNo;
    $referenceNo = $nobu_resp["data"]->referenceNo;
    $_SESSION["order"]["qris_temp"] = $nobu_resp["qris"];

/***** UNTUK BYPASS *****/
    $_SESSION["order"]['trxno'] = $transactionNo;
    $_SESSION["order"]['reffno'] = $referenceNo;
/***** UNTUK BYPASS *****/
?>
<style>
	#time{font-size: 50px;font-weight: 600;}
    .selected-topping img{padding: 0px 15px;max-width: 100px;float:left;}
    table img{max-width: 50px}
</style>
    <body>
        <div class="container mb-5">
            <div class="row mt-3">
                <div class="col-4 offset-md-4">
                    <a href="process.php" class="btn btn-success col-md-12">Bypass</a>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4 offset-md-4 text-center">
                    <h2>Scan QR Code</h2>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12" style="display: flex;justify-content: center;">
                    <img style="height: 60vh;" src="<?= $nobu_resp['qris'] ?>" />
                </div>
            </div>
            <div class="row">
            	<div class="col-md-12 text-center">
            		<span id="time">01:00</span>
            	</div>
            </div>
            <div class="row">
                <div class="col-4 offset-md-4 text-center">
                    <button type="button" class="btn btn-primary col-12" onclick="window.location.href='index.php';">Back</button>
                </div>
            </div>
        </div>
        <!-- <form method="POST" action="process.php"> -->
        	<!-- <div class="row"> -->
	        	<!-- <input name="no_trx_ppob" id="no_trx_ppob" value="" class="form-control" type="hidden"> -->
	        	<!-- <input name="type" value="<?= $type ?>" class="form-control" type="hidden"> -->
	        	<!-- <input type="submit" id="submit" name="submit" style="display: none"> -->
	        <!-- </div> -->
        <!-- </form> -->
    </body>
    <script>
    	
        if ( window.history.replaceState ) {
            window.history.replaceState( null, null, window.location.href );
        }
        
        var counter = 1;

        setInterval(function(){
            $.ajax({
                type: "POST",
                url: "cekpayment.php",
                dataType: "JSON",
                data:
                {
                    storeid:'<?php echo $storeID ?>',
                    posid:'<?php  echo $posID ?>',
                    amount:'<?php echo $ttlamount ?>',
                    trxno:'<?php echo $transactionNo ?>',
                    reffno:'<?php echo $referenceNo ?>',
                    type:'<?php echo $type ?>',
                },
                success: function(res){
                    if(res.success){
                        window.location.href = 'process.php'
                    }else{
                        console.log("WAITING. . .");
                    }
                }
            });
        }, 5000);

        var reload_qris = setInterval(function(){
            window.location.href = 'index.php'
        }, 61000);

        //timer
        function startTimer(duration, display) {
		    var timer = duration, minutes, seconds;
		    setInterval(function () {
		        minutes = parseInt(timer / 60, 10);
		        seconds = parseInt(timer % 60, 10);

		        minutes = minutes < 10 ? "0" + minutes : minutes;
		        seconds = seconds < 10 ? "0" + seconds : seconds;

		        display.textContent = minutes + ":" + seconds;

		        if (--timer < 0) {
		            timer = duration;
		        }
		    }, 1000);
		}

		window.onload = function () {
		    var duration = 60 * 1,
		        display = document.querySelector('#time');
		    startTimer(duration, display);
		};
    </script>
</html>

<!-- 
    NOTE: 
    *** transaction_master->Status:
            - 1 = WAITING
            - 2 = PAID
    *** Asumsi => 
            - semua jenis order (mie atau PPOB) no_trx_master-nya lanjut/tidak berbeda
            - pembayaran transaksi pasti berhasil

    *** ??? =>
    	- Integrasi NoTrxPPOB setelah payment success, masukin ke cek payment
    
-->
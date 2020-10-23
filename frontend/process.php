<?php 
    include('layouts/head.php');
    include('config.php');

    session_start();

    $config = new Config();
    $conn = new mysqli($config->local()[0], $config->local()[1], $config->local()[2], $config->local()[3]);

    if(!isset($_SESSION['order']['trxno'])){
        header("location: index.php");
    }

    $iddetail = $_SESSION['order']["id_detail"];
    $type = $_SESSION['order']["category"];
    $no_trx = $_SESSION['order']['trxno'];
    $type = $_SESSION['order']['category'];
    $ttlamount = $_SESSION['order']['ttlamount'];
    $no_trx_ppob = "null";

    if($type == 1){
        $data['method'] = $_SESSION['order']['method'];
        $data['code'] = $_SESSION['order']['code'];
        $data['customer_id'] = $_SESSION['order']['id_pelanggan'];
        $data['type'] = $type;

        $req_ppob = $config->request_ppob($data);
        
        /**** UNCOMMENT UNTUK LIVE ****/
        // $dcd_req_ppob = json_decode($req_ppob);

        $dcd_req_ppob = $req_ppob;

        if(!isset($dcd_req_ppob->ERROR)){
            $no_trx_ppob = $dcd_req_ppob->REF2;
        }else{
            die("error ppob");
        }
        // die;

        //ORDER PPOB
        $idpelanggan = $_SESSION['order']['id_pelanggan'];

        $column = "`no_trx_master`, `id_prd_detail`, `price`, `customer_id`, `no_trx_ppob`, `type`";

        $arr_trx_detail[] = "('".$no_trx."', ".$iddetail.", ".$ttlamount.", ".$idpelanggan.", '".$no_trx_ppob."', ".$type.")";

    }else{
        //ORDER MIE
        $data_order = $_SESSION['order']["item"];
        $column = "`no_trx_master`, `id_prd_detail`, `topping`, `spice`, `price`, `type`";

        //SQL TRX DETAIL
        $arr_trx_detail = array();

        foreach($_SESSION['order']["item"] as $idx => $item){
            $arr_topp = array();

            foreach($item["topping"] as $id_topp => $topp){
                if($topp != 0){
                    array_push($arr_topp, $id_topp);
                }
            }
            $topping = (!empty($arr_topp))? "'".json_encode($arr_topp)."'" : 'null';
            $spice = (!empty($item["spice"]))? $item["spice"] : 0;
            $price = ($item["ext_price"] != 0)? $item["ext_price"] + $item["price"] : $item["price"];

            //data input transaction_detail MIE
            $arr_trx_detail[] = "('".$no_trx."', ".$iddetail.", ".$topping.", '".$spice."', ".$price.", ".$type.")";
        }
    }
    
    //SAVE TRX MASTER
    $sql_trx_master = "INSERT INTO `transaction_master`(`no_trx`, `created_at`, `name`, `total_price`, `type`) VALUES 
        ('".$no_trx."', '".date('Y-m-d h:i:s')."', 'test',  ".$ttlamount." ,".$type.")";

    if($conn->query($sql_trx_master) === TRUE){
        //SAVE TRX DETAIL

        $sql_trx_detail = "INSERT INTO `transaction_detail`(".$column.") VALUES ".implode(",", $arr_trx_detail);
        
        if($conn->query($sql_trx_detail) !== TRUE){
            echo "transaksi gagal 2";
            die;
        }

        // unlink($_SESSION['order']['qris_temp']);//uncomment ketika live
        session_destroy();
    }else{
        print_r($conn->error);
        echo "transaksi gagal 1";
            die;
    }

?>
<link rel="stylesheet" href="assets/loading.css">
<div class="row">
    <div class="loader">
        <div class="ring"></div>
        <h2 id="wait">Mohon Menunggu. . .</h2>
        <h2 id="thx" style="display: none">Pesanan Anda sudah diproses, Terima Kasih</h2>
    </div>
</div>

<script>
    var type = <?= $type ?>;
    var no_trx_ppob = <?= $no_trx_ppob ?>;

    if(type == 1){
        var checkppob = setInterval(function(){
            $.ajax({
                type: "POST",
                url: "cekppob.php",
                dataType: "JSON",
                data:
                {
                    no_trx_ppob:no_trx_ppob
                },
                success: function(res)
                {
                    if(res.success){
                        clearInterval(checkppob);
                        $(".loader").find(".ring").attr("style", "display:none")
                        
                        $("#wait").attr("style", "display:none");
                        $("#thx").fadeIn("slow");
                       
                        setInterval(function(){
                            window.location.href = 'index.php'
                        }, 3000)
                    }
                }
            });
        }, 3000);
    }else{
        console.log("mie");
        var checkmie = setInterval(function(){
            clearInterval(checkmie);

            $(".loader").find(".ring").attr("style", "display:none")
            
            $("#wait").attr("style", "display:none");
            $("#thx").fadeIn("slow");
           
            setInterval(function(){
                window.location.href = 'index.php'
            }, 3000)
        }, 3000);
    }
</script>
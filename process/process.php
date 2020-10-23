<?php 
	include("../frontend/layouts/head.php");
	include("../frontend/config.php");

	$config = new Config();
    $conn = new mysqli($config->local()[0], $config->local()[1], $config->local()[2], $config->local()[3]);

    $sql = "SELECT tm.no_trx , td.type, td.id id_detail
    		FROM transaction_detail td 
    		LEFT JOIN transaction_master tm ON tm.no_trx = td.no_trx_master 
    		WHERE td.status = 1
    		ORDER BY td.type DESC, td.id ASC";
    $result = $conn->query($sql);
    $data = $result->fetch_all(MYSQLI_ASSOC);

    if(isset($_POST['no_trx'])){
    	$no_trx = $_POST['no_trx'];
    	$type = $_POST['type'];
    	$id_detail = $_POST['id_detail'];

    	$sql = "UPDATE `transaction_detail` SET `status`=2 WHERE no_trx_master = '".$no_trx."' AND id='".$id_detail."'";
    	$upd_detail = $conn->query($sql);

    	$sql2 = "SELECT id FROM `transaction_detail` WHERE no_trx_master = '".$no_trx."' AND status = 1";
    	$result = $conn->query($sql2);

    	if($result->num_rows == 0){
    		$sql3 = "UPDATE `transaction_master` SET `status`=2 WHERE no_trx = '".$no_trx."'";
    		$upd_master = $conn->query($sql3);
    	}

    	header("Refresh:0");
    }
?>
<div class="container">
	<div class="row mt-5">
		<div class="col-md-2">
			<button class="btn btn-primary">PPOB</button>
		</div>
		<div class="col-md-2">
			<button class="btn btn-success">Mie</button>
		</div>
		<div class="col-md-8 ">
			<h2>LIST TRANSAKSI</h2>
		</div>
	</div>
	<hr>
	<?php foreach($data as $dt){ ?>
	<form method="POST" style="margin-bottom: 0px">
		<input name="no_trx" value="<?= $dt['no_trx'] ?>" type="hidden">
		<input name="type" value="<?= $dt['type'] ?>" type="hidden">
		<input name="id_detail" value="<?= $dt['id_detail'] ?>" type="hidden">
		<button type="submit" class="btn <?= ($dt['type'] == 1)? 'btn-primary' : 'btn-success' ?>"><?= $dt['no_trx']." (".$dt['id_detail'].")" ?></button><br><br>
	</form>
	<?php } ?>
</div>
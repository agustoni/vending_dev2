<?php 

	include('config.php');

	$config = new Config();
	$con_ppob = new mysqli($config->trx()[0], $config->trx()[1], $config->trx()[2], $config->trx()[3]);
	// $con_ppob = new mysqli($config->rajabiller()[0], $config->rajabiller()[1], $config->rajabiller()[2], $config->rajabiller()[3]);
	$no_trx_ppob = $_POST['no_trx_ppob'];

	$sql = "SELECT * FROM rajabiller WHERE id_transaksi = '$no_trx_ppob'";
	$res = $con_ppob->query($sql);
	$data = $res->fetch_assoc();

	if($data['keterangan'] == "SUCCESS"){
		echo json_encode(['success'=>true]);
	}else{
		echo json_encode(['success'=>false]);
	}
?>
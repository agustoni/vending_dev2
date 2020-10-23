<?php 
	include("config.php");

	$config = new Config();
	$conn = new mysqli($config->local()[0], $config->local()[1], $config->local()[2], $config->local()[3]);
	$con_pusat = new mysqli($config->trx()[0], $config->trx()[1], $config->trx()[2], $config->trx()[3]);

	//data tipe material
	$sql = "SELECT id FROM material_type";
	$query = $conn->query($sql);
	$data_type = $query->fetch_all();

	$arr_id_type = array();

	foreach($data_type as $ty){
		array_push($arr_id_type, $ty[0]);
	}

	// $str_id_type = implode(",", $arr_id_type);
	$str_id_type = "1,2";

	//Ambil data stock local
	$id_machine = "AA001";
	$sql = "SELECT id, id_machine, material, code, stock FROM materials WHERE id_machine = '".$id_machine."' AND id_mtr_type IN (".$str_id_type.")";
	$query = $conn->query($sql);
	$stock_local = $query->fetch_all(MYSQLI_ASSOC);

	$arr_param_stock = array();
	$arr_param_code = array();

	foreach($stock_local as $dlc){
		//ambil data perubahan stock
		$str_param_stock = "";
		$str_param_stock = "WHEN '".$dlc['material']."' THEN '".$dlc['stock']."'";
		array_push($arr_param_stock, $str_param_stock);

		//ambil data perubahan code/barcode
		$str_param_code = "";
		$str_param_code = "WHEN '".$dlc['material']."' THEN '".$dlc['code']."'";
		array_push($arr_param_code, $str_param_code);

		
	}

	$param_stock = implode(" ", $arr_param_stock);
	$param_code = implode(" ", $arr_param_code);

	$sql_update_pusat = "UPDATE materials SET stock = (CASE material ".$param_stock." END), code = (CASE material ".$param_code." END)
						WHERE id_mtr_type IN(".$str_id_type.") AND id_machine = '".$id_machine."'";
	// $update_pusat = $con_pusat->query($sql_update_pusat);

	echo "<pre>";
	echo $sql_update_pusat." record updated!<br>";
	die("done!");
?>
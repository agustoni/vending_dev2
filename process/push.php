<?php 
	include("../frontend/config.php");

	$config = new Config();
	$conn = new mysqli($config->local()[0], $config->local()[1], $config->local()[2], $config->local()[3]);

	//connection pusat
	$conn_pusat = new mysqli($config->trx()[0], $config->trx()[1], $config->trx()[2], $config->trx()[3]);


/***** PUSH DATA TRX MASTER DAN DETAIL *****/
	$sql = "SELECT tm.id id_trx_master, tm.no_trx, tm.created_at, tm.total_price, tm.type,
					td.id id_trx_detail, td.id_prd_detail, td.topping, td.spice, td.price, td.no_trx_ppob, td.customer_id
			FROM transaction_master tm
			LEFT JOIN transaction_detail td ON tm.no_trx = td.no_trx_master
			WHERE tm.flag = 0 AND tm.status = 2
			ORDER BY tm.no_trx ASC";

	$query = $conn->query($sql);
	$result = $query->fetch_all(MYSQLI_ASSOC);


	$arr_master = array();
	$arr_detail = array();
	$update_flag = array();
	$prev_no_trx = "";

	//tampung data yang mau di push ke dalam array
	foreach($result as $r){
		$str_master = "";
		$str_detail = "";

		if(empty($prev_no_trx)){
			$str_master = "('".$r['no_trx']."', '".$r['created_at']."', '".$r['name']."', ".$r['total_price'].", ".$r['type'].", '2')";
			$str_detail = "('".$r['no_trx']."', ".$r['id_prd_detail'].", '".$r['topping']."', '".$r['spice']."', ".$r['type'].", ".$r['price'].", '".$r['no_trx_ppob']."', '".$r['customer_id']."', '2')";

			array_push($arr_master, $str_master);
			array_push($arr_detail, $str_detail);

			array_push($update_flag, $r['id_trx_master']);//update flag
		}else{
			if($prev_no_trx != $r['no_trx']){
				$str_master = "('".$r['no_trx']."', '".$r['created_at']."', '".$r['name']."', ".$r['total_price'].", ".$r['type'].", '2')";
				array_push($arr_master, $str_master);

				array_push($update_flag, $r['id_trx_master']);//update flag
			}
			$str_detail = "('".$r['no_trx']."', ".$r['id_prd_detail'].", '".$r['topping']."', '".$r['spice']."', ".$r['type'].", ".$r['price'].", '".$r['no_trx_ppob']."', '".$r['customer_id']."', '2')";
			array_push($arr_detail, $str_detail);
		}

		$prev_no_trx = $r['no_trx'];
	}

	//buat querynya dengan values dari array sebelumnya, dan di-implode
	$query_master = "INSERT INTO transaction_master (`no_trx`, `created_at`, `name`, `total_price`, `type`, `status`) VALUES ".implode(",", $arr_master);
	$push_master = $conn_pusat->query($query_master);

	$query_detail = "INSERT INTO transaction_detail (`no_trx_master`, `id_prd_detail`, `topping`, `spice`, `type`, `price`, `no_trx_ppob`, `customer_id`, `status`) VALUES".implode(",", $arr_detail);
	$push_detail = $conn_pusat->query($query_detail);

	// update flag yang sudah di-push datanya
	$query_flag = "UPDATE transaction_master SET flag = 1 WHERE id IN(".implode(',', $update_flag).")";
	$update_flag = $conn->query($query_flag);
/***** END PUSH DATA TRX MASTER DAN DETAIL *****/

/***** PUSH DATA STOCK MACHINE *****/
	$id_mesin = "AA001";
	//data tipe material
	$sql = "SELECT id FROM material_type";
	$query = $conn->query($sql);
	$data_type = $query->fetch_all();

	$arr_id_type = array();

	foreach($data_type as $ty){
		array_push($arr_id_type, $ty[0]);
	}

	$str_id_type = implode(",", $arr_id_type);

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
	$update_pusat = $conn_pusat->query($sql_update_pusat);

/***** END PUSH DATA STOCK MACHINE *****/


	/**** NOTE ****/
	/*
		1. BUAT CRONJOB UNTUK MENJALANKAN SCRIPT INI
		2. DATA YANG DI-PUSH:
			- TRX_MASTER
			- TRX_DETAIL
			- UPDATE FLAG TRX_MASTER
			- UPDATE/INSERT STOCK MESIN
	*/
	echo "transaction_master: ".count($arr_master)." record<br>";
	echo "transaction_detail: ".count($arr_detail)." record<br><br>";
	echo "materials (stock): ".$conn_pusat->affected_rows." record<br><br>";

	die("data pushed!!!!!");
?>
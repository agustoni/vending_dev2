<?php 
	include('config.php');

	$config = new Config;
	$conn = new mysqli($config->local()[0], $config->local()[1], $config->local()[2], $config->local()[3]);

	$sql = "SELECT * FROM machine";
	$query = $conn->query($sql);
	$data_machine = $query->fetch_all(MYSQLI_ASSOC);

	$sql2 = "SELECT pd.id, pd.selling_price
			FROM product_detail pd
			LEFT JOIN product p ON p.id = pd.id_product
			WHERE pd.status = 1 AND p.id_category = 1";
	$query = $conn->query($sql2);
	$data_product_ppob = $query->fetch_all(MYSQLI_ASSOC);

	$sql3 = "SELECT pd.id, pd.selling_price
			FROM product_detail pd
			LEFT JOIN product p ON p.id = pd.id_product
			WHERE pd.status = 1 AND p.id_category = 2";
	$query = $conn->query($sql3);
	$data_product_mie = $query->fetch_all(MYSQLI_ASSOC);
	
	$sql_trx_master = array();
	$sql_trx_detail = array();
	$sql_trx_pusat = array();

	// echo "<pre>";
	// print_r($data_machine);
	// die;

	foreach($data_machine as $dm){
		for($i=1;$i<=50;$i++){
			$type = mt_rand(1,2);
			$created_at = rand_date()['created_at'];
			$machinde_trx_date = rand_date()['no_trx_date'];
			$id_machine = $dm['machine_code'];
			$no_trx = $id_machine.$machinde_trx_date.str_pad(mt_rand(1,9999), 4, "0", STR_PAD_LEFT);
			$total = 0;
			$store_id = $dm['store_id'];
			$pos_id = $dm['pos_id'];
			$no_ref = $id_machine.$machinde_trx_date.str_pad(mt_rand(1,9999), 4, "0", STR_PAD_LEFT);

			if($type == 1){
				$detail_ppob = $data_product_ppob[array_rand($data_product_ppob)];
				$total = $detail_ppob['selling_price'];

				$col_detail = "('".$no_trx."', ".$detail_ppob['id'].", null, null, ".$type.", ".$total.", '".randomNumber(9)."', '".randomNumber(12)."', 1)";
				array_push($sql_trx_detail, $col_detail);
				// echo $col_detail."====> PPOB<br>";
			}else{
				for($j=1;$j<=mt_rand(1,3);$j++){
					$detail_mie = $data_product_mie[array_rand($data_product_mie)];	
					$topping = array('[6]','[7]','[6,7]', null);
					$spice = array(0, 1, 2, 3, 4, 5);

					$price = $detail_mie['selling_price'];

					$sel_topping = $topping[array_rand($topping)];
					$sel_spice = $spice[array_rand($spice)];

					if($sel_topping == '[6]'){
						$price += 5000;
					}else if($sel_topping == '[7]'){
						$price += 3000;
					}else{
						$price += 8000;
					}

					$col_detail = "('".$no_trx."', ".$detail_mie['id'].", '".$sel_topping."', ".$sel_spice.", ".$type.", ".$price.", null, null, 1)";
					array_push($sql_trx_detail, $col_detail);
					// echo $col_detail."====> MIE<br>";

					$total += $price;
				}
				
			}
			
			$col_master = "('".$no_trx."', '".$created_at."', 'test', '".$total."', '".$type."', 1)";
			array_push($sql_trx_master, $col_master);

			//data tbltransaksi pusat
			$col_pusat = "('".$store_id."', '".$pos_id."', '".$no_trx."', '".$no_ref."', ".$total.", '".$created_at."', 'PAID')";
			array_push($sql_trx_pusat, $col_pusat);
			// echo $col_master." ===== master ===== <hr>";
		}
	}

	//`storeid`, `posid`, `trxno`, `reffno`, `amount`, `trxdt`, `pymstt`

	$str_sql_master = implode(",", $sql_trx_master);
	$str_sql_detail = implode(",", $sql_trx_detail);
	$str_sql_pusat = implode(",", $sql_trx_pusat);

	$query_master = "INSERT INTO transaction_master (`no_trx`, `created_at`, `name`, `total_price`, `type`, `status`) VALUES ".$str_sql_master;
	$query_detail = "INSERT INTO transaction_detail (`no_trx_master`, `id_prd_detail`, `topping`, `spice`, `type`, `price`, `no_trx_ppob`, `customer_id`, `status`) VALUES ".$str_sql_detail;
	$query_pusat = "INSERT INTO tbltransaksi (`storeid`, `posid`, `trxno`, `reffno`, `amount`, `trxdt`, `pymstt`) VALUES ".$str_sql_pusat;

	echo "<h2>MASTER</h2>".$query_master."<br><br><h2>DETAIL</h2>".$query_detail."<br><br><h2>TBLTRANSAKSI</h2>".$query_pusat;

	function rand_date(){
		// $min = strtotime("2020-01-01 00:00:00");
		$min = strtotime("2020-10-01 00:00:00");
		$max = strtotime("2020-10-20 23:59:59");

		$rand_date = mt_rand($min, $max);
		$return['created_at'] = date("Y-m-d h:i:s",$rand_date);
		$return['no_trx_date'] = date("ymd", $rand_date);

		return $return;
	}

	function randomNumber($length) {
	    $result = '';
	    for($i = 0; $i < $length; $i++) {
	        $result .= mt_rand(0, 9);
	    }
	    return $result;
	}

	
?>
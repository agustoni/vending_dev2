<?php
	session_start();
	include('config.php');

	//data test
	// $storeid = "ID2020081400023";
	// $posid = "A01";
	// $trxno = "test_mynts_0195";
	// $reffno = "test_mynts_0195";
	// $amount = 10000;
	// $type = 1;
	// $notrxmaster = "P000013";
	//data test

	$success = false;
	$messages = "";
	// $no_trx_ppob = "";
	//data test

	$config = new Config();
	$con = new mysqli($config->trx()[0], $config->trx()[1], $config->trx()[2], $config->trx()[3]);
	$con_loc = new mysqli($config->local()[0], $config->local()[1], $config->local()[2], $config->local()[3]);
	// $con_ppob = new mysqli($config->rajabiller()[0], $config->rajabiller()[1], $config->rajabiller()[2], $config->rajabiller()[3]);
	
	$storeid = trim(mysqli_real_escape_string($con,stripslashes($_POST['storeid'])));
	$posid = trim(mysqli_real_escape_string($con,stripslashes($_POST['posid'])));
	$trxno = trim(mysqli_real_escape_string($con,stripslashes($_POST['trxno'])));
	$reffno = trim(mysqli_real_escape_string($con,stripslashes($_POST['reffno'])));
	$amount = trim(mysqli_real_escape_string($con,stripslashes($_POST['amount'])));
	// $notrxmaster = trim(mysqli_real_escape_string($con,stripslashes($_POST['notrxmaster'])));
	
	$sq = "SELECT * FROM tbltransaksi WHERE storeid = '$storeid' AND posid = '$posid' AND trxno = '$trxno' AND reffno = '$reffno' AND amount = $amount";
	$rs = mysqli_query($con, $sq);
	$res = mysqli_fetch_assoc($rs);
	$rw = mysqli_num_rows($rs);

	$pymstt = $res['pymstt'];

	if ($rw > 0 && $pymstt == "PAID"){
		$success = true;
		$_SESSION["order"]['trxno'] = $trxno;
		$_SESSION["order"]['reffno'] = $reffno;
	}

	echo json_encode(['success'=>$success, 'messages'=>$messages]);
?>
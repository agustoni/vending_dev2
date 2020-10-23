<?php 
    include('assets/phpqrcode/qrlib.php');

    function generate_qris($ttlamount, $pos){
        $config = new Config();
        
        global $login;
        global $password;
        global $merchantID;
        global $storeID;
        global $posID;

        $contrx = new mysqli($config->trx()[0], $config->trx()[1], $config->trx()[2], $config->trx()[3]);
        // TESTING
        $machine_code = substr($pos, 0, 5);
        $sqlmachine = "SELECT * FROM machine where machine_code = '$machine_code'";
        $machine = $contrx->query($sqlmachine);
        $machine_ = $machine->fetch_assoc();
        // print_r($machine_);
        // END TESTING
        $sqno = "SELECT * FROM tbltransaksi WHERE storeid = '".$machine_['store_id']."' AND posid = '".$machine_['pos_id']."' ORDER BY trxno DESC LIMIT 1";
        // echo $sqno;die;
        $rsno = $contrx->query($sqno);
        $resno = $rsno->fetch_assoc();
        if ($rsno->num_rows > 0){
            $nobukti = $pos. sprintf("%04d",substr($resno['trxno'],-4)+1);
        }else{
            $nobukti = $pos."0001";
        }

        $transactionNo = "$nobukti";
        $referenceNo = "$nobukti";
        $amount = $ttlamount;
        $validTime = "120";
        $secretKey = "SecretNobuKey";
        $signature = MD5($login . $password . $merchantID . $storeID . $posID . $transactionNo . $referenceNo . $amount . $validTime . $secretKey);

/***** SCRIPT UNTUK TESTING  *****/
        $dt = date('Y-m-d H:i:s');
        $sq = "INSERT INTO tbltransaksi (storeid, posid, trxno, reffno, amount, trxdt, pymstt) VALUES 
                ('$storeID','$posID','$transactionNo','$referenceNo',$amount,'$dt', 'PAID')";

        $rs = $contrx->query($sq);

        $tempdir = "temp/"; //Nama folder tempat menyimpan file qrcode
        $namaFile= "test_qr.png";

        $datatest = (object) array(
            "data"=>(object) array(
                "transactionNo" => $transactionNo,
                "referenceNo" => $referenceNo
            )
        );

        $arrResponse = [
            "status" => "Success",
            "responseCode" => "211000",
            "data" => $datatest->data,
            "qris" => $tempdir.$namaFile
        ];

        return $arrResponse;
/***** END SCRIPT UNTUK TESTING  *****/

/***** SCRIPT UNTUK LIVE *****/
        // $postfields = array(
        //     "login" => $login,
        //     "password" => $password,
        //     "merchantID" => $merchantID,
        //     "storeID" => $storeID,
        //     "posID" => $posID,
        //     "transactionNo" => $transactionNo,
        //     "referenceNo" => $referenceNo,
        //     "amount" => $ttlamount,
        //     "validTime" => $validTime,
        //     "signature" => $signature,
        // );
        
        // $data = '{"data": "' . base64_encode(json_encode($postfields)) . '"}';
        
        // //curl
        // $curl = curl_init();

        // curl_setopt_array($curl, array(
        // CURLOPT_URL => "http://uatmerchant.nobubank.com:2101/general/Partner/GetQRISSinglePayment",
        // CURLOPT_RETURNTRANSFER => true,
        // CURLOPT_ENCODING => "",
        // CURLOPT_MAXREDIRS => 10,
        // CURLOPT_TIMEOUT => 0,
        // CURLOPT_FOLLOWLOCATION => true,
        // CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
        // CURLOPT_CUSTOMREQUEST => "POST",
        // CURLOPT_POSTFIELDS =>$data,
        // CURLOPT_HTTPHEADER => array(
        //     "Content-Type: application/json"
        // ),
        // ));

        // $response = curl_exec($curl);

        // curl_close($curl);
        
        // $result = json_decode($response);
        
        // $qr = $result->data;
        
        // $newdata = base64_decode($qr);
        
        // $result2 = json_decode($newdata);
        
        // $qrcode = $result2->data->qrisData;
        // //end curl
        
        // $dt = date('Y-m-d H:i:s');
        // $sq = "INSERT INTO tbltransaksi (storeid, posid, trxno, reffno, amount, trxdt) VALUES 
        //         ('$storeID','$posID','$transactionNo','$referenceNo',$amount,'$dt')";
        // $rs = $contrx->query($sq);
        
        // //start qrcode
        // $tempdir = "/frontend/temp/"; //Nama folder tempat menyimpan file qrcode
        // if (!file_exists($tempdir)) //Buat folder bername temp
        // mkdir($tempdir);

        // //isi qrcode jika di scan
        // $codeContents = $qrcode;
        // //nama file qrcode yang akan disimpan
        // $namaFile= $transactionNo . ".png";
        // //ECC Level
        // $level=QR_ECLEVEL_H;
        // //Ukuran pixel
        // $UkuranPixel=10;
        // //Ukuran frame
        // $UkuranFrame=4;

        // QRcode::png($codeContents, $tempdir.$namaFile, $level, $UkuranPixel, $UkuranFrame);

        // $arrResponse = [
        //     "status" => $result2->responseStatus,
        //     "responseCode" => $result2->responseCode,
        //     "data" => $result2->data,
        //     "qris" => $tempdir.$namaFile
        // ];

        // return $arrResponse;
/***** END SCRIPT UNTUK LIVE  *****/        
    }  
?>
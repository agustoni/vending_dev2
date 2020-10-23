<?php 
    date_default_timezone_set('Asia/Jakarta');
    class Config {

        private $servername;
        private $username;
        private $password;
        private $database;
       
        function local() {
            $this->servername = "localhost";
            $this->username = "root";
            $this->password = "";
            $this->database = "vending_dev2";

            return [$this->servername, $this->username, $this->password, $this->database];
        }

        function trx() {
            // $this->servername = "pirez-velasquez.com";
            // $this->username = "velasquez_romiero";
            // $this->password = "Wl%qhcygU4l(";
            // $this->database = "velasquez_romiero";

            $this->servername = "localhost";
            $this->username = "root";
            $this->password = "";
            $this->database = "vending_dev2_pusat";

            return [$this->servername, $this->username, $this->password, $this->database];
        }

        function rajabiller(){
            $this->servername = "service.custom.co.id";
            $this->username = "servicecustom";
            $this->password = "service.custom.co.id2019";
            $this->database = "servicec_vending";

            return [$this->servername, $this->username, $this->password, $this->database];
        }

        function request_ppob($data){
            /***** SCRIPT UNTUK TESTING  *****/
            $contrx = new mysqli($this->trx()[0], $this->trx()[1], $this->trx()[2], $this->trx()[3]);

            $uid = "FA9919";
            $pin = "414455";

            switch ($data["type"]) {
                case 1:
                    $post = [
                        "method"=>$data["method"],
                        "uid"=>$uid,
                        "pin"=>$pin,
                        "no_hp"=>$data["customer_id"],
                        "kodes_produk"=>$data["code"],
                        "ref1"=>""
                    ];
                break;
            }

            $sql = "SELECT count(*) counttrx FROM tbltransaksi";
            
            $query = $contrx->query($sql);
            $id_transaksi = $query->fetch_assoc()['counttrx']+1;

            $sql2 = "INSERT INTO rajabiller (id_transaksi, keterangan) values ('".$id_transaksi."', 'SUCCESS')";
            $insert = $contrx->query($sql2);

            $data_return = (object) [
                "REF2" => $id_transaksi
            ];

            return $data_return;
            /***** END SCRIPT UNTUK TESTING  *****/


            /***** SCRIPT UNTUK LIVE *****/
            // $post = json_encode($data);
            
            // $ch = curl_init();
            
            // curl_setopt($ch, CURLOPT_URL, "https://service.custom.co.id/site/testvm");
            // curl_setopt($ch, CURLOPT_POST, 1);
            // curl_setopt($ch, CURLOPT_POSTFIELDS, $post);
            // curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
            // $server_output = curl_exec($ch);
            // curl_close ($ch);
            // return $server_output;
            /***** END SCRIPT UNTUK LIVE *****/
        }

        function get_last_trx_id($type){
            $conn = new mysqli($this->local()[0], $this->local()[1], $this->local()[2], $this->local()[3]);

            if($type == 1){
                $sql = "SELECT no_trx FROM transaction_master WHERE no_trx LIKE '%P%' ORDER BY id DESC LIMIT 1";
            }else{
                $sql = "SELECT no_trx FROM transaction_master WHERE no_trx LIKE '%M%' ORDER BY id DESC LIMIT 1";
            }
            
            $id = $conn->query($sql)->fetch_assoc();

            return $id['no_trx'];
        }

        function request_check_balance(){
            $data['type'] = "balance";

            $post = json_encode($data);
            
            $ch = curl_init();
            
            curl_setopt($ch, CURLOPT_URL, "https://service.custom.co.id/site/testvm");
            curl_setopt($ch, CURLOPT_POST, 1);
            curl_setopt($ch, CURLOPT_POSTFIELDS, $post);
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
            $server_output = curl_exec($ch);
            curl_close ($ch);

            $response = json_decode($server_output);
            
            return $response->SALDO;
        }
    }

?>


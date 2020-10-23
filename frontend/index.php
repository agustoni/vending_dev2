<!DOCTYPE html>
<html lang="en">
    <?php 
        session_start();
        session_destroy();
   
        include('layouts/head.php') ;
        include('config.php');
        $config = new Config();
        $conn = new mysqli($config->local()[0], $config->local()[1], $config->local()[2], $config->local()[3]);
        
        $sql = "SELECT * FROM product where status = 1 ORDER BY sort ASC";
        $result = $conn->query($sql);

    ?>
    <style>
    	.conf-box{position: absolute;z-index: 1;top: 30%;left: 50%;transform: translate(-50%, -50%);width: 400px;border: 2px solid #b7b7b7;padding: 15px;border-radius: 6px;background-color: #fff;}
    </style>
    <body>
        <div class="container pt-5">
            <div class="row">
                <form class="form-inline" action="view_product_detail.php" id="formsubmit" method="POST">
                    <!-- TESTING -->
                    <div class="row">
                        <h4>UNTUK PPOB</h4>
                        <div class="form-group">
                            <label for="sel1">Posisi Mesin:</label>
                            <select class="form-control" id="sel1" name="position">
                                <option value="AA001<?= date("y") ?><?= date("m") ?><?= date("d") ?>">1</option>
                                <option value="AA002<?= date("y") ?><?= date("m") ?><?= date("d") ?>">2</option>
                                <option value="AA003<?= date("y") ?><?= date("m") ?><?= date("d") ?>">3</option>
                                <option value="AA004<?= date("y") ?><?= date("m") ?><?= date("d") ?>">4</option>
                                <option value="AA005<?= date("y") ?><?= date("m") ?><?= date("d") ?>">5</option>
                            </select>
                        </div>
                    </div>
                    <!-- TESTING -->
                    <div class="row">
                    <?php if ($result->num_rows > 0) {
                        if($result->num_rows == 1){
                            $grid = "col-12 mt-3";
                        }else if($result->num_rows == 2){
                            $grid = "col-6 mt-3";
                        }else{
                            $grid = "col-4 mt-3";
                        }
                        foreach($result->fetch_all(MYSQLI_ASSOC) as $dt){ 
                                if($dt['id_category'] == 1){
                                    $btnType = "submit";
                                    $class = "";
                                }else{
                                    $btnType = "button";
                                    $class = "mdl-mie";
                                }
                            ?>
                            <div class="<?= $grid ?>">
                                <div class="card-item col-12">
                                    <button class="btn <?= $class ?>" value="<?= $dt['id'] ?>" type="<?= $btnType ?>" name="id_product">
                                        <img class="card-img-top" src="assets/images/<?= $dt['image'] ?>" alt="Card image" style="width:100%">
                                    </button>
                                </div>
                            </div>
							<?php 
                        }
                    } 
                    ?>
                    </div>
                </form>
            </div>
        </div>

        <!-- Modal MIE -->
        <div class="modal fade" id="modal-qty" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Masukan Jumlah Pesanan Anda</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form id="form-qty" action="view_mie_detail.php" method="post">
                            <!-- TESTING -->
                            <div class="row">
                                <div class="form-group">
                                    <label for="sel1">Posisi Mesin:</label>
                                    <select class="form-control" id="sel1" name="position">
                                        <option value="AA001<?= date("y") ?><?= date("m") ?><?= date("d") ?>">1</option>
                                        <option value="AA002<?= date("y") ?><?= date("m") ?><?= date("d") ?>">2</option>
                                        <option value="AA003<?= date("y") ?><?= date("m") ?><?= date("d") ?>">3</option>
                                        <option value="AA004<?= date("y") ?><?= date("m") ?><?= date("d") ?>">4</option>
                                        <option value="AA005<?= date("y") ?><?= date("m") ?><?= date("d") ?>">5</option>
                                    </select>
                                </div>
                            </div>
                            <!-- TESTING -->
                            <div class="btn-group-vertical col-12" role="group" aria-label="Basic example" id="numpad">
                                <div class="btn-group">
                                    <input class="text-center form-control-lg mb-2 col-12" id="code" name="qty" autocomplete="off">
                                    <input class="text-center form-control-lg mb-2 col-12" id="idproduct" value="" name="id_product" type="hidden">
                                </div>
                                <div class="btn-group">
                                    <button type="button" class="btn btn-outline-secondary py-3" onclick="document.getElementById('code').value=document.getElementById('code').value + '1';">1</button>
                                    <button type="button" class="btn btn-outline-secondary py-3" onclick="document.getElementById('code').value=document.getElementById('code').value + '2';">2</button>
                                    <button type="button" class="btn btn-outline-secondary py-3" onclick="document.getElementById('code').value=document.getElementById('code').value + '3';">3</button>
                                </div>
                                <div class="btn-group">
                                    <button type="button" class="btn btn-outline-secondary py-3" onclick="document.getElementById('code').value=document.getElementById('code').value + '4';">4</button>
                                    <button type="button" class="btn btn-outline-secondary py-3" onclick="document.getElementById('code').value=document.getElementById('code').value + '5';">5</button>
                                    <button type="button" class="btn btn-outline-secondary py-3" onclick="document.getElementById('code').value=document.getElementById('code').value + '6';">6</button>
                                </div>
                                <div class="btn-group">
                                    <button type="button" class="btn btn-outline-secondary py-3" onclick="document.getElementById('code').value=document.getElementById('code').value + '7';">7</button>
                                    <button type="button" class="btn btn-outline-secondary py-3" onclick="document.getElementById('code').value=document.getElementById('code').value + '8';">8</button>
                                    <button type="button" class="btn btn-outline-secondary py-3" onclick="document.getElementById('code').value=document.getElementById('code').value + '9';">9</button>
                                </div>
                                <div class="btn-group">
                                    <button type="button" class="btn btn-outline-secondary py-3" onclick="document.getElementById('code').value=document.getElementById('code').value.slice(0, -1);">&lt;</button>
                                    <button type="button" class="btn btn-outline-secondary py-3" onclick="document.getElementById('code').value=document.getElementById('code').value + '0';">0</button>
                                    <button type="button" class="btn btn-primary py-3" id="btn-confirm">Go</button>
                                    <!-- <input type="buttion" class="btn btn-primary py-3" value="submit" id="submit" style="display: none"> -->
                                </div>
                            </div>
                            <div class="row" id="confirmation" style="display: none">
			                	<div class="col-md-3">
				    				<button class="btn btn-primary col-md-12" type="submit" id="oke">OK</button>
				    			</div>
			    				<div class="col-md-3">
				    				<button class="btn btn-warning col-md-12" type="button" id="cancel" style="color:#fff">Cancel</button>
				    			</div>
			                </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </body>
    <?php //} ?>
    <script>
        //script untuk modal mie
        $('#modal-qty').on('hidden.bs.modal', function(e) {
            $("#modal-qty").find('#form-qty')[0].reset();

            $("#modal-qty #confirmation").hide();
        	$("#modal-qty #numpad").show();
        })

        $(".mdl-mie").click(function() {
            $("#modal-qty").modal("show");
            $("input#idproduct").val($(this).val());
        });

        $("#modal-qty #cancel").click(function(){
        	console.log("asd");
        	$("#modal-qty #confirmation").hide();
        	$("#modal-qty #numpad").show();
        })

        $('#btn-confirm').click(function() {
            if ($("#code").val() == '' || $("#code").val() == null) {
                alert('Input belum terisi');
                return false;
            }

            $("#modal-qty .modal-title").text("Jumlah pesanan anda "+$("#code").val()+" mangkok mie?");

            $("#modal-qty #numpad").hide();
            $("#modal-qty #confirmation").show();
        });
    </script>
</html>
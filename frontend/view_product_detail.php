<!DOCTYPE html>
<html lang="en">
<?php
if (session_status() == PHP_SESSION_NONE) {
	session_start();
}
include('layouts/head.php');

// TESTING
if(isset($_POST['position'])){
	$_SESSION["order"]["position"] = $_POST["position"];
}
// print_r($_SESSION);die;
if (isset($_POST['id_product'])) {
	include('config.php');
	$config = new Config();

	$ppob_balance = $config->request_check_balance();

	$conn = new mysqli($config->local()[0], $config->local()[1], $config->local()[2], $config->local()[3]);
	$sql = "SELECT `product_detail`.`Id` as `id_detail`, `product_detail`.`id_product` as `id_product`, `product_detail`.`name`, `product_detail`.`code`, `product_detail`.`price`, `product_detail`.`selling_price`, `product_category`.`method`, `product_detail`.`status`, `product`.`product`, `product`.`image`
						FROM product_detail 
						LEFT JOIN product ON `product_detail`.`id_product` = `product`.`id`
						LEFT JOIN product_category ON `product`.`id_category` = `product_category`.`id`
						where `product_detail`.`status` = 1 AND `product_detail`.`id_product` = " . $_POST['id_product'];
	$result = $conn->query($sql);
	$data = $result->fetch_all(MYSQLI_ASSOC);
	// echo "<pre>";
	// print_r($data);
	// die;
	?>
<style>
#overlay{position: absolute;top: 0;left: 0;width: 100%;height: 100%;background-color: rgba(208, 208, 208, 0.7);color: #ffffff;border-radius: 15px;}
</style>
<body>
	<div class="container mb-5">
		<div class="row">
			<?php
				if ($result->num_rows > 0) {
					$i = 0;
					$grid = '';
					foreach ($data as $dt) {
						if ($i % 5 == 0) {
							$grid = "col-md-2 col-lg-2 offset-md-1 offset-lg-1 mt-3";
						} else {
							$grid = "col-md-2 col-lg-2 mt-3";
						}
						$overlay = "";
						$style = "pointer-events:none";
						
						if($dt['price'] < $ppob_balance){
							$style = "";
							$overlay = "d-none";
						}

						?>
			<div class="<?= $grid ?>">
				<div class="card-item col-12 px-0" style="<?= $style ?>">
					<a href="javascript:void(0)" class="text-decoration-none mdl" data-detail="<?= $dt['id_detail'] ?>" data-price="<?= $dt['selling_price'] ?>" data-code="<?= $dt['code'] ?>" data-method="<?= $dt['method'] ?>">
						<img class="card-img-top mx-auto my-2 d-block img-fluid" src="assets/images/small/<?= $dt['image'] ?>">
						<div id="overlay" class="<?= $overlay ?>"></div>
						<div class="card-body py-0 text-center">
							<p><?= $dt['name'] ?></p>
							<p>Rp <?= number_format($dt['selling_price'], 2, '.', ',') ?></p>
						</div>
					</a>
				</div>
			</div>
			<?php
						$i++;
					}
				}
				?>
		</div>
		<div class="row mt-2">
			<div class="col-2 offset-lg-1 offset-md-1">
				<input class="btn btn-primary col-12" action="action" onclick="window.location.href='index.php';" type="submit" value="Back"/>	
			</div>
			<!-- <div class="col-2 offset-lg-6 offset-md-6">
				<button class="btn btn-success col-12" id="cart" type="button" <?php //empty($_SESSION['order']) ? 'disabled':'' ?>>Cart</button>
			</div> -->
		</div>
	</div>
	<!-- Modal -->
	<div class="modal fade" id="modal-idpelanggan" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Masukan No Hp Anda</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form id="form-idpelanggan" action="payment.php" method="post">
						<div class="btn-group-vertical col-12" role="group" aria-label="Basic example">
							<div class="btn-group">
								<input class="text-center form-control-lg mb-2 col-12" id="code" name="id_pelanggan" autocomplete="off">

								<!-- DATA POST -->
								<input class="text-center form-control-lg mb-2 col-12" id="method_ppob" value="" name="method" type="hidden">
								<input class="text-center form-control-lg mb-2 col-12" id="code_ppob" value="" name="code" type="hidden">
								<input class="text-center form-control-lg mb-2 col-12" id="iddetail" value="" name="id_detail" type="hidden">
								<input class="text-center form-control-lg mb-2 col-12" id="price" value="" name="price" type="hidden">
								<input class="text-center form-control-lg mb-2 col-12" value="1" name="category" type="hidden">
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
								<button type="submit" class="btn btn-primary py-3">Go</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
<?php }else{ 
	header('Location: index.php');
} ?>
<script>
	$('#modal-idpelanggan').on('hidden.bs.modal', function(e) {
		$(this).find('#form-idpelanggan')[0].reset();
	})

	$(".mdl").click(function() {
		$("#modal-idpelanggan").modal("show");
		$("input#iddetail").val($(this).attr('data-detail'));
		$("input#price").val($(this).attr('data-price'));
		$("input#code_ppob").val($(this).attr('data-code'));
		$("input#method_ppob").val($(this).attr('data-method'));

	});

	$('#form-idpelanggan').submit(function() {
		if ($("#code").val() == '' || $("#code").val() == null) {
			alert('Input belum terisi');
			return false;
		}
		if (!confirm('Anda yakin ingin top up ke nomer ini ' + $("#code").val() + ' ?')) {
			return false;
		}
	});

	$("button#cart").click(function(){
		window.location.href = 'confirmation.php'
	})
	if ( window.history.replaceState ) {
		window.history.replaceState( null, null, window.location.href );
	}
</script>

</html>
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


if (isset($_POST['id_product'])) {

	include('config.php');
	$config = new Config();
	$conn = new mysqli($config->local()[0], $config->local()[1], $config->local()[2], $config->local()[3]);

	$idproduct = $_POST['id_product'];
	$qty = $_POST['qty'];

	//get data mie
	$sql1 = "SELECT pd.Id id_detail, p.Id id_product, pd.name, pd.price, pd.selling_price
			FROM product_detail pd
			LEFT JOIN product p ON p.Id = pd.id_product
			WHERE p.Id = ".$idproduct." AND pd.status = 1 AND p.status = 1";

	$r_mie = $conn->query($sql1);
	$dt_mie = $r_mie->fetch_assoc();

	//get data topping
	$sql2 = "SELECT * FROM materials where is_topping = 1 AND status = 1";
	$rsql2 = $conn->query($sql2);
	$dt_topping = $rsql2->fetch_all(MYSQLI_ASSOC);

	//get data spice
	$sql3 = "SELECT * FROM spice_level where status = 1  AND id != 1 ORDER BY level";
	$rsql3 = $conn->query($sql3);
	$dt_spice = $rsql3->fetch_all(MYSQLI_ASSOC);

	// echo "<pre>";
	// print_r($dt_spice);
	// die;
?>
<style>
	.spice-level{text-decoration: none}
	.spice-level > img{max-width: 35px}
	.topping{}
	.topping-list{padding:0px 15px;position: relative;}
	.topping-list > img{max-width: 60px}
	.topping-selected .topping-icon{opacity: 0.5}
	.topping-list .check-icon{position: absolute;top:5%;}
	.reset-spice{margin-left: 50px;}
</style>
<body>

<div class="container mb-5 mt-5">
	<?php if($r_mie->num_rows > 0){ ?>
		<center><h2>Pilih Topping dan Level Pedas</h2></center>
		<br>
		<form class="" action="payment.php" method="POST">
			<table class="table">
				<tbody>
					<?php for($i=1;$i<=$qty;$i++): ?>
						<tr id="item-<?= $i ?>">
							<th style="text-align: center;vertical-align: middle"><?= $i ?></th>
							<th style="text-align: center;vertical-align: middle"><?= $dt_mie["name"] ?></th>
							<td style="vertical-align: middle">
								<?php if($rsql2->num_rows > 0){ ?>
									<div class="row">
										<?php foreach($dt_topping as $tp): ?>
											<div class="text-center topping-list" data-price="<?= $tp['price'] ?>" >
												<img src="assets/images/icons/<?= $tp['icon'] ?>" alt="icon <?= $tp['material'] ?>" class="topping-icon"><br>
												<img src="assets/images/icons/check-icon.png" alt="selected" class="check-icon" hidden>
												<?= $tp['material'] ?><br>
												Rp <?= number_format($tp['price'],2 , '.', ',') ?><br>

												<!-- POST DATA -->
												<input name="item[<?= $i ?>][topping][<?= $tp['id'] ?>]" class="form-control topping" value="0" type="hidden">
											</div>
										<?php endforeach; ?>
									</div>
								<?php }else{ ?>
									Topping Kosong
								<?php } ?>
							</td>
							<td style="vertical-align: middle">
								<?php foreach($dt_spice as $spc){ ?>
									<a class="spice-level" id="<?= $i ?>-level-<?= $spc['id'] ?>" data-price="<?= $spc['price'] ?>">
										<img src="assets/images/icons/chili-empty.png" alt="icon chili">
									</a>
								<?php } ?>
								<button type="button" class="btn btn-danger reset-spice">LEVEL 0</button>

								<!-- POST DATA -->
								<input name="id_detail" value="<?= $dt_mie['id_detail'] ?>" type="hidden">
								<input name="category" value="2" type="hidden">
								<input name="item[<?= $i ?>][price]" value="<?= $dt_mie['selling_price'] ?>" type="hidden">
								<input name="item[<?= $i ?>][spice]" value="1" class="spice" type="hidden">
								<input name="item[<?= $i ?>][ext_price]" value="0" class="ext-price" type="hidden">
							</td>
						</tr>
					<?php endfor; ?>
				</tbody>
			</table>
			<br>
			<div class="row">
				<div class="col-2">
					<button type="button" class="btn btn-primary col-12" onclick="window.location.href='index.php';">Back</button>
				</div>
				<div class="col-2 offset-md-8">
					<button type="submit" class="btn btn-success col-12">Pembayaran</button>
				</div>
			</div>
		</form>
	<?php } ?>

</div>

</body>

<?php } ?>
<script>
	$('#modal-qty').on('hidden.bs.modal', function(e) {
		$(this).find('#form-qty')[0].reset();
	})

	$(".mdl").click(function() {
		$("#modal-qty").modal("show");
		$("input#iddetail").val($(this).attr('data-detail'));
	});

	$('#form-qty').submit(function() {
		if ($("#code").val() == '' || $("#code").val() == null) {
			alert('Input belum terisi');
			return false;
		}
		if (!confirm('Anda yakin ingin top up ke nomer ini ' + $("#code").val() + ' ?')) {
			return false;
		}
	});

	$(".spice-level").click(function(){
		var id = $(this).attr("id");
		var item = id.split("-")[0];
		var level = id.split("-")[2];
		var price = $(this).attr("data-price");

		$("#item-"+item+" .spice-level").find("img").attr("src", "assets/images/icons/chili-empty.png");

		$("#item-"+item+" .spice-level").removeClass("spice-selected");
		$(this).addClass("spice-selected");

		$("#item-"+item+" .spice-level").each(function() {
		  	// console.log( index + ": " + $( this ).text() );
		  	$(this).find("img").attr("src", "assets/images/icons/chili-colored.png");
		  	
		  	if($(this).hasClass("spice-selected")){
		  		return false;
		  	}
		});

		calc_ext_price("item-"+item);

		$("#item-"+item+" input.spice").val(level);
	})

	$(".reset-spice").click(function(){
		var item = $(this).parent().parent().attr("id");

		$("#"+item+" .spice-level").find("img").attr("src", "assets/images/icons/chili-empty.png");
		$("#"+item+" .spice-level").removeClass("spice-selected");
		$("#"+item+" .spice").val(1);

		calc_ext_price(item);
	})

	$(".topping-list").click(function(){
		var ext_price = 0;
		if($(this).hasClass("topping-selected")){
			$(this).find("input.topping").val(0);
			$(this).find("img.check-icon").attr("hidden", true);
			$(this).removeClass("topping-selected");
		}else{
			$(this).find("input.topping").val(1);
			$(this).find("img.check-icon").removeAttr("hidden");
			$(this).addClass("topping-selected");
		}

		calc_ext_price($(this).parent().parent().parent().attr("id"));
	})

	$("button#cart").click(function(){
		window.location.href = 'confirmation.php'
	})

	function calc_ext_price(id){
		var ext_price = 0;
		$("#"+id).find(".topping-selected").each(function(){
			ext_price += parseInt($(this).attr("data-price"))
		})

		if($("#"+id).find('.spice-selected').length !== 0){
			ext_price += parseInt($("#"+id).find('.spice-selected').attr("Data-price"));
		}
		
		$("#"+id).find("input.ext-price").val(ext_price);
	}

	if ( window.history.replaceState ) {
        window.history.replaceState( null, null, window.location.href );
    }
</script>
</html>
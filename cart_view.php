<?php include 'includes/session.php'; ?>
<?php include 'includes/header.php'; ?>
<?php

	$conn = $pdo->open();
	$stmt = $conn->prepare("SELECT pay_id FROM sales");
	$stmt->execute();
	$history_transaction = $stmt->fetchColumn();

	$first_code = "PAY-";
	$random_middle = "123456789";
	$random_end = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
	// Generate Transaction Code
	// middle code
	$middle_code = substr(str_shuffle($random_middle), 0, 6);
	// end code
	$end_code = substr(str_shuffle($random_end), 0, 16);

	$transaction_code = $first_code . $middle_code . $end_code;

	// echo $transaction_code . "<br>";

	if ($history_transaction > 0) {
		// Get all transaction code
		foreach ($stmt as $pay_id) {
			$data[] = $pay_id['pay_id'];
		}

		// Check if transaction code is exist
		for ($i = 0; $i < count($data); $i++) { 
			if ($data[$i] == $transaction_code) { // Jika kode transaksi sama dengan data yang ada pada database, maka, acak kode transaksi lagi dan ulangi cek dari awal
				// Generate Transaction Code
				// middle code
				$middle_code = substr(str_shuffle($random_middle), 0, 6);
				// end code
				$end_code = substr(str_shuffle($random_end), 0, 16);

				$transaction_code = $first_code . $middle_code . $end_code;
				$i = 0;
			}
		}
	}

	// echo $transaction_code;

	if(isset($_SESSION['user'])){
		// Check cart is empty or not
		$stmt = $conn->prepare("SELECT COUNT(*) FROM cart WHERE user_id = :id");
		$stmt->execute(['id'=>$user['id']]);
		$cart = $stmt->fetchColumn(); // If $cart is 0, cart is empty
	}

	$pdo->close();

?>
<body class="hold-transition skin-blue layout-top-nav">
<div class="wrapper">

	<?php include 'includes/navbar.php'; ?>
	 
	  <div class="content-wrapper">
	    <div class="container">

	      <!-- Main content -->
	      <section class="content">
	        <div class="row">
	        	<div class="col-sm-9">
	        		<h1 class="page-header">YOUR CART</h1>
	        		<div class="box box-solid box-success">
	        			<div class="box-body">
		        		<table class="table table-bordered">
		        			<thead>
		        				<th>Photo</th>
		        				<th>Name</th>
		        				<th>Price</th>
		        				<th width="20%">Quantity</th>
		        				<th>Subtotal</th>
								<th></th>
		        			</thead>
		        			<tbody id="tbody">
		        			</tbody>
		        		</table>
	        			</div>
	        		</div>
	        		<?php
	        			if(isset($_SESSION['user'])){
	        				echo "
			
								<button class='btn btn-info pull-right' id='bayar' onclick='checkout()'>Checkout</button>
	        				";
	        			}
	        			else{
	        				echo "
	        					<h4>You need to <a href='login.php'>Login</a> to checkout.</h4>
	        				";
	        			}
	        		?>
	        	</div>
	        	<div class="col-sm-3">
	        		<?php include 'includes/sidebar.php'; ?>
	        	</div>
	        </div>
	      </section>
	     
	    </div>
	  </div>
  	<?php $pdo->close(); ?>
  	<?php include 'includes/footer.php'; ?>
</div>

<?php include 'includes/scripts.php'; ?>

<script>
function checkout() {
	$empty_cart = <?php echo $cart ?>;
	if (confirm('Are you sure want to checkout?')) {
		if ($empty_cart > 0) {
			$pay_code = "<?php echo $transaction_code ?>";
	
			window.location = 'sales.php?pay='+ $pay_code;
			
		}else{
			alert("Cart is empty");
		}
	} else {
		// Do nothing!
	}
	
}
</script>

<script>
var total = 0;
$(function(){
	$(document).on('click', '.cart_delete', function(e){
		e.preventDefault();
		var id = $(this).data('id');
		$.ajax({
			type: 'POST',
			url: 'cart_delete.php',
			data: {id:id},
			dataType: 'json',
			success: function(response){
				if(!response.error){
					getDetails();
					getCart();
					getTotal();
				}
			}
		});
	});

	$(document).on('click', '.minus', function(e){
		e.preventDefault();
		var id = $(this).data('id');
		var qty = $('#qty_'+id).val();
		if(qty>1){
			qty--;
		}
		$('#qty_'+id).val(qty);
		$.ajax({
			type: 'POST',
			url: 'cart_update.php',
			data: {
				id: id,
				qty: qty,
			},
			dataType: 'json',
			success: function(response){
				if(!response.error){
					getDetails();
					getCart();
					getTotal();
				}
			}
		});
	});

	$(document).on('click', '.add', function(e){
		e.preventDefault();
		var id = $(this).data('id');
		var qty = $('#qty_'+id).val();
		qty++;
		$('#qty_'+id).val(qty);
		$.ajax({
			type: 'POST',
			url: 'cart_update.php',
			data: {
				id: id,
				qty: qty,
			},
			dataType: 'json',
			success: function(response){
				if(!response.error){
					getDetails();
					getCart();
					getTotal();
				}
			}
		});
	});

	getDetails();
	getTotal();

});

function getDetails(){
	$.ajax({
		type: 'POST',
		url: 'cart_details.php',
		dataType: 'json',
		success: function(response){
			$('#tbody').html(response);
			getCart();
		}
	});
}

function getTotal(){
	$.ajax({
		type: 'POST',
		url: 'cart_total.php',
		dataType: 'json',
		success:function(response){
			total = response;
		}
	});
}
</script>

</body>
</html>
<?php 
session_start();
include('includes/config.php');
error_reporting(0);
?>
<!DOCTYPE HTML>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width,initial-scale=1">
        <meta name="keywords" content="">
        <meta name="description" content="">
        <title>Ride Poa | Vehicle Details</title>
        <!--Bootstrap -->
        <link rel="stylesheet" href="assets/css/bootstrap.min.css" type="text/css">
        <!--Custome Style -->
        <link rel="stylesheet" href="assets/css/style.css" type="text/css">
        <!--OWL Carousel slider-->
        <link rel="stylesheet" href="assets/css/owl.carousel.css" type="text/css">
        <link rel="stylesheet" href="assets/css/owl.transitions.css" type="text/css">
        <!--slick-slider -->
        <link href="assets/css/slick.css" rel="stylesheet">
        <!--bootstrap-slider -->
        <link href="assets/css/bootstrap-slider.min.css" rel="stylesheet">
        <!--FontAwesome Font Style -->
        <link href="assets/css/font-awesome.min.css" rel="stylesheet">

        <link href="assets/css/style1.css" rel="stylesheet" type="text/css">
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.1/css/all.css">
        
        <!-- SWITCHER -->
		<link rel="stylesheet" id="switcher-css" type="text/css" href="assets/switcher/css/switcher.css" media="all" />
		<link rel="alternate stylesheet" type="text/css" href="assets/switcher/css/red.css" title="red" media="all" data-default-color="true" />
		<link rel="alternate stylesheet" type="text/css" href="assets/switcher/css/orange.css" title="orange" media="all" />
		<link rel="alternate stylesheet" type="text/css" href="assets/switcher/css/blue.css" title="blue" media="all" />
		<link rel="alternate stylesheet" type="text/css" href="assets/switcher/css/pink.css" title="pink" media="all" />
		<link rel="alternate stylesheet" type="text/css" href="assets/switcher/css/green.css" title="green" media="all" />
		<link rel="alternate stylesheet" type="text/css" href="assets/switcher/css/purple.css" title="purple" media="all" />
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="assets/images/favicon-icon/apple-touch-icon-144-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="assets/images/favicon-icon/apple-touch-icon-114-precomposed.html">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="assets/images/favicon-icon/apple-touch-icon-72-precomposed.png">
        <link rel="apple-touch-icon-precomposed" href="assets/images/favicon-icon/apple-touch-icon-57-precomposed.png">
        <link rel="shortcut icon" href="assets/images/favicon-icon/favicon.png">
        <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,900" rel="stylesheet">
    </head>
<body>
    <!-- Start Switcher -->
    <?php //include('includes/colorswitcher.php');?>
    <!-- /Switcher -->  

    <!--Header-->
    <?php include('includes/header.php');?>
    <!-- /Header -->

    <form method="post" name="pay">
        <div class="paypal">
            <button type="submit" name="paypal">
                <img src="https://www.paypalobjects.com/webstatic/mktg/Logo/pp-logo-100px.png" border="0" alt="PayPal Logo">
            </button>
        </div>
    </form>

    <?php

    // Below the key is the product ID and the value is the quantity
    $products_in_cart = array(
        1 => 2, // Product with the ID 1 has a quantity of 2
	    2 => 2
    );

    // Products should look like the following, you can execute a SQL query to get products from your database
    $products = array(
        $sql="SELECT tblvehicles.VehiclesTitle,tblbrands.BrandName,tblvehicles.PricePerDay,tblvehicles.FuelType,tblvehicles.ModelYear,tblvehicles.id,tblvehicles.SeatingCapacity,tblvehicles.VehiclesOverview,tblvehicles.Vimage1 from tblvehicles join tblbrands on tblbrands.id=tblvehicles.VehiclesBrand where tblvehicles.VehiclesBrand=:bid"
        /*array(
		    'id' => 1, 
		    'name' => 'Smart Watch',
		    'price' => 15.00
	    ),
	    array(
		    'id' => 2,
		    'name' => 'Headphones',
		    'price' => 10.00
	    )*/	
    );

    // For testing purposes set this to true, if set to true it will use paypal sandbox
    $testmode = true;
    $paypalurl = $testmode ? 'https://www.sandbox.paypal.com/cgi-bin/webscr' : 'https://www.paypal.com/cgi-bin/webscr';
    // If the user clicks the PayPal checkout button...
    if (isset($_POST['paypal']) && $products_in_cart && !empty($products_in_cart)) {
        // Variables we need to pass to paypal
        // Make sure you have a business account and set the "business" variable to your paypal business account email
        $data = array(
            'cmd'			=> '_cart',
            'upload'        => '1',
            'lc'			=> 'EN',
            'business' 		=> 'payments@yourwebsite.com',
            'cancel_return'	=> 'https://yourwebsite.com/index.php?page=cart',
            'notify_url'	=> 'https://yourwebsite.com/index.php?page=cart&ipn_listener=paypal',
            'currency_code'	=> 'USD',
            'return'        => 'https://yourwebsite.com/index.php?page=placeorder'
        );
        
        // Add all the products that are in the shopping cart to the data array variable
        for ($i = 0; $i < count($products); $i++) {
            $data['item_number_' . ($i+1)] = $products[$i]['id'];
            $data['item_name_' . ($i+1)] = $products[$i]['name'];
            $data['quantity_' . ($i+1)] = $products_in_cart[$products[$i]['id']];
            $data['amount_' . ($i+1)] = $products[$i]['price'];
        }
        
        // Send the user to the paypal checkout screen
        header('location:' . $paypalurl . '?' . http_build_query($data));
        // End the script don't need to execute anything else
        exit;
    }
    // Below is the listener for paypal, make sure to set the IPN URL (e.g. http://example.com/cart.php?ipn_listener=paypal) in your paypal account, this will not work on a local server
if (isset($_GET['ipn_listener']) && $_GET['ipn_listener'] == 'paypal') {
    // Get all input variables and convert them all to URL string variables
    $raw_post_data = file_get_contents('php://input');
    $raw_post_array = explode('&', $raw_post_data);
    $myPost = array();
    foreach ($raw_post_array as $keyval) {
        $keyval = explode ('=', $keyval);
        if (count($keyval) == 2) $myPost[$keyval[0]] = urldecode($keyval[1]);
    }
    $req = 'cmd=_notify-validate';
    $get_magic_quotes_exists = function_exists('get_magic_quotes_gpc') ? true : false;
    foreach ($myPost as $key => $value) {
        if ($get_magic_quotes_exists == true)  {
            $value = urlencode(stripslashes($value));
        } else {
            $value = urlencode($value);
        }
        $req .= "&$key=$value";
    }
    // Below will verify the transaction, it will make sure the input data is correct
    $ch = curl_init($paypalurl);
    curl_setopt($ch, CURLOPT_HTTP_VERSION, CURL_HTTP_VERSION_1_1);
    curl_setopt($ch, CURLOPT_POST, 1);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
    curl_setopt($ch, CURLOPT_POSTFIELDS, $req);
    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, 1);
    curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 2);
    curl_setopt($ch, CURLOPT_FORBID_REUSE, 1);
    curl_setopt($ch, CURLOPT_HTTPHEADER, array('Connection: Close'));
    $res = curl_exec($ch);
    curl_close($ch);
    if (strcmp($res, 'VERIFIED') == 0) {
        // Transaction is verified and successful...
        $item_id = array();
        $item_quantity = array();
        $item_mc_gross = array();
        // Add all the item numbers, quantities and prices to the above array variables
        for ($i = 1; $i < ($_POST['num_cart_items']+1); $i++) {
            array_push($item_id, $_POST['item_number' . $i]);
            array_push($item_quantity, $_POST['quantity' . $i]);
            array_push($item_mc_gross, $_POST['mc_gross_' . $i]);
        }
        // Insert the transaction into our transactions table, as the payment status changes the query will execute again and update it, make sure the "txn_id" column is unique
        $stmt = $pdo->prepare('INSERT INTO transactions VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?) ON DUPLICATE KEY UPDATE payment_status = VALUES(payment_status)');
        $stmt->execute([
            NULL,
            $_POST['txn_id'],
            $_POST['mc_gross'],
            $_POST['payment_status'],
            implode(',', $item_id),
            implode(',', $item_quantity),
            implode(',', $item_mc_gross),
            date('Y-m-d H:i:s'),
            $_POST['payer_email'],
            $_POST['first_name'],
            $_POST['last_name'],
            $_POST['address_street'],
            $_POST['address_city'],
            $_POST['address_state'],
            $_POST['address_zip'],
            $_POST['address_country']
        ]);
    }
    exit;
}
    ?>

    <!--Footer -->
    <?php include('includes/footer.php');?>
    <!-- /Footer--> 

    <!--Back to top-->
    <div id="back-top" class="back-top"> <a href="#top"><i class="fa fa-angle-up" aria-hidden="true"></i> </a> </div>
    <!--/Back to top--> 

    <!--Login-Form -->
    <?php include('includes/login.php');?>
    <!--/Login-Form --> 

    <!--Register-Form -->
    <?php include('includes/registration.php');?>
    <!--/Register-Form --> 

    <!--Forgot-password-Form -->
    <?php include('includes/forgotpassword.php');?>

    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script> 
    <script src="assets/js/interface.js"></script> 
    <script src="assets/switcher/js/switcher.js"></script>
    <script src="assets/js/bootstrap-slider.min.js"></script> 
    <script src="assets/js/slick.min.js"></script> 
    <script src="assets/js/owl.carousel.min.js"></script>
</body>
</html>
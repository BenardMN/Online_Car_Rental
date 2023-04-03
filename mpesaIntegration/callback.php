<?php
session_start();
if (isset($_GET['order_id'])) {
    $order_id = $_GET['order_id'];
}

$content = file_get_contents('php://input'); //Receives the JSON Result from safaricom
$res = json_decode($content, true); //Decodes the JSON Result
// var_dump($res);
var_dump($_SESSION);
$MerchantRequestID = $_SESSION["MerchantRequestID"];
$CheckoutRequestID = $_SESSION["CheckoutRequestID"];
$ResponseCode = $_SESSION['ResponseCode'];
$ResponseDescription = $_SESSION['ResponseDescription'];
$CustomerMessage = $_SESSION['CustomerMessage'];
$phone = $_SESSION["phone"];

$_SESSION["MerchantRequestID"] = "";
$_SESSION["CheckoutRequestID"] = "";
$_SESSION["ResponseCode"] = "";
$_SESSION["ResponseDescription"] = "";
$_SESSION["CustomerMessage"] = "";
$_SESSION["phone"] = "";
// header('location: callback.php?MerchantRequestID=' . $MerchantRequestID . '&CheckoutRequestID=' . $CheckoutRequestID . '&ResponseCode=' . $ResponseCode . '&ResponseDescription=' . $ResponseDescription . '&CustomerMessage=' . $CustomerMessage . '&phone=' . $phone . '&order_id=' . $order_id);"index.php";</script>';
$url = "MerchantRequestID=$MerchantRequestID&CheckoutRequestID=$CheckoutRequestID&ResponseCode=$ResponseCode&ResponseDescription=$ResponseDescription&CustomerMessage=$CustomerMessage&phone=$phone&order_id=$order_id";
echo $url;
$script = "<script type='text/javascript'>window.location.href = 'http://localhost/projectexe/Online_Car_Rental/Online_Car_Rental/confirm_checkout.php?$url';</script>";
echo $script;

/* 
http: //localhost/projectexe/Online_Car_Rental/Online_Car_Rental/confirm-checkout.php?MerchantRequestID=17894-46171329-1&CheckoutRequestID=ws_CO_03042023174052641700825009&ResponseCode=&ResponseDescription=&CustomerMessage=&phone=254700825009&order_id=47 */

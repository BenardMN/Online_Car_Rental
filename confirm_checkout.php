<?php

include "includes/config.php";

$MerchantRequestID = $_GET["MerchantRequestID"];
$CheckoutRequestID = $_GET["CheckoutRequestID"];
$ResponseCode = $_GET['ResponseCode'];
$ResponseDescription = $_GET['ResponseDescription'];
$CustomerMessage = $_GET['CustomerMessage'];
$phone = $_GET["phone"];
$order_id = $_GET['order_id'];

echo $MerchantRequestID . '<br>';
echo $CheckoutRequestID . '<br>';
echo $ResponseCode . '<br>';
echo $ResponseDescription . '<br>';
echo $CustomerMessage . '<br>';
echo $phone . '<br>';
echo $order_id . '<br>';

$sql = "INSERT INTO `payments` (`MerchantRequestID`, `CheckoutRequestID`, `ResponseCode`, `ResponseDescription`, `CustomerMessage`, `phone`, `order_id`) VALUES ('$MerchantRequestID', '$CheckoutRequestID', '$ResponseCode', '$ResponseDescription', '$CustomerMessage', '$phone', '$order_id')";
$result = $dbh->prepare($sql);
$result->execute();
if ($result) {
    echo "success";
    // header index.php after 5 seconds
    header("refresh:5;url=index.php");
} else {
    echo "failed";
    echo "error: " . $sql . "<br>" . $dbh->$sql;
}

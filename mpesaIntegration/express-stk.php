<?php
session_start();

$errors  = array();
$errmsg  = '';

$config = array(
    "env"              => "sandbox",
    "BusinessShortCode" => "174379",
    "key"              => "eqlzv9iJEAEh4hjdKt4pKU0U3fWSmhXf", //Enter your consumer key here
    "secret"           => "I3ZEHckh8XjDfQrZ", //Enter your consumer secret here
    "username"         => "apitest",
    "TransactionType"  => "CustomerPayBillOnline",
    "passkey"          => "bfb279f9aa9bdbcf158e97dd71a467cd2e0c893059b10f78e6b72ada1ed2c919", //Enter your passkey here
    "CallBackURL"      => "https://iorder.shaking-machine.com/iorder/mpesaIntegration/callback.php", //When using localhost, Use Ngrok to forward the response to your Localhost
    "AccountReference" => "CompanyXLTD",
    "TransactionDesc"  => "Payment of X",
);

if (isset($_GET['phone'])) {

    $phone = $_GET['phone'];
    $orderNo = $_GET['order_id'];
    $amount = 1;

    $phone = (substr($phone, 0, 1) == "+") ? str_replace("+", "", $phone) : $phone;
    $phone = (substr($phone, 0, 1) == "0") ? preg_replace("/^0/", "254", $phone) : $phone;
    $phone = (substr($phone, 0, 1) == "7") ? "254{$phone}" : $phone;

    $access_token = ($config['env']  == "live") ? "https://api.safaricom.co.ke/oauth/v1/generate?grant_type=client_credentials" : "https://sandbox.safaricom.co.ke/oauth/v1/generate?grant_type=client_credentials";
    $credentials = base64_encode($config['key'] . ':' . $config['secret']);

    $ch = curl_init($access_token);
    curl_setopt($ch, CURLOPT_HTTPHEADER, ["Authorization: Basic " . $credentials]);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
    $response = curl_exec($ch);
    curl_close($ch);
    $result = json_decode($response);
    $token = isset($result->{'access_token'}) ? $result->{'access_token'} : "N/A";

    $timestamp = date("YmdHis");
    $password  = base64_encode($config['BusinessShortCode'] . "" . $config['passkey'] . "" . $timestamp);

    $curl_post_data = array(
        "BusinessShortCode" => $config['BusinessShortCode'],
        "Password" => $password,
        "Timestamp" => $timestamp,
        "TransactionType" => $config['TransactionType'],
        "Amount" => $amount,
        "PartyA" => $phone,
        "PartyB" => $config['BusinessShortCode'],
        "PhoneNumber" => $phone,
        "CallBackURL" => $config['CallBackURL'],
        "AccountReference" => $config['AccountReference'],
        "TransactionDesc" => $config['TransactionDesc'],
    );

    $data_string = json_encode($curl_post_data);

    $endpoint = ($config['env'] == "live") ? "https://api.safaricom.co.ke/mpesa/stkpush/v1/processrequest" : "https://sandbox.safaricom.co.ke/mpesa/stkpush/v1/processrequest";

    $ch = curl_init($endpoint);
    curl_setopt($ch, CURLOPT_HTTPHEADER, [
        'Authorization: Bearer ' . $token,
        'Content-Type: application/json'
    ]);
    curl_setopt($ch, CURLOPT_POST, 1);
    curl_setopt($ch, CURLOPT_POSTFIELDS, $data_string);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
    $response     = curl_exec($ch);
    curl_close($ch);

    $result = json_decode(json_encode(json_decode($response)), true);
    print_r($result);

    if (!preg_match('/^[0-9]{10}+$/', $phone) && array_key_exists('errorMessage', $result)) {
        $errors['phone'] = $result["errorMessage"];
    }
    $_SESSION['ResponseCode'] = $result['ResponseCode'];
    $_SESSION['ResponseDescription'] = $result['ResponseDescription'];
    $_SESSION['CustomerMessage'] = $result['CustomerMessage'];

    if ($result['ResponseCode'] === "0") {
        // include("connection/connect.php");
        $db = mysqli_connect("localhost", "shakingmachine_burt_car", "P@4s%#6bX?jc", "shakingmachine_online_car_rental");
        if ($db) {
            echo "db connected!";
        } else {
            echo "db not connected!";
        }      //STK Push request successful
        $MerchantRequestID = $result['MerchantRequestID'];
        $CheckoutRequestID = $result['CheckoutRequestID'];
        $ResponseCode = $result['ResponseCode'];
        $user_id_email = $_SESSION['login'];
        $sql_uid = "SELECT id FROM `tblusers` WHERE `EmailId` = '$user_id_email'";
        $sql_uid_result = mysqli_query($db, $sql_uid);
        $row = mysqli_fetch_assoc($sql_uid_result);
        $uid = $row['id'];
        $_SESSION['uid'] = $uid;

        //Saves your request to a database


        $sql = "INSERT INTO `payments`(`uid` ,`MerchantRequestID`, `CheckoutRequestID`, `ResponseCode`, `phone`, `order_id`) VALUES ('$uid', '$MerchantRequestID', '$CheckoutRequestID', '$ResponseCode', '$phone', '$orderNo')";
        $sql_result = mysqli_query($db, $sql);
        // get previous insert id
        $last_id = mysqli_insert_id($db);
        if ($sql_result) {
            echo "sql entered!";
            $_SESSION['result'] = $result;
            $_SESSION['last_id'] = $last_id;
            $_SESSION["MerchantRequestID"] = $MerchantRequestID;
            $_SESSION["CheckoutRequestID"] = $CheckoutRequestID;
            $_SESSION["phone"] = $phone;
            $_SESSION["order_no"] = $orderNo;
            // header('location: confirm-payment.php');
            echo '<script type="text/javascript">window.location.href = "confirm-payment.php";</script>';
        } else {
            echo "Error: " . mysqli_error($db);
        }
    } else {
        $errors['mpesastk'] = $result['errorMessage'];
        foreach ($errors as $error) {
            $errmsg .= $error . '<br />';
            echo $error;
        }
    }
}

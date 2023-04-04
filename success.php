<?php
session_start();
include "includes/config.php";
// Handle the PayPal response.

// Create a connection to the database.
$db = $dbh;
// $uid = $_SESSION['uid'];
// $order_id = $_SESSION['order_no'];
/* http://localhost/projectexe/Online_Car_Rental/Online_Car_Rental/success.php?paypal_response={%22id%22:%223GC22164T6282350S%22,%22intent%22:%22CAPTURE%22,%22status%22:%22COMPLETED%22,%22purchase_units%22:[{%22reference_id%22:%22default%22,%22amount%22:{%22currency_code%22:%22USD%22,%22value%22:%22200.00%22},%22payee%22:{%22email_address%22:%22sb-4346ob8166531@business.example.com%22,%22merchant_id%22:%22ZZ2Q244CWPGNN%22},%22shipping%22:{%22name%22:{%22full_name%22:%22John%20Doe%22},%22address%22:{%22address_line_1%22:%22Free%20Trade%20Zone%22,%22admin_area_2%22:%22Nairobi%22,%22postal_code%22:%2200521%22,%22country_code%22:%22KE%22}},%22payments%22:{%22captures%22:[{%22id%22:%2208439585C5594082D%22,%22status%22:%22COMPLETED%22,%22amount%22:{%22currency_code%22:%22USD%22,%22value%22:%22200.00%22},%22final_capture%22:true,%22seller_protection%22:{%22status%22:%22ELIGIBLE%22,%22dispute_categories%22:[%22ITEM_NOT_RECEIVED%22,%22UNAUTHORIZED_TRANSACTION%22]},%22create_time%22:%222023-04-04T05:47:29Z%22,%22update_time%22:%222023-04-04T05:47:29Z%22}]}}],%22payer%22:{%22name%22:{%22given_name%22:%22John%22,%22surname%22:%22Doe%22},%22email_address%22:%22sb-ezvrg8166530@personal.example.com%22,%22payer_id%22:%22LH9X7GT42P32Y%22,%22address%22:{%22country_code%22:%22KE%22}},%22create_time%22:%222023-04-04T05:47:14Z%22,%22update_time%22:%222023-04-04T05:47:29Z%22,%22links%22:[{%22href%22:%22https://api.sandbox.paypal.com/v2/checkout/orders/3GC22164T6282350S%22,%22rel%22:%22self%22,%22method%22:%22GET%22}]} */
// Retrieve the request's body and parse it as JSON

// var_dump($_GET['paypal_response']);
// insert into database paypal_payments
if (isset($_GET['paypal_response'])) {
    // decode the PayPal response JSON string
    $paypal_response = json_decode($_GET['paypal_response'], true);

    // prepare the SQL statement
    $stmt = $dbh->prepare("INSERT INTO paypal_payments (id, intent, status, reference_id, currency_code, amount, email_address, merchant_id, name, address_line_1, admin_area_2, postal_code, country_code, capture_id, capture_status, capture_final, protection_status, create_time, update_time, given_name, surname, payer_email, payer_id, payer_country) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");

    // bind parameters
    $stmt->bindParam(1, $paypal_response['id']);
    $stmt->bindParam(2, $paypal_response['intent']);
    $stmt->bindParam(3, $paypal_response['status']);
    $stmt->bindParam(4, $paypal_response['purchase_units'][0]['reference_id']);
    $stmt->bindParam(5, $paypal_response['purchase_units'][0]['amount']['currency_code']);
    $stmt->bindParam(6, $paypal_response['purchase_units'][0]['amount']['value']);
    $stmt->bindParam(7, $paypal_response['purchase_units'][0]['payee']['email_address']);
    $stmt->bindParam(8, $paypal_response['purchase_units'][0]['payee']['merchant_id']);
    $stmt->bindParam(9, $paypal_response['purchase_units'][0]['shipping']['name']['full_name']);
    $stmt->bindParam(10, $paypal_response['purchase_units'][0]['shipping']['address']['address_line_1']);
    $stmt->bindParam(11, $paypal_response['purchase_units'][0]['shipping']['address']['admin_area_2']);
    $stmt->bindParam(12, $paypal_response['purchase_units'][0]['shipping']['address']['postal_code']);
    $stmt->bindParam(13, $paypal_response['purchase_units'][0]['shipping']['address']['country_code']);
    $stmt->bindParam(14, $paypal_response['purchase_units'][0]['payments']['captures'][0]['id']);
    $stmt->bindParam(15, $paypal_response['purchase_units'][0]['payments']['captures'][0]['status']);
    $stmt->bindParam(16, $paypal_response['purchase_units'][0]['payments']['captures'][0]['final_capture']);
    $stmt->bindParam(17, $paypal_response['purchase_units'][0]['payments']['captures'][0]['seller_protection']['status']);
    $stmt->bindParam(18, $paypal_response['purchase_units'][0]['payments']['captures'][0]['create_time']);
    $stmt->bindParam(19, $paypal_response['purchase_units'][0]['payments']['captures'][0]['update_time']);
    $stmt->bindParam(20, $paypal_response['payer']['name']['given_name']);
    $stmt->bindParam(21, $paypal_response['payer']['name']['surname']);
    $stmt->bindParam(22, $paypal_response['payer']['email_address']);
    $stmt->bindParam(23, $paypal_response['payer']['payer_id']);
    $stmt->bindParam(24, $paypal_response['payer']['address']['country_code']);

    // execute the statement
    $stmt->execute();

    if ($stmt->rowCount() > 0) {
        echo "Payment successful!";
        $inserted = true;
    } else {
        echo "Payment failed!";
        $inserted = false;
    }
}
if (isset($_POST['txn_id'])) {
    // Assign posted variables to local data array.
    $data = [
        'item_name' => $_POST['item_name'],
        'item_number' => $_POST['item_number'],
        'payment_status' => $_POST['payment_status'],
        'payment_amount' => $_POST['mc_gross'],
        'payment_currency' => $_POST['mc_currency'],
        'txn_id' => $_POST['txn_id'],
        'receiver_email' => $_POST['receiver_email'],
        'payer_email' => $_POST['payer_email'],
        'custom' => $_POST['custom'],
    ];

    // We need to verify the transaction comes from PayPal and check we've not
    // already processed the transaction before adding the payment to our
    // database.
    if (verifyTransaction($_POST) && checkTxnid($data['txn_id'])) {
        if (addPayment($data) !== false) {
            // Payment successfully added.
        }
    }
    function verifyTransaction($data)
    {
        global $paypalUrl;

        $req = 'cmd=_notify-validate';
        foreach ($data as $key => $value) {
            $value = urlencode(stripslashes($value));
            $value = preg_replace('/(.*[^%^0^D])(%0A)(.*)/i', '${1}%0D%0A${3}', $value); // IPN fix
            $req .= "&$key=$value";
        }

        $ch = curl_init($paypalUrl);
        curl_setopt($ch, CURLOPT_HTTP_VERSION, CURL_HTTP_VERSION_1_1);
        curl_setopt($ch, CURLOPT_POST, 1);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $req);
        curl_setopt($ch, CURLOPT_SSLVERSION, 6);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, 1);
        curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 2);
        curl_setopt($ch, CURLOPT_FORBID_REUSE, 1);
        curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 30);
        curl_setopt($ch, CURLOPT_HTTPHEADER, array('Connection: Close'));
        $res = curl_exec($ch);

        if (!$res) {
            $errno = curl_errno($ch);
            $errstr = curl_error($ch);
            curl_close($ch);
            throw new Exception("cURL error: [$errno] $errstr");
        }

        $info = curl_getinfo($ch);

        // Check the http response
        $httpCode = $info['http_code'];
        if ($httpCode != 200) {
            throw new Exception("PayPal responded with http code $httpCode");
        }
        curl_close($ch);

        return $res === 'VERIFIED';
    }
    function checkTxnid($txnid)
    {
        global $db;

        $txnid = $db->real_escape_string($txnid);
        $results = $db->query('SELECT * FROM `paypal_payments` WHERE txnid = \'' . $txnid . '\'');

        return !$results->num_rows;
    }
    function addPayment($data)
    {
        global $db;

        if (is_array($data)) {
            $stmt = $db->prepare('INSERT INTO `paypal_payments` (txnid, payment_amount, payment_status, itemid, createdtime) VALUES(?, ?, ?, ?, ?)');
            $stmt->bind_param(
                'sdsss',
                $data['txn_id'],
                $data['payment_amount'],
                $data['payment_status'],
                $data['item_number'],
                date('Y-m-d H:i:s')
            );
            $stmt->execute();
            $stmt->close();

            return $db->insert_id;
        }

        return false;
    }
}
// sql to create table paypal_payments
$sql_table = "CREATE TABLE paypal_payments (
id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
uid INT(6) NOT NULL,
order_id INT(6) NOT NULL,
total VARCHAR(30) NOT NULL,
currency VARCHAR(30) NOT NULL,
status VARCHAR(30) NOT NULL,
txnid VARCHAR(30) NOT NULL,
payment_amount VARCHAR(30) NOT NULL,
payment_status VARCHAR(30) NOT NULL,
itemid VARCHAR(30) NOT NULL,
createdtime VARCHAR(30) NOT NULL
)";

?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Payment Success</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>

<body>
    <div class="container mt-5">
        <div class="row">
            <div class="col-md-6 mx-auto">
                <div class="card p-3 text-center">
                    <?php if ($inserted) : ?>
                        <h3>Payment Successful</h3>
                        <p>Thank you for your payment!</p>
                        <a href="index.php" class="btn btn-primary">Go back to homepage</a>
                    <?php else : ?>
                        <h3>Payment Failed</h3>
                        <p>Something went wrong with your payment!</p>
                        <a href="index.php" class="btn btn-primary">Go back to homepage</a>
                    <?php endif; ?>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>

</html>
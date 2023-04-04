<?php
session_start();
$price = $_SESSION['dailyprice'];
$name = $_SESSION['vname'];
// var_dump($_SESSION);
if (isset($_GET['ref'])) {
    $ref = $_GET['ref'];
}
?>
<html>

<body>

    <head>
        <title>Checkout</title>
        <link rel="stylesheet" href="assets\css\bootstrap.min.css">
        <!-- jquery cdn -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <style>
            #smart-button-container {
                text-align: center;
                margin: 0px auto;
                margin: 20px;
                font-family: Arial, Helvetica, sans-serif;
            }
        </style>
    </head>
    <!--form action="https://www.sandbox.paypal.com/cgi-bin/webscr" method="post" target="_top">
<input type="hidden" name="cmd" value="_s-xclick">
<input type="hidden" name="hosted_button_id" value="8EP37R4F8W2U8">
<input type="image" src="https://www.sandbox.paypal.com/en_US/i/btn/btn_buynowCC_LG.gif" border="0" name="submit" alt="PayPal - The safer, easier way to pay online!">
<img alt="" border="0" src="https://www.sandbox.paypal.com/en_US/i/scr/pixel.gif" width="1" height="1">
</form-->
    <div class="container mt-5 mx-auto">
        <div class="row justify-content-center">
            <div class="col-lg-6 justify-content-center align-items-center">
                <div class="card p-3">
                    <!-- title -->
                    <h1 class="text-center">VPMS Checkout</h1>
                    <div class="d-flex flex-row align-items-center justify-content-between text-white">
                        <div class="d-flex flex-row align-items-center">
                            <i class="fa fa-angle-left"></i>
                            <span class="ml-2">Vehicle Name:</span>
                        </div>
                        <!-- <div class="image mr-3">
                            <img src="https://i.imgur.com/0LKZQYM.jpg" class="rounded-circle" width="30" />
                        </div> -->
                    </div>

                    <div class="form-group mt-4">
                        <input type="text" class="form-control" name="descriptionInput" id="description" maxlength="127" value="<?php echo $name; ?>" placeholder="Vehicle Name" required>
                        <div class="invalid-feedback">Please enter a description</div>
                    </div>

                    <div class="form-group">
                        <label for="amount">Price per day: </label>
                        <div class="input-group">
                            <input type="number" class="form-control" name="amountInput" id="amount" value="<?php echo $price; ?>" placeholder="Price per day" required>
                            <div class="input-group-append">
                                <span class="input-group-text">USD</span>
                            </div>
                        </div>
                    </div>

                    <!-- Lipa Mpesa -->
                    <div class="mt-4" style="margin: 10px 0;">
                        <a href="checkout.php?ref=<?php echo $ref; ?>&total=<?php echo $price; ?>" class="btn btn-success btn-block">Lipa na Mpesa</a>
                    </div>

                    <div class="form-group mt-4">
                        <div id="invoiceidDiv">

                        </div>
                    </div>

                    <div style="text-align: center; margin-top: 0.625rem;" id="paypal-button-container"></div>
                </div>
            </div>
        </div>
    </div>

    <!-- <script src="https://www.paypal.com/sdk/js?client-id=sb&enable-funding=venmo&currency=USD" data-sdk-integration-source="button-factory"></script> -->
    <script src="https://www.paypal.com/sdk/js?client-id=ARe70XLTQPZhu9bdxC22ky4VQfA9zdO1iat7oZmWsKNm4uGl8I0ubk3n5RQO3VCHy130Q6Nylt0ks9sX"></script>

    <script>
        paypal.Buttons({
            createOrder: function(data, actions) {
                return actions.order.create({
                    purchase_units: [{
                        amount: {
                            value: '<?php echo $price; ?>'
                        }
                    }]
                });
            },
            onApprove: function(data, actions) {
                return actions.order.capture().then(function(details) {
                    // Redirect to success page, with PayPal response
                    var url = "success.php?paypal_response=" + JSON.stringify(details);
                    window.location.href = url;
                });
            }
        }).render('#invoiceidDiv');
    </script>
    <!-- http://localhost/projectexe/Online_Car_Rental/Online_Car_Rental/success.php?paypal_response={%22id%22:%223GC22164T6282350S%22,%22intent%22:%22CAPTURE%22,%22status%22:%22COMPLETED%22,%22purchase_units%22:[{%22reference_id%22:%22default%22,%22amount%22:{%22currency_code%22:%22USD%22,%22value%22:%22200.00%22},%22payee%22:{%22email_address%22:%22sb-4346ob8166531@business.example.com%22,%22merchant_id%22:%22ZZ2Q244CWPGNN%22},%22shipping%22:{%22name%22:{%22full_name%22:%22John%20Doe%22},%22address%22:{%22address_line_1%22:%22Free%20Trade%20Zone%22,%22admin_area_2%22:%22Nairobi%22,%22postal_code%22:%2200521%22,%22country_code%22:%22KE%22}},%22payments%22:{%22captures%22:[{%22id%22:%2208439585C5594082D%22,%22status%22:%22COMPLETED%22,%22amount%22:{%22currency_code%22:%22USD%22,%22value%22:%22200.00%22},%22final_capture%22:true,%22seller_protection%22:{%22status%22:%22ELIGIBLE%22,%22dispute_categories%22:[%22ITEM_NOT_RECEIVED%22,%22UNAUTHORIZED_TRANSACTION%22]},%22create_time%22:%222023-04-04T05:47:29Z%22,%22update_time%22:%222023-04-04T05:47:29Z%22}]}}],%22payer%22:{%22name%22:{%22given_name%22:%22John%22,%22surname%22:%22Doe%22},%22email_address%22:%22sb-ezvrg8166530@personal.example.com%22,%22payer_id%22:%22LH9X7GT42P32Y%22,%22address%22:{%22country_code%22:%22KE%22}},%22create_time%22:%222023-04-04T05:47:14Z%22,%22update_time%22:%222023-04-04T05:47:29Z%22,%22links%22:[{%22href%22:%22https://api.sandbox.paypal.com/v2/checkout/orders/3GC22164T6282350S%22,%22rel%22:%22self%22,%22method%22:%22GET%22}]} -->
</body>

</html>
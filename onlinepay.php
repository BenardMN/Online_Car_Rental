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
                    // Redirect to success page
                    window.location.href = 'success.php';
                });
            }
        }).render('#invoiceidDiv');
    </script>

</body>

</html>
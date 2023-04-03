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
    <div id="smart-button-container container">
        <div style="text-align: center;">
            <label for="description">Vehicle Name: </label>
            <input type="text" name="descriptionInput" id="description" maxlength="127" value="<?php echo $name; ?>">
        </div>
        <p id="descriptionError" style="visibility: hidden; color:red; text-align: center;">Please enter a description</p>
        <div style="text-align: center">
            <label for="amount">Price per day: </label>
            <input name="amountInput" type="number" id="amount" value="<?php echo $price; ?>"><span> USD</span>
        </div>
        <!-- lipa mpesa -->
        <div class="mpesa my-6" style="text-align: center;">
            <a href="checkout.php?ref=<?php echo $ref; ?>&total=<?php echo $price; ?>" class="btn btn-success align-center">Lipa na Mpesa</a>
        </div>
        <p id="priceLabelError" style="visibility: hidden; color:red; text-align: center;">Please enter a price</p>
        <div id="invoiceidDiv" style="text-align: center; display: none;">
            <label for="invoiceid"> </label>
            <input name="invoiceid" maxlength="127" type="text" id="invoiceid" value="<?php echo $ref; ?>">
        </div>
        <p id="invoiceidError" style="visibility: hidden; color:red; text-align: center;">Please enter an Invoice ID</p>
        <div style="text-align: center; margin-top: 0.625rem;" id="paypal-button-container"></div>
    </div>

    <script src="https://www.paypal.com/sdk/js?client-id=sb&enable-funding=venmo&currency=USD" data-sdk-integration-source="button-factory"></script>
    <script>
        function initPayPalButton() {
            var description = $('#description').val();
            var amount = $('#amount').val();
            var descriptionError = $('#descriptionError');
            var priceError = $('#priceLabelError');
            var invoiceid = $('#invoiceid').val();
            var invoiceidError = $('#invoiceidError');
            var invoiceidDiv = $('#invoiceidDiv');

            var elArr = [description, amount];

            /* if (invoiceidDiv.firstChild.innerHTML.length > 1) {
                invoiceidDiv.style.display = "block";
            } */

            var purchase_units = [];
            purchase_units[0] = {};
            purchase_units[0].amount = {};

            function validate(event) {
                return event.value.length > 0;
            }

            paypal.Buttons({
                style: {
                    color: 'gold',
                    shape: 'rect',
                    label: 'paypal',
                    layout: 'vertical',

                },

                onInit: function(data, actions) {
                    actions.disable();

                    if (invoiceidDiv.style.display === "block") {
                        elArr.push(invoiceid);
                    }

                    elArr.forEach(function(item) {
                        item.addEventListener('keyup', function(event) {
                            var result = elArr.every(validate);
                            if (result) {
                                actions.enable();
                            } else {
                                actions.disable();
                            }
                        });
                    });
                },

                onClick: function() {
                    if (description.value.length < 1) {
                        descriptionError.style.visibility = "visible";
                    } else {
                        descriptionError.style.visibility = "hidden";
                    }

                    if (amount.value.length > 1) {
                        priceError.style.visibility = "visible";
                    } else {
                        priceError.style.visibility = "hidden";
                    }

                    if (invoiceid.value.length < 1 && invoiceidDiv.style.display === "block") {
                        invoiceidError.style.visibility = "visible";
                    } else {
                        invoiceidError.style.visibility = "hidden";
                    }

                    purchase_units[0].description = description.value;
                    purchase_units[0].amount.value = amount.value;

                    if (invoiceid.value !== '') {
                        purchase_units[0].invoice_id = invoiceid.value;
                    }
                },

                createOrder: function(data, actions) {
                    return actions.order.create({
                        purchase_units: purchase_units,
                    });
                },

                onApprove: function(data, actions) {
                    return actions.order.capture().then(function(orderData) {

                        // Full available details
                        console.log('Capture result', orderData, JSON.stringify(orderData, null, 2));

                        // Show a success message within this page, e.g.
                        const element = document.getElementById('paypal-button-container');
                        element.innerHTML = '';
                        element.innerHTML = '<h3>Thank you for your payment!</h3>';

                        // Or go to another URL:  actions.redirect('thank_you.html');
                        //window.location.href = "index.php";

                    });
                },

                onError: function(err) {
                    console.log(err);
                }
            }).render('#paypal-button-container');
        }
        initPayPalButton();
    </script>
</body>

</html>
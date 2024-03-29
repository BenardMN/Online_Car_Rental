<?php
session_start();
error_reporting(0);
include('includes/config.php');
if (strlen($_SESSION['alogin']) == 0) {
    header('location:index.php');
}
?>

<!doctype html>
<html lang="en" class="no-js">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <meta name="theme-color" content="#3e454c">

    <title>Ride Poa |Admin Manage transactions </title>

    <!-- Font awesome -->
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <!-- Sandstone Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!-- Bootstrap Datatables -->
    <link rel="stylesheet" href="css/dataTables.bootstrap.min.css">
    <!-- Bootstrap social button library -->
    <link rel="stylesheet" href="css/bootstrap-social.css">
    <!-- Bootstrap select -->
    <link rel="stylesheet" href="css/bootstrap-select.css">
    <!-- Bootstrap file input -->
    <link rel="stylesheet" href="css/fileinput.min.css">
    <!-- Awesome Bootstrap checkbox -->
    <link rel="stylesheet" href="css/awesome-bootstrap-checkbox.css">
    <!-- Admin Stye -->
    <link rel="stylesheet" href="css/style.css">
    <style>
        .errorWrap {
            padding: 10px;
            margin: 0 0 20px 0;
            background: #fff;
            border-left: 4px solid #dd3d36;
            -webkit-box-shadow: 0 1px 1px 0 rgba(0, 0, 0, .1);
            box-shadow: 0 1px 1px 0 rgba(0, 0, 0, .1);
        }

        .succWrap {
            padding: 10px;
            margin: 0 0 20px 0;
            background: #fff;
            border-left: 4px solid #5cb85c;
            -webkit-box-shadow: 0 1px 1px 0 rgba(0, 0, 0, .1);
            box-shadow: 0 1px 1px 0 rgba(0, 0, 0, .1);
        }
    </style>

</head>

<body>
    <?php include('includes/header.php'); ?>
    <div class="ts-main-content">
        <?php include('includes/leftbar.php'); ?>
        <div class="content-wrapper">
            <div class="container-fluid">

                <div class="row">
                    <div class="col-md-12">

                        <h2 class="page-title">Transactions</h2>

                        <!-- Zero Configuration Table -->
                        <div class="panel panel-default">
                            <div class="panel-heading">All transactions</div>
                            <div class="panel-body">
                                <?php if ($error) { ?>
                                    <div class="errorWrap">
                                        <strong>ERROR</strong>:<?php echo htmlentities($error); ?>
                                    </div><?php } else if ($msg) { ?>
                                    <div class="succWrap"><strong>SUCCESS</strong>:<?php echo htmlentities($msg); ?> </div><?php } ?>
                                <table id="zctb" class="display table table-striped table-bordered table-hover" cellspacing="0" width="100%">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Transaction id</th>
                                            <th>Amount </th>
                                            <th>Status</th>
                                            <th>Vehicle id</th>
                                            <th>Order id</th>
                                            <th>Date</th>
                                            <!-- <th>Email</th>
                                            <th>Card Number</th>
                                            <th>Expiry date</th>
                                            <th>Holder</th>
                                            <th>cvc</th> -->
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>#</th>
                                            <th>Transaction id</th>
                                            <th>Amount </th>
                                            <th>Status</th>
                                            <th>Vehicle id</th>
                                            <th>Order id</th>
                                            <th>Date</th>
                                            <!-- <th>Email</th> -->
                                            <!-- <th>Card Number</th> -->
                                            <!-- <th>Expiry date</th> -->
                                            <!-- <th>Holder</th> -->
                                            <!-- <th>cvc</th> -->
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                        <?php $sql = "SELECT * from  payments ";
                                        $query = $dbh->prepare($sql);
                                        $query->execute();
                                        $results = $query->fetchAll(PDO::FETCH_OBJ);
                                        $cnt = 1;
                                        if ($query->rowCount() > 0) {
                                            foreach ($results as $result) {
                                                $id = $result->id;
                                                $CheckoutRequestID = $result->CheckoutRequestID;
                                                $CustomerMessage = $result->CustomerMessage;
                                                $phone = $result->phone;
                                                $order_id = $result->order_id;
                                                $timeStamp = $result->timeStamp;
                                                $get_amount = "SELECT PricePerDay, vehicleId FROM tblbooking JOIN tblvehicles ON tblbooking.VehicleId = tblvehicles.id WHERE tblbooking.id = '$order_id';";
                                                $get_query = $dbh->prepare($get_amount);
                                                $get_query->execute();
                                                $get_results = $get_query->fetchAll(PDO::FETCH_OBJ);
                                                $PricePerDay = $get_results[0]->PricePerDay;
                                                $vehicleId = $get_results[0]->vehicleId;
                                                // echo $PricePerDay;
                                        ?>
                                                <tr>
                                                    <td><?php echo htmlentities($id); ?></td>
                                                    <td><?php echo htmlentities($CheckoutRequestID); ?></td>
                                                    <td><?php echo htmlentities($PricePerDay); ?></td>
                                                    <td><?php echo htmlentities($CustomerMessage); ?></td>
                                                    <td><?php echo htmlentities($vehicleId); ?></td>
                                                    <td><?php echo htmlentities($order_id); ?></td>
                                                    <td><?php echo htmlentities($timeStamp); ?></td>
                                                </tr>
                                                <!-- <tr>
                                                    <td><?php echo htmlentities($cnt); ?></td>
                                                    <td><?php echo htmlentities($result->txn_id); ?></td>
                                                    <td><?php echo htmlentities($result->payment_amount); ?></td>
                                                    <td><?php echo htmlentities($result->payment_status); ?></td>
                                                    <td><?php echo htmlentities($result->vehicleId); ?></td>
                                                    <td><?php echo htmlentities($result->created); ?></td>
                                                    <td><?php echo htmlentities($result->payer_email); ?></td>
                                                    <td><?php echo htmlentities($result->cardNumber); ?></td>
                                                    <td><?php echo htmlentities($result->expiryDate); ?></td>
                                                    <td><?php echo htmlentities($result->holder); ?></td>
                                                    <td><?php echo htmlentities($result->cvc); ?></td>
                                                </tr> -->
                                        <?php $cnt = $cnt + 1;
                                            }
                                        } ?>

                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Loading Scripts -->
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap-select.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.dataTables.min.js"></script>
    <script src="js/dataTables.bootstrap.min.js"></script>
    <script src="js/Chart.min.js"></script>
    <script src="js/fileinput.js"></script>
    <script src="js/chartData.js"></script>
    <script src="js/main.js"></script>
</body>

</html>
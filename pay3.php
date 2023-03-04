<?php
session_start();
error_reporting(0);
include('includes/config.php');
if(isset($_POST['submit'])){
    $cardNumber = $_POST['cardNumber'];
    $expiryDate = $_POST['expiryDate'];
    $holder = $_POST['holder'];
    $cvc = $_POST['cvc'];
    $useremail = $_SESSION['login'];
    $vhid = $_GET['vhid'];
    $sql = "INSERT INTO transactions(payer_email,vehicleId,cardNumber,expiryDate,holder,cvc) VALUES(:useremail,:vhid,:cardNumber,:expiryDate,:holder,:cvc)";
    $query = $dbh->prepare($sql);
    $query->bindParam(':useremail', $useremail, PDO::PARAM_STR);
    $query->bindParam(':vhid', $vhid, PDO::PARAM_STR);
    $query->bindParam(':cardNumber', $cardNumber, PDO::PARAM_STR);
    $query->bindParam(':expiryDate', $expiryDate, PDO::PARAM_STR);
    $query->bindParam(':holder', $holder, PDO::PARAM_STR);
    $query->bindParam(':cvc', $cvc, PDO::PARAM_STR);
    $query->execute();
    if($lastInsertId){
        echo "<script>alert('Payment successful. Your Booking is being processed.');</script>";
        //header('location:pay3.php');
    }
    else {
        echo "<script>alert('Something went wrong. Please try again');</script>";
    }
}
?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Ride Poa | Payment</title>
    <link rel="stylesheet" type="text/css" href="assets/payment/pay3.css">
    <link rel="stylesheet" type="text/css" href="assets/payment/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css">
    <script type="text/javascript" src="assets/payment/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://www.paypal.com/sdk/js?client-id=AfB3FC_Sjr9Gi3FGfW5abMvnRDk0hk3SWA1GA4D2ttOr8IvmaR6IbeULB9c9L_Jsk4kyLuoLq08afclu&locale=en_KE"></script>
</head>
<body>
    <div class="container">
        <div class="row m-0">
        <?php
        $sql = "SELECT tblvehicles.*,tblbrands.BrandName,tblbooking.FromDate,tblbooking.ToDate,tblbrands.id as bid  from tblvehicles join tblbrands on tblbrands.id=tblvehicles.VehiclesBrand";
        $query = $dbh -> prepare($sql);
        $query->execute();
        $results=$query->fetchAll(PDO::FETCH_OBJ);
        $cnt=1;
        if($query->rowCount() > 0)
        {
            foreach($results as $result)
            {
                $_SESSION['brndid'] = $result->bid;?>
            <div class="col-lg-7 pb-5 pe-lg-5">
                <div class="row">
                    <div class="col-12 p-5">
                    <img src="admin/img/vehicleimages/<?php echo htmlentities($result->Vimage1);?>" alt="image">
                    </div>
                    <div class="row m-0 bg-light">
                        <div class="col-md-4 col-6 ps-30 my-4">
                            <p class="text-muted">Model</p>
                            <p class="h5 m-0"><?php echo htmlentities($result->BrandName);?></a></p>
                        </div>
                        <div class="col-md-4 col-6 ps-30 my-4">
                            <p class="text-muted">Name</p>
                            <p class="h5 m-0"><?php echo htmlentities($result->VehiclesTitle);?></p>
                        </div>
                        <div class="col-md-4 col-6 ps-30 pe-0 my-4">
                            <p class="text-muted">Fuel type</p>
                            <p class="h5 m-0"><?php echo htmlentities($result->FuelType);?></p>
                        </div>
                        <div class="col-md-4 col-6  ps-30 my-4">
                            <p class="text-muted">Seats</p>
                            <p class="h5 m-0"><?php echo htmlentities($result->SeatingCapacity);?></p>
                        </div>
                        <div class="col-md-4 col-6 ps-30 my-4">
                            <p class="text-muted">Model year</p>
                            <p class="h5 m-0"><?php echo htmlentities($result->ModelYear);?></p>
                        </div>
                        <div class="col-md-4 col-6 ps-30 my-4">
                            <p class="text-muted">Location</p>
                            <p class="h5 m-0"><?php echo htmlentities($result->CarLocation);?></p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-5 p-0 ps-lg-4">
            <?php 
            $date1 = DateTime::createFromFormat('d/m/Y', $result->FromDate);
            $date2 = DateTime::createFromFormat('d/m/Y', $result->ToDate);
            $day_diff = $date2->diff($date1);
            $daysLeft = $day_diff->d;
            $totalcost = $daysLeft * $result->PricePerDay; ?>
                <div class="row m-0">
                    <div class="col-12 px-4">
                        <div class="d-flex align-items-end mt-4 mb-2">
                            <p class="h4 m-0"><span class="pe-1">Payment Details</span></p>
                        </div>
                        <div class="d-flex justify-content-between mb-2">
                            <p class="textmuted">Days hired</p>
                            <p class="fs-14 fw-bold"><span class="fas fa-dollar-sign pe-1"></span><?php echo htmlentities($daysLeft." days");?></p>
                        </div>
                        <div class="d-flex justify-content-between mb-2">
                            <p class="textmuted">Price per day</p>
                            <p class="fs-14 fw-bold"><span class="fas fa-dollar-sign pe-1"></span><?php echo htmlentities($result->PricePerDay);?></p>
                        </div>
                        <div class="d-flex justify-content-between mb-3">
                            <p class="textmuted fw-bold">Total</p>
                            <div class="d-flex align-text-top ">
                                <span class="fas fa-dollar-sign mt-1 pe-1 fs-14 "></span><span class="h4"><?php echo htmlentities($totalcost); ?></span>
                            </div>
                        </div>
                    </div>
                    <form method="post">
                    <div class="col-12 px-0">
                        <div class="row bg-light m-0">
                            <div class="col-12 px-4 my-4">
                                <p class="fw-bold h4 m-0">Credit Card Info</p>
                            </div>
                            <div class="col-12 px-4">
                                <div class="d-flex  mb-4">
                                    <span class="">
                                        <p class="text-muted">Card number</p>
                                        <input class="form-control" name="cardNumber" type="text" placeholder="1234 5678 9012 3456">
                                    </span>
                                    <div class=" w-100 d-flex flex-column align-items-end">
                                        <p class="text-muted">Expires</p>
                                        <input class="form-control2" name="expiryDate" type="text" placeholder="MM/YYYY">
                                    </div>
                                </div>
                                <div class="d-flex mb-5">
                                    <span class="me-5">
                                        <p class="text-muted">Cardholder name</p>
                                        <input class="form-control" name="holder" type="text" placeholder="Name">
                                    </span>
                                    <div class="w-100 d-flex flex-column align-items-end">
                                        <p class="text-muted">CVC</p>
                                        <input class="form-control3" name="cvc" type="text" placeholder="XXX">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row m-0">
                            <div class="col-12  mb-4 p-0">
                                <div class="btn btn-primary"><button class="btn btn-primary" name="submit"><?php print('PAY $'.$totalcost);?>
                                </div>
                            </div>
                        </div>
                    </div></form>
                </div>
            </div>
        </div> <?php }} ?>
    </div>
</body>
</html>
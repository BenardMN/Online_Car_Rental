<?php
session_start();
error_reporting(0);
include('includes/config.php');
if(strlen($_SESSION['login'])==0)
  { 
    header('location:index.php');
}
else{ ?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>pay3</title>
    <link rel="stylesheet" type="text/css" href="assets/payment/pay3.css">
    <link rel="stylesheet" type="text/css" href="assets/payment/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css">
    <script type="text/javascript" src="assets/payment/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
    <!--Header-->
    <?php //include('includes/header.php');
    
    $useremail=$_SESSION['login'];
    $sql = "SELECT * from tblusers where EmailId=:useremail";
    $query = $dbh -> prepare($sql);
    $query -> bindParam(':useremail',$useremail, PDO::PARAM_STR);
    $query->execute();
    $results=$query->fetchAll(PDO::FETCH_OBJ);
    $cnt=1; ?>
    <div class="container">
        <div class="row m-0">
        <?php 
        $sql1 = "SELECT tblvehicles.Vimage1 as Vimage1,tblvehicles.VehiclesTitle,tblvehicles.FuelType,tblvehicles.SeatingCapacity,tblvehicles.ModelYear,tblvehicles.CarLocation,tblvehicles.PricePerDay,tblvehicles.id as vid,tblbrands.BrandName,tblbooking.FromDate,tblbooking.ToDate from tblbooking join tblvehicles on tblbooking.VehicleId=tblvehicles.id join tblbrands on tblbrands.id=tblvehicles.VehiclesBrand where tblbooking.userEmail=:useremail";
        $query1 = $dbh -> prepare($sql1);
        $query1-> bindParam(':useremail', $useremail, PDO::PARAM_STR);
        $query1->execute();
        $results1=$query1->fetchAll(PDO::FETCH_OBJ);
        $cnt1=1;
        if($query1->rowCount() > 0)
        {
            foreach($results1 as $result)
            {  ?>
            <div class="col-lg-7 pb-5 pe-lg-5">
                <div class="row">
                    <div class="col-12 p-5">
                    <a href="vehical-details.php?vhid=<?php echo htmlentities($result->vid);?>""><img src="admin/img/vehicleimages/<?php echo htmlentities($result->Vimage1);?>" alt="image">
                        <!--img src="patrol-2.jpg" alt="Nissan Patrol"-->
                    </div>
                    <div class="row m-0 bg-light">
                        <div class="col-md-4 col-6 ps-30 my-4">
                            <p class="text-muted">Model</p>
                            <p class="h5 m-0"><a href="vehical-details.php?vhid=<?php echo htmlentities($result->vid);?>""> <?php echo htmlentities($result->BrandName);?></a></p>
                            <!--p class="h5 m-0">Nissan</p-->
                        </div>
                        <div class="col-md-4 col-6 ps-30 my-4">
                            <p class="text-muted">Name</p>
                            <p class="h5 m-0"><a href="vehical-details.php?vhid=<?php echo htmlentities($result->vid);?>""> <?php echo htmlentities($result->VehiclesTitle);?></p>
                        </div>
                        <div class="col-md-4 col-6 ps-30 pe-0 my-4">
                            <p class="text-muted">Fuel type</p>
                            <p class="h5 m-0"><a href="vehical-details.php?vhid=<?php echo htmlentities($result->vid);?>""> <?php echo htmlentities($result->FuelType);?></p>
                        </div>
                        <div class="col-md-4 col-6  ps-30 my-4">
                            <p class="text-muted">Seats</p>
                            <p class="h5 m-0"><a href="vehical-details.php?vhid=<?php echo htmlentities($result->vid);?>""> <?php echo htmlentities($result->SeatingCapacity);?></p>
                        </div>
                        <div class="col-md-4 col-6 ps-30 my-4">
                            <p class="text-muted">Model year</p>
                            <p class="h5 m-0"><a href="vehical-details.php?vhid=<?php echo htmlentities($result->vid);?>""> <?php echo htmlentities($result->ModelYear);?></p>
                        </div>
                        <div class="col-md-4 col-6 ps-30 my-4">
                            <p class="text-muted">Location</p>
                            <p class="h5 m-0"><a href="vehical-details.php?vhid=<?php echo htmlentities($result->vid);?>""> <?php echo htmlentities($result->CarLocation);?></p>
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
                                <div class="btn btn-primary"><?php print($totalcost);?><span class="fas fa-arrow-right ps-2"></span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div> <?php }} ?>
    </div>
</body>
</html> <?php } ?>
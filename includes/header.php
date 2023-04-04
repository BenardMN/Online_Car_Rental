<header>
    <!-- Navigation -->
    <nav id="navigation_bar" class="navbar navbar-default">
        <div class="container">
            <div class="navbar-header">
                <button id="menu_slide" data-target="#navigation" aria-expanded="false" data-toggle="collapse" class="navbar-toggle collapsed" type="button"> <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
            </div>
            <div class="header_wrap">
                <div class="user_login">
                    <ul>
                        <li class="dropdown"> <a href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fa fa-user-circle" aria-hidden="true"></i>
                                <?php
                                $email = $_SESSION['login'];
                                $sql = "SELECT FullName FROM tblusers WHERE EmailId=:email ";
                                $query = $dbh->prepare($sql);
                                $query->bindParam(':email', $email, PDO::PARAM_STR);
                                $query->execute();
                                $results = $query->fetchAll(PDO::FETCH_OBJ);
                                if ($query->rowCount() > 0) {
                                    foreach ($results as $result) {
                                        echo htmlentities($result->FullName);
                                    }
                                } ?><i class="fa fa-angle-down" aria-hidden="true"></i></a>
                            <ul class="dropdown-menu">
                                <?php if ($_SESSION['login']) { ?>
                                    <li><a href="profile.php">Profile Settings</a></li>
                                    <li><a href="update-password.php">Update Password</a></li>
                                    <li><a href="my-booking.php">My Booking</a></li>
                                    <li><a href="post-testimonial.php">Post a Testimonial</a></li>
                                    <li><a href="my-testimonials.php">My Testimonial</a></li>
                                    <li><a href="logout.php">Sign Out</a></li>
                                <?php } else { ?>
                                    <li>
                                        <div class="login_btn">
                                            <a href="#loginform" class="btn btn-xs uppercase" data-toggle="modal" data-dismiss="modal">
                                                Sign In</a>
                                        </div>
                                    </li>
                                    <li><a href="update-password.php">Update Password</a></li>
                                    <li><a href="my-booking.php">My Booking</a></li>
                                    <li><a href="post-testimonial.php">Post a Testimonial</a></li>
                                    <li><a href="my-testimonials.php">My Testimonial</a></li>
                                <?php } ?>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="collapse navbar-collapse" id="navigation">
                <ul class="nav navbar-nav">
                    <li><a href="index.php">Home</a> </li>
                    <li><a href="car-listing.php">Car Listing</a>
                    <li><a href="page.php?type=aboutus">About Us</a></li>
                    <li><a href="contact-us.php">Contact Us</a></li>
                    <li><a href="page.php?type=faqs">FAQs</a></li>
                    <li>
                        <div class="header_search">
                            <form action="search.php" method="get" id="form" role="search">
                                <input type="search" id="query" name="q" placeholder="Search..." class="form-control" aria-label="Search through site content">
                                <button>Go!</button>
                            </form>
                            <!-- <script>
                                const f = document.getElementById("form");
                                const q = document.getElementById("query");
                                const google = 'https://www.google.com/search?q=site%3A+';
                                const site = 'http://localhost/projectexe/Online_Car_Rental/Online_Car_Rental/';

                                function submitted(event) {
                                    event.preventDefault();
                                    const url = google + site + '+' + q.value;
                                    const win = window.open(url, '_blank');
                                    win.focus();
                                }

                                f.addEventListener('submit', submitted);
                            </script> -->
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <!--/Navigation-->
</header>
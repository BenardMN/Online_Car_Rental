-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 03, 2023 at 01:36 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `test`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `UserName` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `updationDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `UserName`, `Password`, `updationDate`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', '2022-12-08 11:02:08');

-- --------------------------------------------------------

--
-- Table structure for table `tblbooking`
--

CREATE TABLE `tblbooking` (
  `id` int(11) NOT NULL,
  `userEmail` varchar(100) DEFAULT NULL,
  `PickUpLocation` varchar(255) NOT NULL,
  `VehicleId` int(11) DEFAULT NULL,
  `FromDate` varchar(20) DEFAULT NULL,
  `ToDate` varchar(20) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `Status` int(11) DEFAULT NULL,
  `PostingDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblbooking`
--

INSERT INTO `tblbooking` (`id`, `userEmail`, `PickUpLocation`, `VehicleId`, `FromDate`, `ToDate`, `message`, `Status`, `PostingDate`) VALUES
(6, 'ping2@yahoo.com', '', 3, '27/12/2022', '31/12/2022', 'roadtrip to voi', 0, '2022-12-27 07:49:31'),
(7, 'ping2@yahoo.com', '', 7, '6/1/2013', '12/1/2023', 'Camping to Mt. Kenya', 0, '2023-01-06 09:29:28'),
(8, 'ping2@yahoo.com', '', 8, '6/1/2013', '12/1/2023', 'Going to a ruracio in Muran\'ga', 1, '2023-01-09 10:55:25'),
(9, 'ping2@yahoo.com', '', 8, '17/1/2023', '21/1/2023', 'Attending business meeting at Gelian Hotel', 0, '2023-01-17 17:55:25'),
(10, 'joan12@gmail.com', 'Mlolongo', 9, '17/1/2023', '19/1/2023', 'Trip cation to Kisumu dala', 1, '2023-01-17 18:17:02'),
(11, 'joan12@gmail.com', 'Samson Corner', 8, '17/1/2023', '19/1/2023', 'Offroad drive', 1, '2023-01-17 18:23:24'),
(12, 'jamesKK@gmail.com', 'Blue post', 14, '02/02/2023', '14/02/2023', 'taking family for a outing', 1, '2023-02-03 14:36:53'),
(13, 'jamesKK@gmail.com', 'Samson Corner', 8, '02/06/2023', '15/02/2023', 'Going for a holiday', 0, '2023-02-06 10:52:18'),
(14, 'jamesKK@gmail.com', 'Samson Corner', 8, '02/06/2023', '15/02/2023', 'Going for a holiday', 0, '2023-02-06 11:07:29'),
(15, 'jamesKK@gmail.com', 'Mwea', 13, '08/02/2023', '14/02/2023', 'Trip  to Mandera', 0, '2023-02-08 13:53:35'),
(16, 'jamesKK@gmail.com', 'Kutus', 12, '01/02/2023', '14/02/2023', 'bbg', 0, '2023-02-13 13:10:30'),
(17, 'jamesKK@gmail.com', 'Sagana', 11, '20/02/2023', '21/02/2023', 'Atteding vip meeting', 0, '2023-02-20 10:11:13'),
(18, 'jamesKK@gmail.com', 'Sagana', 15, '01/02/2023', '12/1/2023', 'going on a family trip', 0, '2023-02-27 06:34:40'),
(19, 'jamesKK@gmail.com', 'Kutus', 8, '02/02/2023', '10/02/2023', 'mmmmmmmm', 0, '2023-02-28 11:08:58'),
(20, 'jamesKK@gmail.com', 'Thika', 14, '05/03/2023', '07/03/2023', 'Atending graduation', 0, '2023-03-05 08:59:27'),
(21, 'jamesKK@gmail.com', 'Samson Corner', 8, '01/02/2023', '14/02/2023', 'holiday', 0, '2023-03-06 09:22:45'),
(22, 'jamesKK@gmail.com', 'Sagana', 11, '06/03/2023', '07/03/2023', 'need for a day', 0, '2023-03-06 13:06:41'),
(23, 'jamesKK@gmail.com', 'Sagana', 11, '06/03/2023', '07/03/2023', 'need for a day', 0, '2023-03-11 09:15:49'),
(24, 'jamesKK@gmail.com', 'Kutus', 12, '11/3/2023', '12/3/2023', 'need for a day', 0, '2023-03-11 12:53:24'),
(25, 'jamesKK@gmail.com', 'Kutus', 12, '11/3/2023', '12/3/2023', 'ggmu', 0, '2023-03-11 13:48:13'),
(26, 'jamesKK@gmail.com', 'Thika', 17, '11/3/2023', '12/3/2023', 'ggmu', 0, '2023-03-11 14:53:03'),
(27, 'jamesKK@gmail.com', 'Thika', 17, '11/3/2023', '12/3/2023', 'ggmu', 0, '2023-03-11 14:53:15'),
(28, 'jamesKK@gmail.com', 'Thika', 17, '11/3/2023', '12/3/2023', 'ggmu', 0, '2023-03-11 14:54:01'),
(29, 'jamesKK@gmail.com', 'Thika', 17, '11/3/2023', '12/3/2023', 'ggmu', 0, '2023-03-11 14:54:06'),
(30, 'jamesKK@gmail.com', 'Thika', 17, '11/3/2023', '12/3/2023', 'ggmu', 0, '2023-03-11 14:54:10'),
(31, 'jamesKK@gmail.com', 'Thika', 17, '11/3/2023', '12/3/2023', 'ggmu', 0, '2023-03-11 14:55:03'),
(32, 'jamesKK@gmail.com', 'Thika', 17, '11/3/2023', '12/3/2023', 'ggmu', 0, '2023-03-12 06:19:36'),
(33, 'jamesKK@gmail.com', 'Samson Corner', 8, '20/3/2023', '21/3/2023', 'for a day', 0, '2023-03-20 08:42:40'),
(34, 'jamesKK@gmail.com', 'Samson Corner', 8, '20/3/2023', '21/3/2023', 'for a day', 0, '2023-03-20 08:43:20'),
(35, 'benardmuinde00@gmail.com', 'Sagana', 11, '27/03/2023', '28/03/2023', 'need it for aday', 0, '2023-03-27 09:19:19'),
(36, 'benardmuinde00@gmail.com', 'Sagana', 11, '27/03/2023', '28/03/2023', 'need it for aday', 0, '2023-03-27 09:46:15'),
(37, 'benardmuinde00@gmail.com', 'Kutus', 12, '27/03/2023', '28/03/2023', 'NEED IT ', 0, '2023-03-27 11:32:38');

-- --------------------------------------------------------

--
-- Table structure for table `tblbrands`
--

CREATE TABLE `tblbrands` (
  `id` int(11) NOT NULL,
  `BrandName` varchar(120) NOT NULL,
  `CreationDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblbrands`
--

INSERT INTO `tblbrands` (`id`, `BrandName`, `CreationDate`, `UpdationDate`) VALUES
(9, 'Audi', '2022-12-29 07:45:44', NULL),
(10, 'BMW', '2022-12-29 07:45:53', NULL),
(11, 'Mercedes', '2022-12-29 07:46:25', NULL),
(12, 'Nissan', '2022-12-29 07:46:33', NULL),
(13, 'Toyota', '2022-12-29 07:46:42', NULL),
(14, 'Rolls Royce', '2022-12-29 07:46:46', NULL),
(15, 'Volks Wagon', '2022-12-29 07:46:53', NULL),
(16, 'Ford', '2023-01-06 10:21:45', NULL),
(17, 'Range Rover', '2023-01-06 14:28:13', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblcontactusinfo`
--

CREATE TABLE `tblcontactusinfo` (
  `id` int(11) NOT NULL,
  `Address` tinytext DEFAULT NULL,
  `EmailId` varchar(255) DEFAULT NULL,
  `ContactNo` char(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblcontactusinfo`
--

INSERT INTO `tblcontactusinfo` (`id`, `Address`, `EmailId`, `ContactNo`) VALUES
(1, 'Mulu Mutisya St, Konza City																							', 'info@ridepoa.com', '768 599 825');

-- --------------------------------------------------------

--
-- Table structure for table `tblcontactusquery`
--

CREATE TABLE `tblcontactusquery` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `EmailId` varchar(120) DEFAULT NULL,
  `ContactNumber` char(11) DEFAULT NULL,
  `Message` longtext DEFAULT NULL,
  `PostingDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblcontactusquery`
--

INSERT INTO `tblcontactusquery` (`id`, `name`, `EmailId`, `ContactNumber`, `Message`, `PostingDate`, `status`) VALUES
(1, 'Joan', 'joan@gmail.com', '+2547685998', 'I want to hire two landcruiser SUVs I\'m wondering if I can get them.', '2022-06-16 10:03:07', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tblpages`
--

CREATE TABLE `tblpages` (
  `id` int(11) NOT NULL,
  `PageName` varchar(255) DEFAULT NULL,
  `type` varchar(255) NOT NULL DEFAULT '',
  `detail` longtext NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblpages`
--

INSERT INTO `tblpages` (`id`, `PageName`, `type`, `detail`) VALUES
(1, 'Terms and Conditions', 'terms', '																																								<h2 class=\"wsite-content-title\" style=\"text-align: justify; overflow-wrap: break-word; margin: 0px; padding: 0px 0px 15px; color: rgb(59, 59, 59); font-size: 36px; line-height: 1.2em; font-family: &quot;Architects Daughter&quot; !important;\"><br></h2><div style=\"color: rgb(102, 102, 102); font-family: Lato, sans-serif; font-size: 16px;\"><hr class=\"styled-hr\" style=\"text-align: justify; background-color: rgba(0, 0, 0, 0.13); border-width: 0pt; border-style: none; border-top-color: initial; color: rgba(0, 0, 0, 0.13); height: 1px; margin: 0px auto; width: 960px;\"><div style=\"text-align: justify; height: 30px; overflow: hidden; width: 960px;\"></div></div><div class=\"paragraph\" style=\"overflow-wrap: break-word; margin: 0px; padding: 0px 0px 20px; font-size: 16px; line-height: 1.5em; color: rgb(102, 102, 102); font-family: Sansation !important;\"><div style=\"text-align: justify;\">The Agreement comprises as per the terms and conditions laid out in the rental document setting out the hire details which is provided with each vehicle at the point of hire.&nbsp; The Rental Agreement is made between Ride Poa (herein referred to as “The Owner” and the person and or company signing the document (herein referred to as “The Hirer”.</div><div style=\"text-align: justify;\">It is hereby agreed as follows?</div><strong><div style=\"text-align: justify;\"><strong>TERMS OF HIRE</strong></div></strong><strong><div style=\"text-align: justify;\"><strong>A SELF DRIVE</strong></div></strong><div style=\"text-align: justify;\">1.The Owner will allow the Hirer to take the motor vehicle, details of which are described in the Rental Agreement for a period of time, as specified in the Agreement.</div><div style=\"text-align: justify;\">2.The vehicle may only be driven during that time by the person named in the Agreement or a supplementary driver, also mentioned in the Agreement and only if they hold a valid driver’s license.</div><div style=\"text-align: justify;\">3.The Hirer shall pay the Owner for the hire of the vehicle, the sum as specified in the Agreement and authorize the Owner to charge all amounts payable to the Hirer’s account or a pre authorized credit card.</div><div style=\"text-align: justify;\">4.The Hirer acknowledges that they shall be liable to pay to the Owner any additional charges</div><div style=\"text-align: justify;\">Such as</div><div style=\"text-align: justify;\">a) Extra kilometres (if specified in the Agreement)</div><div style=\"text-align: justify;\">b) Road User Change ( if a vehicle which is specified only for town/tarmac use and this vehicle is taken off road and/or into a national Park – The Hirer will get charged for wrong usage of the vehicle and could even loss their full deposit depending on the extent of the damage to the vehicle.</div><div style=\"text-align: justify;\">c) Charges for late return</div><div style=\"text-align: justify;\">d) Charges for Petrol (The vehicle will be given with a full tank and MUST be returned full)</div><div style=\"text-align: justify;\">e)&nbsp; Charges for damage or repair of the vehicle (subject to the other terms of the Rental Agreement); and any enforcement charges relating to such damage or repairs (including legal costs);</div><div style=\"text-align: justify;\">f) &nbsp;Charges for cleaning the vehicle\'s interior if the vehicle is returned in an excessively dirty condition that requires extra cleaning or deodorizing. This includes, but is not limited to, spillage of fluids, food, vomit, other stains, and unpleasant odours including cigarette smoke;</div><div style=\"text-align: justify;\">g) Traffic and/or parking offence infringement fees;</div><div style=\"text-align: justify;\">g) Any surcharges in connection with the use of a debit or credit card by the hirer.</div><div style=\"text-align: justify;\">5.The owner will charge the amounts set out in clauses 3 and 4 above to the hirer\'s account during or after the term of hire is completed, or the hirer may pay such charges as agreed with the owner, such choice to be at the owner\'s sole discretion.</div><div style=\"text-align: justify;\"><br></div><strong><div style=\"text-align: justify;\"><strong>DEPOSIT</strong></div></strong><div style=\"text-align: justify;\">6.&nbsp; A deposit is required to make a reservation at the start of the rental and to cover the liability excess, any charges incurred during the rental and, in some cases, fuel. &nbsp;A valid major credit card will be required in most cases and must be in the main driver\'s name. Provided the car and extras are returned in the same state as rented and in accordance with the fuel policy, this deposit will be refunded after dropping the car off (please note that it may take 14 days for the money to appear on your credit card again).</div><div style=\"text-align: justify;\">Vehicles are rented out with a full tank and are to be returned full.&nbsp; If the car is not returned full, the car will be filled and this money will be deducted from the deposit.&nbsp; The cost may be higher than it would be at a local petrol station and there may be an admin cost involved.</div><div style=\"text-align: justify;\"><br></div><strong><div style=\"text-align: justify;\"><strong>USE OF THE VEHICLE</strong></div></strong><div style=\"text-align: justify;\">7. The hirer shall not:</div><div style=\"text-align: justify;\">a) Use or allow the vehicle to be used for the transport of passengers for hire or reward unless the vehicle is hired with the owner\'s knowledge for use in a passenger service licensed under Part 4A of the Land Transport Act 1998 (\"the Act\");</div><div style=\"text-align: justify;\">b) Sublet or hire the vehicle to any other person unless prior approval from the Owner has been obtained;</div><div style=\"text-align: justify;\">c) Allow the vehicle to be used outside his/her authority;</div><div style=\"text-align: justify;\">d) Operate the vehicle or allow it to be operated in circumstances that constitute an offence (which relates to driving under the influence of alcohol or drugs);</div><div style=\"text-align: justify;\">e) Operate the vehicle or allow it to be operated in any race, speed test, reliability trial, rally or contest, or operated on any race or rally circuit or in any event as a pace-maker or testing in preparation for any of them;</div><div style=\"text-align: justify;\">f) Operate the vehicle or allow it to be operated for the transport of more passengers or goods than the maximum specified in the certificate of loading and/or road user charge certificate, whichever is the lesser, for the vehicle;</div><div style=\"text-align: justify;\">g) Drive or allow the vehicle to be driven by any person if at the time of driving the vehicle the driver does not hold a current full valid driver\'s licence appropriate for the vehicle;</div><div style=\"text-align: justify;\">h) Drive or allow the vehicle to be driven on any roads excluded in the terms and conditions, or on any beach, driveway, or surface likely to damage the vehicle;</div><div style=\"text-align: justify;\">i) Allow the vehicle to be driven by any person who is not named or described in the Rental Document as a person permitted to drive the vehicle;</div><div style=\"text-align: justify;\">j) Operate the vehicle or allow it to be operated to propel or tow any other vehicle;</div><div style=\"text-align: justify;\">k) Transport any animal in the vehicle (with the exception of guide dogs for visually impaired people);</div><div style=\"text-align: justify;\">l) Operate or allow the vehicle to be used in involvement with any illegal activity; or</div><div style=\"text-align: justify;\">m) Allow any person to smoke in the vehicle.</div><div style=\"text-align: justify;\"><br></div><strong><div style=\"text-align: justify;\"><strong>Child Seats GPS &amp; Special Requests</strong></div></strong><div style=\"text-align: justify;\">8. Child seats, GPS Navigation systems, roof racks (not available on some cars) and other ‘extra’ items are available on request.&nbsp; There is an additional fee payable to the car hire company. As required by the law, rear seatbelts are provided in all cars. Requests for these items should be made at the time of booking.</div><div style=\"text-align: justify;\"><span style=\"font-weight: bold;\">&nbsp;</span></div><strong><div style=\"text-align: justify;\"><strong>Deliveries &amp; Collections</strong></div></strong><div style=\"text-align: justify;\">9. We can arrange for the vehicle to be delivered / collected from a specified address at an extra charge. We will advise you on the fee when you confirm your pick-up / drop-off times, along with the full address details, in your booking request.</div><div style=\"text-align: justify;\"><br></div><strong><div style=\"text-align: justify;\"><strong>HIRER\'S OBLIGATIONS</strong></div></strong><div style=\"text-align: justify;\">10. The hirer shall ensure that:</div><div style=\"text-align: justify;\">a) All reasonable care is taken when driving and parking the vehicle;</div><div style=\"text-align: justify;\">b) The water in the vehicle\'s radiator and battery is maintained at the proper level;</div><div style=\"text-align: justify;\">c) The oil in the vehicle is maintained at the proper level;</div><div style=\"text-align: justify;\">d) Only the fuel type specified for the vehicle will be used;</div><div style=\"text-align: justify;\">e) The tyres are maintained at their proper pressure;</div><div style=\"text-align: justify;\">f) The vehicle is locked and secure at all times when it is not in use and the keys kept under the hirer\'s personal control at all times;</div><div style=\"text-align: justify;\">g) The distance recorder or speedometer, are not interfered with;</div><div style=\"text-align: justify;\">h) No part of the engine, transmission, braking or suspension systems are interfered with;</div><div style=\"text-align: justify;\">i) Should a warning light be illuminated or the hirer believes the vehicle requires mechanical attention the hirer will stop driving and advise the owner immediately;</div><div style=\"text-align: justify;\">j) All drivers authorized to use this vehicle during the term of hire are aware of and comply with the terms outlined in the Rental Agreement; and</div><div style=\"text-align: justify;\">k) Any authorized driver carries their driver\'s license with them in the vehicle at all times and will produce it on demand to any enforcement officer.</div><div style=\"text-align: justify;\"><br></div><strong><div style=\"text-align: justify;\"><strong>OWNER\'S OBLIGATIONS</strong></div></strong><div style=\"text-align: justify;\">11. The owner shall supply the vehicle in a safe and roadworthy condition, up to current Certificate of Fitness standards.</div><div style=\"text-align: justify;\"><br></div><strong><div style=\"text-align: justify;\"><strong>MECHANICAL REPAIRS AND ACCIDENTS</strong></div></strong><div style=\"text-align: justify;\">12. If the vehicle is involved in an accident, is damaged, breaks down or requires repair or salvage, regardless of cause, the hirer shall notify the owner of the full circumstances by telephone immediately. The Hirer MUST also go to the local Police Station and report the accident and get a stamped POLICE ABSTRACT.</div><div style=\"text-align: justify;\">13. The hirer shall not arrange or undertake any repairs or salvage without the owner\'s authority (this includes, but is not limited to, purchasing a replacement tyre) except to the extent that repairs or salvage are necessary to prevent further damage to the vehicle or to other property.</div><div style=\"text-align: justify;\">14. 24 Hour Roadside Assistance is free for all inherent mechanical faults (as determined by the owner or its authorized repairer) related to the vehicle specified in the Rental Document. &nbsp;For all other roadside assistance call outs including refuelling, jump start, tyre related incidents, lost keys and keys locked in the vehicle, a service fee will be charged.</div><div style=\"text-align: justify;\">15. If the vehicle requires repair or replacement, the decision to supply another vehicle to the hirer is at the owner\'s sole discretion.</div><div style=\"text-align: justify;\"><br></div><strong><div style=\"text-align: justify;\"><strong>RETURN OF VEHICLE</strong></div></strong><div style=\"text-align: justify;\">16. The hirer shall, at or before the expiry of the term of hire, deliver the vehicle to the agreed rental location described in the Rental Document or obtain the owner\'s consent to the continuation of the hire (in which case the hirer shall pay additional hire charges for the extended term of hire). If the hirer does not comply with this clause, and does not immediately return the vehicle, the owner may report the vehicle as stolen to the Police and the hirer must compensate the owner for either the full cost of the vehicle, or all additional costs and losses incurred up to the time that the vehicle is recovered by the owner.</div><div style=\"text-align: justify;\"><br></div><strong><div style=\"text-align: justify;\"><strong>LIABILITY</strong></div></strong><div style=\"text-align: justify;\">17. The hirer is liable for:</div><div style=\"text-align: justify;\">a) Any loss of, or damage to, the vehicle and its accessories;</div><div style=\"text-align: justify;\">b) Any consequential damage, loss or costs incurred by the owner, including salvage costs, loss of ability to re-hire and loss of revenue; and</div><div style=\"text-align: justify;\">c) Any loss of, or damage to, vehicles and property of third parties, arising during the term of hire.</div><div style=\"text-align: justify;\"><br></div><strong><div style=\"text-align: justify;\"><strong>INSURANCE</strong></div></strong><div style=\"text-align: justify;\">18. The rate of the hire is inclusive of Collision Damage Waiver (CDW)</div><div style=\"text-align: justify;\">Collision Damage Waiver reduces the renter\'s liability from the total cost of the damage to an excess amount, where applicable, unless the renter intentionally causes the damage, is under the influence of drink or drugs, or uses the car in a prohibited or negligent way – such as driving off main roads or hiring to other parties. CDW covers liability for damage to the car or its parts.&nbsp; Windscreens, tyres, undercarriage, replacement locks, replacement keys and towing charges are NOT covered under the CDW policy.</div><div style=\"text-align: justify;\">In cases of minor accidents, such as scratches, bumper dent, broken light, broken/stolen side mirrors etc., the Hirer may want to settle the claim which is less than the cost of the EXCESS I</div><div style=\"text-align: justify;\">19. Insurance does not cover reckless or negligent use of the vehicle. If the car is used off road or is left unattended once it gets stuck, The Hirer will be debited from the deposit or may lose the entire deposit depending on the extent of the damage.</div><div style=\"text-align: justify;\">20. Windscreen damage and tyre bursts are not included in the insurance and the Hirer will be charged the cost of a new replacement.</div><div style=\"text-align: justify;\"><br></div><strong><div style=\"text-align: justify;\"><strong>INSURANCE EXCLUSIONS</strong></div></strong><div style=\"text-align: justify;\">21. The hirer acknowledges that the cover referred to in clause 18 will not apply:</div><div style=\"text-align: justify;\">a) At any time when the driver of the vehicle is under the influence of alcohol or any drug;</div><div style=\"text-align: justify;\">b) At any time when the vehicle is in an unsafe or roadworthy condition, such condition arising during the course of the hire, that caused or contributed to the damage or loss, and the hirer or driver was aware or should have been aware of the unsafe or roadworthy condition of the vehicle;</div><div style=\"text-align: justify;\">c) At any time when a mechanical failure breakdown or breakage occurs and/or an electrical or electronic failure or breakdown occurs that is the result of improper use of the vehicle. This exclusion also applies to damage to the engine or transmission system directly resulting from any mechanical failure breakdown or breakage, but does not otherwise apply to resulting damage to other parts of the vehicle;</div><div style=\"text-align: justify;\">d) At any time when the vehicle is driven in any race, speed test, reliability trial, rally or contest, or operated on any race or rally circuit or in any event as a pace-maker, or testing in preparation for any of them;</div><div style=\"text-align: justify;\">e) At any time when the vehicle is driven by anyone not named or described in the Rental Document as a person permitted to drive the vehicle (unless the hirer is a body corporate or Department of State and the driver is authorised by them to drive, subject to all other terms and conditions in the Rental Agreement);</div><div style=\"text-align: justify;\">f) At any time when the vehicle is driven by an unlicensed person;</div><div style=\"text-align: justify;\">g) At any time when the vehicle is wilfully or recklessly damaged or lost by the hirer, a nominated driver, or a person under the hirer\'s authority or control;</div><div style=\"text-align: justify;\">h) At any time when the driver commits a traffic offence while driving the vehicle;</div><div style=\"text-align: justify;\">i) At any time when the vehicle is loaded or is being loaded in excess of the manufacturer\'s specifications;</div><div style=\"text-align: justify;\">j) At any time when the vehicle is being loaded or unloaded beyond the limits of a thoroughfare and such loading or unloading is not performed by the driver or attendant of the vehicle;</div><div style=\"text-align: justify;\">k) At any time when the driver fails to stop or remain at the scene following the occurrence of an accident where required to do so by law;</div><div style=\"text-align: justify;\">l) To any fine or penalty imposed as a result of prosecution for breach of any law;</div><div style=\"text-align: justify;\">m) To any puncture, cut or bursting of any tyre, or damage to any tyre by application of brakes;</div><div style=\"text-align: justify;\">n) To any wear and tear to the vehicle;</div><strong><div style=\"text-align: justify;\"><strong>TRAFFIC OFFENCES</strong></div></strong><div style=\"text-align: justify;\">22. All penalties related to traffic and/or parking offences are the responsibility of the hirer and the owner may charge the hirer\'s credit card for any traffic and/or parking offence infringement fees incurred by the hirer. The owner undertakes, in the event that the owner receives notice of any traffic or parking offenses incurred by the hirer, to send a copy of any such notice to the hirer as soon as is practicable and to provide the necessary information to the relevant issuing authority for such notices to be directed to the hirer. The hirer has the right to challenge, complain about, query or object to the alleged offence to the issuing enforcement authority and has a right to seek a court hearing (within 56 days from the date of issue of the infringement notice or 28 days from the date of issue of the reminder notice).</div><div style=\"text-align: justify;\"><br></div><strong><div style=\"text-align: justify;\"><strong>CANCELLATION OF HIRE AGREEMENT</strong></div></strong><div style=\"text-align: justify;\">23. The owner has the right to terminate the hire and take immediate possession of the vehicle if the hirer fails to comply with any of the terms of the Rental Agreement, or if the vehicle is damaged. The termination of a hire under the authority of this clause shall be without prejudice to the other rights of the owner and the rights of the hirer under the Rental Agreement or otherwise.</div><div style=\"text-align: justify;\"><br></div><strong><div style=\"text-align: justify;\"><br></div></strong><div style=\"text-align: justify;\">&nbsp;</div><div style=\"text-align: justify;\">&nbsp;</div><div style=\"text-align: justify;\">&nbsp;</div><div style=\"text-align: justify;\">&nbsp;</div><strong><div style=\"text-align: justify;\"><br></div></strong></div>\r\n										\r\n										\r\n										\r\n										'),
(2, 'Privacy Policy', 'privacy', '																				<span style=\"color: rgb(102, 102, 102); font-family: Sansation; font-size: 16px;\"><div style=\"text-align: justify;\">The information requested from the hirer is to enable the owner to assess the hirer’s request to hire a vehicle.&nbsp; The hirer does not have to supply this information, but if the hirer does not, then the owner is unable to hire the vehicle. The hirer acknowledges that the owner will collect, hold and use the hirer’s personal information for purposes related to the hire of the vehicle and the provision of related customer services, including direct marketing and assessing customer satisfaction with products and services provided by the owner. The hirer further acknowledges that such personal information may be disclosed to debt collection agencies in the event that the hirer defaults in the payment of any monies owing to the owner, or other parties involved in an accident with the vehicle while on hire to the hirer; or any organisations responsible for the processing or handling of traffic related infringements; and the hirer hereby authorises the disclosure of their personal information for such purposes.<br></div></span><div style=\"color: rgb(102, 102, 102); font-family: Sansation; font-size: 16px; text-align: justify;\"><br></div><span style=\"font-weight: bold;\"><span style=\"color: rgb(102, 102, 102); font-family: Sansation; font-size: 16px;\"><div style=\"text-align: justify;\">NOTE TO HIRER</div></span><span style=\"color: rgb(102, 102, 102); font-family: Sansation; font-size: 16px;\"><div style=\"text-align: justify;\">NOTE - THE OWNER MUST GIVE THE HIRER AT LEAST ONE COPY OF THE RENTAL AGREEMENT WHICH MUST BE KEPT IN THE VEHICLE THROUGHOUT THE TERM OF THE HIRE AND PRODUCED ON DEMAND TO AN ENFORCEMENT OFFICER.</div></span></span><span style=\"color: rgb(102, 102, 102); font-family: Sansation; font-size: 16px;\"><div style=\"text-align: justify;\"><span style=\"font-weight: bold;\">B CHAUFFEUR DRIVEN SERVICES</span></div><div style=\"text-align: justify;\"><br></div></span><div style=\"color: rgb(102, 102, 102); font-family: Sansation; font-size: 16px; text-align: justify;\"><br></div>\r\n										\r\n										'),
(3, 'About Us ', 'aboutus', '<div style=\"text-align: justify;\"><span style=\"font-size: 1em; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">We\'ll include something soon</span></div>'),
(11, 'FAQs', 'faqs', '																																								<div class=\"elementor-element elementor-element-7de96de elementor-widget elementor-widget-heading\" data-id=\"7de96de\" data-element_type=\"widget\" data-widget_type=\"heading.default\" style=\"margin: 0px 0px 20px; padding: 0px; border: 0px; outline: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-variant-alternates: inherit; font-stretch: inherit; line-height: inherit; font-optical-sizing: inherit; font-kerning: inherit; font-feature-settings: inherit; font-variation-settings: inherit; vertical-align: baseline; --flex-direction: initial; --flex-wrap: initial; --justify-content: initial; --align-items: initial; --align-content: initial; --gap: initial; --flex-basis: initial; --flex-grow: initial; --flex-shrink: initial; --order: initial; --align-self: initial; -webkit-box-orient: vertical; -webkit-box-direction: normal; flex-direction: var(--flex-direction); flex-wrap: var(--flex-wrap); -webkit-box-pack: var(--justify-content); justify-content: var(--justify-content); -webkit-box-align: var(--align-items); align-items: var(--align-items); align-content: var(--align-content); gap: var(--gap); flex-basis: var(--flex-basis); -webkit-box-flex: var(--flex-grow); flex-grow: var(--flex-grow); flex-shrink: var(--flex-shrink); -webkit-box-ordinal-group: var(--order); order: var(--order); align-self: var(--align-self); position: relative; --widgets-spacing:20px; width: 1004px; color: rgb(74, 74, 74);\"><div class=\"elementor-widget-container\" style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; font-variant: inherit; font-stretch: inherit; line-height: inherit; font-optical-sizing: inherit; font-kerning: inherit; font-feature-settings: inherit; font-variation-settings: inherit; vertical-align: baseline; font-style: inherit; transition: background 0.3s ease 0s, border 0.3s ease 0s, border-radius 0.3s ease 0s, box-shadow 0.3s ease 0s, -webkit-box-shadow 0.3s ease 0s;\"><h2 align=\"justify\" style=\"margin-top:0.0000pt;margin-right:0.0000pt;margin-bottom:15.0000pt;\r\nmargin-left:21.2500pt;mso-para-margin-left:0.0000gd;text-indent:-21.2500pt;\r\nmso-char-indent-count:0.0000;padding:0pt 0pt 0pt 0pt ;mso-pagination:widow-orphan;\r\ntext-align:justify;text-justify:inter-ideograph;vertical-align:baseline;\r\nline-height:150%;mso-list:l4 level1 lfo1;\"><!--[if !supportLists]--><span style=\"font-family: &quot;Times New Roman&quot;; letter-spacing: 0pt; font-weight: bold; font-size: 14pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">1.&nbsp;</span><!--[endif]--><b><span style=\"font-family: &quot;Times New Roman&quot;; line-height: 150%; letter-spacing: 0pt; font-size: 14pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">Which is the best self drive car hire services?</span></b><b><span style=\"font-family: &quot;Times New Roman&quot;; line-height: 150%; font-size: 14pt;\"><o:p></o:p></span></b></h2><h2 style=\"margin-top:0.0000pt;margin-right:0.0000pt;margin-bottom:15.0000pt;\r\nmargin-left:21.2500pt;mso-para-margin-left:0.0000gd;text-indent:-21.2500pt;\r\nmso-char-indent-count:0.0000;padding:0pt 0pt 0pt 0pt ;mso-pagination:widow-orphan;\r\nvertical-align:baseline;line-height:150%;mso-list:l4 level1 lfo1;\"><p class=\"MsoNormal\" align=\"justify\" style=\"margin-top:0.0000pt;margin-right:0.0000pt;margin-bottom:0.0000pt;\r\nmargin-left:45.0000pt;mso-para-margin-right:0.0000gd;mso-para-margin-left:0.0000gd;\r\ntext-indent:-21.0000pt;mso-char-indent-count:0.0000;padding:0pt 0pt 0pt 0pt ;\r\nmso-pagination:widow-orphan;text-align:justify;text-justify:inter-ideograph;\r\nvertical-align:baseline;line-height:150%;mso-list:l6 level1 lfo2;\"><!--[if !supportLists]--><span style=\"font-family: Wingdings; letter-spacing: 0pt; font-size: 12pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">l&nbsp;</span><!--[endif]--><a href=\"https://www.vismart.co.ke/product-category/suv/\"><span class=\"15\" style=\"font-family: &quot;Times New Roman&quot;; letter-spacing: 0pt; font-size: 12pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">SUV</span></a><span style=\"font-family: &quot;Times New Roman&quot;; letter-spacing: 0pt; font-size: 12pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">&nbsp;can be a perfect choice for a getaway with friends or those traveling with more gear for outdoor adventures or other activities.</span><span style=\"mso-spacerun:\'yes\';font-family:\'Times New Roman\';mso-fareast-font-family:SimSun;\r\nfont-size:12.0000pt;\"><o:p></o:p></span></p><p class=\"MsoNormal\" align=\"justify\" style=\"margin-top:0.0000pt;margin-right:0.0000pt;margin-bottom:0.0000pt;\r\nmargin-left:42.0000pt;mso-para-margin-right:0.0000gd;mso-para-margin-left:0.0000gd;\r\ntext-indent:-21.0000pt;mso-char-indent-count:0.0000;padding:0pt 0pt 0pt 0pt ;\r\nmso-pagination:widow-orphan;text-align:justify;text-justify:inter-ideograph;\r\nvertical-align:baseline;line-height:150%;mso-list:l3 level1 lfo3;\"><!--[if !supportLists]--><span style=\"font-family:Wingdings;mso-fareast-font-family:SimSun;mso-bidi-font-family:\'Times New Roman\';\r\nfont-size:12.0000pt;\">l&nbsp;</span><!--[endif]--><span style=\"mso-spacerun:\'yes\';font-family:\'Times New Roman\';mso-fareast-font-family:SimSun;\r\nfont-size:12.0000pt;\">Sedans are good car hire for long drives with their spacious comforts and top amenities.</span><span style=\"mso-spacerun:\'yes\';font-family:\'Times New Roman\';mso-fareast-font-family:SimSun;\r\nfont-size:12.0000pt;\"><o:p></o:p></span></p><p class=\"MsoNormal\" align=\"justify\" style=\"margin-top:0.0000pt;margin-right:0.0000pt;margin-bottom:0.0000pt;\r\nmargin-left:42.0000pt;mso-para-margin-right:0.0000gd;mso-para-margin-left:0.0000gd;\r\ntext-indent:-21.0000pt;mso-char-indent-count:0.0000;padding:0pt 0pt 0pt 0pt ;\r\nmso-pagination:widow-orphan;text-align:justify;text-justify:inter-ideograph;\r\nvertical-align:baseline;line-height:150%;mso-list:l3 level1 lfo3;\"><!--[if !supportLists]--><span style=\"font-family:Wingdings;mso-fareast-font-family:SimSun;mso-bidi-font-family:\'Times New Roman\';\r\nfont-size:12.0000pt;\">l&nbsp;</span><!--[endif]--><span style=\"mso-spacerun:\'yes\';font-family:\'Times New Roman\';mso-fareast-font-family:SimSun;\r\nfont-size:12.0000pt;\">Luxury car hire can add some instant glamour and excitement to the many scenic drives you can take</span><span style=\"mso-spacerun:\'yes\';font-family:\'Times New Roman\';mso-fareast-font-family:SimSun;\r\nfont-size:12.0000pt;\">.</span><span style=\"mso-spacerun:\'yes\';font-family:\'Times New Roman\';mso-fareast-font-family:SimSun;\r\nfont-size:12.0000pt;\"><o:p></o:p></span></p><p class=\"MsoNormal\" align=\"justify\" style=\"margin-top:0.0000pt;margin-right:0.0000pt;margin-bottom:0.0000pt;\r\nmargin-left:21.0000pt;mso-para-margin-right:0.0000gd;mso-para-margin-left:0.0000gd;\r\npadding:0pt 0pt 0pt 0pt ;mso-pagination:widow-orphan;text-align:justify;\r\ntext-justify:inter-ideograph;vertical-align:baseline;line-height:150%;\"><span style=\"mso-spacerun:\'yes\';font-family:\'Times New Roman\';mso-fareast-font-family:SimSun;\r\nfont-size:12.0000pt;\">&nbsp;</span></p></h2><h2 align=\"justify\" style=\"margin-top:0.0000pt;margin-right:0.0000pt;margin-bottom:15.0000pt;\r\nmargin-left:21.6000pt;mso-para-margin-right:0.0000gd;mso-para-margin-left:0.0000gd;\r\ntext-indent:-21.6000pt;mso-char-indent-count:0.0000;padding:0pt 0pt 0pt 0pt ;\r\nmso-pagination:widow-orphan;text-align:justify;text-justify:inter-ideograph;\r\nmso-outline-level:2;vertical-align:baseline;line-height:150%;\r\nmso-list:l5 level1 lfo4;\"><!--[if !supportLists]--><span style=\"font-family: &quot;Times New Roman&quot;; letter-spacing: 0pt; font-weight: bold; font-size: 14pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">2.&nbsp;</span><!--[endif]--><b><span style=\"font-family: &quot;Times New Roman&quot;; line-height: 150%; letter-spacing: 0pt; font-size: 14pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">Minimum age </span></b><b><span style=\"font-family: &quot;Times New Roman&quot;; line-height: 150%; letter-spacing: 0pt; font-size: 14pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">to hire a car?</span></b><b><span style=\"font-family: &quot;Times New Roman&quot;; line-height: 150%; font-size: 14pt;\"><o:p></o:p></span></b></h2><h2 style=\"margin-top:0.0000pt;margin-right:0.0000pt;margin-bottom:15.0000pt;\r\nmargin-left:21.2500pt;mso-para-margin-left:0.0000gd;text-indent:-21.2500pt;\r\nmso-char-indent-count:0.0000;padding:0pt 0pt 0pt 0pt ;mso-pagination:widow-orphan;\r\nvertical-align:baseline;line-height:150%;mso-list:l4 level1 lfo1;\"><p class=\"p\" align=\"justify\" style=\"margin-top:0.0000pt;margin-right:0.0000pt;margin-bottom:30.1000pt;\r\nmargin-left:36.0000pt;mso-para-margin-left:0.0000gd;padding:0pt 0pt 0pt 0pt ;\r\nmso-pagination:widow-orphan;text-align:justify;text-justify:inter-ideograph;\r\nvertical-align:baseline;line-height:150%;\"><span style=\"font-family: &quot;Times New Roman&quot;; letter-spacing: 0pt; font-size: 12pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">The minimum age to&nbsp;rent a car in Kenya&nbsp;is 18. Some specialty vehicle types have further age restrictions, you can find out more during the online booking process.</span><span style=\"font-family: &quot;Times New Roman&quot;; letter-spacing: 0pt; font-size: 12pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><o:p></o:p></span></p></h2><h2 align=\"justify\" style=\"margin-left:21.6000pt;text-indent:-21.6000pt;text-align:justify;\r\ntext-justify:inter-ideograph;mso-list:l0 level1 lfo5;\"><!--[if !supportLists]--><span style=\"font-family:\'Times New Roman\';mso-fareast-font-family:SimSun;font-weight:bold;\r\nfont-size:14.0000pt;mso-font-kerning:0.0000pt;\">3.&nbsp;</span><!--[endif]--><b><span style=\"font-family: &quot;Times New Roman&quot;; font-size: 14pt;\">Do I fuel the car?</span></b><b><span style=\"font-family: &quot;Times New Roman&quot;; font-size: 14pt;\"><o:p></o:p></span></b></h2><h2 style=\"margin-top:0.0000pt;margin-right:0.0000pt;margin-bottom:15.0000pt;\r\nmargin-left:21.2500pt;mso-para-margin-left:0.0000gd;text-indent:-21.2500pt;\r\nmso-char-indent-count:0.0000;padding:0pt 0pt 0pt 0pt ;mso-pagination:widow-orphan;\r\nvertical-align:baseline;line-height:150%;mso-list:l4 level1 lfo1;\"><p class=\"p\" align=\"justify\" style=\"margin-top:0.0000pt;margin-right:0.0000pt;margin-bottom:30.1000pt;\r\nmargin-left:36.0000pt;mso-para-margin-right:0.0000gd;mso-para-margin-left:0.0000gd;\r\npadding:0pt 0pt 0pt 0pt ;mso-pagination:widow-orphan;text-align:justify;\r\ntext-justify:inter-ideograph;vertical-align:baseline;line-height:150%;\"><span style=\"font-family: &quot;Times New Roman&quot;; letter-spacing: 0pt; font-size: 12pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">Your car rental will be handed over with a full tank of gas and must be returned full as well. Alternatively, book our prepaid fuel option which allows you to prepay for a full tank of gas a prices comparable to the local pump and return the rental vehicle on low.</span><span style=\"font-family: &quot;Times New Roman&quot;; letter-spacing: 0pt; font-size: 12pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><o:p></o:p></span></p></h2><h2 align=\"justify\" style=\"margin-left:21.6000pt;mso-para-margin-left:0.0000gd;text-indent:-21.6000pt;\r\nmso-char-indent-count:0.0000;text-align:justify;text-justify:inter-ideograph;\r\nmso-outline-level:2;mso-list:l2 level1 lfo6;\"><!--[if !supportLists]--><span style=\"font-family:\'Times New Roman\';mso-fareast-font-family:SimSun;font-weight:bold;\r\nfont-size:14.0000pt;mso-font-kerning:0.0000pt;\">4.&nbsp;</span><!--[endif]--><b><span style=\"font-family: &quot;Times New Roman&quot;; font-size: 14pt;\">Why you should choose us;</span></b><b><span style=\"font-family: &quot;Times New Roman&quot;; font-size: 14pt;\"><o:p></o:p></span></b></h2><h2 style=\"margin-top:0.0000pt;margin-right:0.0000pt;margin-bottom:15.0000pt;\r\nmargin-left:21.2500pt;mso-para-margin-left:0.0000gd;text-indent:-21.2500pt;\r\nmso-char-indent-count:0.0000;padding:0pt 0pt 0pt 0pt ;mso-pagination:widow-orphan;\r\nvertical-align:baseline;line-height:150%;mso-list:l4 level1 lfo1;\"><p class=\"MsoNormal\" align=\"justify\" style=\"margin-top:0.0000pt;margin-right:0.0000pt;margin-bottom:0.0000pt;\r\nmargin-left:36.0000pt;mso-para-margin-left:0.0000gd;text-indent:-18.0000pt;\r\npadding:0pt 0pt 0pt 0pt ;mso-pagination:widow-orphan;text-align:justify;\r\ntext-justify:inter-ideograph;vertical-align:baseline;line-height:150%;\r\nmso-list:l1 level1 lfo7;\"><!--[if !supportLists]--><span style=\"font-family: Symbol; letter-spacing: 0pt; font-size: 10pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">·&nbsp;</span><!--[endif]--><span style=\"font-family: &quot;Times New Roman&quot;; letter-spacing: 0pt; font-size: 12pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">24hrs customer </span><span style=\"font-family: &quot;Times New Roman&quot;; letter-spacing: 0pt; font-size: 12pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">assistant</span><span style=\"font-family: &quot;Times New Roman&quot;; letter-spacing: 0pt; font-size: 12pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">&nbsp;online</span><span style=\"font-family: &quot;Times New Roman&quot;; font-size: 12pt;\"><o:p></o:p></span></p><p class=\"MsoNormal\" align=\"justify\" style=\"margin-top:0.0000pt;margin-right:0.0000pt;margin-bottom:0.0000pt;\r\nmargin-left:36.0000pt;mso-para-margin-left:0.0000gd;text-indent:-18.0000pt;\r\npadding:0pt 0pt 0pt 0pt ;mso-pagination:widow-orphan;text-align:justify;\r\ntext-justify:inter-ideograph;vertical-align:baseline;line-height:150%;\r\nmso-list:l1 level1 lfo7;\"><!--[if !supportLists]--><span style=\"font-family: Symbol; letter-spacing: 0pt; font-size: 10pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">·&nbsp;</span><!--[endif]--><span style=\"font-family: &quot;Times New Roman&quot;; letter-spacing: 0pt; font-size: 12pt; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">25% off on long term car rental.</span><span style=\"mso-spacerun:\'yes\';font-family:\'Times New Roman\';mso-fareast-font-family:SimSun;\r\nfont-size:12.0000pt;\"><o:p></o:p></span></p></h2></div></div><div class=\"elementor-element elementor-element-7de96de elementor-widget elementor-widget-heading\" data-id=\"7de96de\" data-element_type=\"widget\" data-widget_type=\"heading.default\" style=\"margin: 0px 0px 20px; padding: 0px; border: 0px; outline: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-variant-alternates: inherit; font-stretch: inherit; line-height: inherit; font-optical-sizing: inherit; font-kerning: inherit; font-feature-settings: inherit; font-variation-settings: inherit; vertical-align: baseline; --flex-direction: initial; --flex-wrap: initial; --justify-content: initial; --align-items: initial; --align-content: initial; --gap: initial; --flex-basis: initial; --flex-grow: initial; --flex-shrink: initial; --order: initial; --align-self: initial; -webkit-box-orient: vertical; -webkit-box-direction: normal; flex-direction: var(--flex-direction); flex-wrap: var(--flex-wrap); -webkit-box-pack: var(--justify-content); justify-content: var(--justify-content); -webkit-box-align: var(--align-items); align-items: var(--align-items); align-content: var(--align-content); gap: var(--gap); flex-basis: var(--flex-basis); -webkit-box-flex: var(--flex-grow); flex-grow: var(--flex-grow); flex-shrink: var(--flex-shrink); -webkit-box-ordinal-group: var(--order); order: var(--order); align-self: var(--align-self); position: relative; --widgets-spacing:20px; width: 1004px; color: rgb(74, 74, 74);\"><div class=\"elementor-widget-container\" style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; font-variant: inherit; font-stretch: inherit; line-height: inherit; font-optical-sizing: inherit; font-kerning: inherit; font-feature-settings: inherit; font-variation-settings: inherit; vertical-align: baseline; font-style: inherit; transition: background 0.3s ease 0s, border 0.3s ease 0s, border-radius 0.3s ease 0s, box-shadow 0.3s ease 0s, -webkit-box-shadow 0.3s ease 0s;\"><p style=\"text-align: justify; margin: 0px; padding: 0px; border: 0px; outline: 0px; font-variant: inherit; font-stretch: inherit; line-height: 1; font-optical-sizing: inherit; font-kerning: inherit; font-feature-settings: inherit; font-variation-settings: inherit; vertical-align: baseline; font-style: inherit; color: rgb(50, 61, 98);\"></p></div></div><div class=\"elementor-element elementor-element-7de96de elementor-widget elementor-widget-heading\" data-id=\"7de96de\" data-element_type=\"widget\" data-widget_type=\"heading.default\" style=\"margin: 0px 0px 20px; padding: 0px; border: 0px; outline: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-variant-alternates: inherit; font-stretch: inherit; line-height: inherit; font-optical-sizing: inherit; font-kerning: inherit; font-feature-settings: inherit; font-variation-settings: inherit; vertical-align: baseline; --flex-direction: initial; --flex-wrap: initial; --justify-content: initial; --align-items: initial; --align-content: initial; --gap: initial; --flex-basis: initial; --flex-grow: initial; --flex-shrink: initial; --order: initial; --align-self: initial; -webkit-box-orient: vertical; -webkit-box-direction: normal; flex-direction: var(--flex-direction); flex-wrap: var(--flex-wrap); -webkit-box-pack: var(--justify-content); justify-content: var(--justify-content); -webkit-box-align: var(--align-items); align-items: var(--align-items); align-content: var(--align-content); gap: var(--gap); flex-basis: var(--flex-basis); -webkit-box-flex: var(--flex-grow); flex-grow: var(--flex-grow); flex-shrink: var(--flex-shrink); -webkit-box-ordinal-group: var(--order); order: var(--order); align-self: var(--align-self); position: relative; --widgets-spacing:20px; width: 1004px; color: rgb(74, 74, 74);\"><div class=\"elementor-widget-container\" style=\"margin: 0px; padding: 0px; border: 0px; outline: 0px; font-variant: inherit; font-stretch: inherit; line-height: inherit; font-optical-sizing: inherit; font-kerning: inherit; font-feature-settings: inherit; font-variation-settings: inherit; vertical-align: baseline; font-style: inherit; transition: background 0.3s ease 0s, border 0.3s ease 0s, border-radius 0.3s ease 0s, box-shadow 0.3s ease 0s, -webkit-box-shadow 0.3s ease 0s;\"><p></p></div></div>\r\n										\r\n										\r\n										\r\n										');

-- --------------------------------------------------------

--
-- Table structure for table `tblsubscribers`
--

CREATE TABLE `tblsubscribers` (
  `id` int(11) NOT NULL,
  `SubscriberEmail` varchar(120) DEFAULT NULL,
  `PostingDate` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblsubscribers`
--

INSERT INTO `tblsubscribers` (`id`, `SubscriberEmail`, `PostingDate`) VALUES
(2, 'ping2@yahoo.com', '2023-02-01 10:52:00');

-- --------------------------------------------------------

--
-- Table structure for table `tbltestimonial`
--

CREATE TABLE `tbltestimonial` (
  `id` int(11) NOT NULL,
  `UserEmail` varchar(100) NOT NULL,
  `Testimonial` mediumtext NOT NULL,
  `PostingDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbltestimonial`
--

INSERT INTO `tbltestimonial` (`id`, `UserEmail`, `Testimonial`, `PostingDate`, `status`) VALUES
(1, 'test@gmail.com', 'Test Test', '2023-01-05 07:44:31', 0),
(2, 'test@gmail.com', 'Really enjoyed your services, superb!', '2023-01-18 07:46:05', 0),
(3, 'php@gmail.com', 'Wow its Great ', '2023-02-07 11:08:26', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tblusers`
--

CREATE TABLE `tblusers` (
  `id` int(11) NOT NULL,
  `FullName` varchar(120) DEFAULT NULL,
  `EmailId` varchar(100) DEFAULT NULL,
  `Password` varchar(100) DEFAULT NULL,
  `ContactNo` char(11) DEFAULT NULL,
  `dob` varchar(100) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `City` varchar(100) DEFAULT NULL,
  `Country` varchar(100) DEFAULT NULL,
  `RegDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblusers`
--

INSERT INTO `tblusers` (`id`, `FullName`, `EmailId`, `Password`, `ContactNo`, `dob`, `Address`, `City`, `Country`, `RegDate`, `UpdationDate`) VALUES
(1, 'Anna John', 'annj@gmail.com', 'f925916e2754e5e03f75dd58a5733251', '2147483647', NULL, NULL, NULL, NULL, '2022-10-13 19:59:27', '2023-02-07 21:02:58'),
(2, 'AK', 'anuj@gmail.com', 'f925916e2754e5e03f75dd58a5733251', '8285703354', NULL, NULL, NULL, NULL, '2017-06-17 20:00:49', '2017-06-26 21:03:09'),
(3, 'Mwanahamisi', 'wngamigo@gmail.com', 'f09df7868d52e12bba658982dbd79821', '09999857868', '03/02/1990', 'Kilifi', 'Lamu', 'KE', '2022-06-29 20:01:43', '2022-12-21 21:07:41'),
(4, 'Hassan Kalulu', 'test@gmail.com', '5c428d8875d2948607f3e3fe134d71b4', '9999857868', '', 'Nairobi', 'Nairobi', 'KE', '2022-09-23 20:03:36', '2022-11-18 19:18:14'),
(5, 'test', 'test1@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', '9015501898', NULL, NULL, NULL, NULL, '2017-06-29 18:19:08', NULL),
(6, 'php', 'php@gmail.com', '202cb962ac59075b964b07152d234b70', '9015501898', NULL, NULL, NULL, NULL, '2017-07-05 11:06:55', '2017-07-05 11:08:02'),
(7, 'ping', 'ping2@yahoo.com', '6eea9b7ef19179a06954edd0f6c05ceb', '0987654321', '01/06/2003', '2409-48022', 'Cairo 1', 'Kenya', '2022-12-27 07:48:18', '2023-02-02 06:22:20'),
(8, 'Joan Muthukumi', 'joan12@gmail.com', 'b6d4ca9518c6fa81a5be3c627d997cb6', '0712345678', NULL, NULL, NULL, NULL, '2023-01-17 18:14:53', NULL),
(9, 'James', 'jamesKK@gmail.com', 'd8578edf8458ce06fbc5bb76a58c5ca4', '0711223344', '01/06/2003', '', 'Kutus', 'Kenya', '2023-02-03 14:35:31', '2023-02-13 09:31:16'),
(10, 'Barnerd', 'benardmuinde00@gmail.com', '2cb42f8734ea607eefed3b70af13bbd3', '0768599825', NULL, NULL, NULL, NULL, '2023-03-27 08:59:15', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblvehicles`
--

CREATE TABLE `tblvehicles` (
  `id` int(11) NOT NULL,
  `VehiclesTitle` varchar(150) DEFAULT NULL,
  `VehiclesBrand` int(11) DEFAULT NULL,
  `VehiclesOverview` longtext DEFAULT NULL,
  `PricePerDay` int(11) DEFAULT NULL,
  `FuelType` varchar(100) DEFAULT NULL,
  `ModelYear` int(6) DEFAULT NULL,
  `SeatingCapacity` int(11) DEFAULT NULL,
  `CarLocation` varchar(255) DEFAULT NULL,
  `Vimage1` varchar(120) DEFAULT NULL,
  `Vimage2` varchar(120) DEFAULT NULL,
  `Vimage3` varchar(120) DEFAULT NULL,
  `Vimage4` varchar(120) DEFAULT NULL,
  `Vimage5` varchar(120) DEFAULT NULL,
  `AirConditioner` int(11) DEFAULT NULL,
  `PowerDoorLocks` int(11) DEFAULT NULL,
  `AntiLockBrakingSystem` int(11) DEFAULT NULL,
  `BrakeAssist` int(11) DEFAULT NULL,
  `PowerSteering` int(11) DEFAULT NULL,
  `DriverAirbag` int(11) DEFAULT NULL,
  `PassengerAirbag` int(11) DEFAULT NULL,
  `PowerWindows` int(11) DEFAULT NULL,
  `CDPlayer` int(11) DEFAULT NULL,
  `CentralLocking` int(11) DEFAULT NULL,
  `CrashSensor` int(11) DEFAULT NULL,
  `LeatherSeats` int(11) DEFAULT NULL,
  `RegDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblvehicles`
--

INSERT INTO `tblvehicles` (`id`, `VehiclesTitle`, `VehiclesBrand`, `VehiclesOverview`, `PricePerDay`, `FuelType`, `ModelYear`, `SeatingCapacity`, `CarLocation`, `Vimage1`, `Vimage2`, `Vimage3`, `Vimage4`, `Vimage5`, `AirConditioner`, `PowerDoorLocks`, `AntiLockBrakingSystem`, `BrakeAssist`, `PowerSteering`, `DriverAirbag`, `PassengerAirbag`, `PowerWindows`, `CDPlayer`, `CentralLocking`, `CrashSensor`, `LeatherSeats`, `RegDate`, `UpdationDate`) VALUES
(8, 'Range Rover sport', 17, 'The exterior is an assertive evolution where modernity and refinement meet visceral desire. Range Rover Sport redefines sporting luxury. Taut body surfaces convey power and performance, while stealth like headlights, grille and sculpted lower bumper exude confidence and attitude. Sculpted seats provide exceptional comfort and dynamic stability. The interior is elevated with Noble and Moonlight Chrome details.', 100, 'Petrol', 2022, 4, 'Embu', 'Range-Rover-10.png', 'Range-Rover-5.jpg', 'Range-Rover-9.jpg', 'Range-Rover-8.jpg', 'Range-Rover-7.jpg', NULL, 1, 1, 1, 1, 1, NULL, NULL, NULL, 1, 1, 1, '2023-01-06 10:29:39', '2023-03-12 06:51:14'),
(11, 'BMW X6', 10, 'An athletic, powerful BMW that leads with standout design and impressive performance. Transformative design. Convenient features. Connected technology. The 2023 BMW X6 Sports Activity Coupe was designed to fit perfectly into your life.\r\nDominating design.\r\nAn available M Sport Package enhances the X6 xDrive40i with the Aerodynamic Kit, M Sport suspension, and additional wheel options.\r\nDetail of digital displays in the 2023 BMW X6 Sports Activity Coupe\r\nSeamless compatibility.\r\nStandard wireless Apple CarPlay® and Android Auto™ compatibility keeps you up to date and connected to all your favorite apps and mobile content.\r\nDetail of the standard Panoramic Moonroof\r\nExpansive views.\r\nBring the outside in with the standard Panoramic Moonroof, which floods your cabin with fresh air and natural light.', 200, 'Petrol', 2023, 4, 'Sagana', 'BMW-MY23-X6-1.jpg', 'BMW-MY22-X6-2.jpg', 'BMW-MY23-X6-4.jpg', 'BMW-MY23-X6-5.jpg', 'BMW-MY23-X6-8.jpg', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2023-01-26 14:17:43', '2023-01-26 14:23:15'),
(12, 'Mercedes C200', 11, 'Sleek smart executive car for you.', 180, 'Petrol', 2020, 5, 'Kutus', 'Mercedes-C-Class-2.jpg', 'Mercedes-C-Class-1.jpg', 'Mercedes-C-Class-3.jpg', 'Mercedes-C-Class-5.jpg', 'Mercedes-C-Class-6.jpg', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2023-01-26 14:31:34', '2023-01-26 14:56:54'),
(13, 'Toyota Prado TX', 13, 'New features include the Crawl Control from the Series 200 and a new Multi-Terrain Select System that gives drivers the facility to match the vehicle’s settings to the terrain – if you were crossing a beach you would select Sand, or Rock for more treacherous and technical terrain.', 150, 'Petrol', 2020, 7, 'Mwea', 'prado-tx-2.png', 'prado-tx-4.jpg', 'prado-tx-3.png', 'prado-tx-6.jfif', 'prado-tx-1.jpg', 1, 1, 1, 1, 1, 1, 1, NULL, 1, 1, NULL, 1, '2023-01-26 14:39:11', '2023-03-12 06:39:29'),
(14, 'Nissan Patrol', 12, 'Powerful offroad machine.', 180, 'Diesel', 2022, 7, 'Thika', 'patrol-2.jpg', 'patrol-3.jpg', 'patrol-7.jpg', 'Patrol-1.jpg', 'patrol-5.jpg', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2023-01-26 14:48:01', '2023-02-04 20:50:55'),
(15, 'Audi Q5', 9, '5 passenger luxury SUV with a 2.0-litre turbocharged four cylinder engine, seven-speed dual-clutch automatic transmission and all-wheel drive.\r\nQuiet, comfortable and roomy cabin\r\nAdaptive cruise control', 200, 'Diesel', 2023, 5, 'Sagana', 'Audi Q5-1.jpg', 'Audi Q5-4.jpg', 'Audi Q5-3.jpg', 'Audi Q5-2.jpg', 'Audi Q5-5.jpg', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2023-01-28 10:57:21', NULL),
(16, 'Range Rover Sport', 17, 'Range Rover Sport brings distinctive design touches.\r\nThe purposeful cockpit-like driving position sets the tone for a focused interior.\r\n-Premium LED headlights with signature DRL\r\n-20\'\' style 5125 wheels\r\n-Online Pack with Data Plan and Amazon Alexa\r\n-Grained leather seats\r\n-3D surround camera with blind spot assist pack\r\nThe exterior is an assertive evolution where modernity and refinement meet visceral desire\r\nRange Rover Sport redefines sporting luxury', 150, 'Diesel', 2022, 7, 'Kutus', 'Range-Rover-3.jpg', 'Range-Rover-2.jpg', 'Range-Rover-1.jpg', 'Range-Rover-6.jpg', 'Range-Rover-4.jpg', 1, 1, 1, 1, 1, 1, 1, NULL, 1, 1, 1, 1, '2023-01-29 19:34:09', NULL),
(17, 'RR Phantom', 14, 'A haven of serenity, the apex of luxury\r\nTwin turbocharged and intercooled DOHC 48-valve V12 engine\r\n8-speed automatic transmission', 400, 'Petrol', 2022, 4, 'Thika', 'RR Phantom-1.jpg', 'RR Phantom-4.jpg', 'RR Phantom-2.jpg', 'RR Phantom-3.jpg', 'RR Phantom-5.jpg', 1, 1, 1, NULL, 1, 1, 1, 1, 1, 1, 1, 1, '2023-01-29 19:44:49', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(11) NOT NULL,
  `txn_id` varchar(255) DEFAULT NULL,
  `payment_amount` decimal(7,2) DEFAULT NULL,
  `payment_status` varchar(30) DEFAULT NULL,
  `vehicleId` varchar(255) DEFAULT NULL,
  `created` datetime NOT NULL DEFAULT current_timestamp(),
  `payer_email` varchar(255) DEFAULT NULL,
  `cardNumber` int(255) NOT NULL,
  `expiryDate` date DEFAULT NULL,
  `holder` varchar(60) NOT NULL,
  `cvc` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `txn_id`, `payment_amount`, `payment_status`, `vehicleId`, `created`, `payer_email`, `cardNumber`, `expiryDate`, `holder`, `cvc`) VALUES
(1, 'RAB87BJQFK', '80.00', '1', '8', '2023-01-13 13:37:59', 'ping@yahoo.com', 0, NULL, '', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblbooking`
--
ALTER TABLE `tblbooking`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblbrands`
--
ALTER TABLE `tblbrands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblcontactusinfo`
--
ALTER TABLE `tblcontactusinfo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblcontactusquery`
--
ALTER TABLE `tblcontactusquery`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblpages`
--
ALTER TABLE `tblpages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblsubscribers`
--
ALTER TABLE `tblsubscribers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbltestimonial`
--
ALTER TABLE `tbltestimonial`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblusers`
--
ALTER TABLE `tblusers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblvehicles`
--
ALTER TABLE `tblvehicles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tblbooking`
--
ALTER TABLE `tblbooking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `tblbrands`
--
ALTER TABLE `tblbrands`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `tblcontactusinfo`
--
ALTER TABLE `tblcontactusinfo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tblcontactusquery`
--
ALTER TABLE `tblcontactusquery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tblpages`
--
ALTER TABLE `tblpages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `tblsubscribers`
--
ALTER TABLE `tblsubscribers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbltestimonial`
--
ALTER TABLE `tbltestimonial`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tblusers`
--
ALTER TABLE `tblusers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tblvehicles`
--
ALTER TABLE `tblvehicles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 31, 2019 at 06:43 AM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `databasetest`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `idCustomer` int(11) NOT NULL,
  `fNameCustomer` varchar(45) NOT NULL,
  `lNameCustomer` varchar(45) NOT NULL,
  `cNumCustomer` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`idCustomer`, `fNameCustomer`, `lNameCustomer`, `cNumCustomer`) VALUES
(1, 'Reilly', 'Hernandez', 1),
(2, 'Jaune', 'Raquel', 2);

-- --------------------------------------------------------

--
-- Table structure for table `customer_has_reservation`
--

CREATE TABLE `customer_has_reservation` (
  `custom_idCustomer` int(11) NOT NULL,
  `Reservation_idReservation` int(11) NOT NULL,
  `Rerservation_Customer_idCustomer` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer_has_reservation`
--

INSERT INTO `customer_has_reservation` (`custom_idCustomer`, `Reservation_idReservation`, `Rerservation_Customer_idCustomer`) VALUES
(1, 1, 1),
(2, 2, 2);

-- --------------------------------------------------------

--
-- Stand-in structure for view `databaseview`
-- (See below for the actual view)
--
CREATE TABLE `databaseview` (
`lNameCustomer` varchar(45)
,`fNameCustomer` varchar(45)
,`cNumCustomer` int(11)
,`dateReservation` date
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `diosview`
-- (See below for the actual view)
--
CREATE TABLE `diosview` (
`lNameCustomer` varchar(45)
,`fNameCustomer` varchar(45)
,`cNumCustomer` int(11)
,`custom_idCustomer` int(11)
,`Reservation_idReservation` int(11)
);

-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

CREATE TABLE `reservation` (
  `idReservation` int(11) NOT NULL,
  `dateReservation` date NOT NULL,
  `eventReservation` varchar(45) NOT NULL,
  `venueReservation` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reservation`
--

INSERT INTO `reservation` (`idReservation`, `dateReservation`, `eventReservation`, `venueReservation`) VALUES
(1, '2019-10-31', 'Birthday', 'Swimming Pool'),
(2, '2019-12-12', 'Wedding', 'Garden');

-- --------------------------------------------------------

--
-- Structure for view `databaseview`
--
DROP TABLE IF EXISTS `databaseview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `databaseview`  AS  select `customer`.`lNameCustomer` AS `lNameCustomer`,`customer`.`fNameCustomer` AS `fNameCustomer`,`customer`.`cNumCustomer` AS `cNumCustomer`,`reservation`.`dateReservation` AS `dateReservation` from (`customer` join `reservation` on(`customer`.`idCustomer` = `reservation`.`idReservation`)) ;

-- --------------------------------------------------------

--
-- Structure for view `diosview`
--
DROP TABLE IF EXISTS `diosview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `diosview`  AS  select `customer`.`lNameCustomer` AS `lNameCustomer`,`customer`.`fNameCustomer` AS `fNameCustomer`,`customer`.`cNumCustomer` AS `cNumCustomer`,`customer_has_reservation`.`custom_idCustomer` AS `custom_idCustomer`,`customer_has_reservation`.`Reservation_idReservation` AS `Reservation_idReservation` from (`customer` join `customer_has_reservation` on(`customer_has_reservation`.`Rerservation_Customer_idCustomer` = `customer`.`idCustomer`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`idCustomer`);

--
-- Indexes for table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`idReservation`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `idCustomer` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `idReservation` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `id_Customer_idx` FOREIGN KEY (`idCustomer`) REFERENCES `reservation` (`idReservation`);

--
-- Constraints for table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`idReservation`) REFERENCES `customer` (`idCustomer`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

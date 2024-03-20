-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 20, 2024 at 09:21 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fruterias_perez`
--

-- --------------------------------------------------------

--
-- Table structure for table `computers`
--

CREATE TABLE `computers` (
  `computer_id` int(11) NOT NULL,
  `serial_number` varchar(50) NOT NULL,
  `product_model` varchar(30) NOT NULL,
  `department_id` int(11) DEFAULT NULL,
  `warranty_expiration_date` date NOT NULL,
  `operating_system` varchar(20) DEFAULT NULL,
  `purchase_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `computers`
--

INSERT INTO `computers` (`computer_id`, `serial_number`, `product_model`, `department_id`, `warranty_expiration_date`, `operating_system`, `purchase_date`) VALUES
(1, 'SN001', 'Dell XPS 13', 1, '2025-09-30', 'Windows 10', '2023-01-15'),
(2, 'SN002', 'HP Spectre x360', 1, '2025-10-01', 'Ubuntu 20.04', '2023-02-20'),
(3, 'SN003', 'MacBook Pro 13', 1, '2025-10-02', 'macOS Catalina', '2023-03-25'),
(4, 'SN004', 'Lenovo ThinkPad X1 Carbon', 1, '2025-10-03', 'Windows 11', '2023-04-30'),
(5, 'SN005', 'Microsoft Surface Laptop 4', 2, '2025-10-04', 'Ubuntu 20.04', '2023-05-01'),
(6, 'SN006', 'Asus ZenBook 14', 2, '2025-10-05', 'Windows 10', '2023-06-05'),
(7, 'SN007', 'Acer Swift 5', 2, '2025-10-06', 'macOS Big Sur', '2023-07-10'),
(8, 'SN008', 'Razer Blade 15', 2, '2025-10-07', 'Ubuntu 20.04', '2023-08-15'),
(9, 'SN009', 'MSI GS66 Stealth', 3, '2025-10-08', 'Windows 11', '2023-09-20'),
(10, 'SN010', 'Google Pixelbook Go', 3, '2025-10-09', 'Ubuntu 20.04', '2023-10-25'),
(11, 'SN011', 'Huawei MateBook X Pro', 3, '2025-10-10', 'macOS Catalina', '2023-11-30'),
(12, 'SN012', 'Samsung Galaxy Book Flex', 3, '2025-10-11', 'Windows 10', '2023-12-31'),
(13, 'SN013', 'LG Gram 17', 4, '2025-10-12', 'Ubuntu 20.04', '2024-01-01'),
(14, 'SN014', 'Alienware m15 R4', 4, '2025-10-13', 'Windows 11', '2024-02-05'),
(15, 'SN015', 'Lenovo Yoga C940', 4, '2025-10-14', 'macOS Big Sur', '2024-03-10'),
(16, 'SN016', 'HP Envy x360', 4, '2025-10-15', 'Ubuntu 20.04', '2024-04-15'),
(17, 'SN017', 'Dell Inspiron 15 7000', 5, '2025-10-16', 'Windows 10', '2024-05-20'),
(18, 'SN018', 'Microsoft Surface Pro 7', 5, '2025-10-17', 'Ubuntu 20.04', '2024-06-25'),
(19, 'SN019', 'Asus ROG Zephyrus G14', 5, '2025-10-18', 'macOS Catalina', '2024-07-30'),
(20, 'SN020', 'Acer Predator Helios 300', 5, '2025-10-19', 'Windows 11', '2024-08-31'),
(21, 'SN021', 'Gigabyte Aero 15', 6, '2025-10-20', 'Ubuntu 20.04', '2024-09-01'),
(22, 'SN022', 'Lenovo Legion 5', 6, '2025-10-21', 'Windows 10', '2024-10-05'),
(23, 'SN023', 'HP Omen 15', 6, '2025-10-22', 'macOS Big Sur', '2024-11-10'),
(24, 'SN024', 'Dell Precision 5550', 6, '2025-10-23', 'Ubuntu 20.04', '2024-12-15'),
(25, 'SN025', 'Apple iMac 27', 7, '2025-10-24', 'Windows 11', '2025-01-01'),
(26, 'SN026', 'Microsoft Surface Studio 2', 7, '2025-10-25', 'Ubuntu 20.04', '2025-02-05'),
(27, 'SN027', 'Lenovo ThinkCentre M90n Nano', 7, '2025-10-26', 'macOS Catalina', '2025-03-10'),
(28, 'SN028', 'Asus VivoMini', 7, '2025-10-27', 'Windows 10', '2025-04-15'),
(29, 'SN029', 'Intel NUC', 8, '2025-10-28', 'Ubuntu 20.04', '2025-05-20'),
(30, 'SN030', 'Raspberry Pi 4', 8, '2025-10-29', 'Windows 11', '2025-06-25'),
(31, 'SN031', 'Zotac Magnus', 8, '2025-10-30', 'macOS Big Sur', '2025-07-30'),
(32, 'SN032', 'Gigabyte BRIX', 8, '2025-10-31', 'Ubuntu 20.04', '2025-08-31');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customer_id` int(11) NOT NULL,
  `first_name` varchar(12) NOT NULL,
  `last_name` varchar(20) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `phone_number` int(9) DEFAULT NULL,
  `address` varchar(30) DEFAULT NULL,
  `country` varchar(20) DEFAULT NULL,
  `registration_date` date DEFAULT curdate(),
  `promotional_offers` tinyint(1) DEFAULT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_id`, `first_name`, `last_name`, `email`, `phone_number`, `address`, `country`, `registration_date`, `promotional_offers`, `password`) VALUES
(1, 'Tessy', 'Spencer', 'tspencer0@skyrock.com', 795606894, NULL, 'Latvia', '2024-03-12', 1, ''),
(2, 'Kayla', 'Smallpeice', 'ksmallpeice1@drupal.org', 564683657, NULL, 'China', '2024-03-12', 0, ''),
(3, 'Becki', 'Wimpress', 'bwimpress2@nature.com', 436010902, '355 Lakewood Gardens Lane', 'Philippines', '2024-03-12', NULL, ''),
(4, 'Lee', 'Cometson', 'lcometson3@tinypic.com', NULL, '11070 Commercial Park', 'Sweden', '2024-03-12', 0, ''),
(5, 'Marlo', 'Teasdale', 'mteasdale4@photobucket.com', 789757161, '14811 Oak Road', 'Indonesia', '2024-03-12', 1, ''),
(6, 'Matilda', 'Fairpool', 'mfairpool5@sbwire.com', 911692787, NULL, 'Russia', '2024-03-12', NULL, ''),
(7, 'Rikki', 'Spir', 'rspir6@a8.net', 355144643, '1739 Charing Cross Parkway', 'Germany', '2024-03-12', NULL, ''),
(8, 'Dimitry', 'Faithfull', 'dfaithfull7@nydailynews.com', 925091922, NULL, 'Colombia', '2024-03-12', 1, ''),
(9, 'Doralyn', 'McEllen', 'dmcellen8@seattletimes.com', 130790373, '77626 Crowley Junction', 'Zambia', '2024-03-12', 1, ''),
(10, 'Lexi', 'Minigo', 'lminigo9@java.com', 913501177, '5 Pierstorff Pass', 'Indonesia', '2024-03-12', 1, ''),
(11, 'Tait', 'Van Vuuren', 'tvanvuurena@marriott.com', NULL, '2430 Del Sol Parkway', 'Ukraine', '2024-03-12', NULL, ''),
(12, 'Gabriele', 'Norewood', 'gnorewoodb@wikipedia.org', 620992154, NULL, 'Honduras', '2024-03-12', 0, ''),
(13, 'Rooney', 'Lewtey', 'rlewteyc@state.tx.us', 889412239, '03 4th Junction', 'Vietnam', '2024-03-12', 1, ''),
(14, 'Jeanelle', NULL, 'jabbatid@hc360.com', 216174379, NULL, 'Slovenia', '2024-03-12', 1, ''),
(15, 'Ebenezer', 'Wicher', 'ewichere@google.pl', 843776048, '1 Glacier Hill Park', 'Argentina', '2024-03-12', NULL, ''),
(16, 'Gipsy', 'Carder', 'gcarderf@amazon.co.jp', 626622395, '027 Amoth Drive', 'Argentina', '2024-03-12', NULL, ''),
(17, 'Lazar', 'Pillman', 'lpillmang@wikispaces.com', 100270403, '6797 Dixon Court', 'Russia', '2024-03-12', 1, ''),
(18, 'Yuri', 'Brabyn', 'ybrabynh@jiathis.com', NULL, NULL, 'China', '2024-03-12', NULL, ''),
(19, 'Rocky', 'Standing', 'rstandingi@spotify.com', 834811917, '88 Steensland Center', 'China', '2024-03-12', 1, ''),
(20, 'Nels', 'Mizen', 'nmizenj@parallels.com', NULL, NULL, 'Sweden', '2024-03-12', 0, ''),
(21, 'Lance', 'Endean', 'lendeank@slashdot.org', 560966206, '43 Glacier Hill Terrace', 'Sweden', '2024-03-12', 1, ''),
(22, 'Godart', 'Olenchenko', 'golenchenkol@paypal.com', 258350095, '9 Charing Cross Drive', 'Argentina', '2024-03-12', 0, ''),
(23, 'Hilde', 'Cowoppe', 'hcowoppem@edublogs.org', 137263965, '60 Bellgrove Circle', 'Argentina', '2024-03-12', 0, ''),
(24, 'Paddie', 'Grimm', 'pgrimmn@cloudflare.com', NULL, NULL, 'Haiti', '2024-03-12', NULL, ''),
(25, 'Daron', 'Crookshank', 'dcrookshanko@virginia.edu', 279497254, '96 South Trail', 'Russia', '2024-03-12', 0, ''),
(26, 'Mirna', 'Hasney', 'mhasneyp@unc.edu', NULL, '74523 Arapahoe Trail', 'Brazil', '2024-03-12', 1, ''),
(27, 'Leonhard', 'Moakes', 'lmoakesq@123-reg.co.uk', 375054507, '35981 Lawn Hill', 'China', '2024-03-12', NULL, ''),
(28, 'Darrell', 'Idel', 'didelr@youtu.be', 681090241, NULL, 'China', '2024-03-12', 1, ''),
(29, 'Imogene', 'Casier', 'icasiers@digg.com', NULL, '80 Melby Avenue', 'China', '2024-03-12', 1, ''),
(30, 'Laurel', 'Ingarfield', 'lingarfieldt@homestead.com', 548888822, '4 Badeau Terrace', 'Poland', '2024-03-12', NULL, ''),
(31, 'Anni', NULL, 'agabbidonu@yolasite.com', 994927807, '3852 Trailsway Parkway', 'Germany', '2024-03-12', NULL, ''),
(32, 'Eda', 'Zanolli', 'ezanolliv@dell.com', 979579205, NULL, 'Morocco', '2024-03-12', 0, ''),
(33, 'Sarge', 'Lebond', 'slebondw@hexun.com', 658236493, '818 Artisan Hill', 'China', '2024-03-12', NULL, ''),
(34, 'Marika', 'Olivie', 'moliviex@paypal.com', 346157992, '39720 Prentice Alley', 'Japan', '2024-03-12', 0, ''),
(35, 'Allsun', 'Vince', 'avincey@yolasite.com', 940069795, '46 Debs Crossing', 'China', '2024-03-12', 1, ''),
(36, 'Jenica', 'Manns', 'jmannsz@theglobeandmail.com', 929165842, '61173 Darwin Terrace', 'China', '2024-03-12', NULL, ''),
(37, 'Hugibert', 'Markwell', 'hmarkwell10@nps.gov', NULL, '3830 Brickson Park Plaza', 'China', '2024-03-12', 0, ''),
(38, 'Kat', 'O\'Hollegan', 'kohollegan11@aol.com', 580636290, '00522 Pond Hill', 'Sweden', '2024-03-12', 0, ''),
(39, 'Paddy', 'Rembrant', 'prembrant12@springer.com', 489373367, '786 Grayhawk Drive', 'China', '2024-03-12', 1, ''),
(40, 'Deva', 'Headland', 'dheadland13@mlb.com', 667545714, '5030 Merry Pass', 'South Africa', '2024-03-12', 0, ''),
(41, 'Allie', 'Tanton', 'atanton14@tiny.cc', 471494221, '5200 Cordelia Hill', 'Indonesia', '2024-03-12', 1, ''),
(42, 'Vitia', 'Giddins', 'vgiddins15@aol.com', 836446484, '12943 Hoard Circle', 'Argentina', '2024-03-12', NULL, ''),
(43, 'Hernando', NULL, 'hpalfery16@google.pl', 463399732, '1 Anzinger Park', 'Portugal', '2024-03-12', 1, ''),
(44, 'Louis', 'Sporrij', 'lsporrij17@youku.com', 343225783, '211 Weeping Birch Pass', 'Brazil', '2024-03-12', 1, ''),
(45, 'Addi', 'Alessandone', 'aalessandone18@buzzfeed.com', 242836972, '5 Kennedy Parkway', 'Indonesia', '2024-03-12', 0, ''),
(46, 'Robbie', 'Hoggetts', 'rhoggetts19@blogtalkradio.com', 954092675, '00 Mariners Cove Hill', 'Thailand', '2024-03-12', 0, ''),
(47, 'Dunn', 'Rennock', 'drennock1a@tamu.edu', 795825684, NULL, 'China', '2024-03-12', NULL, ''),
(48, 'Felicle', 'Quinnelly', 'fquinnelly1b@spiegel.de', 534368875, '2279 Rowland Street', 'China', '2024-03-12', 1, ''),
(49, 'Solomon', 'Dunstall', 'sdunstall1c@myspace.com', 264092611, '4 Corben Park', 'Nigeria', '2024-03-12', 0, ''),
(50, 'Piper', 'Garrold', 'pgarrold1d@house.gov', 767574636, '2 Commercial Center', 'Canada', '2024-03-12', 0, ''),
(51, 'Adrasdjnas', NULL, 'asdad@jashd.com', NULL, NULL, 'spain', '2024-03-19', 0, '11'),
(52, 'ruben', NULL, 'ruben@ruben.com', NULL, NULL, 'spain', '2024-03-19', 0, 'ruben');

-- --------------------------------------------------------

--
-- Table structure for table `deliveryman`
--

CREATE TABLE `deliveryman` (
  `deliveryman_id` int(11) NOT NULL,
  `first_name` varchar(12) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phone_number` int(9) NOT NULL,
  `address` varchar(30) DEFAULT NULL,
  `DNI` varchar(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `deliveryman`
--

INSERT INTO `deliveryman` (`deliveryman_id`, `first_name`, `last_name`, `email`, `phone_number`, `address`, `DNI`) VALUES
(1, 'Pooh', 'Sambrook', 'psambrook0@auda.org.au', 999209056, '15 Briar Crest Drive', '683830195'),
(2, 'Hillier', 'Findon', 'hfindon1@wikia.com', 387240232, '46266 Tomscot Parkway', '207189997'),
(3, 'Kayle', 'Brownsea', 'kbrownsea2@quantcast.com', 310769422, '37 Truax Parkway', '500775342'),
(4, 'Alecia', 'Finnes', 'afinnes3@cpanel.net', 990738871, '1159 Johnson Point', '325679652'),
(5, 'Claudius', 'Hacun', 'chacun4@usda.gov', 838573867, '87 Mcguire Point', '794872251'),
(6, 'Shep', 'Rudsdale', 'srudsdale5@xing.com', 421703382, '2 Barnett Center', '270792477'),
(7, 'Bria', 'Piggott', 'bpiggott6@1688.com', 775466151, '9157 Atwood Terrace', '436273874'),
(8, 'Shell', 'Broadbury', 'sbroadbury7@w3.org', 837603991, '2 Northland Avenue', '734131432'),
(9, 'Allie', 'Zipsell', 'azipsell8@so-net.ne.jp', 961145018, '07 Derek Street', '945354678'),
(10, 'Hieronymus', 'Bassam', 'hbassam9@yelp.com', 453068498, '05095 Village Trail', '840648937');

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `department_id` int(11) NOT NULL,
  `department_name` varchar(30) NOT NULL,
  `manager_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`department_id`, `department_name`, `manager_id`) VALUES
(1, 'Ejecutivos', 1),
(2, 'Marketing', 8),
(3, 'Recursos Humanos', 4),
(4, 'Envios', 7),
(5, 'Almacen', 3),
(6, 'Contabilidad', 5),
(7, 'Ventas', 6),
(8, 'Mantenimiento', 2);

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `employee_id` int(11) NOT NULL,
  `first_name` varchar(20) DEFAULT NULL,
  `last_name` varchar(25) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `hire_date` date NOT NULL DEFAULT curdate(),
  `job_id` varchar(20) NOT NULL,
  `salary` int(11) DEFAULT NULL,
  `commission_pct` decimal(4,2) DEFAULT NULL,
  `manager_id` int(11) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`employee_id`, `first_name`, `last_name`, `email`, `phone_number`, `hire_date`, `job_id`, `salary`, `commission_pct`, `manager_id`, `department_id`) VALUES
(1, 'Lluc', 'Farre', 'lluc.farre@fruteriasperez.com', '123456788', '2024-03-12', 'Pres', 22000, 0.25, NULL, 1),
(2, 'Ava', 'Rodriguez', 'ava.rodriguez@fruteriasperez.com', '666555444', '2024-03-12', 'Resp_Mante', 4200, NULL, 1, 8),
(3, 'Grace', 'Anderson', 'grace.anderson@fruteriasperez.com', '999888777', '2024-03-12', 'Resp_Alma', 3500, NULL, 1, 5),
(4, 'Emily', 'Davis', 'emily.davis@fruteriasperez.com', '111222333', '2024-03-12', 'Resp_RH', 6000, 0.08, 1, 3),
(5, 'Sophia', 'White', 'sophia.white@fruteriasperez.com', '555444333', '2024-03-12', 'Resp_Cont', 5000, 0.07, 1, 6),
(6, 'Emma', 'Garcia', 'emma.garcia@fruteriasperez.com', '777888999', '2024-03-12', 'Resp_Vent', 7200, 0.08, 1, 7),
(7, 'Ava', 'Rodriguez', 'ava.rodriguez@fruteriasperez.com', '666555444', '2024-03-12', 'Resp_Env', 4200, NULL, 1, 4),
(8, 'Bob', 'Johnson', 'bob.johnson@fruteriasperez.com', '987654321', '2024-03-12', 'Resp_Mark', 8000, 0.10, 1, 2),
(9, 'Sophie', 'Brown', 'sophie.brown@fruteriasperez.com', '555666777', '2024-03-12', 'Emp_Mark', 8200, 0.10, 8, 2),
(10, 'Jackson', 'Taylor', 'jackson.taylor@fruteriasperez.com', '444555666', '2024-03-12', 'Emp_Mark', 7900, 0.09, 8, 2),
(11, 'Alice', 'Smith', 'alice.smith@fruteriasperez.com', '123456789', '2024-03-12', 'Emp_Mark', 8500, 0.10, 8, 2),
(12, 'Isabella', 'Martinez', 'isabella.martinez@efruteriasperez.com', '333222111', '2024-03-12', 'Emp_RH', 6300, 0.07, 4, 3),
(13, 'Ethan', 'Gomez', 'ethan.gomez@fruteriasperez.com', '222333444', '2024-03-12', 'Emp_RH', 5900, 0.06, 4, 3),
(14, 'Charlie', 'Brown', 'charlie.brown@fruteriasperez.com', '444555666', '2024-03-12', 'Emp_RH', 5500, 0.05, 4, 3),
(15, 'William', 'Young', 'william.young@fruteriasperez.com', '777666555', '2024-03-12', 'Emp_Mante', 3900, NULL, 2, 4),
(16, 'Harper', 'Rivera', 'harper.rivera@fruteriasperez.com', '111222333', '2024-03-12', 'Emp_Mante', 4500, 0.35, 2, 4),
(17, 'Benjamin', 'Parker', 'benjamin.parker@fruteriasperez.com', '777666555', '2024-03-12', 'Emp_Mante', 4100, 0.15, 2, 4),
(18, 'Charlotte', 'Lopez', 'charlotte.lopez@fruteriasperez.com', '555444333', '2024-03-12', 'Emp_Alma', 3800, NULL, 3, 5),
(19, 'Liam', 'Hernandez', 'liam.hernandez@fruteriasperez.com', '666555444', '2024-03-12', 'Emp_Alma', 3400, NULL, 3, 5),
(20, 'Edward', 'Clark', 'edward.clark@fruteriasperez.com', '222111333', '2024-03-12', 'Emp_Alma', 3200, 0.10, 3, 5),
(21, 'Amelia', 'Gonzalez', 'amelia.gonzalez@fruteriasperez.com', '999888777', '2024-03-12', 'Emp_Cont', 5200, 0.07, 5, 6),
(22, 'Lucas', 'Diaz', 'lucas.diaz@fruteriasperez.com', '222333444', '2024-03-12', 'Emp_Cont', 4800, 0.05, 5, 6),
(23, 'Oliver', 'Lee', 'oliver.lee@fruteriasperez.com', '333222111', '2024-03-12', 'Emp_Cont', 4700, 0.05, 5, 6),
(24, 'Mia', 'Perez', 'mia.perez@fruteriasperez.com', '111222333', '2024-03-12', 'Emp_Vent', 7500, 0.08, 6, 7),
(25, 'James', 'Sanchez', 'james.sanchez@fruteriasperez.com', '777888999', '2024-03-12', 'Emp_Vent', 7100, 0.07, 6, 7),
(26, 'Daniel', 'Martinez', 'daniel.martinez@fruteriasperez.com', '333666999', '2024-03-12', 'Emp_Vent', 6800, 0.06, 6, 7),
(27, 'William', 'Young', 'william.young@fruteriasperez.com', '777666555', '2024-03-12', 'Emp_Env', 3900, NULL, 7, 4),
(28, 'Harper', 'Rivera', 'harper.rivera@fruteriasperez.com', '111222333', '2024-03-12', 'Emp_Env', 4500, 0.07, 7, 4),
(29, 'Benjamin', 'Parker', 'benjamin.parker@fruteriasperez.com', '777666555', '2024-03-12', 'Emp_Env', 4100, NULL, 7, 4);

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `job_id` varchar(20) NOT NULL,
  `job_title` varchar(30) DEFAULT NULL,
  `min_salary` decimal(10,0) NOT NULL,
  `max_salary` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`job_id`, `job_title`, `min_salary`, `max_salary`) VALUES
('Emp_Alma', 'Empleado Almacen', 2000, 5000),
('Emp_Cont', 'Empleado Contabilidad', 2000, 6000),
('Emp_Env', 'Empleado Envios', 4000, 7000),
('Emp_Mante', 'Empleado Mentenimiento', 2000, 5000),
('Emp_Mark', 'Empleado Marketing', 8000, 10000),
('Emp_Prod', 'Empleado Produccion', 4000, 9000),
('Emp_RH', 'Empleado Recursos Humanos', 4000, 8000),
('Emp_Vent', 'Empleado Ventas', 7000, 9000),
('Pres', 'President', 18000, 25000),
('Resp_Alma', 'Responsable Almacen', 3000, 8000),
('Resp_Cont', 'Responsable Contabilidad', 4000, 9000),
('Resp_Env', 'Responsable Envios', 6000, 8000),
('Resp_Mante', 'Responsable Mentenimiento', 5000, 10000),
('Resp_Mark', 'Responsable Marketing', 10000, 15000),
('Resp_Prod', 'Responsable Produccion', 7000, 11000),
('Resp_RH', 'Responsable Recursos Humanos', 6000, 10000),
('Resp_Vent', 'Responsable Ventas', 9000, 12000);

-- --------------------------------------------------------

--
-- Table structure for table `job_history`
--

CREATE TABLE `job_history` (
  `employee_id` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `job_id` varchar(10) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `job_history`
--

INSERT INTO `job_history` (`employee_id`, `start_date`, `end_date`, `job_id`, `department_id`) VALUES
(1, '2017-01-01', '2023-02-18', 'Resp_Alma', 5),
(9, '2020-03-01', '2022-12-28', 'Emp_Mark', 2),
(10, '2021-02-01', '2023-11-08', 'Emp_Cont', 6),
(19, '2022-03-01', '2023-12-01', 'Emp_Vent', 7),
(24, '2019-03-01', '2022-12-11', 'Emp_RH', 7);

-- --------------------------------------------------------

--
-- Table structure for table `logins`
--

CREATE TABLE `logins` (
  `employee_id` int(11) NOT NULL,
  `username` varchar(20) DEFAULT NULL,
  `user_password` varchar(255) NOT NULL,
  `two_factor_auth` tinyint(1) NOT NULL,
  `account_status` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `logins`
--

INSERT INTO `logins` (`employee_id`, `username`, `user_password`, `two_factor_auth`, `account_status`) VALUES
(1, 'lluc_farre', 'password1', 1, 'active'),
(2, 'ava_rodriguez', 'password2', 0, 'active'),
(3, 'grace_anderson', 'password3', 1, 'active'),
(4, 'emily_davis', 'password4', 1, 'active'),
(5, 'sophia_white', 'password5', 0, 'active'),
(6, 'emma_garcia', 'password6', 1, 'active'),
(7, 'ava_rodriguez', 'password7', 0, 'active'),
(8, 'bob_johnson', 'password8', 1, 'active'),
(9, 'sophie_brown', 'password9', 0, 'active'),
(10, 'jackson_taylor', 'password10', 1, 'active'),
(11, 'alice_smith', 'password11', 1, 'active'),
(12, 'isabella_martinez', 'password12', 1, 'active'),
(13, 'ethan_gomez', 'password13', 0, 'active'),
(14, 'charlie_brown', 'password14', 1, 'active'),
(15, 'william_young', 'password15', 0, 'active'),
(16, 'harper_rivera', 'password16', 1, 'active'),
(17, 'benjamin_parker', 'password17', 1, 'active'),
(18, 'charlotte_lopez', 'password18', 0, 'active'),
(19, 'liam_hernandez', 'password19', 1, 'active'),
(20, 'edward_clark', 'password20', 1, 'active'),
(21, 'amelia_gonzalez', 'password21', 0, 'active'),
(22, 'lucas_diaz', 'password22', 0, 'active'),
(23, 'oliver_lee', 'password23', 1, 'active'),
(24, 'mia_perez', 'password24', 0, 'active'),
(25, 'james_sanchez', 'password25', 1, 'active'),
(26, 'daniel_martinez', 'password26', 0, 'active'),
(27, 'william_young', 'password27', 0, 'active'),
(28, 'harper_rivera', 'password28', 1, 'active'),
(29, 'benjamin_parker', 'password29', 1, 'active');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `deliveryman_id` int(11) DEFAULT NULL,
  `payment_method` varchar(10) NOT NULL,
  `order_date` date DEFAULT curdate(),
  `delivery_date` date DEFAULT NULL,
  `postal_code` int(5) NOT NULL,
  `address` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `customer_id`, `deliveryman_id`, `payment_method`, `order_date`, `delivery_date`, `postal_code`, `address`) VALUES
(1, 28, 4, 'Cash', '2021-04-14', '2022-06-16', 77953, '20th Floor'),
(2, 22, 5, 'Visa', '2020-04-11', '2022-08-04', 24348, 'Room 929'),
(3, 7, 9, 'Cash', '2020-10-29', '2022-04-27', 80274, 'PO Box 70462'),
(4, 28, 5, 'Cash', '2021-10-23', '2022-04-23', 60507, 'Apt 68'),
(5, 40, 7, 'Cash', '2021-07-07', '2021-07-02', 62089, 'PO Box 28964'),
(6, 38, 9, 'Cash', '2020-05-16', '2021-12-29', 27441, 'Room 527'),
(7, 3, 1, 'Cash', '2022-06-29', '2021-09-19', 67721, 'Suite 76'),
(8, 3, 3, 'PayPal', '2022-04-14', '2022-01-15', 93168, 'Suite 46'),
(9, 10, 6, 'PayPal', '2020-08-17', '2022-12-08', 74984, '14th Floor'),
(10, 20, 4, 'Cash', '2020-03-26', '2021-03-06', 95927, 'Room 376'),
(11, 9, 5, 'PayPal', '2022-12-17', '2022-10-24', 42899, 'Apt 1134'),
(12, 33, 2, 'PayPal', '2022-07-03', '2020-02-22', 87965, 'Room 512'),
(13, 24, 2, 'PayPal', '2020-03-14', '2021-03-13', 28032, 'Apt 1094'),
(14, 39, 4, 'Cash', '2021-01-16', '2020-07-18', 21852, '14th Floor'),
(15, 38, 1, 'Cash', '2021-06-05', '2021-11-05', 53448, '20th Floor'),
(16, 14, 3, 'Visa', '2020-11-20', '2020-07-10', 48614, '9th Floor'),
(17, 11, 8, 'MasterCard', '2022-03-21', '2020-08-06', 89885, 'PO Box 88550'),
(18, 18, 5, 'PayPal', '2022-10-03', '2021-11-20', 99996, 'Room 590'),
(19, 18, 3, 'Visa', '2021-04-23', '2021-02-15', 46114, 'Suite 77'),
(20, 28, 1, 'Visa', '2021-12-12', '2021-10-10', 31857, 'Suite 56'),
(21, 27, 7, 'Visa', '2020-12-06', '2021-12-28', 64877, 'Room 608'),
(22, 38, 10, 'Visa', '2022-08-10', '2021-10-10', 35733, 'Apt 969'),
(23, 11, 2, 'Cash', '2021-03-01', '2021-11-24', 71482, 'Suite 12'),
(24, 48, 5, 'Visa', '2021-05-05', '2022-11-02', 16135, 'PO Box 33138'),
(25, 2, 9, 'MasterCard', '2022-10-12', '2022-03-28', 69439, '19th Floor'),
(26, 2, 2, 'Cash', '2021-07-17', '2021-04-09', 17315, 'Suite 40'),
(27, 38, 3, 'Cash', '2022-06-13', '2022-01-09', 10006, 'Apt 784'),
(28, 40, 9, 'PayPal', '2021-06-02', '2020-12-03', 56779, 'Room 1050'),
(29, 9, 6, 'MasterCard', '2020-02-08', '2021-11-11', 38404, 'Apt 109'),
(30, 9, 1, 'Visa', '2022-11-26', '2020-09-01', 16883, 'Suite 7'),
(31, 17, 10, 'MasterCard', '2020-04-13', '2020-07-16', 44774, 'Suite 18'),
(32, 23, 8, 'Cash', '2021-03-21', '2021-10-03', 32444, 'Suite 30'),
(33, 40, 1, 'PayPal', '2020-10-13', '2020-08-09', 97194, 'Apt 971'),
(34, 12, 2, 'PayPal', '2022-08-30', '2020-08-02', 63939, 'PO Box 47969'),
(35, 16, 9, 'Cash', '2022-07-09', '2021-07-20', 85373, '14th Floor'),
(36, 10, 5, 'PayPal', '2022-04-08', '2020-03-26', 98868, '19th Floor'),
(37, 9, 10, 'Visa', '2021-11-11', '2020-03-06', 75442, 'PO Box 93667'),
(38, 9, 5, 'MasterCard', '2020-10-31', '2022-02-14', 24086, 'Room 928'),
(39, 17, 1, 'PayPal', '2022-03-31', '2022-03-08', 85930, 'Suite 96'),
(40, 12, 7, 'PayPal', '2022-08-25', '2020-03-19', 22271, 'Apt 1430'),
(41, 32, 6, 'Cash', '2021-12-19', '2020-09-20', 67248, '9th Floor'),
(42, 7, 3, 'MasterCard', '2022-02-16', '2021-09-06', 43847, '7th Floor'),
(43, 47, 7, 'Cash', '2020-09-04', '2021-08-20', 42571, 'Suite 14'),
(44, 26, 4, 'MasterCard', '2022-07-13', '2022-04-06', 66192, 'PO Box 74154'),
(45, 37, 4, 'Visa', '2020-04-25', '2022-11-07', 16034, '1st Floor'),
(46, 35, 1, 'PayPal', '2020-06-13', '2022-08-29', 12617, 'PO Box 62684'),
(47, 6, 6, 'PayPal', '2022-06-21', '2021-02-28', 22753, 'Apt 1458'),
(48, 25, 10, 'Cash', '2022-05-20', '2020-05-05', 97168, 'PO Box 62189'),
(49, 31, 2, 'MasterCard', '2020-02-02', '2020-03-31', 97128, '17th Floor'),
(50, 22, 1, 'Cash', '2022-11-01', '2020-01-05', 67452, 'Room 1597');

-- --------------------------------------------------------

--
-- Table structure for table `orders_products`
--

CREATE TABLE `orders_products` (
  `order_product_id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders_products`
--

INSERT INTO `orders_products` (`order_product_id`, `order_id`, `product_id`, `quantity`) VALUES
(1, 5, 40, 146),
(2, 40, 18, 131),
(3, 34, 26, 15),
(4, 33, 5, 87),
(5, 13, 24, 140),
(6, 11, 23, 53),
(7, 49, 37, 67),
(8, 49, 11, 80),
(9, 42, 27, 44),
(10, 34, 32, 120),
(11, 42, 39, 45),
(12, 15, 14, 161),
(13, 21, 17, 58),
(14, 49, 32, 28),
(15, 40, 32, 49),
(16, 10, 16, 151),
(17, 47, 33, 93),
(18, 38, 9, 114),
(19, 41, 27, 144),
(20, 49, 36, 127),
(21, 9, 26, 8),
(22, 22, 39, 75),
(23, 20, 26, 133),
(24, 3, 23, 12),
(25, 43, 12, 81),
(26, 47, 5, 110),
(27, 19, 37, 158),
(28, 26, 33, 42),
(29, 27, 5, 196),
(30, 40, 39, 29),
(31, 6, 17, 184),
(32, 41, 3, 8),
(33, 18, 10, 150),
(34, 36, 17, 199),
(35, 32, 16, 104),
(36, 9, 27, 185),
(37, 19, 17, 193),
(38, 26, 22, 194),
(39, 42, 35, 18),
(40, 15, 37, 143),
(41, 25, 30, 88),
(42, 12, 4, 130),
(43, 16, 34, 189),
(44, 48, 8, 28),
(45, 10, 40, 128),
(46, 31, 33, 78),
(47, 45, 7, 165),
(48, 17, 25, 14),
(49, 31, 24, 119),
(50, 18, 7, 152);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `provider_id` int(11) DEFAULT NULL,
  `name` varchar(20) NOT NULL,
  `price` decimal(5,2) NOT NULL,
  `stock` int(11) NOT NULL,
  `origin_country` varchar(20) DEFAULT NULL,
  `harvest_date` date DEFAULT curdate(),
  `expiration_date` date NOT NULL,
  `image_URL` varchar(255) NOT NULL DEFAULT 'https://cdn-icons-png.flaticon.com/128/5726/5726716.png'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `provider_id`, `name`, `price`, `stock`, `origin_country`, `harvest_date`, `expiration_date`, `image_URL`) VALUES
(1, 11, 'Calabacín', 928.46, 113, 'Tunisia', '2024-03-12', '2024-05-06', 'https://www.pngall.com/wp-content/uploads/11/Zucchini-PNG-File.png'),
(2, 4, 'Ciruela', 832.49, 943, 'Central African Repu', '2024-03-12', '2024-05-06', 'https://www.pngall.com/wp-content/uploads/2016/04/Plum-PNG-File.png'),
(3, 6, 'Cereza', 157.09, 741, 'Peru', '2024-03-12', '2024-02-22', 'https://www.pngall.com/wp-content/uploads/2016/05/Cherry-PNG-Clipart.png'),
(4, 12, 'Guisantes', 32.54, 274, 'Philippines', '2024-03-12', '2024-08-07', 'https://www.pngall.com/wp-content/uploads/2/Pea-Transparent-Image.png'),
(5, 2, 'Pomelo', 116.96, 115, 'Sweden', '2024-03-12', '2024-04-01', 'https://www.pngall.com/wp-content/uploads/12/Grapefruit-PNG-Images.png'),
(6, 14, 'Pera', 277.03, 546, 'China', '2024-03-12', '2024-10-09', 'https://www.pngall.com/wp-content/uploads/2016/04/Pear-Download-PNG.png'),
(7, 5, 'Piña', 907.61, 161, 'Sri Lanka', '2024-03-12', '2024-05-28', 'https://www.pngall.com/wp-content/uploads/2016/05/Pineapple-Free-Download-PNG.png'),
(8, 10, 'Espinaca', 400.08, 196, 'Peru', '2024-03-12', '2024-06-29', 'https://www.pngall.com/wp-content/uploads/2/Spinach-PNG-Free-Image.png'),
(9, 2, 'Batata', 623.33, 214, 'Norway', '2024-03-12', '2024-07-28', 'https://static.vecteezy.com/system/resources/previews/029/712/252/original/sweet-potato-transparent-background-png.png'),
(10, 7, 'Berenjena', 43.56, 540, 'China', '2024-03-12', '2024-04-09', 'https://www.pngall.com/wp-content/uploads/2016/06/Aubergine-Free-Download-PNG.png'),
(11, 3, 'Naranja', 602.52, 593, 'Bolivia', '2024-03-12', '2024-05-10', 'https://www.pngall.com/wp-content/uploads/2016/05/Orange-PNG-Picture.png'),
(12, 1, 'Tomate', 675.89, 395, 'Ukraine', '2024-03-12', '2024-05-02', 'https://www.pngall.com/wp-content/uploads/2016/04/Tomato-PNG-Clipart.png'),
(13, 8, 'Limón', 629.20, 342, 'France', '2024-03-12', '2024-07-10', 'https://www.pngall.com/wp-content/uploads/2016/05/Lemon-PNG-Image.png'),
(14, 6, 'Pepino', 873.06, 421, 'Ecuador', '2024-03-12', '2024-08-08', 'https://www.pngall.com/wp-content/uploads/2016/04/Cucumber-Transparent.png'),
(15, 2, 'Coliflor', 273.26, 287, 'Indonesia', '2024-03-12', '2024-06-18', 'https://www.pngall.com/wp-content/uploads/7/Cauliflower-PNG-Photo.png'),
(16, 4, 'Fresa', 63.02, 320, 'Sweden', '2024-03-12', '2024-04-04', 'https://www.pngall.com/wp-content/uploads/2016/05/Strawberry-Download-PNG.png'),
(17, 3, 'Cebolla', 153.32, 517, 'Syria', '2024-03-12', '2024-05-13', 'https://www.pngall.com/wp-content/uploads/2016/03/Onion-Free-PNG-Image.png'),
(18, 10, 'Zanahoria', 950.78, 602, 'China', '2024-03-12', '2024-06-30', 'https://www.pngall.com/wp-content/uploads/2016/04/Carrot-PNG-Clipart.png'),
(19, 13, 'Granada', 260.65, 55, 'China', '2024-03-12', '2022-07-27', 'https://www.pngall.com/wp-content/uploads/2016/04/Pomegranate-PNG-Clipart.png'),
(20, 7, 'Papaya', 955.41, 790, 'Russia', '2024-03-12', '2024-04-08', 'https://www.pngall.com/wp-content/uploads/12/Papaya-Fruit-No-Background.png'),
(21, 9, 'Brócoli', 649.32, 136, 'Indonesia', '2024-03-12', '2024-05-14', 'https://www.pngall.com/wp-content/uploads/2016/05/Broccoli-PNG-Picture.png'),
(22, 15, 'Esparragos', 352.43, 121, 'China', '2024-03-12', '2024-03-30', 'https://www.pngall.com/wp-content/uploads/12/Asparagus-Vegetable-PNG-Photos.png'),
(23, 12, 'Platano', 115.86, 855, 'Indonesia', '2024-03-12', '2024-04-06', 'https://static.vecteezy.com/system/resources/previews/011/653/851/original/unripe-green-banana-png.png'),
(24, 7, 'Mango', 36.32, 51, 'South Africa', '2024-03-12', '2024-04-22', 'https://www.pngall.com/wp-content/uploads/2016/04/Mango-Free-Download-PNG.png'),
(25, 4, 'Puerro', 328.25, 738, 'China', '2024-03-12', '2024-07-07', 'https://www.pngall.com/wp-content/uploads/12/Leek-No-Background.png'),
(26, 11, 'Manzana', 928.46, 113, 'Tunisia', '2024-03-12', '2024-05-06', 'https://www.calfruitos.com/es/fotos/pr_46_20191009095325.png'),
(27, 4, 'Uva', 832.49, 943, 'Central African', '2024-03-12', '2024-05-06', 'https://www.calfruitos.com/es/fotos/pr_92_20170912145844.png'),
(28, 6, 'Kiwi', 157.09, 741, 'Peru', '2024-03-12', '2024-02-22', 'https://www.theproducemoms.com/wp-content/uploads/2022/01/kiwi.png'),
(29, 12, 'Sandía', 32.54, 274, 'Philippines', '2024-03-12', '2024-08-07', 'https://www.soldelevante.com/wp-content/uploads/2020/05/sandia-1.png'),
(30, 2, 'Melón', 116.96, 115, 'Sweden', '2024-03-12', '2024-04-01', 'https://www.lesdomainesexport.com/wp-content/uploads/2017/01/melon-charentais-300x292.png'),
(31, 14, 'Mandarina', 277.03, 546, 'China', '2024-03-12', '2024-10-09', 'https://mon.es/wp-content/uploads/2018/11/Mandarina.png'),
(32, 5, 'Higo', 907.61, 161, 'Sri Lanka', '2024-03-12', '2024-05-28', 'https://www.calfruitos.com/es/fotos/pr_30_20170907115332.png'),
(33, 10, 'Albaricoque', 400.08, 196, 'Peru', '2024-03-12', '2024-06-29', 'https://www.calfruitos.com/es/fotos/pr_2_20210602152347.png'),
(34, 2, 'Lechuga', 623.33, 214, 'Norway', '2024-03-12', '2024-07-28', 'https://www.calfruitos.com/es/fotos/pr_160_20170919152613.png'),
(35, 7, 'Pimientos', 43.56, 540, 'China', '2024-03-12', '2024-04-09', 'https://www.pngall.com/wp-content/uploads/2016/04/Pepper-Free-Download-PNG.png'),
(36, 3, 'Col rizada', 602.52, 593, 'Bolivia', '2024-03-12', '2024-05-10', 'https://cdn.pixabay.com/photo/2017/10/18/19/08/eat-2865211_960_720.png'),
(37, 1, 'Apio', 675.89, 395, 'Ukraine', '2024-03-12', '2024-05-02', 'https://www.soldelevante.com/wp-content/uploads/2020/05/apio.png'),
(38, 8, 'Judias Verdes', 629.20, 342, 'France', '2024-03-12', '2024-07-10', 'https://www.que.es/wp-content/uploads/2021/10/green-2505076_1280-1024x834.png'),
(39, 6, 'Calabaza', 873.06, 421, 'Ecuador', '2024-03-12', '2024-08-08', 'https://www.yummyfresh.es/wp-content/uploads/2021/08/Muscat.png'),
(40, 2, 'Rúcula', 273.26, 287, 'Indonesia', '2024-03-12', '2024-06-18', 'https://comedelahuerta.com/wp-content/uploads/2019/09/Rucula-ecologica.png');

-- --------------------------------------------------------

--
-- Table structure for table `providers`
--

CREATE TABLE `providers` (
  `provider_id` int(11) NOT NULL,
  `provider_name` varchar(20) NOT NULL,
  `contact_person` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone_number` int(9) NOT NULL,
  `address` varchar(30) NOT NULL,
  `country` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `providers`
--

INSERT INTO `providers` (`provider_id`, `provider_name`, `contact_person`, `email`, `phone_number`, `address`, `country`) VALUES
(1, 'Mr', 'Philippa Rimour', 'primour0@gnu.org', 895791923, '66254 Schurz Park', 'China'),
(2, 'Ms', 'Adriena Cabedo', 'acabedo1@oakley.com', 110428670, '1440 Kings Avenue', 'Indonesia'),
(3, 'Rev', 'Abeu Pinar', 'apinar2@discuz.net', 725989272, '4214 Milwaukee Center', 'China'),
(4, 'Ms', 'Cari Rougier', 'crougier3@state.gov', 909279497, '76530 Stone Corner Road', 'Mexico'),
(5, 'Mrs', 'Lucie Gilligan', 'lgilligan4@amazon.co.jp', 937117608, '236 Oak Valley Junction', 'Indonesia'),
(6, 'Mr', 'Allix McKerley', 'amckerley5@sfgate.com', 212823546, '990 Eastlawn Parkway', 'Greece'),
(7, 'Honorable', 'Kiley Maunders', 'kmaunders6@networksolutions.com', 857720044, '3 Fair Oaks Junction', 'Albania'),
(8, 'Mr', 'Lisa Ackenhead', 'lackenhead7@gov.uk', 667268772, '999 Bowman Trail', 'South Africa'),
(9, 'Mrs', 'Baron Shaddick', 'bshaddick8@weather.com', 994208045, '4985 Maple Wood Hill', 'Indonesia'),
(10, 'Dr', 'Alexina Sinkinson', 'asinkinson9@cam.ac.uk', 493976636, '871 Ronald Regan Circle', 'Indonesia'),
(11, 'Dr', 'Ame Hubbock', 'ahubbocka@fastcompany.com', 672220841, '59 Di Loreto Junction', 'Guatemala'),
(12, 'Honorable', 'Alix Narey', 'anareyb@biblegateway.com', 791865746, '600 Fremont Place', 'Philippines'),
(13, 'Mr', 'Marigold Nelhams', 'mnelhamsc@icq.com', 485204994, '37 Delladonna Road', 'Philippines'),
(14, 'Rev', 'Aylmer Crosham', 'acroshamd@sogou.com', 925101661, '27 Stone Corner Lane', 'Iran'),
(15, 'Dr', 'Perkin Pearman', 'ppearmane@nature.com', 684246644, '27 Starling Junction', 'Russia');

-- --------------------------------------------------------

--
-- Table structure for table `schedules`
--

CREATE TABLE `schedules` (
  `employee_id` int(11) NOT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `schedules`
--

INSERT INTO `schedules` (`employee_id`, `start_time`, `end_time`) VALUES
(1, '09:00:00', '17:00:00'),
(2, '08:30:00', '16:30:00'),
(3, '10:00:00', '18:00:00'),
(4, '08:00:00', '16:00:00'),
(5, '09:30:00', '17:30:00'),
(6, '08:45:00', '16:45:00'),
(7, '09:15:00', '17:15:00'),
(8, '08:15:00', '16:15:00'),
(9, '09:45:00', '17:45:00'),
(10, '08:20:00', '16:20:00'),
(11, '13:00:00', '21:00:00'),
(12, '13:30:00', '21:30:00'),
(13, '14:00:00', '22:00:00'),
(14, '14:15:00', '22:15:00'),
(15, '14:30:00', '22:30:00'),
(16, '14:45:00', '22:45:00'),
(17, '15:00:00', '23:00:00'),
(18, '15:15:00', '23:15:00'),
(19, '15:30:00', '23:30:00'),
(20, '15:45:00', '23:45:00'),
(21, '09:00:00', '17:00:00'),
(22, '08:30:00', '16:30:00'),
(23, '10:00:00', '18:00:00'),
(24, '08:00:00', '16:00:00'),
(25, '09:30:00', '17:30:00'),
(26, '08:45:00', '16:45:00'),
(27, '09:15:00', '17:15:00'),
(28, '08:15:00', '16:15:00'),
(29, '09:45:00', '17:45:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `computers`
--
ALTER TABLE `computers`
  ADD PRIMARY KEY (`computer_id`),
  ADD UNIQUE KEY `serial_number` (`serial_number`),
  ADD KEY `fk_computers_departments_department_id` (`department_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `phone_number` (`phone_number`);

--
-- Indexes for table `deliveryman`
--
ALTER TABLE `deliveryman`
  ADD PRIMARY KEY (`deliveryman_id`),
  ADD UNIQUE KEY `phone_number` (`phone_number`),
  ADD UNIQUE KEY `DNI` (`DNI`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`department_id`),
  ADD KEY `fk_departments_employees_employee_id` (`manager_id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`employee_id`),
  ADD KEY `fk_employees_departments_department_id` (`department_id`),
  ADD KEY `fk_employees_jobs_job_id` (`job_id`),
  ADD KEY `fk_employees_employees_manager_id` (`manager_id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`job_id`);

--
-- Indexes for table `job_history`
--
ALTER TABLE `job_history`
  ADD PRIMARY KEY (`employee_id`,`start_date`),
  ADD KEY `fk_job_history_departments_department_id` (`department_id`);

--
-- Indexes for table `logins`
--
ALTER TABLE `logins`
  ADD PRIMARY KEY (`employee_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `deliveryman_id` (`deliveryman_id`);

--
-- Indexes for table `orders_products`
--
ALTER TABLE `orders_products`
  ADD PRIMARY KEY (`order_product_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `provider_id` (`provider_id`);

--
-- Indexes for table `providers`
--
ALTER TABLE `providers`
  ADD PRIMARY KEY (`provider_id`);

--
-- Indexes for table `schedules`
--
ALTER TABLE `schedules`
  ADD PRIMARY KEY (`employee_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `computers`
--
ALTER TABLE `computers`
  MODIFY `computer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `department_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `employee_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `orders_products`
--
ALTER TABLE `orders_products`
  MODIFY `order_product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `computers`
--
ALTER TABLE `computers`
  ADD CONSTRAINT `fk_computers_departments_department_id` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`);

--
-- Constraints for table `departments`
--
ALTER TABLE `departments`
  ADD CONSTRAINT `fk_departments_employees_employee_id` FOREIGN KEY (`manager_id`) REFERENCES `employees` (`employee_id`);

--
-- Constraints for table `employees`
--
ALTER TABLE `employees`
  ADD CONSTRAINT `fk_employees_departments_department_id` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`),
  ADD CONSTRAINT `fk_employees_employees_manager_id` FOREIGN KEY (`manager_id`) REFERENCES `employees` (`employee_id`),
  ADD CONSTRAINT `fk_employees_jobs_job_id` FOREIGN KEY (`job_id`) REFERENCES `jobs` (`job_id`);

--
-- Constraints for table `job_history`
--
ALTER TABLE `job_history`
  ADD CONSTRAINT `fk_job_history_departments_department_id` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`),
  ADD CONSTRAINT `fk_job_history_employees_employee_id` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`);

--
-- Constraints for table `logins`
--
ALTER TABLE `logins`
  ADD CONSTRAINT `fk_logins_employees_employee_id` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`deliveryman_id`) REFERENCES `deliveryman` (`deliveryman_id`);

--
-- Constraints for table `orders_products`
--
ALTER TABLE `orders_products`
  ADD CONSTRAINT `orders_products_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  ADD CONSTRAINT `orders_products_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`provider_id`) REFERENCES `providers` (`provider_id`);

--
-- Constraints for table `schedules`
--
ALTER TABLE `schedules`
  ADD CONSTRAINT `fk_schedules_employees_employee_id` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 21, 2026 at 08:57 AM
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
-- Database: `trekking_booking_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `booking_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `trek_id` int(11) NOT NULL,
  `booking_date` date NOT NULL,
  `trek_start_date` date DEFAULT NULL,
  `num_persons` int(11) DEFAULT 1,
  `special_requests` text DEFAULT NULL,
  `status` enum('pending','confirmed','rejected','cancelled') DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`booking_id`, `user_id`, `trek_id`, `booking_date`, `trek_start_date`, `num_persons`, `special_requests`, `status`) VALUES
(1, 2, 1, '2026-04-20', '2026-05-01', 2, 'Vegetarian meals preferred', 'confirmed'),
(2, 3, 2, '2026-05-10', '2026-06-15', 1, NULL, 'pending'),
(3, 2, 3, '2026-05-01', '2026-05-20', 3, 'Need porter for heavy bags', 'confirmed'),
(4, 4, 4, '2026-05-02', '2026-05-25', 1, NULL, 'pending'),
(5, 11, 1, '2026-05-18', '2026-12-22', 1, 'no requirement', 'cancelled'),
(6, 11, 1, '2026-05-18', '2026-12-22', 1, 'no requirement', 'pending'),
(7, 11, 4, '2026-05-18', '2026-09-22', 1, 'no', 'pending'),
(8, 11, 4, '2026-05-18', '2026-09-22', 1, 'no', 'pending'),
(9, 11, 3, '2026-05-19', '2026-12-22', 1, 'Nothing', 'pending'),
(10, 10, 4, '2026-05-19', '2026-12-22', 1, 'Bags', 'pending'),
(11, 10, 4, '2026-05-19', '2026-12-22', 1, 'Want tw0 guides', 'pending'),
(12, 10, 3, '2026-05-19', '2026-05-28', 12, 'No', 'pending'),
(13, 10, 2, '2026-05-19', '2026-05-24', 1, 'Hello', 'pending'),
(14, 10, 1, '2026-05-19', '2026-07-22', 1, 'nooo', 'pending'),
(15, 10, 2, '2026-05-19', '2026-05-30', 1, 'mmmm', 'pending'),
(16, 11, 1, '2026-05-20', '2026-05-28', 1, 'hello', 'cancelled'),
(17, 11, 2, '2026-05-20', '2026-05-30', 1, 'Nothing  ', 'confirmed'),
(18, 10, 3, '2026-05-20', '2026-05-28', 1, 'Nothing', 'confirmed'),
(19, 10, 2, '2026-05-20', '2026-05-28', 1, 'nnnnn', 'pending'),
(20, 11, 2, '2026-05-20', '2026-05-29', 1, 'Any ', 'pending'),
(21, 11, 9, '2026-05-21', '2026-05-30', 1, 'sadasas', 'confirmed');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `payment_id` int(11) NOT NULL,
  `booking_id` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payment_method` enum('credit_card','debit_card','paypal','bank_transfer','cash') DEFAULT NULL,
  `payment_status` enum('pending','paid','refunded','failed') DEFAULT 'pending',
  `payment_date` date DEFAULT NULL,
  `transaction_ref` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`payment_id`, `booking_id`, `amount`, `payment_method`, `payment_status`, `payment_date`, `transaction_ref`) VALUES
(1, 1, 2400.00, 'credit_card', 'paid', '2026-04-20', 'TXN-001'),
(2, 2, 900.00, 'paypal', 'pending', '2026-05-10', 'TXN-002'),
(3, 3, 1950.00, 'bank_transfer', 'paid', '2026-05-01', 'TXN-003'),
(4, 4, 400.00, 'credit_card', 'pending', '2026-05-02', 'TXN-004'),
(5, 6, 1200.00, 'cash', 'pending', '2026-05-18', 'TXN-1779100907135'),
(6, 7, 400.00, 'cash', 'pending', '2026-05-18', 'TXN-1779102280016'),
(7, 9, 650.00, 'cash', 'pending', '2026-05-19', 'TXN-1779168822976'),
(8, 11, 400.00, 'cash', 'pending', '2026-05-19', 'TXN-1779197769633'),
(9, 12, 7800.00, 'bank_transfer', 'pending', '2026-05-19', 'TXN-1779198563468'),
(10, 14, 1200.00, 'cash', 'pending', '2026-05-19', 'TXN-1779200059920'),
(11, 16, 1200.00, 'cash', 'pending', '2026-05-20', 'TXN-1779260005685'),
(12, 17, 900.00, 'cash', 'pending', '2026-05-20', 'TXN-1779262051243'),
(13, 20, 900.00, 'bank_transfer', 'pending', '2026-05-20', 'TXN-1779269448398'),
(14, 21, 890.00, 'cash', 'pending', '2026-05-21', 'TXN-1779337097236');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `review_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `trek_id` int(11) NOT NULL,
  `booking_id` int(11) DEFAULT NULL,
  `rating` tinyint(4) NOT NULL,
  `comment` text DEFAULT NULL,
  `review_date` date DEFAULT curdate()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`review_id`, `user_id`, `trek_id`, `booking_id`, `rating`, `comment`, `review_date`) VALUES
(1, 2, 1, 1, 5, 'Amazing Everest Base Camp experience!', '2026-05-16'),
(2, 2, 3, 3, 4, 'Beautiful Langtang trek with fewer crowds.', '2026-06-04');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `role_id` int(11) NOT NULL,
  `role_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`role_id`, `role_name`) VALUES
(1, 'admin'),
(2, 'customer');

-- --------------------------------------------------------

--
-- Table structure for table `routes`
--

CREATE TABLE `routes` (
  `route_id` int(11) NOT NULL,
  `trek_id` int(11) NOT NULL,
  `waypoint_order` int(11) NOT NULL,
  `waypoint_name` varchar(100) DEFAULT NULL,
  `altitude_m` int(11) DEFAULT NULL,
  `notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `routes`
--

INSERT INTO `routes` (`route_id`, `trek_id`, `waypoint_order`, `waypoint_name`, `altitude_m`, `notes`) VALUES
(1, 1, 1, 'Lukla', 2860, 'Starting point'),
(2, 1, 2, 'Namche Bazaar', 3440, 'Acclimatization stop'),
(3, 1, 3, 'Tengboche', 3867, 'Monastery'),
(4, 1, 4, 'Everest Base Camp', 5364, 'Destination'),
(5, 2, 1, 'Besisahar', 760, 'Starting point'),
(6, 2, 2, 'Manang', 3519, 'Rest day'),
(7, 2, 3, 'Thorong La Pass', 5416, 'Highest point'),
(8, 3, 1, 'Syabrubesi', 1550, 'Trailhead'),
(9, 3, 2, 'Langtang Village', 3430, 'Village stay'),
(10, 3, 3, 'Kyanjin Gompa', 3870, 'Final destination'),
(11, 4, 1, 'Nayapul', 1070, 'Starting point'),
(12, 4, 2, 'Ghorepani', 2860, 'Overnight stay'),
(13, 4, 3, 'Poon Hill', 3210, 'Sunrise viewpoint');

-- --------------------------------------------------------

--
-- Table structure for table `treks`
--

CREATE TABLE `treks` (
  `trek_id` int(11) NOT NULL,
  `trek_name` varchar(100) NOT NULL,
  `difficulty` enum('Easy','Moderate','Hard','Extreme') NOT NULL,
  `duration_days` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `max_group_size` int(11) DEFAULT 20,
  `region` varchar(100) DEFAULT NULL,
  `start_location` varchar(100) DEFAULT NULL,
  `end_location` varchar(100) DEFAULT NULL,
  `distance_km` decimal(6,2) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `treks`
--

INSERT INTO `treks` (`trek_id`, `trek_name`, `difficulty`, `duration_days`, `price`, `max_group_size`, `region`, `start_location`, `end_location`, `distance_km`, `image_url`, `description`, `is_active`) VALUES
(1, 'Everest Base Camp Trek', 'Hard', 14, 1290.00, 15, 'Everest', 'Lukla', 'Everest Base Camp', 130.50, '/image/Everest Base Camp Trek 14 Days Banner.png', 'World famous Everest Base Camp trek with stunning mountain views.', 1),
(2, 'Annapurna Base Camp Trek', 'Moderate', 14, 650.00, 20, 'Annapurna', 'Besisahar', 'Nayapul', 160.00, '/image/Annapurna-Dhaulagiri.png', 'Beautiful trek to the base camp of Annapurna with mountain views.', 1),
(3, 'Langtang Valley Trek', 'Moderate', 10, 560.00, 18, 'Langtang', 'Syabrubesi', 'Kyanjin Gompa', 65.00, '/image/Langtang Valley Trek Banner.png', 'Beautiful Langtang valley trek with glacier views.', 1),
(4, 'Mera Peak Climbing', 'Hard', 14, 1800.00, 10, 'Everest', 'Nayapul', 'Birethanti', 43.00, '/image/mera%20peak.png', 'Highest trekking peak in Nepal at 6,476m.', 1),
(5, 'Island Peak Climbing', 'Hard', 18, 1600.00, 10, 'Everest', 'Lukla', 'Island Peak', 130.00, '/image/island%20peak.png', 'Popular climbing peak at 6,189m with spectacular views.', 1),
(6, 'Three Highest Passes Trek', 'Extreme', 19, 1680.00, 12, 'Everest', 'Salleri', 'Lukla', 180.00, '/image/Three Highest Passes Trek Banner.png', 'Ultimate challenge crossing three high passes in Everest region.', 1),
(7, 'Sleep at Base Camp Trek', 'Hard', 15, 1450.00, 12, 'Everest', 'Lukla', 'Everest Base Camp', 140.00, '/image/Sleep at Base Camp on Everest Trek Banner.png', 'Unique experience camping overnight at Everest Base Camp.', 1),
(8, 'Ghorepani Poon Hill Trek', 'Easy', 8, 280.00, 25, 'Annapurna', 'Nayapul', 'Ghandruk', 43.00, '/image/Ghorepani Poon Hill Trek Banner.png', 'Best beginner trek with sunrise views from Poon Hill.', 1),
(9, 'Annapurna Circuit with Poon Hill', '', 16, 890.00, 20, 'Annapurna', 'Besisahar', 'Nayapul', 160.00, '/image/Annapurna Circuit.png', 'Classic Annapurna Circuit with Poon Hill sunrise view.', 1),
(10, 'Ama Yangri Trek', 'Moderate', 3, 210.00, 15, 'Langtang', 'Tarkeghyang', 'Ama Yangri', 25.00, '/image/ama-yangri-trekking.png', 'Short spiritual trek to the sacred peak of Ama Yangri.', 1),
(11, 'Gosaikunda Lake Trek', 'Moderate', 7, 420.00, 18, 'Langtang', 'Dhunche', 'Gosaikunda', 45.00, '/image/Gosaikunda Lake Trek Banner.png', 'Sacred alpine lake trek with religious significance.', 1),
(12, 'Langtang Ganja La Pass Trek', '', 14, 1150.00, 10, 'Langtang', 'Syabrubesi', 'Melamchi', 110.00, '/image/Langtang Ganja La Pass Trek Banner.png', 'Challenging high pass trek for experienced hikers.', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL DEFAULT 2,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `profile_image` varchar(255) DEFAULT NULL,
  `is_approved` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `role_id`, `name`, `email`, `password_hash`, `phone`, `profile_image`, `is_approved`, `created_at`) VALUES
(1, 1, 'Admin User', 'admin@trekhub.com', 'JAvlGPq9JyTdtvBO6x2llnRI1+gxwIyPqCKAn3THIKk=', '9800000001', NULL, 1, '2026-05-12 06:04:15'),
(2, 2, 'Ram Sharma', 'ram@example.com', 'hashed_ram_password', '9800000002', NULL, 1, '2026-05-12 06:04:15'),
(3, 2, 'Sita Rai', 'sita@example.com', 'hashed_sita_password', '9811111111', NULL, 1, '2026-05-12 06:04:15'),
(4, 2, 'Hari Thapa', 'hari@example.com', 'hashed_hari_password', '9822222222', NULL, 1, '2026-05-12 06:04:15'),
(5, 2, 'Sam Nal', 'sam123@gmail.com', 'w1972a', '9829778765', NULL, 1, '2026-05-12 15:42:51'),
(6, 2, 'Rishabh Ale', 'alerishabh5@gmail.com', 'svCpNiJ0GwXjPVXJ/t/IITZtsipZO/dd6AiZ0UvZWUE=', '9828556724', NULL, 1, '2026-05-14 03:18:23'),
(7, 2, 'Sammy J', 'sam21@gmail.com', '05thhdSGCc13+7SHUTaSzi4lW/pGEi+NWfIATelP2Cs=', '9865775435', NULL, 1, '2026-05-15 05:57:59'),
(9, 2, 'Safal Kunwar', 'safal@gmail', '05thhdSGCc13+7SHUTaSzi4lW/pGEi+NWfIATelP2Cs=', '9867654345', NULL, 1, '2026-05-16 06:02:49'),
(10, 2, 'men raj gurung', 'men@gmail.com', '9cHoF2OmuGMG4OOfM3FVKvBa+DvcxtYXkEnISwWI0KI=', '9876778764', NULL, 1, '2026-05-16 07:52:25'),
(11, 2, 'Nabin Gurung', 'nabin@gmail.com', '05thhdSGCc13+7SHUTaSzi4lW/pGEi+NWfIATelP2Cs=', '9878665456', NULL, 1, '2026-05-17 08:27:09'),
(15, 2, 'Men Raj Gurung', 'raj@gmail.com', '05thhdSGCc13+7SHUTaSzi4lW/pGEi+NWfIATelP2Cs=', '9878776765', NULL, 1, '2026-05-21 06:34:30'),
(16, 2, 'Surendra', 'raj@icp.edu.np', '05thhdSGCc13+7SHUTaSzi4lW/pGEi+NWfIATelP2Cs=', '9829112871', NULL, 1, '2026-05-21 06:38:47');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`booking_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `trek_id` (`trek_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `booking_id` (`booking_id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`review_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `trek_id` (`trek_id`),
  ADD KEY `booking_id` (`booking_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`role_id`),
  ADD UNIQUE KEY `role_name` (`role_name`);

--
-- Indexes for table `routes`
--
ALTER TABLE `routes`
  ADD PRIMARY KEY (`route_id`),
  ADD UNIQUE KEY `trek_id` (`trek_id`,`waypoint_order`);

--
-- Indexes for table `treks`
--
ALTER TABLE `treks`
  ADD PRIMARY KEY (`trek_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `role_id` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `booking_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `routes`
--
ALTER TABLE `routes`
  MODIFY `route_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `treks`
--
ALTER TABLE `treks`
  MODIFY `trek_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bookings_ibfk_2` FOREIGN KEY (`trek_id`) REFERENCES `treks` (`trek_id`);

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`booking_id`) ON DELETE CASCADE;

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`trek_id`) REFERENCES `treks` (`trek_id`),
  ADD CONSTRAINT `reviews_ibfk_3` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`booking_id`);

--
-- Constraints for table `routes`
--
ALTER TABLE `routes`
  ADD CONSTRAINT `routes_ibfk_1` FOREIGN KEY (`trek_id`) REFERENCES `treks` (`trek_id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

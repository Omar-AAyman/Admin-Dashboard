-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 28, 2023 at 06:36 AM
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
-- Database: `nti_ecommerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `street` varchar(32) NOT NULL,
  `bulding` varchar(32) NOT NULL,
  `floor` varchar(32) NOT NULL,
  `flat` varchar(32) NOT NULL,
  `type` varchar(32) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `region_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `address_notes`
--

CREATE TABLE `address_notes` (
  `notes` longtext NOT NULL,
  `address_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `phone`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(3, 'Omar Ayman', '01149685494', 'omaraymn411@gmail.com', '2022-04-27 04:39:06', '$2y$10$lQpdjXp79ANX0CTIV2/EPuzCpCXeG/7qWhQeoVdE4KF7thasOiTca', NULL, '2022-04-27 04:31:19', '2022-04-27 04:39:06'),
(4, 'Ghada Mohamed', '01121844502', 'ghadamohamed24979@gmail.com', '2022-04-27 12:09:20', '$2y$10$oRDqQn1755z4lJ5DAFesGOeLZKVkfCGzlcj3S1VnNBqkLx7IF2R4y', 'jERJ0k5UKX9wOnqBRaODRgpGr0Mmxo2wRKFAXiMCkT6sZZS8BEDiDrTzjyzr', '2022-04-27 12:04:44', '2022-04-27 12:09:20');

-- --------------------------------------------------------

--
-- Table structure for table `bills`
--

CREATE TABLE `bills` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `payment_amount` decimal(8,0) NOT NULL,
  `payment_data` longtext NOT NULL,
  `payment_method_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name_ar` varchar(32) NOT NULL,
  `name_en` varchar(32) NOT NULL,
  `image` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name_ar`, `name_en`, `image`, `created_at`, `updated_at`) VALUES
(1, 'أبل ', 'Apple', '', '2022-04-25 05:50:56', '2022-04-25 10:20:56'),
(2, 'سامسونج', 'Samsung', '', '2022-04-25 05:50:56', '2022-04-25 05:50:56');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` tinyint(3) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name_ar` varchar(32) NOT NULL,
  `name_en` varchar(32) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0=> Not Available, 1=> Available',
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name_ar`, `name_en`, `status`, `image`, `created_at`, `updated_at`) VALUES
(1, 'الكترونيات', 'Electronics', 1, NULL, '2022-04-25 05:48:22', '2022-04-25 05:48:22');

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name_ar` varchar(255) NOT NULL,
  `name_en` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` bigint(20) UNSIGNED NOT NULL,
  `discount` decimal(8,0) UNSIGNED NOT NULL,
  `discount_type` varchar(32) NOT NULL,
  `mini_order_value` decimal(8,2) NOT NULL,
  `max_discount_value` decimal(8,2) NOT NULL,
  `max_number_of_usage` varchar(64) NOT NULL,
  `max_number_of_usage_per_user` varchar(64) NOT NULL,
  `start_date_time` datetime NOT NULL,
  `end_date_time` datetime NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(2, '2022_04_27_043624_create_admins_table', 2),
(3, '2019_08_19_000000_create_failed_jobs_table', 3),
(4, '2014_10_12_100000_create_password_resets_table', 4);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_number` bigint(20) UNSIGNED NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0 => Not Available, 1=> Available',
  `total` decimal(8,0) UNSIGNED NOT NULL,
  `coupon_id` bigint(20) UNSIGNED NOT NULL,
  `address_id` bigint(20) UNSIGNED NOT NULL,
  `bill_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `shipped_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_product`
--

CREATE TABLE `order_product` (
  `price` decimal(8,0) UNSIGNED NOT NULL,
  `quantity` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `admin_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('omaraymn411@gmail.com', '$2y$10$ZayItH5en4LUihs4eFKlAulz5zAPIstp/HHgQspXNMZu85DEbJgum', '2022-04-27 03:18:59');

-- --------------------------------------------------------

--
-- Table structure for table `payment_methods`
--

CREATE TABLE `payment_methods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cash` decimal(8,0) DEFAULT NULL,
  `visa` decimal(8,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name_en` varchar(255) NOT NULL,
  `name_ar` varchar(255) NOT NULL,
  `desc_en` longtext NOT NULL,
  `desc_ar` longtext NOT NULL,
  `price` decimal(8,0) UNSIGNED NOT NULL,
  `quantity` tinyint(3) UNSIGNED DEFAULT 1,
  `code` bigint(20) NOT NULL,
  `status` tinyint(1) NOT NULL COMMENT '1=> Active , 0=> Not Active',
  `image` varchar(255) NOT NULL,
  `sub_category_id` bigint(20) UNSIGNED NOT NULL,
  `brand_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name_en`, `name_ar`, `desc_en`, `desc_ar`, `price`, `quantity`, `code`, `status`, `image`, `sub_category_id`, `brand_id`, `created_at`, `updated_at`) VALUES
(5, 'Miss Gerda Maggio Jr.', 'Prof. Aaron Dach V', 'Davin Dietrich III', 'Josefina Jast', 764, 91, 27131, 0, 'TPNhWeyzQ7vedNKg2cud6eTvLopldX0FcPuRbVlk.jpg', 1, 1, '2023-12-26 23:37:11', '2023-12-28 04:23:09'),
(6, 'Angelo Rath', 'Dr. Geovany Fay', 'Harrison Little', 'Minnie Cummings', 500, 13, 70446, 0, 'AZtgl8AiBGvytHc2OoOeMYlCWmizbdxSiXMHGLR2.jpg', 1, 2, '2023-12-26 23:37:11', '2023-12-27 22:06:14'),
(7, 'Mr. Stewart Hayes V', 'Jedediah Grimes', 'Cristian Willms', 'Aditya Kuhn Jr.', 415, 16, 151659076, 1, 'sru1OElVZkklE1wyeTfNuJ8W3mLbG4BfkDDpiXIlonpYW4lv8n', 79, 2, '2023-12-26 23:37:11', '2023-12-26 23:37:11'),
(8, 'Christian Terry', 'Coy Kessler', 'Dr. Pedro Hane III', 'Dr. Favian Schneider', 127, 20, 220743190, 0, 'WcYhQ4aIfjyvCKANet1HtO89StEKuqzBHF5Tz66nGeOweI6JGP', 29, 1, '2023-12-26 23:37:11', '2023-12-26 23:37:11'),
(9, 'Morris Glover', 'Prof. Aniyah McDermott', 'Mrs. Clara Torphy', 'Amani Schaefer', 196, 73, 851036687, 0, 'sNy6JdFoGVjmOQFbW5dZmE5wzhGD8k11ZPfLilaDEWGUnhhNU1', 89, 1, '2023-12-26 23:37:11', '2023-12-26 23:37:11'),
(10, 'Prof. Kim Goldner', 'Prof. Koby Wolff Sr.', 'Prof. Chaim Kub', 'Prof. Caterina Greenfelder DDS', 815, 45, 138044569, 1, 'Q25okuUqFZRCuCC74di2eFrtp4XkdaX5ymCXEXoPpTmmWNt08g', 70, 2, '2023-12-26 23:37:11', '2023-12-26 23:37:11'),
(11, 'Parker Abbott', 'Dr. Daryl Eichmann MD', 'Constantin Harris', 'Pamela Lind', 898, 73, 231873038, 1, 'xRpWiqqUc2faU0kfmW0bkTHpJ2tHt42irQ3LXg13UIYWQz9cmE', 57, 1, '2023-12-26 23:37:11', '2023-12-26 23:37:11'),
(12, 'Ms. Willow Schoen II', 'Nadia Heller', 'Katrina Bahringer', 'Darrin Schamberger', 427, 89, 506683073, 1, 'PYQ8IJtjzoHi0KYZ2RcbG1qC2L7MEjmLz5OjDWjq5trPq4pQmn', 35, 2, '2023-12-26 23:39:45', '2023-12-26 23:39:45'),
(13, 'Dylan Carroll', 'Raegan Grimes', 'Prof. Camryn Gusikowski DVM', 'Paige Feeney', 634, 96, 779228237, 1, '2dTNs8wwf9ayFhpevBBuDW0pIwOJn3WP2u9Q9eHtnHFcnTJ28I', 16, 1, '2023-12-26 23:39:45', '2023-12-26 23:39:45'),
(14, 'Johnnie Beahan', 'Prof. Tatum Friesen Sr.', 'Nestor Crooks', 'Luz Muller Sr.', 325, 77, 948899012, 1, 'jzWLaXRSj5HCvkl1N6NuBPNzpiHjWOFm9Rl2WR4jj6719ypMOu', 35, 2, '2023-12-26 23:39:45', '2023-12-26 23:39:45'),
(15, 'Prof. Buddy McDermott', 'Jaylin Tromp', 'Alayna Okuneva', 'Quincy Rowe', 225, 18, 668415352, 1, 'n7mRKLrGgrFmgEFEGhmUK6w7ofOfYGBYXLZlHsk9VtoMiit6ha', 54, 2, '2023-12-26 23:39:45', '2023-12-26 23:39:45'),
(16, 'Dr. Ignacio Hegmann', 'Fay Osinski', 'Toni Johnson Sr.', 'Keira Rath', 680, 64, 865039933, 1, 'Oq2ryx3MIUgOZG32JH1Iu0w5x0LpSvyccLR0haHJW1h7fSo2XG', 80, 1, '2023-12-26 23:39:45', '2023-12-26 23:39:45'),
(17, 'Anya Howe Sr.', 'Prof. Marlene Kozey Sr.', 'Charles Hodkiewicz', 'Dr. Werner Aufderhar', 543, 81, 523597514, 1, 'z0SL1babJ8rxJAt79fvsm3j3obOOmyq10cdaq01qz92ii51pyp', 40, 2, '2023-12-26 23:39:45', '2023-12-26 23:39:45'),
(18, 'Cleveland Dare', 'Judson O\'Connell', 'Gregory Kassulke DDS', 'Prof. Brandt Turcotte MD', 452, 19, 883402561, 1, 'T6wNGRqhfc5sxkcq5TONnEqVuWtN7OcEFb29EU1ORvWUqPaHX1', 67, 2, '2023-12-26 23:39:45', '2023-12-26 23:39:45'),
(19, 'Maci Carter', 'Estrella Beier', 'Ms. Zaria Zulauf PhD', 'Prof. Sydney Littel', 209, 21, 585446595, 1, 'Nr66B8Sl95qh3mtm7ZBmQqpNgiJAOnuioFq04xzuwl0IcmmDUm', 77, 1, '2023-12-26 23:39:45', '2023-12-26 23:39:45'),
(20, 'Prof. Merlin Ebert', 'Mrs. Josie Gusikowski Sr.', 'Miss Amelie Wyman MD', 'Mrs. Marianna Langosh Jr.', 336, 55, 873570443, 0, 'ZU6ZJFGgWvJqjGy06tFLjVMSA4Jlo3BtKCK7QUSgIJikezS2hd', 61, 1, '2023-12-26 23:39:45', '2023-12-26 23:39:45'),
(24, 'Ahmed', '234asfd', 'asfasf', 'asfasfa', 324, 12, 54354, 1, 'GY2eTWYcvCaZdjQefGRX6X3WWf5eLjVKE3tBqtqO.jpg', 2, 2, '2023-12-27 16:49:36', '2023-12-27 16:49:36'),
(25, 'Ahmed', '123', '123', '123124sda', 131, 12, 1234, 1, 'Yz4URIpNr1WuXgXcbGWrrBG6vp8HOCIsQA4ow4gg.jpg', 2, 2, '2023-12-27 16:52:32', '2023-12-27 16:52:32'),
(26, 'Cooler', 'مبرد', 'cvbcxvb', 'cvbcvbc', 1234, 12, 123445, 1, 'KQ2rLpcspgEOeorGtdrkM56kLMeengVJ0pjxB7Y9.jpg', 2, 1, '2023-12-27 17:05:13', '2023-12-27 17:05:13'),
(27, 'Ahmed', '234asfd', 'asdasd', 'asdasd', 125, 12, 53242, 1, 'oFbUfcBnNEq2xQsBG3QCAK8KuEIcTEdv94zUAsqf.jpg', 2, 2, '2023-12-27 17:10:11', '2023-12-27 17:10:11'),
(28, 'Ahmed', '234asfd', 'asd', 'asdas', 131, 12, 13256, 1, 'dSaWKcFf4CrBGBNLoAPyr8ye0p7jUweR3cnNreXN.jpg', 1, 1, '2023-12-27 17:11:26', '2023-12-27 17:11:26'),
(29, 'Cooler', '234asfd', 'asd', 'asdasd', 125, 12, 1456, 1, 'vs0KO3qCTZqnF4CmRDd3mzunjVg5h4FLLVICGisE.jpg', 1, 1, '2023-12-27 17:17:32', '2023-12-27 17:17:32'),
(30, 'Cooler', '123', '45', '45', 125, 45, 45234, 1, '4jDHl1mL4cWKglkfv9Ln3flfWnEIyBoXGRZJh4Li.jpg', 2, 1, '2023-12-27 17:19:19', '2023-12-27 17:19:19'),
(31, 'Cooler', 'مبرد', '5654', '12221', 125, 12, 12356, 1, 'wmjFHdknzYXsaTFwgWoagWEbyViIjed70El69VBu.jpg', 2, 2, '2023-12-27 17:57:41', '2023-12-27 22:30:03'),
(32, 'Ahmed', 'asdas', 'adf', 'asdas', 134, 12, 12345, 1, '9L2MGGs1EVN0eY6P0eZ9Ydhkc7YoQFK7khAiewm9.jpg', 2, 2, '2023-12-28 03:55:56', '2023-12-28 03:55:56'),
(33, 'Cooler', '234asfd', 'sdfsdf', 'sdfsdf', 234, NULL, 234, 0, '6X0WseKBWA5BDR4wI2hW2MYs39fuVBPp5T5IB4m1.jpg', 2, NULL, '2023-12-28 04:33:40', '2023-12-28 04:33:40'),
(34, 'New Product', 'منتج جديد', 'asdafadfasd', 'شيسشسيشسيشسي', 3210, 12, 254132, 1, 'dzx4mHTXUVa51NUz8F1veBJlOYgvrFfG7DL4AhmD.jpg', 1, 1, '2023-12-28 04:36:46', '2023-12-28 04:36:46');

-- --------------------------------------------------------

--
-- Table structure for table `product_spec`
--

CREATE TABLE `product_spec` (
  `value` longtext NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `spec_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `regions`
--

CREATE TABLE `regions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name_ar` varchar(32) NOT NULL,
  `name_en` varchar(32) NOT NULL,
  `status` tinyint(1) NOT NULL COMMENT '	1=> Available , 0=> Not Available',
  `city_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reveiws`
--

CREATE TABLE `reveiws` (
  `value` tinyint(1) UNSIGNED NOT NULL,
  `comment` longtext NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `Created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `specs`
--

CREATE TABLE `specs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name_ar` varchar(64) NOT NULL,
  `name_en` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sub_categories`
--

CREATE TABLE `sub_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name_ar` varchar(32) NOT NULL,
  `name_en` varchar(32) NOT NULL,
  `status` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sub_categories`
--

INSERT INTO `sub_categories` (`id`, `name_ar`, `name_en`, `status`, `image`, `category_id`, `created_at`, `updated_at`) VALUES
(1, 'موبايلات', 'Phones', 1, NULL, 1, '2022-04-25 05:48:56', '2022-04-25 10:19:49'),
(2, 'كمبيوترات', 'Desktops', 1, NULL, 1, '2022-04-25 05:48:56', '2022-04-25 10:20:26');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(32) NOT NULL,
  `last_name` varchar(32) NOT NULL,
  `email` varchar(64) NOT NULL,
  `phone` varchar(11) NOT NULL,
  `password` varchar(255) NOT NULL,
  `gender` enum('f','m') NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=> Active User ,0=> Blocked User',
  `verification_code` mediumint(5) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `password`, `gender`, `status`, `verification_code`, `email_verified_at`, `created_at`, `updated_at`) VALUES
(34, 'Ahmed', 'Salim', 'ahmed.salim.2097@gmail.com', '01128835786', '$2y$10$zFVwmYrguf.eYZC1kwChEelOwkApcopWDyLTWWgiDGWyZuzsdbv.S', 'm', 1, 30077, NULL, '2022-07-13 04:29:58', '2022-07-13 04:29:58');

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `region_id` (`region_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `address_notes`
--
ALTER TABLE `address_notes`
  ADD UNIQUE KEY `notes` (`notes`) USING HASH,
  ADD KEY `address_id` (`address_id`);

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`),
  ADD UNIQUE KEY `phone` (`phone`);

--
-- Indexes for table `bills`
--
ALTER TABLE `bills`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payment_method_id` (`payment_method_id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `order_num` (`order_number`),
  ADD UNIQUE KEY `order_number` (`order_number`),
  ADD KEY `address_id` (`address_id`),
  ADD KEY `bill_id` (`bill_id`);

--
-- Indexes for table `order_product`
--
ALTER TABLE `order_product`
  ADD PRIMARY KEY (`order_id`,`product_id`,`admin_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `admin_id` (`admin_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payment_methods`
--
ALTER TABLE `payment_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`),
  ADD KEY `brand_id` (`brand_id`);

--
-- Indexes for table `product_spec`
--
ALTER TABLE `product_spec`
  ADD PRIMARY KEY (`product_id`,`spec_id`),
  ADD UNIQUE KEY `value` (`value`) USING HASH,
  ADD KEY `spec_id` (`spec_id`);

--
-- Indexes for table `regions`
--
ALTER TABLE `regions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `city_id` (`city_id`);

--
-- Indexes for table `reveiws`
--
ALTER TABLE `reveiws`
  ADD PRIMARY KEY (`product_id`,`user_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `specs`
--
ALTER TABLE `specs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `phone` (`phone`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`product_id`,`user_id`),
  ADD KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `bills`
--
ALTER TABLE `bills`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_methods`
--
ALTER TABLE `payment_methods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `regions`
--
ALTER TABLE `regions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sub_categories`
--
ALTER TABLE `sub_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `addresses`
--
ALTER TABLE `addresses`
  ADD CONSTRAINT `addresses_ibfk_1` FOREIGN KEY (`region_id`) REFERENCES `regions` (`id`),
  ADD CONSTRAINT `addresses_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `address_notes`
--
ALTER TABLE `address_notes`
  ADD CONSTRAINT `address_notes_ibfk_1` FOREIGN KEY (`address_id`) REFERENCES `addresses` (`id`);

--
-- Constraints for table `bills`
--
ALTER TABLE `bills`
  ADD CONSTRAINT `bills_ibfk_1` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_methods` (`id`);

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`address_id`) REFERENCES `addresses` (`id`),
  ADD CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`bill_id`) REFERENCES `bills` (`id`);

--
-- Constraints for table `order_product`
--
ALTER TABLE `order_product`
  ADD CONSTRAINT `order_product_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `order_product_ibfk_3` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_2` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`);

--
-- Constraints for table `product_spec`
--
ALTER TABLE `product_spec`
  ADD CONSTRAINT `product_spec_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `product_spec_ibfk_3` FOREIGN KEY (`spec_id`) REFERENCES `specs` (`id`);

--
-- Constraints for table `regions`
--
ALTER TABLE `regions`
  ADD CONSTRAINT `regions_ibfk_2` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`);

--
-- Constraints for table `reveiws`
--
ALTER TABLE `reveiws`
  ADD CONSTRAINT `reveiws_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `reveiws_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD CONSTRAINT `sub_categories_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);

--
-- Constraints for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD CONSTRAINT `wishlist_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `wishlist_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

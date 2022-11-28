-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 17, 2022 lúc 08:29 AM
-- Phiên bản máy phục vụ: 10.4.25-MariaDB
-- Phiên bản PHP: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `geniuscommerce`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admins`
--

CREATE TABLE `admins` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_id` int(191) NOT NULL DEFAULT 0,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `shop_name` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `phone`, `role_id`, `photo`, `password`, `status`, `remember_token`, `created_at`, `updated_at`, `shop_name`) VALUES
(1, 'Admin', 'admin@gmail.com', '01629552892', 0, '1556780563user.png', '$2y$10$p35S2FczpEfpbe41CX4j4.XE548tHBtF5weGLPxZ56MX5dsOFtaCC', 1, 'xHSYezZZ25OIcIlRAUyzf4eu99G0SQoMgx7Yn0vXVkPn3WR7I32g6JtKXz4J', '2018-02-28 23:27:08', '2019-07-26 21:21:32', 'Genius Store'),
(9, 'Hữu Điểm', 'huudiem2510@gmail.com', '0971894618', 19, '1668592530z3764071195767_fa17e2cc019a33852544f95715dbe393.jpg', '$2y$10$Bl0ewGsHalw81I2tFcB3QOQinxpliIEWoMfFYLByWQLMzqFmXXOfy', 1, NULL, '2022-11-16 02:55:30', '2022-11-16 02:55:30', NULL),
(10, 'user', 'satthucrisi1@gmail.com', '0971894618', 16, '1668608606z3764071195767_fa17e2cc019a33852544f95715dbe393.jpg', '$2y$10$w1u/X8KJ8YksnYQFkE6NTe41zYnhqtbEAd8lV1hE5w6mCVszkcBIK', 1, NULL, '2022-11-16 07:23:26', '2022-11-16 07:23:26', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin_languages`
--

CREATE TABLE `admin_languages` (
  `id` int(191) NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `language` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `file` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `rtl` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `admin_languages`
--

INSERT INTO `admin_languages` (`id`, `is_default`, `language`, `file`, `name`, `rtl`) VALUES
(1, 1, 'English', '1567232745AoOcvCtY.json', '1567232745AoOcvCtY', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin_user_conversations`
--

CREATE TABLE `admin_user_conversations` (
  `id` int(191) NOT NULL,
  `subject` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(191) NOT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `type` enum('Ticket','Dispute') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_number` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin_user_messages`
--

CREATE TABLE `admin_user_messages` (
  `id` int(191) NOT NULL,
  `conversation_id` int(191) NOT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `attributes`
--

CREATE TABLE `attributes` (
  `id` int(11) NOT NULL,
  `attributable_id` int(11) DEFAULT NULL,
  `attributable_type` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `input_name` varchar(255) DEFAULT NULL,
  `price_status` int(3) NOT NULL DEFAULT 1 COMMENT '0 - hide, 1- show	',
  `details_status` int(3) NOT NULL DEFAULT 1 COMMENT '0 - hide, 1- show	',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `attributes`
--

INSERT INTO `attributes` (`id`, `attributable_id`, `attributable_type`, `name`, `input_name`, `price_status`, `details_status`, `created_at`, `updated_at`) VALUES
(14, 5, 'App\\Models\\Category', 'Warranty Type', 'warranty_type', 1, 1, '2019-09-23 22:56:07', '2019-09-23 22:56:07'),
(22, 2, 'App\\Models\\Subcategory', 'Color Family', 'color_family', 1, 1, '2019-09-24 00:45:45', '2019-09-24 00:45:45'),
(30, 3, 'App\\Models\\Subcategory', 'Interior Color', 'interior_color', 1, 1, '2019-09-24 04:31:44', '2019-09-24 04:31:44');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `attribute_options`
--

CREATE TABLE `attribute_options` (
  `id` int(11) NOT NULL,
  `attribute_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `attribute_options`
--

INSERT INTO `attribute_options` (`id`, `attribute_id`, `name`, `created_at`, `updated_at`) VALUES
(107, 14, 'No Warranty', '2019-09-23 22:56:07', '2019-09-23 22:56:07'),
(108, 14, 'Local seller Warranty', '2019-09-23 22:56:07', '2019-09-23 22:56:07'),
(109, 14, 'Non local warranty', '2019-09-23 22:56:07', '2019-09-23 22:56:07'),
(110, 14, 'International Manufacturer Warranty', '2019-09-23 22:56:07', '2019-09-23 22:56:07'),
(111, 14, 'International Seller Warranty', '2019-09-23 22:56:07', '2019-09-23 22:56:07'),
(157, 22, 'Black', '2019-09-24 00:46:26', '2019-09-24 00:46:26'),
(158, 22, 'White', '2019-09-24 00:46:26', '2019-09-24 00:46:26'),
(159, 22, 'Sliver', '2019-09-24 00:46:26', '2019-09-24 00:46:26'),
(160, 22, 'Red', '2019-09-24 00:46:26', '2019-09-24 00:46:26'),
(161, 22, 'Dark Grey', '2019-09-24 00:46:26', '2019-09-24 00:46:26'),
(162, 22, 'Dark Blue', '2019-09-24 00:46:26', '2019-09-24 00:46:26'),
(163, 22, 'Brown', '2019-09-24 00:46:26', '2019-09-24 00:46:26'),
(187, 30, 'Yellow', '2019-09-24 04:31:44', '2019-09-24 04:31:44'),
(188, 30, 'White', '2019-09-24 04:31:44', '2019-09-24 04:31:44');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `banners`
--

CREATE TABLE `banners` (
  `id` int(191) NOT NULL,
  `photo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` enum('Large','TopSmall','BottomSmall') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `banners`
--

INSERT INTO `banners` (`id`, `photo`, `link`, `type`) VALUES
(1, '1568889151top2.jpg', 'https://www.google.com/', 'TopSmall'),
(2, '1568889146top1.jpg', NULL, 'TopSmall'),
(3, '1568889164bottom1.jpg', 'https://www.google.com/', 'Large'),
(4, '1564398600side-triple3.jpg', 'https://www.google.com/', 'BottomSmall'),
(5, '1564398579side-triple2.jpg', 'https://www.google.com/', 'BottomSmall'),
(6, '1564398571side-triple1.jpg', 'https://www.google.com/', 'BottomSmall');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `blogs`
--

CREATE TABLE `blogs` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_id` int(191) NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `source` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `views` int(11) NOT NULL DEFAULT 0,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `meta_tag` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tags` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `blogs`
--

INSERT INTO `blogs` (`id`, `category_id`, `title`, `details`, `photo`, `source`, `views`, `status`, `meta_tag`, `meta_description`, `tags`, `created_at`) VALUES
(9, 2, 'How to design effective arts?', '<div align=\"justify\">The recording starts with the patter of a summer squall. Later, a \r\ndrifting tone like that of a not-quite-tuned-in radio station \r\n                                        rises and for a while drowns out\r\n the patter. These are the sounds encountered by NASA’s Cassini \r\nspacecraft as it dove \r\n                                        the gap between Saturn and its \r\ninnermost ring on April 26, the first of 22 such encounters before it \r\nwill plunge into \r\n                                        atmosphere in September. What \r\nCassini did not detect were many of the collisions of dust particles \r\nhitting the spacecraft\r\n                                        it passed through the plane of \r\nthe ringsen the charged particles oscillate in unison.<br><br></div><h3 align=\"justify\">How its Works ?</h3>\r\n                                    <p align=\"justify\">\r\n                                        MIAMI — For decades, South \r\nFlorida schoolchildren and adults fascinated by far-off galaxies, \r\nearthly ecosystems, the proper\r\n                                        ties of light and sound and \r\nother wonders of science had only a quaint, antiquated museum here in \r\nwhich to explore their \r\n                                        interests. Now, with the \r\nlong-delayed opening of a vast new science museum downtown set for \r\nMonday, visitors will be able \r\n                                        to stand underneath a suspended,\r\n 500,000-gallon aquarium tank and gaze at hammerhead and tiger sharks, \r\nmahi mahi, devil\r\n                                        rays and other creatures through\r\n a 60,000-pound oculus. <br></p><p align=\"justify\">Lens that will give the impression of seeing the fish from the bottom of\r\n a huge cocktail glass. And that’s just one of many\r\n                                        attractions and exhibits. \r\nOfficials at the $305 million Phillip and Patricia Frost Museum of \r\nScience promise that it will be a \r\n                                        vivid expression of modern \r\nscientific inquiry and exposition. Its opening follows a series of \r\nsetbacks and lawsuits and a \r\n                                        scramble to finish the \r\n250,000-square-foot structure. At one point, the project ran \r\nprecariously short of money. The museum\r\n                                        high-profile opening is \r\nespecially significant in a state s <br></p><p align=\"justify\"><br></p><h3 align=\"justify\">Top 5 reason to choose us</h3>\r\n                                    <p align=\"justify\">\r\n                                        Mauna Loa, the biggest volcano \r\non Earth — and one of the most active — covers half the Island of \r\nHawaii. Just 35 miles to the \r\n                                        northeast, Mauna Kea, known to \r\nnative Hawaiians as Mauna a Wakea, rises nearly 14,000 feet above sea \r\nlevel. To them it repre\r\n                                        sents a spiritual connection \r\nbetween our planet and the heavens above. These volcanoes, which have \r\nbeguiled millions of \r\n                                        tourists visiting the Hawaiian \r\nislands, have also plagued scientists with a long-running mystery: If \r\nthey are so close together, \r\n                                        how did they develop in two \r\nparallel tracks along the Hawaiian-Emperor chain formed over the same \r\nhot spot in the Pacific \r\n                                        Ocean — and why are their \r\nchemical compositions so different? \"We knew this was related to \r\nsomething much deeper,\r\n                                        but we couldn’t see what,” said \r\nTim Jones.\r\n                                    </p>', '15542700986-min.jpg', 'www.geniusocean.com', 36, 1, 'b1,b2,b3', 'Mauna Loa, the biggest volcano on Earth — and one of the most active — covers half the Island of Hawaii. Just 35 miles to the northeast, Mauna Kea, known to native Hawaiians as Mauna a Wakea, rises nearly 14,000 feet above sea level.', 'Business,Research,Mechanical,Process,Innovation,Engineering', '2018-02-06 09:53:41'),
(10, 3, 'How to design effective arts?', '<div align=\"justify\">The recording starts with the patter of a summer squall. Later, a \r\ndrifting tone like that of a not-quite-tuned-in radio station \r\n                                        rises and for a while drowns out\r\n the patter. These are the sounds encountered by NASA’s Cassini \r\nspacecraft as it dove \r\n                                        the gap between Saturn and its \r\ninnermost ring on April 26, the first of 22 such encounters before it \r\nwill plunge into \r\n                                        atmosphere in September. What \r\nCassini did not detect were many of the collisions of dust particles \r\nhitting the spacecraft\r\n                                        it passed through the plane of \r\nthe ringsen the charged particles oscillate in unison.<br><br></div><h3 align=\"justify\">How its Works ?</h3>\r\n                                    <p align=\"justify\">\r\n                                        MIAMI — For decades, South \r\nFlorida schoolchildren and adults fascinated by far-off galaxies, \r\nearthly ecosystems, the proper\r\n                                        ties of light and sound and \r\nother wonders of science had only a quaint, antiquated museum here in \r\nwhich to explore their \r\n                                        interests. Now, with the \r\nlong-delayed opening of a vast new science museum downtown set for \r\nMonday, visitors will be able \r\n                                        to stand underneath a suspended,\r\n 500,000-gallon aquarium tank and gaze at hammerhead and tiger sharks, \r\nmahi mahi, devil\r\n                                        rays and other creatures through\r\n a 60,000-pound oculus. <br></p><p align=\"justify\">Lens that will give the impression of seeing the fish from the bottom of\r\n a huge cocktail glass. And that’s just one of many\r\n                                        attractions and exhibits. \r\nOfficials at the $305 million Phillip and Patricia Frost Museum of \r\nScience promise that it will be a \r\n                                        vivid expression of modern \r\nscientific inquiry and exposition. Its opening follows a series of \r\nsetbacks and lawsuits and a \r\n                                        scramble to finish the \r\n250,000-square-foot structure. At one point, the project ran \r\nprecariously short of money. The museum\r\n                                        high-profile opening is \r\nespecially significant in a state s <br></p><p align=\"justify\"><br></p><h3 align=\"justify\">Top 5 reason to choose us</h3>\r\n                                    <p align=\"justify\">\r\n                                        Mauna Loa, the biggest volcano \r\non Earth — and one of the most active — covers half the Island of \r\nHawaii. Just 35 miles to the \r\n                                        northeast, Mauna Kea, known to \r\nnative Hawaiians as Mauna a Wakea, rises nearly 14,000 feet above sea \r\nlevel. To them it repre\r\n                                        sents a spiritual connection \r\nbetween our planet and the heavens above. These volcanoes, which have \r\nbeguiled millions of \r\n                                        tourists visiting the Hawaiian \r\nislands, have also plagued scientists with a long-running mystery: If \r\nthey are so close together, \r\n                                        how did they develop in two \r\nparallel tracks along the Hawaiian-Emperor chain formed over the same \r\nhot spot in the Pacific \r\n                                        Ocean — and why are their \r\nchemical compositions so different? \"We knew this was related to \r\nsomething much deeper,\r\n                                        but we couldn’t see what,” said \r\nTim Jones.\r\n                                    </p>', '15542700902-min.jpg', 'www.geniusocean.com', 14, 1, NULL, NULL, 'Business,Research,Mechanical,Process,Innovation,Engineering', '2018-03-06 09:54:21'),
(12, 2, 'How to design effective arts?', '<div align=\"justify\">The recording starts with the patter of a summer squall. Later, a \r\ndrifting tone like that of a not-quite-tuned-in radio station \r\n                                        rises and for a while drowns out\r\n the patter. These are the sounds encountered by NASA’s Cassini \r\nspacecraft as it dove \r\n                                        the gap between Saturn and its \r\ninnermost ring on April 26, the first of 22 such encounters before it \r\nwill plunge into \r\n                                        atmosphere in September. What \r\nCassini did not detect were many of the collisions of dust particles \r\nhitting the spacecraft\r\n                                        it passed through the plane of \r\nthe ringsen the charged particles oscillate in unison.<br><br></div><h3 align=\"justify\">How its Works ?</h3>\r\n                                    <p align=\"justify\">\r\n                                        MIAMI — For decades, South \r\nFlorida schoolchildren and adults fascinated by far-off galaxies, \r\nearthly ecosystems, the proper\r\n                                        ties of light and sound and \r\nother wonders of science had only a quaint, antiquated museum here in \r\nwhich to explore their \r\n                                        interests. Now, with the \r\nlong-delayed opening of a vast new science museum downtown set for \r\nMonday, visitors will be able \r\n                                        to stand underneath a suspended,\r\n 500,000-gallon aquarium tank and gaze at hammerhead and tiger sharks, \r\nmahi mahi, devil\r\n                                        rays and other creatures through\r\n a 60,000-pound oculus. <br></p><p align=\"justify\">Lens that will give the impression of seeing the fish from the bottom of\r\n a huge cocktail glass. And that’s just one of many\r\n                                        attractions and exhibits. \r\nOfficials at the $305 million Phillip and Patricia Frost Museum of \r\nScience promise that it will be a \r\n                                        vivid expression of modern \r\nscientific inquiry and exposition. Its opening follows a series of \r\nsetbacks and lawsuits and a \r\n                                        scramble to finish the \r\n250,000-square-foot structure. At one point, the project ran \r\nprecariously short of money. The museum\r\n                                        high-profile opening is \r\nespecially significant in a state s <br></p><p align=\"justify\"><br></p><h3 align=\"justify\">Top 5 reason to choose us</h3>\r\n                                    <p align=\"justify\">\r\n                                        Mauna Loa, the biggest volcano \r\non Earth — and one of the most active — covers half the Island of \r\nHawaii. Just 35 miles to the \r\n                                        northeast, Mauna Kea, known to \r\nnative Hawaiians as Mauna a Wakea, rises nearly 14,000 feet above sea \r\nlevel. To them it repre\r\n                                        sents a spiritual connection \r\nbetween our planet and the heavens above. These volcanoes, which have \r\nbeguiled millions of \r\n                                        tourists visiting the Hawaiian \r\nislands, have also plagued scientists with a long-running mystery: If \r\nthey are so close together, \r\n                                        how did they develop in two \r\nparallel tracks along the Hawaiian-Emperor chain formed over the same \r\nhot spot in the Pacific \r\n                                        Ocean — and why are their \r\nchemical compositions so different? \"We knew this was related to \r\nsomething much deeper,\r\n                                        but we couldn’t see what,” said \r\nTim Jones.\r\n                                    </p>', '15542700821-min.jpg', 'www.geniusocean.com', 19, 1, NULL, NULL, 'Business,Research,Mechanical,Process,Innovation,Engineering', '2018-04-06 22:04:20'),
(13, 3, 'How to design effective arts?', '<div align=\"justify\">The recording starts with the patter of a summer squall. Later, a \r\ndrifting tone like that of a not-quite-tuned-in radio station \r\n                                        rises and for a while drowns out\r\n the patter. These are the sounds encountered by NASA’s Cassini \r\nspacecraft as it dove \r\n                                        the gap between Saturn and its \r\ninnermost ring on April 26, the first of 22 such encounters before it \r\nwill plunge into \r\n                                        atmosphere in September. What \r\nCassini did not detect were many of the collisions of dust particles \r\nhitting the spacecraft\r\n                                        it passed through the plane of \r\nthe ringsen the charged particles oscillate in unison.<br><br></div><h3 align=\"justify\">How its Works ?</h3>\r\n                                    <p align=\"justify\">\r\n                                        MIAMI — For decades, South \r\nFlorida schoolchildren and adults fascinated by far-off galaxies, \r\nearthly ecosystems, the proper\r\n                                        ties of light and sound and \r\nother wonders of science had only a quaint, antiquated museum here in \r\nwhich to explore their \r\n                                        interests. Now, with the \r\nlong-delayed opening of a vast new science museum downtown set for \r\nMonday, visitors will be able \r\n                                        to stand underneath a suspended,\r\n 500,000-gallon aquarium tank and gaze at hammerhead and tiger sharks, \r\nmahi mahi, devil\r\n                                        rays and other creatures through\r\n a 60,000-pound oculus. <br></p><p align=\"justify\">Lens that will give the impression of seeing the fish from the bottom of\r\n a huge cocktail glass. And that’s just one of many\r\n                                        attractions and exhibits. \r\nOfficials at the $305 million Phillip and Patricia Frost Museum of \r\nScience promise that it will be a \r\n                                        vivid expression of modern \r\nscientific inquiry and exposition. Its opening follows a series of \r\nsetbacks and lawsuits and a \r\n                                        scramble to finish the \r\n250,000-square-foot structure. At one point, the project ran \r\nprecariously short of money. The museum\r\n                                        high-profile opening is \r\nespecially significant in a state s <br></p><p align=\"justify\"><br></p><h3 align=\"justify\">Top 5 reason to choose us</h3>\r\n                                    <p align=\"justify\">\r\n                                        Mauna Loa, the biggest volcano \r\non Earth — and one of the most active — covers half the Island of \r\nHawaii. Just 35 miles to the \r\n                                        northeast, Mauna Kea, known to \r\nnative Hawaiians as Mauna a Wakea, rises nearly 14,000 feet above sea \r\nlevel. To them it repre\r\n                                        sents a spiritual connection \r\nbetween our planet and the heavens above. These volcanoes, which have \r\nbeguiled millions of \r\n                                        tourists visiting the Hawaiian \r\nislands, have also plagued scientists with a long-running mystery: If \r\nthey are so close together, \r\n                                        how did they develop in two \r\nparallel tracks along the Hawaiian-Emperor chain formed over the same \r\nhot spot in the Pacific \r\n                                        Ocean — and why are their \r\nchemical compositions so different? \"We knew this was related to \r\nsomething much deeper,\r\n                                        but we couldn’t see what,” said \r\nTim Jones.\r\n                                    </p>', '15542700676-min.jpg', 'www.geniusocean.com', 57, 1, NULL, NULL, 'Business,Research,Mechanical,Process,Innovation,Engineering', '2018-05-06 22:04:36'),
(14, 2, 'How to design effective arts?', '<div align=\"justify\">The recording starts with the patter of a summer squall. Later, a drifting tone like that of a not-quite-tuned-in radio station rises and for a while drowns out the patter. These are the sounds encountered by NASA’s Cassini spacecraft as it dove the gap between Saturn and its innermost ring on April 26, the first of 22 such encounters before it will plunge into atmosphere in September. What Cassini did not detect were many of the collisions of dust particles hitting the spacecraft it passed through the plane of the ringsen the charged particles oscillate in unison.<br><br></div><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">How its Works ?</h3><p align=\"justify\">MIAMI — For decades, South Florida schoolchildren and adults fascinated by far-off galaxies, earthly ecosystems, the proper ties of light and sound and other wonders of science had only a quaint, antiquated museum here in which to explore their interests. Now, with the long-delayed opening of a vast new science museum downtown set for Monday, visitors will be able to stand underneath a suspended, 500,000-gallon aquarium tank and gaze at hammerhead and tiger sharks, mahi mahi, devil rays and other creatures through a 60,000-pound oculus.&nbsp;<br></p><p align=\"justify\">Lens that will give the impression of seeing the fish from the bottom of a huge cocktail glass. And that’s just one of many attractions and exhibits. Officials at the $305 million Phillip and Patricia Frost Museum of Science promise that it will be a vivid expression of modern scientific inquiry and exposition. Its opening follows a series of setbacks and lawsuits and a scramble to finish the 250,000-square-foot structure. At one point, the project ran precariously short of money. The museum high-profile opening is especially significant in a state s&nbsp;<br></p><p align=\"justify\"><br></p><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">Top 5 reason to choose us</h3><p align=\"justify\">Mauna Loa, the biggest volcano on Earth — and one of the most active — covers half the Island of Hawaii. Just 35 miles to the northeast, Mauna Kea, known to native Hawaiians as Mauna a Wakea, rises nearly 14,000 feet above sea level. To them it repre sents a spiritual connection between our planet and the heavens above. These volcanoes, which have beguiled millions of tourists visiting the Hawaiian islands, have also plagued scientists with a long-running mystery: If they are so close together, how did they develop in two parallel tracks along the Hawaiian-Emperor chain formed over the same hot spot in the Pacific Ocean — and why are their chemical compositions so different? \"We knew this was related to something much deeper, but we couldn’t see what,” said Tim Jones.</p>', '15542700595-min.jpg', 'www.geniusocean.com', 3, 1, NULL, NULL, 'Business,Research,Mechanical,Process,Innovation,Engineering', '2018-06-03 06:02:30'),
(15, 3, 'How to design effective arts?', '<div align=\"justify\">The recording starts with the patter of a summer squall. Later, a drifting tone like that of a not-quite-tuned-in radio station rises and for a while drowns out the patter. These are the sounds encountered by NASA’s Cassini spacecraft as it dove the gap between Saturn and its innermost ring on April 26, the first of 22 such encounters before it will plunge into atmosphere in September. What Cassini did not detect were many of the collisions of dust particles hitting the spacecraft it passed through the plane of the ringsen the charged particles oscillate in unison.<br><br></div><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">How its Works ?</h3><p align=\"justify\">MIAMI — For decades, South Florida schoolchildren and adults fascinated by far-off galaxies, earthly ecosystems, the proper ties of light and sound and other wonders of science had only a quaint, antiquated museum here in which to explore their interests. Now, with the long-delayed opening of a vast new science museum downtown set for Monday, visitors will be able to stand underneath a suspended, 500,000-gallon aquarium tank and gaze at hammerhead and tiger sharks, mahi mahi, devil rays and other creatures through a 60,000-pound oculus.&nbsp;<br></p><p align=\"justify\">Lens that will give the impression of seeing the fish from the bottom of a huge cocktail glass. And that’s just one of many attractions and exhibits. Officials at the $305 million Phillip and Patricia Frost Museum of Science promise that it will be a vivid expression of modern scientific inquiry and exposition. Its opening follows a series of setbacks and lawsuits and a scramble to finish the 250,000-square-foot structure. At one point, the project ran precariously short of money. The museum high-profile opening is especially significant in a state s&nbsp;<br></p><p align=\"justify\"><br></p><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">Top 5 reason to choose us</h3><p align=\"justify\">Mauna Loa, the biggest volcano on Earth — and one of the most active — covers half the Island of Hawaii. Just 35 miles to the northeast, Mauna Kea, known to native Hawaiians as Mauna a Wakea, rises nearly 14,000 feet above sea level. To them it repre sents a spiritual connection between our planet and the heavens above. These volcanoes, which have beguiled millions of tourists visiting the Hawaiian islands, have also plagued scientists with a long-running mystery: If they are so close together, how did they develop in two parallel tracks along the Hawaiian-Emperor chain formed over the same hot spot in the Pacific Ocean — and why are their chemical compositions so different? \"We knew this was related to something much deeper, but we couldn’t see what,” said Tim Jones.</p>', '15542700464-min.jpg', 'www.geniusocean.com', 6, 1, NULL, NULL, 'Business,Research,Mechanical,Process,Innovation,Engineering', '2018-07-03 06:02:53'),
(16, 2, 'How to design effective arts?', '<div align=\"justify\">The recording starts with the patter of a summer squall. Later, a drifting tone like that of a not-quite-tuned-in radio station rises and for a while drowns out the patter. These are the sounds encountered by NASA’s Cassini spacecraft as it dove the gap between Saturn and its innermost ring on April 26, the first of 22 such encounters before it will plunge into atmosphere in September. What Cassini did not detect were many of the collisions of dust particles hitting the spacecraft it passed through the plane of the ringsen the charged particles oscillate in unison.<br><br></div><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">How its Works ?</h3><p align=\"justify\">MIAMI — For decades, South Florida schoolchildren and adults fascinated by far-off galaxies, earthly ecosystems, the proper ties of light and sound and other wonders of science had only a quaint, antiquated museum here in which to explore their interests. Now, with the long-delayed opening of a vast new science museum downtown set for Monday, visitors will be able to stand underneath a suspended, 500,000-gallon aquarium tank and gaze at hammerhead and tiger sharks, mahi mahi, devil rays and other creatures through a 60,000-pound oculus.&nbsp;<br></p><p align=\"justify\">Lens that will give the impression of seeing the fish from the bottom of a huge cocktail glass. And that’s just one of many attractions and exhibits. Officials at the $305 million Phillip and Patricia Frost Museum of Science promise that it will be a vivid expression of modern scientific inquiry and exposition. Its opening follows a series of setbacks and lawsuits and a scramble to finish the 250,000-square-foot structure. At one point, the project ran precariously short of money. The museum high-profile opening is especially significant in a state s&nbsp;<br></p><p align=\"justify\"><br></p><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">Top 5 reason to choose us</h3><p align=\"justify\">Mauna Loa, the biggest volcano on Earth — and one of the most active — covers half the Island of Hawaii. Just 35 miles to the northeast, Mauna Kea, known to native Hawaiians as Mauna a Wakea, rises nearly 14,000 feet above sea level. To them it repre sents a spiritual connection between our planet and the heavens above. These volcanoes, which have beguiled millions of tourists visiting the Hawaiian islands, have also plagued scientists with a long-running mystery: If they are so close together, how did they develop in two parallel tracks along the Hawaiian-Emperor chain formed over the same hot spot in the Pacific Ocean — and why are their chemical compositions so different? \"We knew this was related to something much deeper, but we couldn’t see what,” said Tim Jones.</p>', '15542700383-min.jpg', 'www.geniusocean.com', 5, 1, NULL, NULL, 'Business,Research,Mechanical,Process,Innovation,Engineering', '2018-08-03 06:03:14'),
(17, 3, 'How to design effective arts?', '<div align=\"justify\">The recording starts with the patter of a summer squall. Later, a drifting tone like that of a not-quite-tuned-in radio station rises and for a while drowns out the patter. These are the sounds encountered by NASA’s Cassini spacecraft as it dove the gap between Saturn and its innermost ring on April 26, the first of 22 such encounters before it will plunge into atmosphere in September. What Cassini did not detect were many of the collisions of dust particles hitting the spacecraft it passed through the plane of the ringsen the charged particles oscillate in unison.<br><br></div><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">How its Works ?</h3><p align=\"justify\">MIAMI — For decades, South Florida schoolchildren and adults fascinated by far-off galaxies, earthly ecosystems, the proper ties of light and sound and other wonders of science had only a quaint, antiquated museum here in which to explore their interests. Now, with the long-delayed opening of a vast new science museum downtown set for Monday, visitors will be able to stand underneath a suspended, 500,000-gallon aquarium tank and gaze at hammerhead and tiger sharks, mahi mahi, devil rays and other creatures through a 60,000-pound oculus.&nbsp;<br></p><p align=\"justify\">Lens that will give the impression of seeing the fish from the bottom of a huge cocktail glass. And that’s just one of many attractions and exhibits. Officials at the $305 million Phillip and Patricia Frost Museum of Science promise that it will be a vivid expression of modern scientific inquiry and exposition. Its opening follows a series of setbacks and lawsuits and a scramble to finish the 250,000-square-foot structure. At one point, the project ran precariously short of money. The museum high-profile opening is especially significant in a state s&nbsp;<br></p><p align=\"justify\"><br></p><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">Top 5 reason to choose us</h3><p align=\"justify\">Mauna Loa, the biggest volcano on Earth — and one of the most active — covers half the Island of Hawaii. Just 35 miles to the northeast, Mauna Kea, known to native Hawaiians as Mauna a Wakea, rises nearly 14,000 feet above sea level. To them it repre sents a spiritual connection between our planet and the heavens above. These volcanoes, which have beguiled millions of tourists visiting the Hawaiian islands, have also plagued scientists with a long-running mystery: If they are so close together, how did they develop in two parallel tracks along the Hawaiian-Emperor chain formed over the same hot spot in the Pacific Ocean — and why are their chemical compositions so different? \"We knew this was related to something much deeper, but we couldn’t see what,” said Tim Jones.</p>', '15542700322-min.jpg', 'www.geniusocean.com', 50, 1, NULL, NULL, 'Business,Research,Mechanical,Process,Innovation,Engineering', '2019-01-03 06:03:37'),
(18, 2, 'How to design effective arts?', '<div align=\"justify\">The recording starts with the patter of a summer squall. Later, a drifting tone like that of a not-quite-tuned-in radio station rises and for a while drowns out the patter. These are the sounds encountered by NASA’s Cassini spacecraft as it dove the gap between Saturn and its innermost ring on April 26, the first of 22 such encounters before it will plunge into atmosphere in September. What Cassini did not detect were many of the collisions of dust particles hitting the spacecraft it passed through the plane of the ringsen the charged particles oscillate in unison.<br><br></div><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">How its Works ?</h3><p align=\"justify\">MIAMI — For decades, South Florida schoolchildren and adults fascinated by far-off galaxies, earthly ecosystems, the proper ties of light and sound and other wonders of science had only a quaint, antiquated museum here in which to explore their interests. Now, with the long-delayed opening of a vast new science museum downtown set for Monday, visitors will be able to stand underneath a suspended, 500,000-gallon aquarium tank and gaze at hammerhead and tiger sharks, mahi mahi, devil rays and other creatures through a 60,000-pound oculus.&nbsp;<br></p><p align=\"justify\">Lens that will give the impression of seeing the fish from the bottom of a huge cocktail glass. And that’s just one of many attractions and exhibits. Officials at the $305 million Phillip and Patricia Frost Museum of Science promise that it will be a vivid expression of modern scientific inquiry and exposition. Its opening follows a series of setbacks and lawsuits and a scramble to finish the 250,000-square-foot structure. At one point, the project ran precariously short of money. The museum high-profile opening is especially significant in a state s&nbsp;<br></p><p align=\"justify\"><br></p><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">Top 5 reason to choose us</h3><p align=\"justify\">Mauna Loa, the biggest volcano on Earth — and one of the most active — covers half the Island of Hawaii. Just 35 miles to the northeast, Mauna Kea, known to native Hawaiians as Mauna a Wakea, rises nearly 14,000 feet above sea level. To them it repre sents a spiritual connection between our planet and the heavens above. These volcanoes, which have beguiled millions of tourists visiting the Hawaiian islands, have also plagued scientists with a long-running mystery: If they are so close together, how did they develop in two parallel tracks along the Hawaiian-Emperor chain formed over the same hot spot in the Pacific Ocean — and why are their chemical compositions so different? \"We knew this was related to something much deeper, but we couldn’t see what,” said Tim Jones.</p>', '15542700251-min.jpg', 'www.geniusocean.com', 151, 1, NULL, NULL, 'Business,Research,Mechanical,Process,Innovation,Engineering', '2019-01-03 06:03:59'),
(20, 2, 'How to design effective arts?', '<div align=\"justify\">The recording starts with the patter of a summer squall. Later, a drifting tone like that of a not-quite-tuned-in radio station rises and for a while drowns out the patter. These are the sounds encountered by NASA’s Cassini spacecraft as it dove the gap between Saturn and its innermost ring on April 26, the first of 22 such encounters before it will plunge into atmosphere in September. What Cassini did not detect were many of the collisions of dust particles hitting the spacecraft it passed through the plane of the ringsen the charged particles oscillate in unison.<br><br></div><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">How its Works ?</h3><p align=\"justify\">MIAMI — For decades, South Florida schoolchildren and adults fascinated by far-off galaxies, earthly ecosystems, the proper ties of light and sound and other wonders of science had only a quaint, antiquated museum here in which to explore their interests. Now, with the long-delayed opening of a vast new science museum downtown set for Monday, visitors will be able to stand underneath a suspended, 500,000-gallon aquarium tank and gaze at hammerhead and tiger sharks, mahi mahi, devil rays and other creatures through a 60,000-pound oculus.&nbsp;<br></p><p align=\"justify\">Lens that will give the impression of seeing the fish from the bottom of a huge cocktail glass. And that’s just one of many attractions and exhibits. Officials at the $305 million Phillip and Patricia Frost Museum of Science promise that it will be a vivid expression of modern scientific inquiry and exposition. Its opening follows a series of setbacks and lawsuits and a scramble to finish the 250,000-square-foot structure. At one point, the project ran precariously short of money. The museum high-profile opening is especially significant in a state s&nbsp;<br></p><p align=\"justify\"><br></p><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">Top 5 reason to choose us</h3><p align=\"justify\">Mauna Loa, the biggest volcano on Earth — and one of the most active — covers half the Island of Hawaii. Just 35 miles to the northeast, Mauna Kea, known to native Hawaiians as Mauna a Wakea, rises nearly 14,000 feet above sea level. To them it repre sents a spiritual connection between our planet and the heavens above. These volcanoes, which have beguiled millions of tourists visiting the Hawaiian islands, have also plagued scientists with a long-running mystery: If they are so close together, how did they develop in two parallel tracks along the Hawaiian-Emperor chain formed over the same hot spot in the Pacific Ocean — and why are their chemical compositions so different? \"We knew this was related to something much deeper, but we couldn’t see what,” said Tim Jones.</p>', '15542699136-min.jpg', 'www.geniusocean.com', 10, 1, NULL, NULL, 'Business,Research,Mechanical,Process,Innovation,Engineering', '2018-08-03 06:03:14'),
(21, 3, 'How to design effective arts?', '<div align=\"justify\">The recording starts with the patter of a summer squall. Later, a drifting tone like that of a not-quite-tuned-in radio station rises and for a while drowns out the patter. These are the sounds encountered by NASA’s Cassini spacecraft as it dove the gap between Saturn and its innermost ring on April 26, the first of 22 such encounters before it will plunge into atmosphere in September. What Cassini did not detect were many of the collisions of dust particles hitting the spacecraft it passed through the plane of the ringsen the charged particles oscillate in unison.<br><br></div><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">How its Works ?</h3><p align=\"justify\">MIAMI — For decades, South Florida schoolchildren and adults fascinated by far-off galaxies, earthly ecosystems, the proper ties of light and sound and other wonders of science had only a quaint, antiquated museum here in which to explore their interests. Now, with the long-delayed opening of a vast new science museum downtown set for Monday, visitors will be able to stand underneath a suspended, 500,000-gallon aquarium tank and gaze at hammerhead and tiger sharks, mahi mahi, devil rays and other creatures through a 60,000-pound oculus.&nbsp;<br></p><p align=\"justify\">Lens that will give the impression of seeing the fish from the bottom of a huge cocktail glass. And that’s just one of many attractions and exhibits. Officials at the $305 million Phillip and Patricia Frost Museum of Science promise that it will be a vivid expression of modern scientific inquiry and exposition. Its opening follows a series of setbacks and lawsuits and a scramble to finish the 250,000-square-foot structure. At one point, the project ran precariously short of money. The museum high-profile opening is especially significant in a state s&nbsp;<br></p><p align=\"justify\"><br></p><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">Top 5 reason to choose us</h3><p align=\"justify\">Mauna Loa, the biggest volcano on Earth — and one of the most active — covers half the Island of Hawaii. Just 35 miles to the northeast, Mauna Kea, known to native Hawaiians as Mauna a Wakea, rises nearly 14,000 feet above sea level. To them it repre sents a spiritual connection between our planet and the heavens above. These volcanoes, which have beguiled millions of tourists visiting the Hawaiian islands, have also plagued scientists with a long-running mystery: If they are so close together, how did they develop in two parallel tracks along the Hawaiian-Emperor chain formed over the same hot spot in the Pacific Ocean — and why are their chemical compositions so different? \"We knew this was related to something much deeper, but we couldn’t see what,” said Tim Jones.</p>', '15542699045-min.jpg', 'www.geniusocean.com', 36, 1, NULL, NULL, 'Business,Research,Mechanical,Process,Innovation,Engineering', '2019-01-03 06:03:37'),
(22, 2, 'How to design effective arts?', '<div align=\"justify\">The recording starts with the patter of a summer squall. Later, a drifting tone like that of a not-quite-tuned-in radio station rises and for a while drowns out the patter. These are the sounds encountered by NASA’s Cassini spacecraft as it dove the gap between Saturn and its innermost ring on April 26, the first of 22 such encounters before it will plunge into atmosphere in September. What Cassini did not detect were many of the collisions of dust particles hitting the spacecraft it passed through the plane of the ringsen the charged particles oscillate in unison.<br><br></div><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">How its Works ?</h3><p align=\"justify\">MIAMI — For decades, South Florida schoolchildren and adults fascinated by far-off galaxies, earthly ecosystems, the proper ties of light and sound and other wonders of science had only a quaint, antiquated museum here in which to explore their interests. Now, with the long-delayed opening of a vast new science museum downtown set for Monday, visitors will be able to stand underneath a suspended, 500,000-gallon aquarium tank and gaze at hammerhead and tiger sharks, mahi mahi, devil rays and other creatures through a 60,000-pound oculus.&nbsp;<br></p><p align=\"justify\">Lens that will give the impression of seeing the fish from the bottom of a huge cocktail glass. And that’s just one of many attractions and exhibits. Officials at the $305 million Phillip and Patricia Frost Museum of Science promise that it will be a vivid expression of modern scientific inquiry and exposition. Its opening follows a series of setbacks and lawsuits and a scramble to finish the 250,000-square-foot structure. At one point, the project ran precariously short of money. The museum high-profile opening is especially significant in a state s&nbsp;<br></p><p align=\"justify\"><br></p><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">Top 5 reason to choose us</h3><p align=\"justify\">Mauna Loa, the biggest volcano on Earth — and one of the most active — covers half the Island of Hawaii. Just 35 miles to the northeast, Mauna Kea, known to native Hawaiians as Mauna a Wakea, rises nearly 14,000 feet above sea level. To them it repre sents a spiritual connection between our planet and the heavens above. These volcanoes, which have beguiled millions of tourists visiting the Hawaiian islands, have also plagued scientists with a long-running mystery: If they are so close together, how did they develop in two parallel tracks along the Hawaiian-Emperor chain formed over the same hot spot in the Pacific Ocean — and why are their chemical compositions so different? \"We knew this was related to something much deeper, but we couldn’t see what,” said Tim Jones.</p>', '15542698954-min.jpg', 'www.geniusocean.com', 68, 1, NULL, NULL, 'Business,Research,Mechanical,Process,Innovation,Engineering', '2019-01-03 06:03:59'),
(23, 7, 'How to design effective arts?', '<div align=\"justify\">The recording starts with the patter of a summer squall. Later, a drifting tone like that of a not-quite-tuned-in radio station rises and for a while drowns out the patter. These are the sounds encountered by NASA’s Cassini spacecraft as it dove the gap between Saturn and its innermost ring on April 26, the first of 22 such encounters before it will plunge into atmosphere in September. What Cassini did not detect were many of the collisions of dust particles hitting the spacecraft it passed through the plane of the ringsen the charged particles oscillate in unison.<br><br></div><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">How its Works ?</h3><p align=\"justify\">MIAMI — For decades, South Florida schoolchildren and adults fascinated by far-off galaxies, earthly ecosystems, the proper ties of light and sound and other wonders of science had only a quaint, antiquated museum here in which to explore their interests. Now, with the long-delayed opening of a vast new science museum downtown set for Monday, visitors will be able to stand underneath a suspended, 500,000-gallon aquarium tank and gaze at hammerhead and tiger sharks, mahi mahi, devil rays and other creatures through a 60,000-pound oculus.&nbsp;<br></p><p align=\"justify\">Lens that will give the impression of seeing the fish from the bottom of a huge cocktail glass. And that’s just one of many attractions and exhibits. Officials at the $305 million Phillip and Patricia Frost Museum of Science promise that it will be a vivid expression of modern scientific inquiry and exposition. Its opening follows a series of setbacks and lawsuits and a scramble to finish the 250,000-square-foot structure. At one point, the project ran precariously short of money. The museum high-profile opening is especially significant in a state s&nbsp;<br></p><p align=\"justify\"><br></p><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">Top 5 reason to choose us</h3><p align=\"justify\">Mauna Loa, the biggest volcano on Earth — and one of the most active — covers half the Island of Hawaii. Just 35 miles to the northeast, Mauna Kea, known to native Hawaiians as Mauna a Wakea, rises nearly 14,000 feet above sea level. To them it repre sents a spiritual connection between our planet and the heavens above. These volcanoes, which have beguiled millions of tourists visiting the Hawaiian islands, have also plagued scientists with a long-running mystery: If they are so close together, how did they develop in two parallel tracks along the Hawaiian-Emperor chain formed over the same hot spot in the Pacific Ocean — and why are their chemical compositions so different? \"We knew this was related to something much deeper, but we couldn’t see what,” said Tim Jones.</p>', '15542698893-min.jpg', 'www.geniusocean.com', 5, 1, NULL, NULL, 'Business,Research,Mechanical,Process,Innovation,Engineering', '2018-08-03 06:03:14'),
(24, 3, 'How to design effective arts?', '<div align=\"justify\">The recording starts with the patter of a summer squall. Later, a drifting tone like that of a not-quite-tuned-in radio station rises and for a while drowns out the patter. These are the sounds encountered by NASA’s Cassini spacecraft as it dove the gap between Saturn and its innermost ring on April 26, the first of 22 such encounters before it will plunge into atmosphere in September. What Cassini did not detect were many of the collisions of dust particles hitting the spacecraft it passed through the plane of the ringsen the charged particles oscillate in unison.<br><br></div><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">How its Works ?</h3><p align=\"justify\">MIAMI — For decades, South Florida schoolchildren and adults fascinated by far-off galaxies, earthly ecosystems, the proper ties of light and sound and other wonders of science had only a quaint, antiquated museum here in which to explore their interests. Now, with the long-delayed opening of a vast new science museum downtown set for Monday, visitors will be able to stand underneath a suspended, 500,000-gallon aquarium tank and gaze at hammerhead and tiger sharks, mahi mahi, devil rays and other creatures through a 60,000-pound oculus.&nbsp;<br></p><p align=\"justify\">Lens that will give the impression of seeing the fish from the bottom of a huge cocktail glass. And that’s just one of many attractions and exhibits. Officials at the $305 million Phillip and Patricia Frost Museum of Science promise that it will be a vivid expression of modern scientific inquiry and exposition. Its opening follows a series of setbacks and lawsuits and a scramble to finish the 250,000-square-foot structure. At one point, the project ran precariously short of money. The museum high-profile opening is especially significant in a state s&nbsp;<br></p><p align=\"justify\"><br></p><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">Top 5 reason to choose us</h3><p align=\"justify\">Mauna Loa, the biggest volcano on Earth — and one of the most active — covers half the Island of Hawaii. Just 35 miles to the northeast, Mauna Kea, known to native Hawaiians as Mauna a Wakea, rises nearly 14,000 feet above sea level. To them it repre sents a spiritual connection between our planet and the heavens above. These volcanoes, which have beguiled millions of tourists visiting the Hawaiian islands, have also plagued scientists with a long-running mystery: If they are so close together, how did they develop in two parallel tracks along the Hawaiian-Emperor chain formed over the same hot spot in the Pacific Ocean — and why are their chemical compositions so different? \"We knew this was related to something much deeper, but we couldn’t see what,” said Tim Jones.</p>', '15542698832-min.jpg', 'www.geniusocean.com', 34, 1, NULL, NULL, 'Business,Research,Mechanical,Process,Innovation,Engineering', '2019-01-03 06:03:37');
INSERT INTO `blogs` (`id`, `category_id`, `title`, `details`, `photo`, `source`, `views`, `status`, `meta_tag`, `meta_description`, `tags`, `created_at`) VALUES
(25, 3, 'How to design effective arts?', '<div align=\"justify\">The recording starts with the patter of a summer squall. Later, a drifting tone like that of a not-quite-tuned-in radio station rises and for a while drowns out the patter. These are the sounds encountered by NASA’s Cassini spacecraft as it dove the gap between Saturn and its innermost ring on April 26, the first of 22 such encounters before it will plunge into atmosphere in September. What Cassini did not detect were many of the collisions of dust particles hitting the spacecraft it passed through the plane of the ringsen the charged particles oscillate in unison.<br><br></div><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">How its Works ?</h3><p align=\"justify\">MIAMI — For decades, South Florida schoolchildren and adults fascinated by far-off galaxies, earthly ecosystems, the proper ties of light and sound and other wonders of science had only a quaint, antiquated museum here in which to explore their interests. Now, with the long-delayed opening of a vast new science museum downtown set for Monday, visitors will be able to stand underneath a suspended, 500,000-gallon aquarium tank and gaze at hammerhead and tiger sharks, mahi mahi, devil rays and other creatures through a 60,000-pound oculus.&nbsp;<br></p><p align=\"justify\">Lens that will give the impression of seeing the fish from the bottom of a huge cocktail glass. And that’s just one of many attractions and exhibits. Officials at the $305 million Phillip and Patricia Frost Museum of Science promise that it will be a vivid expression of modern scientific inquiry and exposition. Its opening follows a series of setbacks and lawsuits and a scramble to finish the 250,000-square-foot structure. At one point, the project ran precariously short of money. The museum high-profile opening is especially significant in a state s&nbsp;<br></p><p align=\"justify\"><br></p><h3 align=\"justify\" style=\"font-family: \" helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);\"=\"\">Top 5 reason to choose us</h3><p align=\"justify\">Mauna Loa, the biggest volcano on Earth — and one of the most active — covers half the Island of Hawaii. Just 35 miles to the northeast, Mauna Kea, known to native Hawaiians as Mauna a Wakea, rises nearly 14,000 feet above sea level. To them it repre sents a spiritual connection between our planet and the heavens above. These volcanoes, which have beguiled millions of tourists visiting the Hawaiian islands, have also plagued scientists with a long-running mystery: If they are so close together, how did they develop in two parallel tracks along the Hawaiian-Emperor chain formed over the same hot spot in the Pacific Ocean — and why are their chemical compositions so different? \"We knew this was related to something much deeper, but we couldn’t see what,” said Tim Jones.</p>', '15557542831-min.jpg', 'www.geniusocean.com', 40, 1, NULL, NULL, 'Business,Research,Mechanical,Process,Innovation,Engineering', '2019-01-03 06:03:59');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `blog_categories`
--

CREATE TABLE `blog_categories` (
  `id` int(191) NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `blog_categories`
--

INSERT INTO `blog_categories` (`id`, `name`, `slug`) VALUES
(2, 'Oil & gas', 'oil-and-gas'),
(3, 'Manufacturing', 'manufacturing'),
(4, 'Chemical Research', 'chemical_research'),
(5, 'Agriculture', 'agriculture'),
(6, 'Mechanical', 'mechanical'),
(7, 'Entrepreneurs', 'entrepreneurs'),
(8, 'Technology', 'technology');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` int(191) NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `photo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_featured` tinyint(1) NOT NULL DEFAULT 0,
  `image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `status`, `photo`, `is_featured`, `image`) VALUES
(4, 'Electronic', 'electric', 0, '1557807287light.png', 1, '1568709131f6.jpg'),
(5, 'Fashion & Beauty', 'fashion-and-Beauty', 1, '1557807279fashion.png', 1, '1568709123f1.jpg'),
(6, 'Camera & Photo', 'camera-and-photo', 1, '1557807264camera.png', 1, '1568709110f2.jpg'),
(7, 'Smart Phone', 'smart-phone', 1, '1557377810mobile.png', 1, '1568709597f4.jpg'),
(17, 'Portable & Personal Electronics', 'portable-and-personal-electronics', 0, '1568878538electronic.jpg', 0, NULL),
(18, 'Outdoor, Recreation & Fitness', 'Outdoor-Recreation-and-Fitness', 0, '1568878596home.jpg', 0, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `childcategories`
--

CREATE TABLE `childcategories` (
  `id` int(191) NOT NULL,
  `subcategory_id` int(191) NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `childcategories`
--

INSERT INTO `childcategories` (`id`, `subcategory_id`, `name`, `slug`, `status`) VALUES
(1, 2, 'LCD TV', 'lcd-tv', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comments`
--

CREATE TABLE `comments` (
  `id` int(191) NOT NULL,
  `user_id` int(191) UNSIGNED NOT NULL,
  `product_id` int(191) UNSIGNED NOT NULL,
  `text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `comments`
--

INSERT INTO `comments` (`id`, `user_id`, `product_id`, `text`, `created_at`, `updated_at`) VALUES
(1, 29, 184, 'ok', '2022-11-16 07:26:55', '2022-11-16 07:26:55');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `conversations`
--

CREATE TABLE `conversations` (
  `id` int(191) NOT NULL,
  `subject` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sent_user` int(191) NOT NULL,
  `recieved_user` int(191) NOT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `conversations`
--

INSERT INTO `conversations` (`id`, `subject`, `sent_user`, `recieved_user`, `message`, `created_at`, `updated_at`) VALUES
(1, 'hello', 32, 32, 'hi', '2022-11-16 07:01:25', '2022-11-16 07:01:25');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `counters`
--

CREATE TABLE `counters` (
  `id` int(11) NOT NULL,
  `type` enum('referral','browser') NOT NULL DEFAULT 'referral',
  `referral` varchar(255) DEFAULT NULL,
  `total_count` int(11) NOT NULL DEFAULT 0,
  `todays_count` int(11) NOT NULL DEFAULT 0,
  `today` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `counters`
--

INSERT INTO `counters` (`id`, `type`, `referral`, `total_count`, `todays_count`, `today`) VALUES
(1, 'referral', 'www.facebook.com', 5, 0, NULL),
(2, 'referral', 'geniusocean.com', 2, 0, NULL),
(3, 'browser', 'Windows 10', 927, 0, NULL),
(4, 'browser', 'Linux', 221, 0, NULL),
(5, 'browser', 'Unknown OS Platform', 384, 0, NULL),
(6, 'browser', 'Windows 7', 415, 0, NULL),
(7, 'referral', 'yandex.ru', 15, 0, NULL),
(8, 'browser', 'Windows 8.1', 536, 0, NULL),
(9, 'referral', 'www.google.com', 6, 0, NULL),
(10, 'browser', 'Android', 355, 0, NULL),
(11, 'browser', 'Mac OS X', 502, 0, NULL),
(12, 'referral', 'l.facebook.com', 1, 0, NULL),
(13, 'referral', 'codecanyon.net', 6, 0, NULL),
(14, 'browser', 'Windows XP', 2, 0, NULL),
(15, 'browser', 'Windows 8', 1, 0, NULL),
(16, 'browser', 'iPad', 4, 0, NULL),
(17, 'browser', 'Ubuntu', 1, 0, NULL),
(18, 'browser', 'iPhone', 4, 0, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `countries`
--

CREATE TABLE `countries` (
  `id` int(11) NOT NULL,
  `country_code` varchar(2) NOT NULL DEFAULT '',
  `country_name` varchar(100) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `countries`
--

INSERT INTO `countries` (`id`, `country_code`, `country_name`) VALUES
(1, 'AF', 'Afghanistan'),
(2, 'AL', 'Albania'),
(3, 'DZ', 'Algeria'),
(4, 'DS', 'American Samoa'),
(5, 'AD', 'Andorra'),
(6, 'AO', 'Angola'),
(7, 'AI', 'Anguilla'),
(8, 'AQ', 'Antarctica'),
(9, 'AG', 'Antigua and Barbuda'),
(10, 'AR', 'Argentina'),
(11, 'AM', 'Armenia'),
(12, 'AW', 'Aruba'),
(13, 'AU', 'Australia'),
(14, 'AT', 'Austria'),
(15, 'AZ', 'Azerbaijan'),
(16, 'BS', 'Bahamas'),
(17, 'BH', 'Bahrain'),
(18, 'BD', 'Bangladesh'),
(19, 'BB', 'Barbados'),
(20, 'BY', 'Belarus'),
(21, 'BE', 'Belgium'),
(22, 'BZ', 'Belize'),
(23, 'BJ', 'Benin'),
(24, 'BM', 'Bermuda'),
(25, 'BT', 'Bhutan'),
(26, 'BO', 'Bolivia'),
(27, 'BA', 'Bosnia and Herzegovina'),
(28, 'BW', 'Botswana'),
(29, 'BV', 'Bouvet Island'),
(30, 'BR', 'Brazil'),
(31, 'IO', 'British Indian Ocean Territory'),
(32, 'BN', 'Brunei Darussalam'),
(33, 'BG', 'Bulgaria'),
(34, 'BF', 'Burkina Faso'),
(35, 'BI', 'Burundi'),
(36, 'KH', 'Cambodia'),
(37, 'CM', 'Cameroon'),
(38, 'CA', 'Canada'),
(39, 'CV', 'Cape Verde'),
(40, 'KY', 'Cayman Islands'),
(41, 'CF', 'Central African Republic'),
(42, 'TD', 'Chad'),
(43, 'CL', 'Chile'),
(44, 'CN', 'China'),
(45, 'CX', 'Christmas Island'),
(46, 'CC', 'Cocos (Keeling) Islands'),
(47, 'CO', 'Colombia'),
(48, 'KM', 'Comoros'),
(49, 'CD', 'Democratic Republic of the Congo'),
(50, 'CG', 'Republic of Congo'),
(51, 'CK', 'Cook Islands'),
(52, 'CR', 'Costa Rica'),
(53, 'HR', 'Croatia (Hrvatska)'),
(54, 'CU', 'Cuba'),
(55, 'CY', 'Cyprus'),
(56, 'CZ', 'Czech Republic'),
(57, 'DK', 'Denmark'),
(58, 'DJ', 'Djibouti'),
(59, 'DM', 'Dominica'),
(60, 'DO', 'Dominican Republic'),
(61, 'TP', 'East Timor'),
(62, 'EC', 'Ecuador'),
(63, 'EG', 'Egypt'),
(64, 'SV', 'El Salvador'),
(65, 'GQ', 'Equatorial Guinea'),
(66, 'ER', 'Eritrea'),
(67, 'EE', 'Estonia'),
(68, 'ET', 'Ethiopia'),
(69, 'FK', 'Falkland Islands (Malvinas)'),
(70, 'FO', 'Faroe Islands'),
(71, 'FJ', 'Fiji'),
(72, 'FI', 'Finland'),
(73, 'FR', 'France'),
(74, 'FX', 'France, Metropolitan'),
(75, 'GF', 'French Guiana'),
(76, 'PF', 'French Polynesia'),
(77, 'TF', 'French Southern Territories'),
(78, 'GA', 'Gabon'),
(79, 'GM', 'Gambia'),
(80, 'GE', 'Georgia'),
(81, 'DE', 'Germany'),
(82, 'GH', 'Ghana'),
(83, 'GI', 'Gibraltar'),
(84, 'GK', 'Guernsey'),
(85, 'GR', 'Greece'),
(86, 'GL', 'Greenland'),
(87, 'GD', 'Grenada'),
(88, 'GP', 'Guadeloupe'),
(89, 'GU', 'Guam'),
(90, 'GT', 'Guatemala'),
(91, 'GN', 'Guinea'),
(92, 'GW', 'Guinea-Bissau'),
(93, 'GY', 'Guyana'),
(94, 'HT', 'Haiti'),
(95, 'HM', 'Heard and Mc Donald Islands'),
(96, 'HN', 'Honduras'),
(97, 'HK', 'Hong Kong'),
(98, 'HU', 'Hungary'),
(99, 'IS', 'Iceland'),
(100, 'IN', 'India'),
(101, 'IM', 'Isle of Man'),
(102, 'ID', 'Indonesia'),
(103, 'IR', 'Iran (Islamic Republic of)'),
(104, 'IQ', 'Iraq'),
(105, 'IE', 'Ireland'),
(106, 'IL', 'Israel'),
(107, 'IT', 'Italy'),
(108, 'CI', 'Ivory Coast'),
(109, 'JE', 'Jersey'),
(110, 'JM', 'Jamaica'),
(111, 'JP', 'Japan'),
(112, 'JO', 'Jordan'),
(113, 'KZ', 'Kazakhstan'),
(114, 'KE', 'Kenya'),
(115, 'KI', 'Kiribati'),
(116, 'KP', 'Korea, Democratic People\'s Republic of'),
(117, 'KR', 'Korea, Republic of'),
(118, 'XK', 'Kosovo'),
(119, 'KW', 'Kuwait'),
(120, 'KG', 'Kyrgyzstan'),
(121, 'LA', 'Lao People\'s Democratic Republic'),
(122, 'LV', 'Latvia'),
(123, 'LB', 'Lebanon'),
(124, 'LS', 'Lesotho'),
(125, 'LR', 'Liberia'),
(126, 'LY', 'Libyan Arab Jamahiriya'),
(127, 'LI', 'Liechtenstein'),
(128, 'LT', 'Lithuania'),
(129, 'LU', 'Luxembourg'),
(130, 'MO', 'Macau'),
(131, 'MK', 'North Macedonia'),
(132, 'MG', 'Madagascar'),
(133, 'MW', 'Malawi'),
(134, 'MY', 'Malaysia'),
(135, 'MV', 'Maldives'),
(136, 'ML', 'Mali'),
(137, 'MT', 'Malta'),
(138, 'MH', 'Marshall Islands'),
(139, 'MQ', 'Martinique'),
(140, 'MR', 'Mauritania'),
(141, 'MU', 'Mauritius'),
(142, 'TY', 'Mayotte'),
(143, 'MX', 'Mexico'),
(144, 'FM', 'Micronesia, Federated States of'),
(145, 'MD', 'Moldova, Republic of'),
(146, 'MC', 'Monaco'),
(147, 'MN', 'Mongolia'),
(148, 'ME', 'Montenegro'),
(149, 'MS', 'Montserrat'),
(150, 'MA', 'Morocco'),
(151, 'MZ', 'Mozambique'),
(152, 'MM', 'Myanmar'),
(153, 'NA', 'Namibia'),
(154, 'NR', 'Nauru'),
(155, 'NP', 'Nepal'),
(156, 'NL', 'Netherlands'),
(157, 'AN', 'Netherlands Antilles'),
(158, 'NC', 'New Caledonia'),
(159, 'NZ', 'New Zealand'),
(160, 'NI', 'Nicaragua'),
(161, 'NE', 'Niger'),
(162, 'NG', 'Nigeria'),
(163, 'NU', 'Niue'),
(164, 'NF', 'Norfolk Island'),
(165, 'MP', 'Northern Mariana Islands'),
(166, 'NO', 'Norway'),
(167, 'OM', 'Oman'),
(168, 'PK', 'Pakistan'),
(169, 'PW', 'Palau'),
(170, 'PS', 'Palestine'),
(171, 'PA', 'Panama'),
(172, 'PG', 'Papua New Guinea'),
(173, 'PY', 'Paraguay'),
(174, 'PE', 'Peru'),
(175, 'PH', 'Philippines'),
(176, 'PN', 'Pitcairn'),
(177, 'PL', 'Poland'),
(178, 'PT', 'Portugal'),
(179, 'PR', 'Puerto Rico'),
(180, 'QA', 'Qatar'),
(181, 'RE', 'Reunion'),
(182, 'RO', 'Romania'),
(183, 'RU', 'Russian Federation'),
(184, 'RW', 'Rwanda'),
(185, 'KN', 'Saint Kitts and Nevis'),
(186, 'LC', 'Saint Lucia'),
(187, 'VC', 'Saint Vincent and the Grenadines'),
(188, 'WS', 'Samoa'),
(189, 'SM', 'San Marino'),
(190, 'ST', 'Sao Tome and Principe'),
(191, 'SA', 'Saudi Arabia'),
(192, 'SN', 'Senegal'),
(193, 'RS', 'Serbia'),
(194, 'SC', 'Seychelles'),
(195, 'SL', 'Sierra Leone'),
(196, 'SG', 'Singapore'),
(197, 'SK', 'Slovakia'),
(198, 'SI', 'Slovenia'),
(199, 'SB', 'Solomon Islands'),
(200, 'SO', 'Somalia'),
(201, 'ZA', 'South Africa'),
(202, 'GS', 'South Georgia South Sandwich Islands'),
(203, 'SS', 'South Sudan'),
(204, 'ES', 'Spain'),
(205, 'LK', 'Sri Lanka'),
(206, 'SH', 'St. Helena'),
(207, 'PM', 'St. Pierre and Miquelon'),
(208, 'SD', 'Sudan'),
(209, 'SR', 'Suriname'),
(210, 'SJ', 'Svalbard and Jan Mayen Islands'),
(211, 'SZ', 'Swaziland'),
(212, 'SE', 'Sweden'),
(213, 'CH', 'Switzerland'),
(214, 'SY', 'Syrian Arab Republic'),
(215, 'TW', 'Taiwan'),
(216, 'TJ', 'Tajikistan'),
(217, 'TZ', 'Tanzania, United Republic of'),
(218, 'TH', 'Thailand'),
(219, 'TG', 'Togo'),
(220, 'TK', 'Tokelau'),
(221, 'TO', 'Tonga'),
(222, 'TT', 'Trinidad and Tobago'),
(223, 'TN', 'Tunisia'),
(224, 'TR', 'Turkey'),
(225, 'TM', 'Turkmenistan'),
(226, 'TC', 'Turks and Caicos Islands'),
(227, 'TV', 'Tuvalu'),
(228, 'UG', 'Uganda'),
(229, 'UA', 'Ukraine'),
(230, 'AE', 'United Arab Emirates'),
(231, 'GB', 'United Kingdom'),
(232, 'US', 'United States'),
(233, 'UM', 'United States minor outlying islands'),
(234, 'UY', 'Uruguay'),
(235, 'UZ', 'Uzbekistan'),
(236, 'VU', 'Vanuatu'),
(237, 'VA', 'Vatican City State'),
(238, 'VE', 'Venezuela'),
(239, 'VN', 'Vietnam'),
(240, 'VG', 'Virgin Islands (British)'),
(241, 'VI', 'Virgin Islands (U.S.)'),
(242, 'WF', 'Wallis and Futuna Islands'),
(243, 'EH', 'Western Sahara'),
(244, 'YE', 'Yemen'),
(245, 'ZM', 'Zambia'),
(246, 'ZW', 'Zimbabwe');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `coupons`
--

CREATE TABLE `coupons` (
  `id` int(11) NOT NULL,
  `code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` tinyint(4) NOT NULL,
  `price` double NOT NULL,
  `times` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `used` int(191) UNSIGNED NOT NULL DEFAULT 0,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `coupons`
--

INSERT INTO `coupons` (`id`, `code`, `type`, `price`, `times`, `used`, `status`, `start_date`, `end_date`) VALUES
(1, 'eqwe', 1, 12.22, '989', 19, 1, '2019-01-15', '2026-08-20'),
(2, 'sdsdsasd', 0, 11, NULL, 2, 1, '2019-05-23', '2022-05-26'),
(3, 'werwd', 0, 22, NULL, 3, 1, '2019-05-23', '2023-06-08'),
(4, 'asdasd', 1, 23.5, NULL, 1, 1, '2019-05-23', '2020-05-28'),
(6, 'rererere', 1, 9, '665', 1, 1, '2019-05-23', '2022-05-26');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `currencies`
--

CREATE TABLE `currencies` (
  `id` int(191) NOT NULL,
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sign` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` double NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `currencies`
--

INSERT INTO `currencies` (`id`, `name`, `sign`, `value`, `is_default`) VALUES
(1, 'USD', '$', 1, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `email_templates`
--

CREATE TABLE `email_templates` (
  `id` int(11) NOT NULL,
  `email_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email_subject` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `email_body` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `email_templates`
--

INSERT INTO `email_templates` (`id`, `email_type`, `email_subject`, `email_body`, `status`) VALUES
(1, 'new_order', 'Your Order Placed Successfully', '<p>Hello {customer_name},<br>Your Order Number is {order_number}<br>Your order has been placed successfully</p>', 1),
(2, 'new_registration', 'Welcome To Royal Commerce', '<p>Hello {customer_name},<br>You have successfully registered to {website_title}, We wish you will have a wonderful experience using our service.</p><p>Thank You<br></p>', 1),
(3, 'vendor_accept', 'Your Vendor Account Activated', '<p>Hello {customer_name},<br>Your Vendor Account Activated Successfully. Please Login to your account and build your own shop.</p><p>Thank You<br></p>', 1),
(4, 'subscription_warning', 'Your subscrption plan will end after five days', '<p>Hello {customer_name},<br>Your subscription plan duration will end after five days. Please renew your plan otherwise all of your products will be deactivated.</p><p>Thank You<br></p>', 1),
(5, 'vendor_verification', 'Request for verification.', '<p>Hello {customer_name},<br>You are requested verify your account. Please send us photo of your passport.</p><p>Thank You<br></p>', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `faqs`
--

CREATE TABLE `faqs` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `faqs`
--

INSERT INTO `faqs` (`id`, `title`, `details`, `status`) VALUES
(1, 'Right my front it wound cause fully', '<span style=\"font-size: 16px;\">For the smile, the servant, and, the door, and, some, and, the smile. Each policy Pure diesel in bulk. Aeneas on the foot. The boat and the free and the land of the kids always. But as well as the cat. But it is convenient, who adorns the lacinium with a large one, than before some one, unless, with the arrows of the pure venomous lion of God.</span><br>', 1),
(3, 'Man particular insensible celebrated', '<span style=\"font-size: 16px;\">For the smile, the servant, and, the door, and, some, and, the smile. Each policy Pure diesel in bulk. Aeneas on the foot. The boat and the free and the land of the kids always. But as well as the cat. But it is convenient, who adorns the lacinium with a large one, than before some one, unless, with the arrows of the pure venomous lion of God.</span><br>', 1),
(4, 'Civilly why how end viewing related', '<span style=\"font-size: 16px;\">For the smile, the servant, and, the door, and, some, and, the smile. Each policy Pure diesel in bulk. Aeneas on the foot. The boat and the free and the land of the kids always. But as well as the cat. But it is convenient, who adorns the lacinium with a large one, than before some one, unless, with the arrows of the pure venomous lion of God.</span><br>', 0),
(5, 'Six started far placing saw respect', '<span style=\"color: rgb(70, 85, 65); font-family: \" open=\"\" sans\",=\"\" sans-serif;=\"\" font-size:=\"\" 16px;\"=\"\">For the smile, the servant, and, the door, and, some, and, the smile. Each policy Pure diesel in bulk. Aeneas on the foot. The boat and the free and the land of the kids always. But as well as the cat. But it is convenient, who adorns the lacinium with a large one, than before some one, unless, with the arrows of the pure venomous lion of God.</span><br>', 0),
(6, 'She jointure goodness interest debat', '<div style=\"text-align: center;\"><div style=\"text-align: center;\">For the smile, the servant, and, the door, and, some, and, the smile. Each policy Pure diesel in bulk. Aeneas on the foot. The boat and the free and the land of the kids always. But as well as the cat. But it is convenient, who adorns the lacinium with a large one, than before some one, unless, with the arrows of the pure venomous lion of God.<br></div></div>', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `favorite_sellers`
--

CREATE TABLE `favorite_sellers` (
  `id` int(191) NOT NULL,
  `user_id` int(191) NOT NULL,
  `vendor_id` int(191) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `favorite_sellers`
--

INSERT INTO `favorite_sellers` (`id`, `user_id`, `vendor_id`) VALUES
(2, 29, 13),
(3, 32, 32);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `galleries`
--

CREATE TABLE `galleries` (
  `id` int(191) UNSIGNED NOT NULL,
  `product_id` int(191) UNSIGNED NOT NULL,
  `photo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `galleries`
--

INSERT INTO `galleries` (`id`, `product_id`, `photo`) VALUES
(125, 122, '1568027503rFK94cnU.jpg'),
(126, 122, '1568027503i1X2FtIi.jpg'),
(127, 122, '156802750316jxawoZ.jpg'),
(128, 122, '1568027503QRBf290F.jpg'),
(129, 121, '1568027539SQqUc8Bu.jpg'),
(130, 121, '1568027539Zs5OTzjq.jpg'),
(131, 121, '1568027539C45VRZq1.jpg'),
(132, 121, '15680275398ovCzFnJ.jpg'),
(133, 120, '1568027565bJgX744G.jpg'),
(134, 120, '1568027565j0RPFUgX.jpg'),
(135, 120, '1568027565QGi6Lhyo.jpg'),
(136, 120, '15680275658MAY3VKp.jpg'),
(137, 119, '1568027610p9R6ivC6.jpg'),
(138, 119, '1568027610t2Aq7E5D.jpg'),
(139, 119, '1568027611ikz4n0fx.jpg'),
(140, 119, '15680276117BLgrCub.jpg'),
(141, 118, '156802763634t0c8tG.jpg'),
(142, 118, '1568027636fuJplSf3.jpg'),
(143, 118, '1568027636MXcgCQHU.jpg'),
(144, 118, '1568027636lfexGTpt.jpg'),
(145, 117, '1568027665rFHWlsAJ.jpg'),
(146, 117, '15680276655LPktA9k.jpg'),
(147, 117, '1568027665vcNWWq3u.jpg'),
(148, 117, '1568027665gQnqKhCw.jpg'),
(149, 116, '1568027692FPQpwtWN.jpg'),
(150, 116, '1568027692zBaGjOIC.jpg'),
(151, 116, '1568027692UXpDx63F.jpg'),
(152, 116, '1568027692KdIWbIGK.jpg'),
(153, 95, '1568027743xS8gHocM.jpg'),
(154, 95, '1568027743aVUOljdD.jpg'),
(155, 95, '156802774327OOA1Zj.jpg'),
(156, 95, '1568027743kGBx6mxa.jpg'),
(231, 183, '1668606592cartimg1.jpg'),
(232, 184, '1668607183MJ6119-B16_45-1-scaled.jpg'),
(233, 186, '1668625196Bongtaidai4.PNG'),
(234, 199, '1668626163b6f7275e67742f88114d840d34f6752a.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `generalsettings`
--

CREATE TABLE `generalsettings` (
  `id` int(191) NOT NULL,
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `favicon` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `header_email` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `header_phone` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `footer` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `copyright` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `colors` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `loader` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin_loader` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_talkto` tinyint(1) NOT NULL DEFAULT 1,
  `talkto` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_language` tinyint(1) NOT NULL DEFAULT 1,
  `is_loader` tinyint(1) NOT NULL DEFAULT 1,
  `map_key` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_disqus` tinyint(1) NOT NULL DEFAULT 0,
  `disqus` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_contact` tinyint(1) NOT NULL DEFAULT 0,
  `is_faq` tinyint(1) NOT NULL DEFAULT 0,
  `guest_checkout` tinyint(1) NOT NULL DEFAULT 0,
  `stripe_check` tinyint(1) NOT NULL DEFAULT 0,
  `cod_check` tinyint(1) NOT NULL DEFAULT 0,
  `stripe_key` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stripe_secret` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_format` tinyint(1) NOT NULL DEFAULT 0,
  `withdraw_fee` double NOT NULL DEFAULT 0,
  `withdraw_charge` double NOT NULL DEFAULT 0,
  `tax` double NOT NULL DEFAULT 0,
  `shipping_cost` double NOT NULL DEFAULT 0,
  `smtp_host` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `smtp_port` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `smtp_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `smtp_pass` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `from_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `from_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_smtp` tinyint(1) NOT NULL DEFAULT 0,
  `is_comment` tinyint(1) NOT NULL DEFAULT 1,
  `is_currency` tinyint(1) NOT NULL DEFAULT 1,
  `add_cart` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `out_stock` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `add_wish` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `already_wish` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wish_remove` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `add_compare` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `already_compare` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `compare_remove` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color_change` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coupon_found` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `no_coupon` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `already_coupon` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_title` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_text` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_affilate` tinyint(1) NOT NULL DEFAULT 1,
  `affilate_charge` int(100) NOT NULL DEFAULT 0,
  `affilate_banner` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `already_cart` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fixed_commission` double NOT NULL DEFAULT 0,
  `percentage_commission` double NOT NULL DEFAULT 0,
  `multiple_shipping` tinyint(1) NOT NULL DEFAULT 0,
  `multiple_packaging` tinyint(4) NOT NULL DEFAULT 0,
  `vendor_ship_info` tinyint(1) NOT NULL DEFAULT 0,
  `reg_vendor` tinyint(1) NOT NULL DEFAULT 0,
  `cod_text` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paypal_text` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stripe_text` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `header_color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `footer_color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `copyright_color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_admin_loader` tinyint(1) NOT NULL DEFAULT 0,
  `menu_color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `menu_hover_color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_home` tinyint(1) NOT NULL DEFAULT 0,
  `is_verification_email` tinyint(1) NOT NULL DEFAULT 0,
  `instamojo_key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instamojo_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instamojo_text` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_instamojo` tinyint(1) NOT NULL DEFAULT 0,
  `instamojo_sandbox` tinyint(1) NOT NULL DEFAULT 0,
  `is_paystack` tinyint(1) NOT NULL DEFAULT 0,
  `paystack_key` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paystack_email` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paystack_text` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wholesell` int(191) NOT NULL DEFAULT 0,
  `is_capcha` tinyint(1) NOT NULL DEFAULT 0,
  `error_banner` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_popup` tinyint(1) NOT NULL DEFAULT 0,
  `popup_title` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `popup_text` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `popup_background` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vendor_color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_secure` tinyint(1) NOT NULL DEFAULT 0,
  `is_report` tinyint(1) NOT NULL,
  `paypal_check` tinyint(1) DEFAULT 0,
  `paypal_business` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `footer_logo` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_encryption` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paytm_merchant` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paytm_secret` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paytm_website` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paytm_industry` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_paytm` int(11) NOT NULL DEFAULT 1,
  `paytm_text` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paytm_mode` enum('sandbox','live') CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `is_molly` tinyint(1) NOT NULL DEFAULT 0,
  `molly_key` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `molly_text` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_razorpay` int(11) NOT NULL DEFAULT 1,
  `razorpay_key` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `razorpay_secret` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `razorpay_text` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_stock` tinyint(1) NOT NULL DEFAULT 0,
  `is_maintain` tinyint(1) NOT NULL DEFAULT 0,
  `maintain_text` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `generalsettings`
--

INSERT INTO `generalsettings` (`id`, `logo`, `favicon`, `title`, `header_email`, `header_phone`, `footer`, `copyright`, `colors`, `loader`, `admin_loader`, `is_talkto`, `talkto`, `is_language`, `is_loader`, `map_key`, `is_disqus`, `disqus`, `is_contact`, `is_faq`, `guest_checkout`, `stripe_check`, `cod_check`, `stripe_key`, `stripe_secret`, `currency_format`, `withdraw_fee`, `withdraw_charge`, `tax`, `shipping_cost`, `smtp_host`, `smtp_port`, `smtp_user`, `smtp_pass`, `from_email`, `from_name`, `is_smtp`, `is_comment`, `is_currency`, `add_cart`, `out_stock`, `add_wish`, `already_wish`, `wish_remove`, `add_compare`, `already_compare`, `compare_remove`, `color_change`, `coupon_found`, `no_coupon`, `already_coupon`, `order_title`, `order_text`, `is_affilate`, `affilate_charge`, `affilate_banner`, `already_cart`, `fixed_commission`, `percentage_commission`, `multiple_shipping`, `multiple_packaging`, `vendor_ship_info`, `reg_vendor`, `cod_text`, `paypal_text`, `stripe_text`, `header_color`, `footer_color`, `copyright_color`, `is_admin_loader`, `menu_color`, `menu_hover_color`, `is_home`, `is_verification_email`, `instamojo_key`, `instamojo_token`, `instamojo_text`, `is_instamojo`, `instamojo_sandbox`, `is_paystack`, `paystack_key`, `paystack_email`, `paystack_text`, `wholesell`, `is_capcha`, `error_banner`, `is_popup`, `popup_title`, `popup_text`, `popup_background`, `invoice_logo`, `user_image`, `vendor_color`, `is_secure`, `is_report`, `paypal_check`, `paypal_business`, `footer_logo`, `email_encryption`, `paytm_merchant`, `paytm_secret`, `paytm_website`, `paytm_industry`, `is_paytm`, `paytm_text`, `paytm_mode`, `is_molly`, `molly_key`, `molly_text`, `is_razorpay`, `razorpay_key`, `razorpay_secret`, `razorpay_text`, `show_stock`, `is_maintain`, `maintain_text`) VALUES
(1, '16686561171571567295logo.png', '1571567283favicon.png', 'Genius Cart', 'smtp', '0123 456789', 'Buying on GeniusShop is always an impressive experience. All information about the seller and the buyer is absolutely confidential. Payment transactions at GeniusShop are always guaranteed to be fast and safe. Another issue that makes customers always interested is whether buying on GeniusShop is guaranteed.', 'COPYRIGHT © 2022. All Rights Reserved By GeniusShop', '#0f78f2', '1564224328loading3.gif', '1564224329loading3.gif', 0, '<script type=\"text/javascript\">\r\nvar Tawk_API=Tawk_API||{}, Tawk_LoadStart=new Date();\r\n(function(){\r\nvar s1=document.createElement(\"script\"),s0=document.getElementsByTagName(\"script\")[0];\r\ns1.async=true;\r\ns1.src=\'https://embed.tawk.to/5bc2019c61d0b77092512d03/default\';\r\ns1.charset=\'UTF-8\';\r\ns1.setAttribute(\'crossorigin\',\'*\');\r\ns0.parentNode.insertBefore(s1,s0);\r\n})();\r\n</script>', 1, 1, 'AIzaSyB1GpE4qeoJ__70UZxvX9CTMUTZRZNHcu8', 0, '<div id=\"disqus_thread\">         \r\n    <script>\r\n    /**\r\n    *  RECOMMENDED CONFIGURATION VARIABLES: EDIT AND UNCOMMENT THE SECTION BELOW TO INSERT DYNAMIC VALUES FROM YOUR PLATFORM OR CMS.\r\n    *  LEARN WHY DEFINING THESE VARIABLES IS IMPORTANT: https://disqus.com/admin/universalcode/#configuration-variables*/\r\n    /*\r\n    var disqus_config = function () {\r\n    this.page.url = PAGE_URL;  // Replace PAGE_URL with your page\'s canonical URL variable\r\n    this.page.identifier = PAGE_IDENTIFIER; // Replace PAGE_IDENTIFIER with your page\'s unique identifier variable\r\n    };\r\n    */\r\n    (function() { // DON\'T EDIT BELOW THIS LINE\r\n    var d = document, s = d.createElement(\'script\');\r\n    s.src = \'https://junnun.disqus.com/embed.js\';\r\n    s.setAttribute(\'data-timestamp\', +new Date());\r\n    (d.head || d.body).appendChild(s);\r\n    })();\r\n    </script>\r\n    <noscript>Please enable JavaScript to view the <a href=\"https://disqus.com/?ref_noscript\">comments powered by Disqus.</a></noscript>\r\n    </div>', 1, 1, 1, 0, 1, 'pk_test_UnU1Coi1p5qFGwtpjZMRMgJM', 'sk_test_QQcg3vGsKRPlW6T3dXcNJsor', 0, 5, 5, 0, 5, 'smtp.gmail.com', '587', 'huudiem2510@gmail.com', 'upwcjammlnijtpbd', 'huudiem2510@gmail.com', 'Genius', 1, 1, 1, 'Successfully Added To Cart', 'Out Of Stock', 'Add To Wishlist', 'Already Added To Wishlist', 'Successfully Removed From The Wishlist', 'Successfully Added To Compare', 'Already Added To Compare', 'Successfully Removed From The Compare', 'Successfully Changed The Color', 'Coupon Found', 'No Coupon Found', 'Coupon Already Applied', 'THANK YOU FOR YOUR PURCHASE.', 'We\'ll email you an order confirmation with details and tracking info.', 1, 8, '15587771131554048228onepiece.jpeg', 'Already Added To Cart', 5, 5, 1, 1, 1, 1, 'Pay with cash upon delivery.', 'Pay via your Credit Card.', 'Pay via your Credit Card.', '#ffffff', '#143250', '#02020c', 1, '#ff5500', '#02020c', 0, 0, 'test_172371aa837ae5cad6047dc3052', 'test_4ac5a785e25fc596b67dbc5c267', 'Pay via your Instamojo account.', 0, 0, 0, 'pk_test_162a56d42131cbb01932ed0d2c48f9cb99d8e8e2', 'junnuns@gmail.com', 'Pay via your Paystack account.', 6, 1, '1566878455404.png', 1, 'NEWSLETTER', 'Pain is important, and it will be followed by obesity tomorrow.', '1584934329adv-banner.jpg', '1571567295logo.png', '1567655174profile.jpg', '#725959', 0, 1, 1, 'nguyenniem0702@gmail.com', '1571567309footers.png', 'tls', 'tkogux49985047638244', 'LhNGUUKE9xCQ9xY8', 'WEBSTAGING', 'Retail', 0, 'Pay via your Paytm account.', 'live', 0, 'test_5HcWVs9qc5pzy36H9Tu9mwAyats33J', 'Pay with Molly Payment.', 0, 'rzp_test_xDH74d48cwl8DF', 'cr0H1BiQ20hVzhpHfHuNbGri', 'Pay via your Razorpay account.', 0, 0, '<div style=\"text-align: center;\"><font size=\"5\"><br></font></div><h1 style=\"text-align: center;\"><font size=\"6\">UNDER MAINTENANCE</font></h1>');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `languages`
--

CREATE TABLE `languages` (
  `id` int(191) NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `language` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `languages`
--

INSERT INTO `languages` (`id`, `is_default`, `language`, `file`) VALUES
(1, 1, 'English', '1579926860LzpDa1Y7.json');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `messages`
--

CREATE TABLE `messages` (
  `id` int(191) NOT NULL,
  `conversation_id` int(191) NOT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sent_user` int(191) DEFAULT NULL,
  `recieved_user` int(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `messages`
--

INSERT INTO `messages` (`id`, `conversation_id`, `message`, `sent_user`, `recieved_user`, `created_at`, `updated_at`) VALUES
(1, 1, 'hi', 32, NULL, '2022-11-16 07:01:25', '2022-11-16 07:01:25'),
(2, 1, 'hi', 32, NULL, '2022-11-16 07:01:26', '2022-11-16 07:01:26');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `notifications`
--

CREATE TABLE `notifications` (
  `id` int(191) NOT NULL,
  `order_id` int(191) UNSIGNED DEFAULT NULL,
  `user_id` int(191) DEFAULT NULL,
  `vendor_id` int(191) DEFAULT NULL,
  `product_id` int(191) DEFAULT NULL,
  `conversation_id` int(191) DEFAULT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `notifications`
--

INSERT INTO `notifications` (`id`, `order_id`, `user_id`, `vendor_id`, `product_id`, `conversation_id`, `is_read`, `created_at`, `updated_at`) VALUES
(35, NULL, 32, NULL, NULL, NULL, 1, '2022-11-16 06:41:00', '2022-11-16 06:42:24'),
(36, 22, NULL, NULL, NULL, NULL, 1, '2022-11-16 07:14:19', '2022-11-16 07:30:00');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(191) DEFAULT NULL,
  `cart` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pickup_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `totalQty` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `pay_amount` float NOT NULL,
  `txnid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `charge_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_number` varchar(255) NOT NULL,
  `payment_status` varchar(255) NOT NULL,
  `customer_email` varchar(255) NOT NULL,
  `customer_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `customer_country` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_phone` varchar(255) NOT NULL,
  `customer_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `customer_city` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `customer_zip` varchar(255) DEFAULT NULL,
  `shipping_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `shipping_country` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `shipping_phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `shipping_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `shipping_city` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `shipping_zip` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `order_note` text CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `coupon_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coupon_discount` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('pending','processing','completed','declined','on delivery') NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `affilate_user` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `affilate_charge` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_sign` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_value` double NOT NULL,
  `shipping_cost` double NOT NULL,
  `packing_cost` double NOT NULL DEFAULT 0,
  `tax` int(191) NOT NULL,
  `dp` tinyint(1) NOT NULL DEFAULT 0,
  `pay_id` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vendor_shipping_id` int(191) NOT NULL DEFAULT 0,
  `vendor_packing_id` int(191) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `cart`, `method`, `shipping`, `pickup_location`, `totalQty`, `pay_amount`, `txnid`, `charge_id`, `order_number`, `payment_status`, `customer_email`, `customer_name`, `customer_country`, `customer_phone`, `customer_address`, `customer_city`, `customer_zip`, `shipping_name`, `shipping_country`, `shipping_email`, `shipping_phone`, `shipping_address`, `shipping_city`, `shipping_zip`, `order_note`, `coupon_code`, `coupon_discount`, `status`, `created_at`, `updated_at`, `affilate_user`, `affilate_charge`, `currency_sign`, `currency_value`, `shipping_cost`, `packing_cost`, `tax`, `dp`, `pay_id`, `vendor_shipping_id`, `vendor_packing_id`) VALUES
(22, 29, 'BZh91AY&SYçÏv.\0ÃßP\0ø;üÄ¿ÿÿúP¹¼c;¡¬ºJ{SjHý(ôÐ\0\04Ð\0	@&¦U?T7ª\0\0\0\0\0\0 \0\0CM44\0s\0ÉÂ`C\0F\0$&Bi0LLõ\Z¡êz5\0Ójy2I$(:$ûö{ p},ä8øìÞ0ÐÎ!!G	[7eB\\9Z§(69ÆV!_e61Ê©iBïxÚe¯ð¦iià¸c#1×Í8.3üãnTÀÁ«t(@7æ£ÔÐ`>£³ÌK0PvI	vÒK¹¤$k;Jài¡¶­f¨ÄÆ®f®ðVLÕëÇ¨D\"ÀPC+kÑ¶KYsVwMdACZ»¹§òn4h\";VØEH&]Þ!|dQáó¸¦7IRÇÊ08ÂnReªºE¶Ä`nYh¤@b.ÛaIÉPîá7T#Ø(DêP¡%UuÓ/TTÒ/ñ	|×HBm°ª>U(!T0Yr%ú#uMA¤%HÈ0#2Àl°Cc7-R¶$ª,lw0Ø&	ç$Ëp¼AÄFÆppä°Æ1­6ÆaÌÓ]j	²**ê²­rFvº¡Md/h6ML³Ü9aÈL{Fð^C¼øq#bgæXø\"»äwõyØÎyÊ%ß¨õØy¬Ï6ÅÜÕÃÒ­£H 1ú¹_ØÏ#ÐY¨8#ÄÃ úNB6ÂÔÐËPrÃòBW9æF¶bâÅæbü#Ö\r¨ÀuWô:kLÇAvY@EC(Øf£Ø¼rDXÉlÛÎÛ7N·ÜLe¥FÜÅZ«Ðè5\Zf\"CÒÌBWäHª*h&9<±\"Wm6/¸Ýø\Zò(35)ìYy¦ði69â5<Ãx>°UÌ»uÚØ!q©µi§jLârë¸ái¤äX¯%6°¾´ª&3æIj	gBó7 ÏcVâúê5ÑÀÀÖWQÃsZ#&³Ü)Qãî1úK#@ÃØaBGa]NIL&X¤8¡©ià-\Z\Zeh}\\¥¦Ts\rKpØÂb)J¡ü^òÙIÈWy\\R¥¬!2+G\ZËMm)Á\rp4°HRð\nJ¡°KSv=îâÍö£Ä\0\"F/*21FÒ´lICImn&i3YmSR[ÅEØ^V¦rFxÆML[´A[ke!ØÞe|ªZÉ¤`²P1K¦(L²°Ub=h¡0­Q]©{0¶qÜ_G\0Ü&L½7Bº¥ðíòB¾br»ì(Ä±U÷?´çÔõ\\¹¡6\r/ñw$S	|÷bà', 'Cash On Delivery', 'shipto', 'Azampur', '1', 26, NULL, NULL, 'bbzM8t5mGs', 'Completed', 'huudiem2510@gmail.com', 'Hữu Điểm', 'Bahamas', '0971894618', 'hcm', 'hồ chí minh', '09883', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'completed', '2022-11-16 07:14:19', '2022-11-16 07:20:13', NULL, NULL, '$', 1, 0, 0, 0, 0, NULL, 0, 0),
(23, 29, 'BZh91AY&SY÷$b\0ÃßP\0ø;üÄ¿ÿÿúP¼Ã±ºe@))íIé<£ÓÕ0h \Z\0PTÐÚ\0\0Ð\0\0\0!	)¨F\0\0\0ÓL\0À2`0&ÀI 	&E=@hzM L¤E#x7Ä%÷ì÷!8H}hå8øèØ³S\\CiÕâHÝÉ#å¸\Z9Á,#kì¦ÃÜs*ZP¼âM¦[?\noKLçf23_ÕBó?Äï:²ºÅ®ãrÇx ÀÖzBlÖvó°.luÐÂcHHê\" Ài¡[mµ¬`\r-ÊWa\0ÛJò³Ç4;Lh5XjÕ&K¥wL´Á°Ìª¥òp`&ÂÞ¦¬,M]VëÆyBEG\"+)¡!ÁÊ$0q0¡ÂÇN\"vªs)\ZâÁnqÌ1KÆºÀ¤d¨EFwpªð!ÕìÂÞ¶ZÕ,é	}à(Bm`6°*CçÓ	Cj-6C¿Bi¾±0Q&Ð&®#@Ø`Ç¤ÒðÐbÄ@K{#ä1MÜ¶²`.ãnÂåïg 5lhÓ\ZÓlooLnº(Õ©ªm·VÚH­²¨S[¦mÑI©|gv¿hÂ§×òiö8&y2§â!{¾gÀÀøQæ>FsÌÎPñ/ý°ï±\'¬ðhy;Ú¼`ÚT¬j¦?Sõ3Ëùæzbé5#âxÐ}F&qOáq5\"¨ÄwkÐÎ\\m1~ä%3¦i¤l`f/*`f0°\\B=`êEEí\0Ó`~fV¡¦ãÐ_PRPË#\nÖ{¸Huì\n?\'I9:q{Qð,Q,UXí0å=\rÂÅÃL°¤Hà¬³9(\ZGPÊÇCÃ%6OPMrV?#Z_Â{HºîXm.:b5;\0 {¾¡S2ï=×rC`ÊRÒ!äÈçÙy-âÕ#QÌ©f!\"Jm[\n]DLgöIk	gBù\rÀÏc^ó\nk5úÍXØSYÇ{V#&³Þ)Ü\\õØ+®ð-åe¢¦Ðae*¦o°a0]àUZÆ¥WiÖ!¦Rà©oá5ª3dè\Z£¦¸b¼_\'JÑ¬4!iYÊdS§jðo\"°q¤°ÜØ®k¥aBaa â4¨H597ãÛÂþLáX8Àí14oCM1cC\ZP16M(i0bM­äÍFc¯.¨EÚÒà+iJÈ@A2hdBß¦B½NC©ÀË	P­SH²É@Æ@^X´·EÄÊª#Ø(5Ü³\nçø-æäq\rÁ	MMEäFÒ^CÝ°Gì2¢ocD j^ã\'õ:Ð¾AÏD&Á°!ÿ¹\"(H{±\0', 'Paypal', 'shipto', 'Azampur', '1', 13.78, NULL, NULL, 'tmRguwXEVj', 'Pending', 'huudiem2510@gmail.com', 'Huu Diem', 'French Southern Territories', '0971894618', 'hcm', 'ho chi minh', '09883', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'eqwe', '12.22', 'pending', '2022-11-16 07:32:21', '2022-11-16 07:32:21', NULL, NULL, '$', 1, 0, 0, 0, 0, NULL, 0, 0),
(24, 29, 'BZh91AY&SY\"/ÕÝ\0ÃßP\0ø;üÄ¿ÿÿúPîÌ1CZgM®	£LQä5\r \0\Z(Ñ*zÔõ1h\0\0\0\0@SÔÒ\r\0\0\Z4\0`\00\0L`ÀRHL h44jh\r\r=L!ê1<¦K$ÒFGIñO\'í£à³ú¹òxx\\Åy)®AÄ:¢)yd{¡Îao²1Ð©iCº!32×øST´ÈÎo)vÆÖÆÝY³nrëbÔÝíz;pÑ¥LºSH³7y}\nó==©4J\'¡éº$îÂÐÌ&4Ç0\ZhbÓ]uµÁ¡¹Jòj0Ài^Vqâ\rim`Âæ©4],£6T±þMæ	°·¤Ón	°cÌº²ñQáÞºBnÉ$)cIea7j¡G.m±ÄÛZ)\"¶ÅXRB2EÔ\"£;¸EMÕö\nêõao\nZ­4³jÅ1r¡/ªüM lÐ6H|\"Úa @hmR¦ÈwhM7¾,CI¤4	«Ð:\n¢*½¾³äk¤!\'\Z=êSÝÌ6	`Å9Å2Û×|ä\"0æ5{aÛfÉ¨sTÆb°UZ¤®ÌÙÒ¶dæê6Ñ\n^`ÌRm2Ïr,é!1íSúñCï}Ël½Ï\'îïDú×kÖÍëÆ¶=íÏssz=cØ4b$tágTCKQ60°AJ=OuÞ\n{+5Ö7Ë;×{NGüÚ\\Öä-ÎöOfåÌNVµ`ÛÀx·0sµ¨þV5ïFËäsPØÔÉc=+:cEc3V*UÕÉdoÁØØäjÛ¶Å²]j`mgE§R®¯dQøq²ÚßHÆhL|ª&U1³âäs4`©MåËfWlZLÔí\\Æ1oU#+îø(²jBLZo|xÚÉyîSqà°çW]ËØ=\ZÕ/ÑÔ,®±1Ù=O¬îTDìÅÓ©.é)Øíóê]Å9nr»Y,óë.]/©¦xá^§øºp.Ýæêtú8qgåNa£W×Æekv%-¨]Sv¤½«µÊç®Á]w1lVY\n*kR¨:gP¥//Î*Éà£É¡ËÖøFRàd·Q%ªx3	Ì5?=pÙ¨ÈL\rcø¹%Ä3\r1²b¢â¥3UTNfV4å®k¥¡IdwFÎëà1Ä®`äÛ·Ë]9m\0i14oCM1cC\ZPI&Ä\ZLk))aI}WAcS©0lqnZ-¡¾,½kN;ìÖeÆ¬\nK-¦ì¾´TCI¹QF\n4iú­$2Íjæã\ZTîéF[ü§zöºÎZµ5[Ñ:¥{G¿q\0a>C6	½Íæ5­¯ðËã8»(_Á áÃ	°lÁÅÿrE8P\"/ÕÝ', 'Paypal', 'shipto', 'Azampur', '1', 26, NULL, NULL, 'ou7py8XkMF', 'Pending', 'huudiem2510@gmail.com', 'Hữu Điểm', 'Anguilla', '0971894618', 'hcm', 'ho chi minh', '09883', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'eqwe', NULL, 'pending', '2022-11-16 07:49:02', '2022-11-16 07:49:02', NULL, NULL, '$', 1, 0, 0, 0, 0, NULL, 0, 0),
(25, 29, 'BZh91AY&SYj`^Í\0ÃßP\0ø;üÄ¿ÿÿúPÉÌ	±t5¡¬Üí`I6ÉQéêM\0\0\0\0\Z) D*zÔÃP\0\0\0\0*e4\r442\0\0\0æ\0	\0	Á0\0\0$Â	¦IF¦ÐÓÔÂ£Êd²H½$dpDò~ÑJ>?«\'ÌW\"|0çÀ{Q!Æîëï.tRÏ·Ù\Zè]=1îm*?kjÝ\rå®ØÚØÛ«6mÎ]lZ½¯S§n\Z4©C¢ `êqIfàòo/¡^g§µ&Dô=7DØZ\Zêf²of!¨LîmÛ·GX	 ÒÍìCi Tºk³^MPÜ-\ZA A/qEËC&`y¨;%K H*¢#µù9, ¼2@0A\'v$M]!n  Ð¢(ÉdmÅ¶¯v\"Û,¾\'\0±Y&Y##¾/!m,í9¹dÏ7Y»\Z2&\ZpQ*l5Ü55q\rÎÃ7Õ¿HP3v8ÁS±ÃF;»kRÈYItÁª\n¢*½¾³äk¤!\'\Z=êS	0ø*JSï[äßA31®\rðHm66smCY[sU±fÍY(ÂmÖúJ|Ñ:é±jJ3¤M¶ÕO¡V®A-pâ<\'×ò{î\\ëd½î|Ù?wz\'Ö»^¶o^5±ïn{»Ñê¹½ÙK:`^-D`ÚTSé|®ðSÜñY®±¾YØö»Úr?æÒæ·$Ánw²{0_.brµ«ÞÅ¹­Gò´¯z6_#Æ¦LÛè`´yYÓ\Z+´±R¨~®HË#~ÆÇ#VÝ¶-ëSk<àú-:t!vG+¬¬ñóN4²Dcâ`¤À±Éáx¹Í*SD¹råYÛ5;W1[Õ`ËGSË%wO`MD¯7>F¼I\rcÊ{HÂè¸çW]ËØ=\ZÕ/ÑÔ,®±1Ù=O¬îTDìÅÓ©.é)Øíóê]Å9nr»Y,óë.]/©¦xá^§øºp.Ýæêtú8qgåNa£W×Æekv%-¨]Sv¤½«µÈÜÜæT9MG Ã$#y\rB//Î*Éà£É¡ËÖøFRàd¿I5ê¨2j®ka(\Zñ$t!i\\er+Sµ6Q\\8Ö\\k`¶k}¥¨vgÓQÎuÍãâP`æÛ·Âúèá8ÀåB+ÁK31$K4«B¹,´ö\r¡Ï8:|Mz¬êL\'¥[Ëhf¥//ZÓû5r§S¬\rÚFå1«ng55G¢YLfµsFÌq*wIô£-Ê~S={]g@bèèæ×}3¬lå-ýã\0>noI8Ý0º?â4ä8¸þ\n<<HÐPü]ÉáBA©{4', 'Paypal', 'shipto', 'Azampur', '1', 26, NULL, NULL, 'hNnYGykfW5', 'Pending', 'huudiem2510@gmail.com', 'Hữu Điểm', 'Djibouti', '0971894618', 'hcm', 'ho chi minh', '09883', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'eqwe', NULL, 'pending', '2022-11-16 07:50:37', '2022-11-16 07:50:37', NULL, NULL, '$', 1, 0, 0, 0, 0, NULL, 0, 0),
(26, 29, 'BZh91AY&SYxo\0ÃßP\0ø;üÄ¿ÿÿúP»=¬l@®²ä/	ö¤ôÉQéêM4A\r\0A) D)¨mM\Z\0\04dh\0( M@\0\0\0\09dÀa0L!#\0	M2h *~Djz\rSÉ¤ÊzJ-.áØ~Îò+sÏÎÃ$´¡C|Çµ9Ê\"ÓÝ~%ÂÎ\0¡Ô³í÷Fb8.ÆwL¶OkjÝ\råÈÌÈÎü\r\r/4øÇVs±f«Àà3|T£(¼}!l`1á,`8v\"íÜ¤ÈHHÜw`ÓCô¥.S`\r%<4Ô0`A@$¦¢¼TÁb@É0$%î(¹hdÌ7-rr, ºkòu, ¹	 BDÄD Æ;&®7lQCÉd²6âÛW»m_X¬Á,Î_¶vÜ²g¬Ý\r8(D6\ZîM\Z¸Fæaº&	\0	\0²¨î¦FPPD±¢ÖBvdÕ¦âJÒÅ\"m¡\n6\0Ø!±ë5¼5±%PâÀHødæ Ãà©*L\\5O½o}Î Æ¸7Á!¶ØÙÍ¶}\rf\rmÍVÅh^M²Vúa>htÍØµ%ÒM&Ûj§Ð«W ÇÄqCôãí$s*\\y2§à!}aï0=ôyCÈÐ¡à_úqÝbO*³¾\ráâïjñiR±°B¸~êi/ägæA¥ÊÀð-¨ÿÂF&¥27ë¾eÊEaæg´3BfóîBXÌ®HÜÀÈ¼©d#Ò¤XtXÐ\r6æjEj\Zæt25çT2aFm=H\\&!wG]ÖVx¸ç\ZY\"1ô0RC`IHØÃd÷f£qbcL°¤Hà¬²!,v(\ZÇPÊÇCÃ%6OPMrV?#Z_Â{HºîXo9=]c\0äÖ*d»¢íHlºPêC\ZD ¡Ú:wâ-6H:ñ	W5l):\"áÙ%´%¢ÌäpzxSi´>LÜÅ9}G>,aXd^Òñ\\_4DÜÝ8ÕSe¤È!ðâ	!¡ÅÞCPÂà¹.±Hp*­£BÁ³µíEÓ)0©oá5ª3dè\Z£¦¸b¼_\'JÑ¬4!iYÊdS§jðo\"°q¤°ÜØ®k¥a)(ÂÃ!AÌiP7lr(qÇÛÊþåX7@ëABMøR@ÂDd¨° ²7ËM#4Á­Irò\\5í0)CBE¹\\D.:àÄ+Ôà8u9á*ªiY¨ÈËqUP¢Ä{2à¥f»Rõa]~9ÃBW+QpDo%â>~Ã*&÷4At¢96¿Ä-Þ1`GðPÃ2T	O\"îH§\n\ró ', 'Paypal', 'shipto', 'Azampur', '1', 26, NULL, NULL, 'llQ5cPIBIx', 'Pending', 'huudiem2510@gmail.com', 'Hữu Điểm', 'Bangladesh', '0971894618', 'hcm', 'ho chi minh', '09883', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'eqwe', NULL, 'pending', '2022-11-16 07:53:53', '2022-11-16 07:53:53', NULL, NULL, '$', 1, 0, 0, 0, 0, NULL, 0, 0),
(27, 29, 'BZh91AY&SY4á¥\0ÃßP\0ø;üÄ¿ÿÿúP=¬,@®²ä!\"Ô#Ê==S	¦È2 \0h%4PÚ4\r\0Ð\0\0%4\0Ði¡\0\0\0\00\0L\0L&	0`\"BdÒheOÈOP\Z§H\r6§ÉB¥¢¥Ð¼\"ûÙÒÞQåaîyùØd\"saÏö¢9ÄC\Z}×Þ\\,Ü:}¾ÈÐPæë§¦1ó-¥Sçðm[³ÁÀ²ZÍxbbi6dTÀÓï;¬érí[Á\"ø©FQxû4BØÀcÂ.XÀqìEÛ¹IJF¸î!¦,+ZÍQ4 ðÓPÁ\0fðSY$À ¹.3Õ×\')rÈ¨j_¨Q@É«{!LDJ	<#±\"hèØsyâFH£% q·Ú½Ø3l²øÅfdLNrø¼´³´æå<DÝfìhÈ S¨ABnVLÅQS`¿´%ñ^a!	´\"eQÝM\n  #cE¬ìÉ«MÄ¥DÛB°CcÖkxê2bJÀ%ÅðÊN Ãà©*L\\UOÁpÎ Æ¸8A!¶ØÙÍ¶}\rf\rmÍVÅl^M²«}6O¥¶º]ÓRQ$Òm¶ªxÍ\nµr	l{Ì}x)÷i#bgæXñ</£ì=Æ\'º¯Að4F§ê=ÇuÉ=g|ÃÅàÖÒ­£` 1ú±¦_ÐÏ#Ð\'Y¨:óÀ¾£þ3	\ZÞw®úR*C= z\ZJÌÁ	bLöhFæÆ&G¬H¸ê±à\ZlÐÔX5Ðèh5gX2m>d.C!vGUÖVxù\'\ZY\"1ñ0RC`IHØÃdæ=\rFâåqH!Áih!,Fv*ÇPÊÇCÃ%6OPMrV?#Z_Â{HºîXo9({2\ZÌC>X«¡wEÚØ!t©Ô4ASµ&t;:ð%Ä[$l;uä$¦Õñ­*ø[BZP¼ÎG\0gÌÛÄÆ»M¡òfà.n+Ëê9ñcDt#\0$Ö3\n\"$FöëÈ¨r-$AI\r(G\Z	¥Ö)e´aê\\6s½¨º\Zeh-ü&µQ¦lTt×Wäé@Ú5FD0\r1²r9Lbí^\räP`V4Á\rr4®2¥%Üd(9*ò\rEN9{yaÑ­èa1I¿\nHc@ah\"¬µFùi¤f3µ©.^W!Q{LJÔÒB¸b1D\"pdêp¤;ñKY4¬ÔdËËPe`ªÈ{BaZ¢ív¥óam#?ÄÇ,ÎaÀ!)©¨ªàÞKÄ|7ýÆXMîh\"éDrm[¼bÀà¡$d	\0¨ñw$S	NP', 'Paypal', 'shipto', 'Azampur', '1', 26, NULL, NULL, 'Tl5merQpOG', 'Pending', 'huudiem2510@gmail.com', 'Hữu Điểm', 'American Samoa', '0971894618', 'hcm', 'ho chi minh', '09883', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'eqwe', NULL, 'pending', '2022-11-16 07:55:40', '2022-11-16 07:55:40', NULL, NULL, '$', 1, 0, 0, 0, 0, NULL, 0, 0),
(28, 33, 'BZh91AY&SYÆ\'ö¥\0ÃßP\0ø;üÄ¿ÿÿúP¾îÌ,fÝnº\ZËYÂSR\ZORGzz¦M\0\0\0\Z\0\0J\0Q)êÕ4Äh\0\0\0ÐÑ MH$¡ê\r=5\rHz@ê\09dÀa0L!#\0I0\Z)äÓI¦CCM0M©É#Åàýb{Ö7|_Ù00%Î$(øÖ(çÐè}*½è2kRÂ6ïºr1Ò©iKQs|Bi2ÙÐ¦´´ÈÎll_s{s~Í\Z89¶²lpö<ÏüukS>L@ÅÖêIhâðrP¯±ßÜT¢y÷<¸ÚÁXd$6ÊcÓM/0`Ú´¾-A\0¨Å¯lÀ°Þ!¬Ü¾âZ2bÓ67¼ACµ­0þM¦P»ÍÂäPD^ÖµÑ¼ê0T¾¾<j³zåÛ±YL×Y8Âo)5j¡G2q®,çÃH¸Ìk¬\nHFHÊTgw©Ê¡B\"Á!dt´ªD>È\"s§@8* (@µQï©@±\n  `²Ò¯£½b1vÔÄ\ZBTFeèLATER¹\\µ§#m$:¨H÷)IrÛl©*L·6l] ÚB\"Ü½lÙÈ\rÖÃÞ,¦ÈÀ±9ì#\"%i¨OIÔ%QKÞU\nk©\nfi¦YòEXrþ\nxÎ~Òô<ë»°{_&oÙëDú×sÒÑéÊ·=Îk\'°Ï¬vú%zÕGprÌ,j® Råx=îø)í|Öm¬°v½[^GüÞ]µÉ1[¡ê¬XK²9UópbèmQü-&MØHç¡¹±Fæ­x£Ue4V¶*UÑÉærâínr6oßbÙ¯jboi_E§Z^Ð£ðñ2âç^@¥üË%TKV»Lz7#«Jj]uY÷-&w.Ê2rÑ\nK4H}V§¹ð&ñ(6SdÌ{Ì±bæt+²ì¼U0Õ¡Ö,®µ2Ý<Ï¬òÈª\"väñE*E¡Ë%;]Þ=õ\'5ÜÎæk<{K¯0©®c`§ö¼â_O­ÒSèãÔÓ..\'ÆãW;.¿±ÙÕJ3µ»RØ/SÄÁ³³½9ãYÄv¶ tvÔØtIãKªÉâ£Á©ÍØ¼cX©L±+0û(Á¥2+9DÒæº\ZøÌLÐ4âlt!L7ó,Õ&Æ\ZÌHÊ×.^jStM¾¤ÕLm/ym5RÒÎÅIÐ³®ÉÕ·¿¯gm:ó£x0|)PAD\"0FJ,)$¦DEç¬äéö*ã\'Zc;Ú2ÉÁh,¶¦S³­:¹lÚ3X\\9\rú=¨©½QF\n55~»Ks3)µ\\ñ,£ZQô©?ÔÓn÷`Ú%ååi6Â¸Ëp»\n\nø¨±#QC4¼ÿ	~cøH·rÂ((Mþ.äp¡!OíJ', 'Paypal', 'shipto', 'Azampur', '3', 26, '5345345', NULL, 'CU7TiU2ysa', 'Pending', 'admin1@gmail.com', 'Vietnamese', 'Angola', '0971894618', 'hcm', 'ho chi minh', '09883', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'eqwe', NULL, 'pending', '2022-11-16 08:02:18', '2022-11-16 08:20:10', NULL, NULL, '$', 1, 0, 0, 0, 0, NULL, 0, 0),
(29, 33, 'BZh91AY&SY×cÐ\0ÃßP\0ø;üÄ¿ÿÿúP¼c±\0èu))íIé<£ÓÕ0h \Z\0P	©5\rê\0Ð\0\0@\0jH4\0h\0\0\r4h\0À2`0&À	\0&=F©äÒhSÒQ$0ÁÀBO±?g²GÎÏ¹ôúY¸ÃB[8ÄElÝqpßäª~ùA±Ì\r°¯²â©iCÂ!6kü)Zdg7(c#1×ÍX.3üó~TÀÁ«n7!\0PâpDÏSHMúÞX	ì;d»©¥£HHØwÓCÕ­f¨Á\ZÆ®nÖÙÄ4²f°Íxv°ÊÚômã V\\Õ&² ¡­]ÜÓù:PÇjÛ Ë»Æ)àQáÞyâà89ÄI#\nXãYCN&Z¨QË¤[lFq6åD¦\"í±Vu¨ÎîSuB=\\ÍÁFt\\Ý6Û\rù©®9!\'Ö~ÈE ,êJU(È¥Û#©SPi	R2Ì¢0\0lØô]úX°	p`$|F2îa°L)Î9Ýwy9àÝÈ\ra\ZcZmÃ¦2º(Ô¥aRT×m¤çj¡Mh/h6ML³Ü9aÈL{ð^3Ê{¸È±3Ìú<êúòóßWøÏ39SÄ»õÃ¿O5áÐòw5pÁ´«hÔ!L~§ìgò3Ìô ÅÖjgÀñ0ÐÆA#B¡OáBjECQèe¬C9CiÃ÷!+É¦±¸±y¿\0¡õz0UãÂ¦Àý\rµMfcAvY@EC(Øf³ØÄrDXÉmßÎÛxN·ÜLe~EJ6*¹µV=Ç¡ Ø`Pi\nDK1	^3¡\"¨©¤u¬t<1\"Sdõ×%iÃò5¨ÈÕü\'¹T®åÑò2f#SÀ¼8Ýö\n¹yõ]É\r:ÐÆ*w$ÎgN»p©\Z:ñ	SkëJ¢c?²KXK:Ðân{\Zø×Y¬>lØÂ¼z\\ÂÑÄÈ¸	5áLºÍrúÎ57¦QeÖêÂåÐÚp4!0]bàVZÆ¦«´ëFi X·ðÕDF²t\rQÓ\\1^/¥hÖI\Z	À4ÆÉÈ,å2)Sµx7AX8ÒXnlW5ÈÒÀe!JJ/Àd(9\r*Ò\rNENöñ»8Ú\0àD_TdcJ&ÒI±%\r&IµÀ¨Ìue¾MiqiyZÈ@Aã4A2!pÓ!mîcò©k&É@Æ@\\`a-ÑBe«ìE	j\ZîKÙ³üWür9à¦¦¢«r#i/!îØ@#ä2ÂocDÅÝü&xNçbøH<=ÈEjÅÜN$5Øô@', 'Paypal', 'shipto', 'Azampur', '1', 26, NULL, NULL, 'lfGYrlNUxA', 'Pending', 'admin1@gmail.com', 'Vietnamese', 'Albania', '0971894618', 'hcm', 'ho chi minh', '09883', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'eqwe', NULL, 'pending', '2022-11-16 08:08:44', '2022-11-16 08:08:44', NULL, NULL, '$', 1, 0, 0, 0, 0, NULL, 0, 0),
(30, 33, 'BZh91AY&SY©m\0à_@\0Psø?[ö¿ïÿúPù¼\Z3¦\0(#b`00\0	\02i& \0\0\0\0\0\0MQé©¦ÔÄÓLÑ!¦HÐõÍ10\0\0\0À\0L\"&4ÓÔ¦£Ôa3Põ3jIÄë:DMå\0I(.	ØQø¥,×¼îÏgÁKf±!GØ¬²b\\qêÌÁqW\'²´fÈµe;Ä._õÙÚCrwj\\®\ræÖ>Çì|<0a×Í ¡èv#ÌÈfòND¡¼ï1î4½&Ðõ%îß¬Öjù¦¤ÌzÌ\ZhbÓM4¢«7EÆHDZ\0ÛJi*ËDÂ,+0e°H¤\rMæ¼)Q0	&Ô\ZKT(PaGX­$Àd2Â£ÊVfßV5Ìf9|\n f	 ©ÄÉ!*¬É4´1tñ­IA¢pPYªÓ@Ir¥ê\\¡Vfæ*d böDHlf\\\\Á¢}3ï?2Y°Ä®ÆX±ª)Ëb)E ó*\r$*FDAÅ	ÐH\n:M.}ÃBH²HJÌc)IÑb´+BÖkÇ¥S7¾v9I\Z^\ri¤k)\nÈ ÇQ(Õ¥¬ã%ïz ¦»ÎGjQa×øO2åBçõBT=£úúeæOÈ|óWù3|Ý°Á´¯Þ*`}§ÈÞ½bm	¸$Ðø<Æ!gÎt3\rI>ÇR;øÔ¢áÔh:õ©ó*v\Z>#¼©cå­9°5,fhje¸*B>ÐlÇt²p\r\r/pãCÄÐÞ[rÝ&P93xàæ}É]ÃKó=CÃÇf¾W.TdAs,Ø°6äXº¹ûCÖfTiI$pbwC<É.¾§£87ÝSw*jnÞÃôÿPxùºwAÐÉÝ|Pòbjp`6\r>ÏQk²ö^¤%Ýc ±è;ûPï+°ouô.s<MÄxZß»ÐÊÙ\"£=\nxSø3?3ËÙÙÜg^³¨bö½þ\'§z1*$óp%­d.&^¨\'rÁ=B\n¥B¡B{Ë^¥dugQ+yPª^áHà[XÃø7×ä-9£44ËÔ0z~äø¬¬4ÌÖ_Ûy3Sb©A¼èìøèGÓ*w¾&Y*5¨lw&r\"Úªq5ôif2°¥J#<ÆBÀi\\9qr\\íÓßµ¼¶>H?c@ÆùÒ #Äd(H²\0°\ZL&×ic¸Û^õ%°ª½å¬47ä`c((D.ÕÆÃwGRÆ¹NbÁI¤JÕ@Æ@XÌÎ{\"§y@©È0·*P2É\Z5ðKîÃ|ö2ÓSÀ	QQE×DG#î|ÒßqíÐ?bBCp¡ö´A\'ØÐ`fÖSâ&5i÷	V®XEjÅÜN$\'#ê[@', 'Paypal', 'shipto', 'Azampur', '1', 57.5, NULL, NULL, 'cl21CD66WW', 'Pending', 'admin1@gmail.com', 'Vietnamese', 'Bahamas', '0971894618', 'hcm', 'ho chi minh', '09883', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'eqwe', NULL, 'pending', '2022-11-16 08:14:20', '2022-11-16 08:14:20', NULL, NULL, '$', 1, 0, 0, 0, 1, NULL, 0, 0),
(31, 33, 'BZh91AY&SY©m\0à_@\0Psø?[ö¿ïÿúPù¼\Z3¦\0(#b`00\0	\02i& \0\0\0\0\0\0MQé©¦ÔÄÓLÑ!¦HÐõÍ10\0\0\0À\0L\"&4ÓÔ¦£Ôa3Põ3jIÄë:DMå\0I(.	ØQø¥,×¼îÏgÁKf±!GØ¬²b\\qêÌÁqW\'²´fÈµe;Ä._õÙÚCrwj\\®\ræÖ>Çì|<0a×Í ¡èv#ÌÈfòND¡¼ï1î4½&Ðõ%îß¬Öjù¦¤ÌzÌ\ZhbÓM4¢«7EÆHDZ\0ÛJi*ËDÂ,+0e°H¤\rMæ¼)Q0	&Ô\ZKT(PaGX­$Àd2Â£ÊVfßV5Ìf9|\n f	 ©ÄÉ!*¬É4´1tñ­IA¢pPYªÓ@Ir¥ê\\¡Vfæ*d böDHlf\\\\Á¢}3ï?2Y°Ä®ÆX±ª)Ëb)E ó*\r$*FDAÅ	ÐH\n:M.}ÃBH²HJÌc)IÑb´+BÖkÇ¥S7¾v9I\Z^\ri¤k)\nÈ ÇQ(Õ¥¬ã%ïz ¦»ÎGjQa×øO2åBçõBT=£úúeæOÈ|óWù3|Ý°Á´¯Þ*`}§ÈÞ½bm	¸$Ðø<Æ!gÎt3\rI>ÇR;øÔ¢áÔh:õ©ó*v\Z>#¼©cå­9°5,fhje¸*B>ÐlÇt²p\r\r/pãCÄÐÞ[rÝ&P93xàæ}É]ÃKó=CÃÇf¾W.TdAs,Ø°6äXº¹ûCÖfTiI$pbwC<É.¾§£87ÝSw*jnÞÃôÿPxùºwAÐÉÝ|Pòbjp`6\r>ÏQk²ö^¤%Ýc ±è;ûPï+°ouô.s<MÄxZß»ÐÊÙ\"£=\nxSø3?3ËÙÙÜg^³¨bö½þ\'§z1*$óp%­d.&^¨\'rÁ=B\n¥B¡B{Ë^¥dugQ+yPª^áHà[XÃø7×ä-9£44ËÔ0z~äø¬¬4ÌÖ_Ûy3Sb©A¼èìøèGÓ*w¾&Y*5¨lw&r\"Úªq5ôif2°¥J#<ÆBÀi\\9qr\\íÓßµ¼¶>H?c@ÆùÒ #Äd(H²\0°\ZL&×ic¸Û^õ%°ª½å¬47ä`c((D.ÕÆÃwGRÆ¹NbÁI¤JÕ@Æ@XÌÎ{\"§y@©È0·*P2É\Z5ðKîÃ|ö2ÓSÀ	QQE×DG#î|ÒßqíÐ?bBCp¡ö´A\'ØÐ`fÖSâ&5i÷	V®XEjÅÜN$\'#ê[@', 'Paypal', 'shipto', 'Azampur', '1', 57.5, NULL, NULL, 't6G0VN4qqs', 'Pending', 'admin1@gmail.com', 'Vietnamese', 'Anguilla', '0971894618', 'hcm', 'ho chi minh', '09883', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'eqwe', NULL, 'pending', '2022-11-16 08:16:02', '2022-11-16 08:16:02', NULL, NULL, '$', 1, 0, 0, 0, 1, NULL, 0, 0),
(32, 33, 'BZh91AY&SY©m\0à_@\0Psø?[ö¿ïÿúPù¼\Z3¦\0(#b`00\0	\02i& \0\0\0\0\0\0MQé©¦ÔÄÓLÑ!¦HÐõÍ10\0\0\0À\0L\"&4ÓÔ¦£Ôa3Põ3jIÄë:DMå\0I(.	ØQø¥,×¼îÏgÁKf±!GØ¬²b\\qêÌÁqW\'²´fÈµe;Ä._õÙÚCrwj\\®\ræÖ>Çì|<0a×Í ¡èv#ÌÈfòND¡¼ï1î4½&Ðõ%îß¬Öjù¦¤ÌzÌ\ZhbÓM4¢«7EÆHDZ\0ÛJi*ËDÂ,+0e°H¤\rMæ¼)Q0	&Ô\ZKT(PaGX­$Àd2Â£ÊVfßV5Ìf9|\n f	 ©ÄÉ!*¬É4´1tñ­IA¢pPYªÓ@Ir¥ê\\¡Vfæ*d böDHlf\\\\Á¢}3ï?2Y°Ä®ÆX±ª)Ëb)E ó*\r$*FDAÅ	ÐH\n:M.}ÃBH²HJÌc)IÑb´+BÖkÇ¥S7¾v9I\Z^\ri¤k)\nÈ ÇQ(Õ¥¬ã%ïz ¦»ÎGjQa×øO2åBçõBT=£úúeæOÈ|óWù3|Ý°Á´¯Þ*`}§ÈÞ½bm	¸$Ðø<Æ!gÎt3\rI>ÇR;øÔ¢áÔh:õ©ó*v\Z>#¼©cå­9°5,fhje¸*B>ÐlÇt²p\r\r/pãCÄÐÞ[rÝ&P93xàæ}É]ÃKó=CÃÇf¾W.TdAs,Ø°6äXº¹ûCÖfTiI$pbwC<É.¾§£87ÝSw*jnÞÃôÿPxùºwAÐÉÝ|Pòbjp`6\r>ÏQk²ö^¤%Ýc ±è;ûPï+°ouô.s<MÄxZß»ÐÊÙ\"£=\nxSø3?3ËÙÙÜg^³¨bö½þ\'§z1*$óp%­d.&^¨\'rÁ=B\n¥B¡B{Ë^¥dugQ+yPª^áHà[XÃø7×ä-9£44ËÔ0z~äø¬¬4ÌÖ_Ûy3Sb©A¼èìøèGÓ*w¾&Y*5¨lw&r\"Úªq5ôif2°¥J#<ÆBÀi\\9qr\\íÓßµ¼¶>H?c@ÆùÒ #Äd(H²\0°\ZL&×ic¸Û^õ%°ª½å¬47ä`c((D.ÕÆÃwGRÆ¹NbÁI¤JÕ@Æ@XÌÎ{\"§y@©È0·*P2É\Z5ðKîÃ|ö2ÓSÀ	QQE×DG#î|ÒßqíÐ?bBCp¡ö´A\'ØÐ`fÖSâ&5i÷	V®XEjÅÜN$\'#ê[@', 'Paypal', 'shipto', 'Azampur', '1', 57.5, NULL, NULL, 'uCU7LVgPg6', 'Pending', 'admin1@gmail.com', 'Vietnamese', 'Andorra', '0971894618', 'hcm', 'ho chi minh', '09883', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'eqwe', NULL, 'pending', '2022-11-16 08:17:54', '2022-11-16 08:17:54', NULL, NULL, '$', 1, 0, 0, 0, 1, NULL, 0, 0),
(33, 33, 'BZh91AY&SY©m\0à_@\0Psø?[ö¿ïÿúPù¼\Z3¦\0(#b`00\0	\02i& \0\0\0\0\0\0MQé©¦ÔÄÓLÑ!¦HÐõÍ10\0\0\0À\0L\"&4ÓÔ¦£Ôa3Põ3jIÄë:DMå\0I(.	ØQø¥,×¼îÏgÁKf±!GØ¬²b\\qêÌÁqW\'²´fÈµe;Ä._õÙÚCrwj\\®\ræÖ>Çì|<0a×Í ¡èv#ÌÈfòND¡¼ï1î4½&Ðõ%îß¬Öjù¦¤ÌzÌ\ZhbÓM4¢«7EÆHDZ\0ÛJi*ËDÂ,+0e°H¤\rMæ¼)Q0	&Ô\ZKT(PaGX­$Àd2Â£ÊVfßV5Ìf9|\n f	 ©ÄÉ!*¬É4´1tñ­IA¢pPYªÓ@Ir¥ê\\¡Vfæ*d böDHlf\\\\Á¢}3ï?2Y°Ä®ÆX±ª)Ëb)E ó*\r$*FDAÅ	ÐH\n:M.}ÃBH²HJÌc)IÑb´+BÖkÇ¥S7¾v9I\Z^\ri¤k)\nÈ ÇQ(Õ¥¬ã%ïz ¦»ÎGjQa×øO2åBçõBT=£úúeæOÈ|óWù3|Ý°Á´¯Þ*`}§ÈÞ½bm	¸$Ðø<Æ!gÎt3\rI>ÇR;øÔ¢áÔh:õ©ó*v\Z>#¼©cå­9°5,fhje¸*B>ÐlÇt²p\r\r/pãCÄÐÞ[rÝ&P93xàæ}É]ÃKó=CÃÇf¾W.TdAs,Ø°6äXº¹ûCÖfTiI$pbwC<É.¾§£87ÝSw*jnÞÃôÿPxùºwAÐÉÝ|Pòbjp`6\r>ÏQk²ö^¤%Ýc ±è;ûPï+°ouô.s<MÄxZß»ÐÊÙ\"£=\nxSø3?3ËÙÙÜg^³¨bö½þ\'§z1*$óp%­d.&^¨\'rÁ=B\n¥B¡B{Ë^¥dugQ+yPª^áHà[XÃø7×ä-9£44ËÔ0z~äø¬¬4ÌÖ_Ûy3Sb©A¼èìøèGÓ*w¾&Y*5¨lw&r\"Úªq5ôif2°¥J#<ÆBÀi\\9qr\\íÓßµ¼¶>H?c@ÆùÒ #Äd(H²\0°\ZL&×ic¸Û^õ%°ª½å¬47ä`c((D.ÕÆÃwGRÆ¹NbÁI¤JÕ@Æ@XÌÎ{\"§y@©È0·*P2É\Z5ðKîÃ|ö2ÓSÀ	QQE×DG#î|ÒßqíÐ?bBCp¡ö´A\'ØÐ`fÖSâ&5i÷	V®XEjÅÜN$\'#ê[@', 'Paypal', 'shipto', 'Azampur', '1', 57.5, NULL, NULL, '7NXJjQnPZo', 'Pending', 'admin1@gmail.com', 'Vietnamese', 'Andorra', '0971894618', 'hcm', 'ho chi minh', '09883', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'eqwe', NULL, 'pending', '2022-11-16 08:25:39', '2022-11-16 08:25:39', NULL, NULL, '$', 1, 0, 0, 0, 1, NULL, 0, 0),
(34, 32, 'BZh91AY&SYJ[zÇ\0ß_P\0ø+þ¿ÿÿúP±àTqup\Zj1<¨\0\0\0Ð\0\0\0$ýSÔ\0\0\0S &¥244\Zµ\00\0L\0À\0\0\0\"!4LF\r¦¦hÐ\ZM$FC® ö¥óGìûu`!8Âßô#\r09Î1ÙÉÝº¥ÂÍÔ;J~n4#9ºééÎù¥SçðÆËfg58ø;ÆKàu¥ÍÛ4¹g¼µÇrú³Í.f×¼Ï¡Ð§x Èí7§!È0û Z}ED´M\nÇÛ(KpÔ¾FÓ.\r\0ÐÐÅz^ôUe°RC8ª¶\Z(CiM&+eì\ZESÚÁc	Ál £< ci+*ßáY`Ø1;O¸¢34½HHÈ\Z¤ÌÓpÍ=¤EJ2äT¹bC¸·ÈKI8\n Í¦wd³y©1Î_µ)Ôæå2x	ºÍØ£ Á0§\0åÔBÂ»EJJâ¹!/ºà°*Õ(2¨)ÂÉE±J5l]4©K2 F[A\n`(q\Z`BÛÙY4Tpnª}[]h¢eÌ1Á$¶Û¡Qª#ä6(pXo6Â1\ZI¥ØÆÝ±0i8[k/\ZæÈ,<Ç.°ô0Å°á­ñJK 6TNg<Zl!+MÇÁÙ¥fÆô?Slÿ#?#Ì7Ïñ2Úz\ZfmU#ä¼ªQIo3Mx©C°Èaï<IGì3\"Çá­8°5,dfjc T89£!à±P\r6ænEîêx\ZKk¬\\eCSÅWê<yÃ»¿Æì±0±VÂÃmH­eè}\r\"£LÈRI#ó	b3ÔI06AGéQgºÛ·°ù|Æ ê×f\\K»l8*u	¹päD4°ÎôþvùÈTåÒ\'yáÖÄó	8È:æJ£YcpEm%p	Øæq]ÍüÛp|¼çÐîäÆDw`C.kHÈDµvHì5RÑI#I)8ÀÂ¤©Ë7ª0 Q.¡#P,Që<NÂCÌÔ;;Ç4CLÂ¡s¯¡> ûÌQ»xjt*øèC¡Ôl*Bægüà¬ÒÔ;Þ·ÚÎß~Ö!2£BÀi`H8909g÷t·VvÞÅc@¡i*21FPX\0Ø$ÚæPÞhwkÊ^	tW°µ  KeÏt\Zrp&VÎ¸ÎîFKU@±;bÅ-!u ûb{£6¼WÕ}£=ÜÌsØwhBTTQÜâOÔ}½\0Â,2L|\ZP3\"äVÙü&RöRíÈO²@ÉèEj¹\"(H%-½c', 'Paypal', 'shipto', 'Azampur', '1', 46, NULL, NULL, '20rA4Wj43K', 'Pending', 'satthucrisi1@gmail.com', 'user', 'Bangladesh', '0971894618', 'hcm', 'hồ chí minh', '09883', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'eqwe', NULL, 'pending', '2022-11-16 08:27:41', '2022-11-16 08:27:41', NULL, NULL, '$', 1, 0, 0, 0, 0, NULL, 0, 0),
(35, 32, 'BZh91AY&SY0RÁú\0ß_P\0ø+þ¿ÿÿúP¹áØFÐl(#\0&\0`\0\0\0\0#USÔ@h\0@\0I©4j6¦Ô\0¨\0zM=F@0\0L\0À\0\0\0\"A4Òh\052iP\ZÓID²Hq¨\0tºMðý^£\r\rEèwùÌjoboµSÕt\Z2Sr¸úSXP:Ò(-¦sXÒo&^­¸6»ö,WQ¬ÔX×§E#(\rl; ñÙ Ü³Ëí|ò9 @TìtDN³Y¨ò$q>äH=DÄ´&3!-Þ¸E(EQp@ !À2,Îs*¼8`¶zWV2óÝ3=!q°ºÓ\ZM¡ä\n(E/8u(&¨¼ÖÃ&B(eºÍDB%ã´¡ÄDðÐç9¢Éd²¸ ! ÔALïL` ÌeLFrø¼©N§7)Ä@MÖnÅ	8(¢Ü*RWYt!/ªà(@ÅQ¾¥ÆU0XbQqJ;8¶Ìi	RXÊt¦(AGiµ×Èq¤X@\râÑVM%Ü:§âÜxÑDËcñIjÜÑ§5»èÞ`Þ÷¢ÍdØ0ÊYÞ1+}¶«Öä±°m8Z¬¼lKÁd,1ã:8sÄ|ÉAö~ó#ßGrK~&ê:Åðg¾\rgÁÑE5qW` T±ýç&8	ñ?wUÊ9â_QæfHÈÔ¨FóÜ½Ô&¤`C= fLÜ\\aò=¤û¹SãÒ7°3*\\ÈÌÇ@PH9\"ãÁb;À4Ø>&;{ÜQ¬­´ÀEC(\ZLl4tz?áÎ¸t6eH&AJ6jB­Vÿ\ZM¥Ê\r2â\"CÒÈ±àHÁ\Z f¡âúPYkxn>A¨;µ¿}åtGÊDÊÂV,DÁ>±g¡{Cì¼%ÖÇ1¤B	3©ßµIrÙNå;d$¦ÕñÂ\"c5[BZP¼ëÙ³jëí\0±N\\ÎXÃ¢cØË¥bét»$v\Z)l¤Î¹%ã]dÄÅiÆD×cÒn$Fa» ·íF4Ì(;yî±© ÀÅüvÇ|ÎeIö9£Ìæ@v\n¹bFX*´³¹Õlt\r³ÙAq)(Æã!AÜi`È6¹rös¯fp´µ¨1Ý(ZJb!$$\06$¡¤Á6¹6\ZñSj\\ÅE÷©¤a ¹kæ.ÊC±ÌÏ`ZÉ¤]f c &.^|\"¤Ê­&!e {Rak#&½«ÑmC>rÒu	MMFZ#y/AðÜ@\"£$`CÚÒ,Hjá7Üsxa?ËËÍ  R\rOø»)ÂÐ', 'Paypal', 'shipto', 'Azampur', '1', 46, NULL, NULL, 'JSdy9yzry1', 'Pending', 'satthucrisi1@gmail.com', 'user', 'Armenia', '0971894618', 'hcm', 'ho chi minh', '09883', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'eqwe', NULL, 'pending', '2022-11-16 08:31:11', '2022-11-16 08:31:11', NULL, NULL, '$', 1, 0, 0, 0, 0, NULL, 0, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_tracks`
--

CREATE TABLE `order_tracks` (
  `id` int(191) NOT NULL,
  `order_id` int(191) NOT NULL,
  `title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `order_tracks`
--

INSERT INTO `order_tracks` (`id`, `order_id`, `title`, `text`, `created_at`, `updated_at`) VALUES
(21, 22, 'Pending', 'You have successfully placed your order.', '2022-11-16 07:14:19', '2022-11-16 07:14:19'),
(22, 22, 'processing', 'người gửi đang chuẩn bị hàng', '2022-11-16 07:17:46', '2022-11-16 07:17:46'),
(23, 22, 'ondelivery', 'ondelivery', '2022-11-16 07:19:39', '2022-11-16 07:19:39'),
(24, 22, 'completed', 'completed', '2022-11-16 07:20:23', '2022-11-16 07:20:23');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `packages`
--

CREATE TABLE `packages` (
  `id` int(191) NOT NULL,
  `user_id` int(191) NOT NULL DEFAULT 0,
  `title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subtitle` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` double NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `packages`
--

INSERT INTO `packages` (`id`, `user_id`, `title`, `subtitle`, `price`) VALUES
(1, 0, 'Default Packaging', 'Default packaging by store', 0),
(2, 0, 'Gift Packaging', 'Exclusive Gift packaging', 15);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pages`
--

CREATE TABLE `pages` (
  `id` int(191) NOT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_tag` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `header` tinyint(1) NOT NULL DEFAULT 0,
  `footer` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `pages`
--

INSERT INTO `pages` (`id`, `title`, `slug`, `details`, `meta_tag`, `meta_description`, `header`, `footer`) VALUES
(1, 'About Us', 'about', '<div helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" font-style:=\"\" normal;=\"\" font-variant-ligatures:=\"\" font-variant-caps:=\"\" font-weight:=\"\" 400;=\"\" letter-spacing:=\"\" orphans:=\"\" 2;=\"\" text-align:=\"\" start;=\"\" text-indent:=\"\" 0px;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" word-spacing:=\"\" -webkit-text-stroke-width:=\"\" background-color:=\"\" rgb(255,=\"\" 255,=\"\" 255);=\"\" text-decoration-style:=\"\" initial;=\"\" text-decoration-color:=\"\" initial;\"=\"\"><h2><font size=\"6\">Title number 1</font><br></h2><p><span style=\"font-weight: 700;\">Lorem Ipsum</span>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p></div><div helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" font-style:=\"\" normal;=\"\" font-variant-ligatures:=\"\" font-variant-caps:=\"\" font-weight:=\"\" 400;=\"\" letter-spacing:=\"\" orphans:=\"\" 2;=\"\" text-align:=\"\" start;=\"\" text-indent:=\"\" 0px;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" word-spacing:=\"\" -webkit-text-stroke-width:=\"\" background-color:=\"\" rgb(255,=\"\" 255,=\"\" 255);=\"\" text-decoration-style:=\"\" initial;=\"\" text-decoration-color:=\"\" initial;\"=\"\"><h2><font size=\"6\">Title number 2</font><br></h2><p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p></div><br helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" font-style:=\"\" normal;=\"\" font-variant-ligatures:=\"\" font-variant-caps:=\"\" font-weight:=\"\" 400;=\"\" letter-spacing:=\"\" orphans:=\"\" 2;=\"\" text-align:=\"\" start;=\"\" text-indent:=\"\" 0px;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" word-spacing:=\"\" -webkit-text-stroke-width:=\"\" background-color:=\"\" rgb(255,=\"\" 255,=\"\" 255);=\"\" text-decoration-style:=\"\" initial;=\"\" text-decoration-color:=\"\" initial;\"=\"\"><div helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" font-style:=\"\" normal;=\"\" font-variant-ligatures:=\"\" font-variant-caps:=\"\" font-weight:=\"\" 400;=\"\" letter-spacing:=\"\" orphans:=\"\" 2;=\"\" text-align:=\"\" start;=\"\" text-indent:=\"\" 0px;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" word-spacing:=\"\" -webkit-text-stroke-width:=\"\" background-color:=\"\" rgb(255,=\"\" 255,=\"\" 255);=\"\" text-decoration-style:=\"\" initial;=\"\" text-decoration-color:=\"\" initial;\"=\"\"><h2><font size=\"6\">Title number 3</font><br></h2><p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p></div><h2 helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-weight:=\"\" 700;=\"\" line-height:=\"\" 1.1;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);=\"\" margin:=\"\" 0px=\"\" 15px;=\"\" font-size:=\"\" 30px;=\"\" font-style:=\"\" normal;=\"\" font-variant-ligatures:=\"\" font-variant-caps:=\"\" letter-spacing:=\"\" orphans:=\"\" 2;=\"\" text-align:=\"\" start;=\"\" text-indent:=\"\" 0px;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" word-spacing:=\"\" -webkit-text-stroke-width:=\"\" background-color:=\"\" rgb(255,=\"\" 255,=\"\" 255);=\"\" text-decoration-style:=\"\" initial;=\"\" text-decoration-color:=\"\" initial;\"=\"\" style=\"font-family: \" 51);\"=\"\"><font size=\"6\">Title number 9</font><br></h2><p helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" font-style:=\"\" normal;=\"\" font-variant-ligatures:=\"\" font-variant-caps:=\"\" font-weight:=\"\" 400;=\"\" letter-spacing:=\"\" orphans:=\"\" 2;=\"\" text-align:=\"\" start;=\"\" text-indent:=\"\" 0px;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" word-spacing:=\"\" -webkit-text-stroke-width:=\"\" background-color:=\"\" rgb(255,=\"\" 255,=\"\" 255);=\"\" text-decoration-style:=\"\" initial;=\"\" text-decoration-color:=\"\" initial;\"=\"\">There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</p>', NULL, NULL, 1, 1),
(2, 'Privacy & Policy', 'privacy', '<div helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" font-style:=\"\" normal;=\"\" font-variant-ligatures:=\"\" font-variant-caps:=\"\" font-weight:=\"\" 400;=\"\" letter-spacing:=\"\" orphans:=\"\" 2;=\"\" text-align:=\"\" start;=\"\" text-indent:=\"\" 0px;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" word-spacing:=\"\" -webkit-text-stroke-width:=\"\" background-color:=\"\" rgb(255,=\"\" 255,=\"\" 255);=\"\" text-decoration-style:=\"\" initial;=\"\" text-decoration-color:=\"\" initial;\"=\"\"><h2><img src=\"https://i.imgur.com/BobQuyA.jpg\" width=\"591\"></h2><h2><font size=\"6\">Title number 1</font></h2><p><span style=\"font-weight: 700;\">Lorem Ipsum</span>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p></div><div helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" font-style:=\"\" normal;=\"\" font-variant-ligatures:=\"\" font-variant-caps:=\"\" font-weight:=\"\" 400;=\"\" letter-spacing:=\"\" orphans:=\"\" 2;=\"\" text-align:=\"\" start;=\"\" text-indent:=\"\" 0px;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" word-spacing:=\"\" -webkit-text-stroke-width:=\"\" background-color:=\"\" rgb(255,=\"\" 255,=\"\" 255);=\"\" text-decoration-style:=\"\" initial;=\"\" text-decoration-color:=\"\" initial;\"=\"\"><h2><font size=\"6\">Title number 2</font><br></h2><p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p></div><br helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" font-style:=\"\" normal;=\"\" font-variant-ligatures:=\"\" font-variant-caps:=\"\" font-weight:=\"\" 400;=\"\" letter-spacing:=\"\" orphans:=\"\" 2;=\"\" text-align:=\"\" start;=\"\" text-indent:=\"\" 0px;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" word-spacing:=\"\" -webkit-text-stroke-width:=\"\" background-color:=\"\" rgb(255,=\"\" 255,=\"\" 255);=\"\" text-decoration-style:=\"\" initial;=\"\" text-decoration-color:=\"\" initial;\"=\"\"><div helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" font-style:=\"\" normal;=\"\" font-variant-ligatures:=\"\" font-variant-caps:=\"\" font-weight:=\"\" 400;=\"\" letter-spacing:=\"\" orphans:=\"\" 2;=\"\" text-align:=\"\" start;=\"\" text-indent:=\"\" 0px;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" word-spacing:=\"\" -webkit-text-stroke-width:=\"\" background-color:=\"\" rgb(255,=\"\" 255,=\"\" 255);=\"\" text-decoration-style:=\"\" initial;=\"\" text-decoration-color:=\"\" initial;\"=\"\"><h2><font size=\"6\">Title number 3</font><br></h2><p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p></div><h2 helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-weight:=\"\" 700;=\"\" line-height:=\"\" 1.1;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);=\"\" margin:=\"\" 0px=\"\" 15px;=\"\" font-size:=\"\" 30px;=\"\" font-style:=\"\" normal;=\"\" font-variant-ligatures:=\"\" font-variant-caps:=\"\" letter-spacing:=\"\" orphans:=\"\" 2;=\"\" text-align:=\"\" start;=\"\" text-indent:=\"\" 0px;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" word-spacing:=\"\" -webkit-text-stroke-width:=\"\" background-color:=\"\" rgb(255,=\"\" 255,=\"\" 255);=\"\" text-decoration-style:=\"\" initial;=\"\" text-decoration-color:=\"\" initial;\"=\"\" 51);\"=\"\" style=\"font-family: \"><font size=\"6\">Title number 9</font><br></h2><p helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" font-style:=\"\" normal;=\"\" font-variant-ligatures:=\"\" font-variant-caps:=\"\" font-weight:=\"\" 400;=\"\" letter-spacing:=\"\" orphans:=\"\" 2;=\"\" text-align:=\"\" start;=\"\" text-indent:=\"\" 0px;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" word-spacing:=\"\" -webkit-text-stroke-width:=\"\" background-color:=\"\" rgb(255,=\"\" 255,=\"\" 255);=\"\" text-decoration-style:=\"\" initial;=\"\" text-decoration-color:=\"\" initial;\"=\"\">There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</p>', 'test,test1,test2,test3', 'Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.', 1, 1),
(3, 'Terms & Condition', 'terms', '<div helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" font-style:=\"\" normal;=\"\" font-variant-ligatures:=\"\" font-variant-caps:=\"\" font-weight:=\"\" 400;=\"\" letter-spacing:=\"\" orphans:=\"\" 2;=\"\" text-align:=\"\" start;=\"\" text-indent:=\"\" 0px;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" word-spacing:=\"\" -webkit-text-stroke-width:=\"\" background-color:=\"\" rgb(255,=\"\" 255,=\"\" 255);=\"\" text-decoration-style:=\"\" initial;=\"\" text-decoration-color:=\"\" initial;\"=\"\"><h2><font size=\"6\">Title number 1</font><br></h2><p><span style=\"font-weight: 700;\">Lorem Ipsum</span>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p></div><div helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" font-style:=\"\" normal;=\"\" font-variant-ligatures:=\"\" font-variant-caps:=\"\" font-weight:=\"\" 400;=\"\" letter-spacing:=\"\" orphans:=\"\" 2;=\"\" text-align:=\"\" start;=\"\" text-indent:=\"\" 0px;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" word-spacing:=\"\" -webkit-text-stroke-width:=\"\" background-color:=\"\" rgb(255,=\"\" 255,=\"\" 255);=\"\" text-decoration-style:=\"\" initial;=\"\" text-decoration-color:=\"\" initial;\"=\"\"><h2><font size=\"6\">Title number 2</font><br></h2><p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p></div><br helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" font-style:=\"\" normal;=\"\" font-variant-ligatures:=\"\" font-variant-caps:=\"\" font-weight:=\"\" 400;=\"\" letter-spacing:=\"\" orphans:=\"\" 2;=\"\" text-align:=\"\" start;=\"\" text-indent:=\"\" 0px;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" word-spacing:=\"\" -webkit-text-stroke-width:=\"\" background-color:=\"\" rgb(255,=\"\" 255,=\"\" 255);=\"\" text-decoration-style:=\"\" initial;=\"\" text-decoration-color:=\"\" initial;\"=\"\"><div helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" font-style:=\"\" normal;=\"\" font-variant-ligatures:=\"\" font-variant-caps:=\"\" font-weight:=\"\" 400;=\"\" letter-spacing:=\"\" orphans:=\"\" 2;=\"\" text-align:=\"\" start;=\"\" text-indent:=\"\" 0px;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" word-spacing:=\"\" -webkit-text-stroke-width:=\"\" background-color:=\"\" rgb(255,=\"\" 255,=\"\" 255);=\"\" text-decoration-style:=\"\" initial;=\"\" text-decoration-color:=\"\" initial;\"=\"\"><h2><font size=\"6\">Title number 3</font><br></h2><p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p></div><h2 helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-weight:=\"\" 700;=\"\" line-height:=\"\" 1.1;=\"\" color:=\"\" rgb(51,=\"\" 51,=\"\" 51);=\"\" margin:=\"\" 0px=\"\" 15px;=\"\" font-size:=\"\" 30px;=\"\" font-style:=\"\" normal;=\"\" font-variant-ligatures:=\"\" font-variant-caps:=\"\" letter-spacing:=\"\" orphans:=\"\" 2;=\"\" text-align:=\"\" start;=\"\" text-indent:=\"\" 0px;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" word-spacing:=\"\" -webkit-text-stroke-width:=\"\" background-color:=\"\" rgb(255,=\"\" 255,=\"\" 255);=\"\" text-decoration-style:=\"\" initial;=\"\" text-decoration-color:=\"\" initial;\"=\"\" 51);\"=\"\" style=\"font-family: \"><font size=\"6\">Title number 9</font><br></h2><p helvetica=\"\" neue\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" font-style:=\"\" normal;=\"\" font-variant-ligatures:=\"\" font-variant-caps:=\"\" font-weight:=\"\" 400;=\"\" letter-spacing:=\"\" orphans:=\"\" 2;=\"\" text-align:=\"\" start;=\"\" text-indent:=\"\" 0px;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" word-spacing:=\"\" -webkit-text-stroke-width:=\"\" background-color:=\"\" rgb(255,=\"\" 255,=\"\" 255);=\"\" text-decoration-style:=\"\" initial;=\"\" text-decoration-color:=\"\" initial;\"=\"\">There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</p>', 't1,t2,t3,t4', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.', 1, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pagesettings`
--

CREATE TABLE `pagesettings` (
  `id` int(10) UNSIGNED NOT NULL,
  `contact_success` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_title` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_text` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `side_title` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `side_text` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `street` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fax` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `site` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slider` tinyint(1) NOT NULL DEFAULT 1,
  `service` tinyint(1) NOT NULL DEFAULT 1,
  `featured` tinyint(1) NOT NULL DEFAULT 1,
  `small_banner` tinyint(1) NOT NULL DEFAULT 1,
  `best` tinyint(1) NOT NULL DEFAULT 1,
  `top_rated` tinyint(1) NOT NULL DEFAULT 1,
  `large_banner` tinyint(1) NOT NULL DEFAULT 1,
  `big` tinyint(1) NOT NULL DEFAULT 1,
  `hot_sale` tinyint(1) NOT NULL DEFAULT 1,
  `partners` tinyint(1) NOT NULL DEFAULT 0,
  `review_blog` tinyint(1) NOT NULL DEFAULT 1,
  `best_seller_banner` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `best_seller_banner_link` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `big_save_banner` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `big_save_banner_link` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bottom_small` tinyint(1) NOT NULL DEFAULT 0,
  `flash_deal` tinyint(1) NOT NULL DEFAULT 0,
  `best_seller_banner1` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `best_seller_banner_link1` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `big_save_banner1` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `big_save_banner_link1` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `featured_category` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `pagesettings`
--

INSERT INTO `pagesettings` (`id`, `contact_success`, `contact_email`, `contact_title`, `contact_text`, `side_title`, `side_text`, `street`, `phone`, `fax`, `email`, `site`, `slider`, `service`, `featured`, `small_banner`, `best`, `top_rated`, `large_banner`, `big`, `hot_sale`, `partners`, `review_blog`, `best_seller_banner`, `best_seller_banner_link`, `big_save_banner`, `big_save_banner_link`, `bottom_small`, `flash_deal`, `best_seller_banner1`, `best_seller_banner_link1`, `big_save_banner1`, `big_save_banner_link1`, `featured_category`) VALUES
(1, 'Success! Thanks for contacting us, we will get back to you shortly.', 'huudiem2510@gmail.com', '<h4 class=\"subtitle\" style=\"margin-bottom: 6px; font-weight: 600; line-height: 28px; font-size: 28px; text-transform: uppercase;\">WE\'D LOVE TO</h4><h2 class=\"title\" style=\"margin-bottom: 13px;font-weight: 600;line-height: 50px;font-size: 40px;color: #0f78f2;text-transform: uppercase;\">HEAR FROM YOU</h2>', '<span style=\"color: rgb(119, 119, 119);\">Send us a message and we\' ll respond as soon as possible</span><br>', '<h4 class=\"title\" style=\"margin-bottom: 10px; font-weight: 600; line-height: 28px; font-size: 28px;\">Let\'s Connect</h4>', '<span style=\"color: rgb(51, 51, 51);\">Get in touch with us</span>', 'No. 280 An Duong Vuong Street, District 5, Ho Chi Minh City', '012 345 678', '00 000 000 000', 'huudiem2510@gmail.com', 'https://genius.com', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '1568889138banner1.jpg', 'http://google.com', '1565150264banner3.jpg', 'http://google.com', 1, 1, '1568889138banner2.jpg', 'http://google.com', '1565150264banner4.jpg', 'http://google.com', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `partners`
--

CREATE TABLE `partners` (
  `id` int(191) NOT NULL,
  `photo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `partners`
--

INSERT INTO `partners` (`id`, `photo`, `link`) VALUES
(1, '1563165366brand-1.png', 'https://www.google.com/'),
(2, '1563165383brand-2.png', 'https://www.google.com/'),
(3, '1563165393brand-3.png', 'https://www.google.com/'),
(4, '1563165400brand-1.png', NULL),
(5, '1563165411brand-2.png', NULL),
(6, '1563165444brand-3.png', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `payment_gateways`
--

CREATE TABLE `payment_gateways` (
  `id` int(191) NOT NULL,
  `subtitle` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(10) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `payment_gateways`
--

INSERT INTO `payment_gateways` (`id`, `subtitle`, `title`, `details`, `status`) VALUES
(46, 'Pay via your Mobile Money.', 'Mobile Money', '<font size=\"3\"><b style=\"\">Mobile Money</b><b>&nbsp;No: 6528068515</b><br><br></font>', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pickups`
--

CREATE TABLE `pickups` (
  `id` int(191) UNSIGNED NOT NULL,
  `location` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `pickups`
--

INSERT INTO `pickups` (`id`, `location`) VALUES
(2, 'Vietnamese');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` int(191) UNSIGNED NOT NULL,
  `sku` varchar(255) DEFAULT NULL,
  `product_type` enum('normal','affiliate') NOT NULL DEFAULT 'normal',
  `affiliate_link` text DEFAULT NULL,
  `user_id` int(191) NOT NULL DEFAULT 0,
  `category_id` int(191) UNSIGNED NOT NULL,
  `subcategory_id` int(191) UNSIGNED DEFAULT NULL,
  `childcategory_id` int(191) UNSIGNED DEFAULT NULL,
  `attributes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `thumbnail` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size_qty` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size_price` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` double NOT NULL,
  `previous_price` double DEFAULT NULL,
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stock` int(191) DEFAULT NULL,
  `policy` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(2) UNSIGNED NOT NULL DEFAULT 1,
  `views` int(191) UNSIGNED NOT NULL DEFAULT 0,
  `tags` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `features` text DEFAULT NULL,
  `colors` text DEFAULT NULL,
  `product_condition` tinyint(1) NOT NULL DEFAULT 0,
  `ship` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_meta` tinyint(1) NOT NULL DEFAULT 0,
  `meta_tag` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `youtube` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` enum('Physical','Digital','License') NOT NULL,
  `license` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `license_qty` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `platform` varchar(255) DEFAULT NULL,
  `region` varchar(255) DEFAULT NULL,
  `licence_type` varchar(255) DEFAULT NULL,
  `measure` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `featured` tinyint(2) UNSIGNED NOT NULL DEFAULT 0,
  `best` tinyint(10) UNSIGNED NOT NULL DEFAULT 0,
  `top` tinyint(10) UNSIGNED NOT NULL DEFAULT 0,
  `hot` tinyint(10) UNSIGNED NOT NULL DEFAULT 0,
  `latest` tinyint(10) UNSIGNED NOT NULL DEFAULT 0,
  `big` tinyint(10) UNSIGNED NOT NULL DEFAULT 0,
  `trending` tinyint(1) NOT NULL DEFAULT 0,
  `sale` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_discount` tinyint(1) NOT NULL DEFAULT 0,
  `discount_date` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `whole_sell_qty` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `whole_sell_discount` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_catalog` tinyint(1) NOT NULL DEFAULT 0,
  `catalog_id` int(191) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `sku`, `product_type`, `affiliate_link`, `user_id`, `category_id`, `subcategory_id`, `childcategory_id`, `attributes`, `name`, `slug`, `photo`, `thumbnail`, `file`, `size`, `size_qty`, `size_price`, `color`, `price`, `previous_price`, `details`, `stock`, `policy`, `status`, `views`, `tags`, `features`, `colors`, `product_condition`, `ship`, `is_meta`, `meta_tag`, `meta_description`, `youtube`, `type`, `license`, `license_qty`, `link`, `platform`, `region`, `licence_type`, `measure`, `featured`, `best`, `top`, `hot`, `latest`, `big`, `trending`, `sale`, `created_at`, `updated_at`, `is_discount`, `discount_date`, `whole_sell_qty`, `whole_sell_discount`, `is_catalog`, `catalog_id`) VALUES
(95, 'pr495jsv', 'affiliate', 'https://www.amazon.com/Rolex-Master-Automatic-self-Wind-Certified-Pre-Owned/dp/B07MHJ8SVQ/ref=lp_13779934011_1_2?s=apparel&ie=UTF8&qid=1565186470&sr=1-2&nodeID=13779934011&psd=1', 13, 4, NULL, NULL, NULL, 'Affiliate Product Title will Be Here. Affiliate Product Title will Be Here 95', 'affiliate-product-title-will-be-here-affiliate-product-title-will-be-here-1-pr495jsv', '1568027732dTwHda8l.png', '1568027751AidGUyJv.jpg', NULL, NULL, NULL, NULL, '#000000,#a33333,#d90b0b,#209125', 50, 100, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', 55555, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', 1, 49, 'watch', NULL, NULL, 2, '5-7 days', 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 1, '2019-09-09 07:36:06', '2022-11-16 12:04:02', 1, '09/08/2021', NULL, NULL, 0, 0),
(116, 'pr496jsv', 'affiliate', 'https://www.amazon.com/Rolex-Master-Automatic-self-Wind-Certified-Pre-Owned/dp/B07MHJ8SVQ/ref=lp_13779934011_1_2?s=apparel&ie=UTF8&qid=1565186470&sr=1-2&nodeID=13779934011&psd=1', 13, 4, NULL, NULL, NULL, 'Affiliate Product Title will Be Here. Affiliate Product Title will Be Here 116', 'affiliate-product-title-will-be-here-affiliate-product-title-will-be-here-1-pr495jsv', '1568027684whVhJDrR.png', '1568027717gm0tFzeb.jpg', NULL, NULL, NULL, NULL, '#000000,#a33333,#d90b0b,#209125', 50, 100, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', 55555, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', 1, 0, 'watch', 'Keyword1,Keyword 2', '#ff1a1a,#0fbcd4', 2, '5-7 days', 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2019-09-09 12:36:06', '2019-09-09 10:15:17', 1, '09/08/2021', NULL, NULL, 0, 0),
(117, 'pr497jsv', 'affiliate', 'https://www.amazon.com/Rolex-Master-Automatic-self-Wind-Certified-Pre-Owned/dp/B07MHJ8SVQ/ref=lp_13779934011_1_2?s=apparel&ie=UTF8&qid=1565186470&sr=1-2&nodeID=13779934011&psd=1', 13, 4, NULL, NULL, NULL, 'Affiliate Product Title will Be Here. Affiliate Product Title will Be Here 117', 'affiliate-product-title-will-be-here-affiliate-product-title-will-be-here-1-pr495jsv', '1568027658Up0FIXsW.png', '1568027670dTA7gQml.jpg', NULL, NULL, NULL, NULL, '#000000,#a33333,#d90b0b,#209125', 50, 100, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', 55555, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', 1, 0, 'watch', NULL, NULL, 2, '5-7 days', 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2019-09-09 12:36:06', '2019-09-09 10:14:30', 1, '09/08/2021', NULL, NULL, 0, 0),
(118, 'pr498jsv', 'affiliate', 'https://www.amazon.com/Rolex-Master-Automatic-self-Wind-Certified-Pre-Owned/dp/B07MHJ8SVQ/ref=lp_13779934011_1_2?s=apparel&ie=UTF8&qid=1565186470&sr=1-2&nodeID=13779934011&psd=1', 13, 4, NULL, NULL, NULL, 'Affiliate Product Title will Be Here. Affiliate Product Title will Be Here 118', 'affiliate-product-title-will-be-here-affiliate-product-title-will-be-here-1-pr495jsv', '1568027631cnmEylRa.png', '1568027643PgYviwVK.jpg', NULL, NULL, NULL, NULL, '#000000,#a33333,#d90b0b,#209125', 50, 100, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', 55555, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', 1, 0, 'watch', NULL, NULL, 2, '5-7 days', 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2019-09-09 12:36:06', '2019-09-09 10:14:03', 1, '09/08/2021', NULL, NULL, 0, 0),
(119, 'pr499jsv', 'affiliate', 'https://www.amazon.com/Rolex-Master-Automatic-self-Wind-Certified-Pre-Owned/dp/B07MHJ8SVQ/ref=lp_13779934011_1_2?s=apparel&ie=UTF8&qid=1565186470&sr=1-2&nodeID=13779934011&psd=1', 13, 4, NULL, NULL, NULL, 'Affiliate Product Title will Be Here. Affiliate Product Title will Be Here 1', 'affiliate-product-title-will-be-here-affiliate-product-title-will-be-here-1-pr495jsv', '1568027603i5UAZiKB.png', '1568027616O1coe3aV.jpg', NULL, NULL, NULL, NULL, '#000000,#a33333,#d90b0b,#209125', 50, 100, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', 55555, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', 1, 0, 'watch', NULL, NULL, 2, '5-7 days', 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2019-09-09 12:36:06', '2019-09-09 10:13:36', 1, '09/08/2021', NULL, NULL, 0, 0),
(120, 'pr500jsv', 'affiliate', 'https://www.amazon.com/Rolex-Master-Automatic-self-Wind-Certified-Pre-Owned/dp/B07MHJ8SVQ/ref=lp_13779934011_1_2?s=apparel&ie=UTF8&qid=1565186470&sr=1-2&nodeID=13779934011&psd=1', 13, 4, NULL, NULL, NULL, 'Affiliate Product Title will Be Here. Affiliate Product Title will Be Here 120', 'affiliate-product-title-will-be-here-affiliate-product-title-will-be-here-1-pr495jsv', '1568027558gLSECTIh.png', '1568027591b1oUIo7Q.jpg', NULL, NULL, NULL, NULL, '#000000,#a33333,#d90b0b,#209125', 50, 100, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', 55555, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', 1, 0, 'watch', NULL, NULL, 2, '5-7 days', 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 1, 0, '2019-09-09 12:36:06', '2019-09-09 10:53:33', 1, '09/08/2021', NULL, NULL, 0, 0),
(121, 'pr501jsv', 'affiliate', 'https://www.amazon.com/Rolex-Master-Automatic-self-Wind-Certified-Pre-Owned/dp/B07MHJ8SVQ/ref=lp_13779934011_1_2?s=apparel&ie=UTF8&qid=1565186470&sr=1-2&nodeID=13779934011&psd=1', 13, 4, NULL, NULL, NULL, 'Affiliate Product Title will Be Here. Affiliate Product Title will Be Here 121', 'affiliate-product-title-will-be-here-affiliate-product-title-will-be-here-1-pr495jsv', '1568027534O1QEBPpR.png', '1568027543P8eoamtf.jpg', NULL, NULL, NULL, NULL, '#000000,#a33333,#d90b0b,#209125', 50, 100, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', 55555, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', 1, 0, 'watch', NULL, NULL, 2, '5-7 days', 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2019-09-09 12:36:06', '2019-09-09 10:12:23', 1, '09/08/2021', NULL, NULL, 0, 0),
(122, 'pr502jsv', 'affiliate', 'https://www.amazon.com/Rolex-Master-Automatic-self-Wind-Certified-Pre-Owned/dp/B07MHJ8SVQ/ref=lp_13779934011_1_2?s=apparel&ie=UTF8&qid=1565186470&sr=1-2&nodeID=13779934011&psd=1', 13, 4, NULL, NULL, NULL, 'Affiliate Product Title will Be Here. Affiliate Product Title will Be Here 122', 'affiliate-product-title-will-be-here-affiliate-product-title-will-be-here-1-pr495jsv', '1568027493eLqHNoZP.png', '1568027517LGq90luX.jpg', NULL, NULL, NULL, NULL, '#000000,#a33333,#d90b0b,#209125', 50, 100, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', 55555, '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', 1, 0, 'watch', NULL, NULL, 2, '5-7 days', 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2019-09-09 12:36:06', '2020-03-22 09:07:59', 1, '09/08/2021', NULL, NULL, 0, 0),
(181, 'ZCl4563x00', 'normal', NULL, 29, 5, 6, NULL, NULL, 'GLASSES', 'glasses-zcl4563x00', 'o1LYhTxPnvZX.jpg', 'YU9NYaAWa61I.jpg', NULL, NULL, NULL, NULL, NULL, 20, 10, 'glassed', 20, 'glassed<br>', 1, 4, 'glassed', 'glassed', '#000000', 0, NULL, 0, 'glassed', 'glassed', NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 1, 1, 1, 1, '2022-11-16 03:29:57', '2022-11-16 21:14:51', 1, '11/16/2022', NULL, NULL, 0, 0),
(182, '123343561', 'affiliate', 'https://www.amazon.com/adidas-Girls-Sleeveless-Toddler-Little/dp/B07MTJL7ZT/ref=sr_1_1?keywords=dress&qid=1565068717&s=gateway&sr=8-1', 29, 4, 2, 1, NULL, 'Test CSV Product', 'test-csv-product-123343561', 'ywKgYju3Iqsf.jpg', NULL, NULL, 'X,3XL', '22,23', '5,8', '#000000,#9c1515,#24f015,#050bc2,#d1900c', 20, 25, 'This is product Description', 10, 'Test policy', 1, 3, 'CLOTHS,FASHION,WOMEN FASHION,DRESSES,MENSWEAR', NULL, NULL, 0, NULL, 0, '', '', 'https://www.youtube.com/watch?v=7hx4gdlfamo', 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2022-11-16 06:02:21', '2022-11-16 21:14:58', 0, NULL, NULL, NULL, 0, 0),
(183, 'bxi6434bTo', 'normal', NULL, 32, 5, 8, NULL, NULL, 'clothes', 'clothes-bxi6434bto', 'xmo0q4o6UFyq.jpg', '0tUQ6s0Mwgj9.jpg', NULL, 'S,M', '2,1', '20,20', '#000000,#d51515', 20, 50, 'clothes<br>', NULL, 'clothes<br>', 1, 4, 'clothes', NULL, NULL, 0, '5-7 days', 0, 'clothes', NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 1, 1, 1, 1, '2022-11-16 06:49:52', '2022-11-16 21:16:55', 1, '11/17/2022', '10', '10', 0, 0),
(184, 'fku694935d', 'normal', NULL, 32, 5, 6, NULL, NULL, 'GLASSES', 'glasses-fku694935d', 'WkXbOfLBMq6x.jpg', 'k0tehTyLYYEg.jpg', NULL, NULL, NULL, NULL, '#000000,#e71919', 20, 50, 'GLASSES<br>', 192, 'GLASSES<br>', 1, 6, 'GLASSES', NULL, NULL, 0, '5-7 days', 0, 'GLASSES', NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 0, 0, 0, 0, 0, 0, '2022-11-16 06:59:43', '2022-11-16 21:18:02', 1, '11/16/2022', NULL, NULL, 0, 0),
(185, 'cYq4316Ajx', 'normal', NULL, 32, 5, 6, NULL, NULL, 'Earrings', 'earrings-cyq4316ajx', 'LSTah5rszsnk.jpg', 'hgmy9sVdgdDT.jpg', NULL, NULL, NULL, NULL, '#000000', 30, 100, 'EarringsEarringsEarringsEarringsEarringsEarringsEarringsEarrings<br>', NULL, 'EarringsEarringsEarringsEarringsEarringsEarringsEarringsEarringsEarrings<br>', 1, 8, NULL, NULL, NULL, 2, '5-7 days', 0, 'Earrings', 'Earrings', NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 1, 1, 1, 1, '2022-11-16 11:49:51', '2022-11-16 21:21:15', 1, '11/17/2022', '10', '10', 0, 0),
(186, 'G0O5125dkA', 'normal', NULL, 32, 5, 6, NULL, NULL, 'Earring 1', 'earring-1-g0o5125dka', 'C76N99Yq2wje.jpg', 'cALE2wRhpADL.jpg', NULL, NULL, NULL, NULL, NULL, 30, 60, 'Earring 1Earring 1Earring 1Earring 1Earring 1<br>', NULL, 'Earring 1Earring 1Earring 1Earring 1<br>', 1, 0, NULL, NULL, NULL, 2, NULL, 0, 'Earring', NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 1, 1, 1, 1, '2022-11-16 11:59:55', '2022-11-16 21:21:25', 1, '11/17/2022', NULL, NULL, 0, 0),
(187, 'Gct5227Via', 'normal', NULL, 32, 5, 6, NULL, NULL, 'Earring 2', 'earring-2-gct5227via', 'J1PItDLhgKR2.jpg', 'RuwMceVEA2e6.jpg', NULL, NULL, NULL, NULL, NULL, 20, 50, 'Earring 1Earring 1Earring 1<br>', NULL, 'Earring 1Earring 1Earring 1Earring 1<br>', 1, 0, NULL, NULL, NULL, 2, NULL, 0, 'Earring', NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 1, 1, 1, 1, '2022-11-16 12:01:00', '2022-11-16 21:21:34', 1, '11/17/2022', NULL, NULL, 0, 0),
(188, 'NVM5264glf', 'normal', NULL, 32, 5, 6, NULL, NULL, 'Earring 3', 'earring-3-nvm5264glf', 'zl0Oj64kAMLN.jpg', 'zKlxx0Y98l8S.jpg', NULL, NULL, NULL, NULL, NULL, 20, 50, 'Earring 3Earring 3Earring 3Earring 3<br>', NULL, 'Earring 3Earring 3Earring 3<br>', 1, 0, NULL, NULL, NULL, 0, NULL, 0, 'Earring', NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2022-11-16 12:01:33', '2022-11-16 12:01:33', 0, NULL, NULL, NULL, 0, 0),
(189, 'XxG5297jml', 'normal', NULL, 32, 5, 6, NULL, NULL, 'Earring 4', 'earring-4-xxg5297jml', '9q4Vl31vTbi8.jpg', 'vLpye7G7NsZp.jpg', NULL, NULL, NULL, NULL, NULL, 30, 50, 'Earring 3Earring 3Earring 3Earring 3Earring 3<br>', NULL, 'Earring 3Earring 3Earring 3Earring 3<br>', 1, 0, NULL, NULL, NULL, 0, NULL, 0, 'Earring', NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 1, 1, 1, 1, '2022-11-16 12:02:04', '2022-11-16 21:21:06', 1, '11/17/2022', NULL, NULL, 0, 0),
(190, 'p7s5327iAB', 'normal', NULL, 32, 5, 6, NULL, NULL, 'Necklace 1', 'necklace-1-p7s5327iab', '01J6Hnfw2nlr.jpg', 'tnFHnX5zlVGj.jpg', NULL, NULL, NULL, NULL, NULL, 30, 72, 'NecklaceNecklaceNecklaceNecklaceNecklace<br>', NULL, 'NecklaceNecklaceNecklaceNecklace<br>', 1, 0, NULL, NULL, NULL, 2, NULL, 0, 'necklace', NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 1, 1, 1, 1, '2022-11-16 12:03:08', '2022-11-16 21:20:54', 1, '11/17/2022', NULL, NULL, 0, 0),
(191, '5H25391rCR', 'normal', NULL, 32, 5, 6, NULL, NULL, 'Necklace 2', 'necklace-2-5h25391rcr', 'kSxkaBJVLGXU.jpg', 'npSL5qYArM42.jpg', NULL, NULL, NULL, NULL, NULL, 40, 200, 'NecklaceNecklaceNecklaceNecklaceNecklace<br>', NULL, 'NecklaceNecklaceNecklaceNecklaceNecklace<br>', 1, 0, NULL, NULL, NULL, 2, NULL, 0, 'Necklace', NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 1, 1, 1, 1, '2022-11-16 12:03:41', '2022-11-16 21:20:45', 1, '11/17/2022', NULL, NULL, 0, 0),
(192, 'Kgl5645ULD', 'normal', NULL, 32, 5, 7, NULL, NULL, 'Hand Bags', 'hand-bags-kgl5645uld', 'vdeIVSYt0Iog.jpg', 'xeRU5CHT9xJX.jpg', NULL, NULL, NULL, NULL, '#000000,#e33d3d,#fcfcfc', 50, 210, 'Hand BagsHand BagsHand BagsHand BagsHand BagsHand Bags<br>', NULL, 'Hand BagsHand BagsHand BagsHand BagsHand Bags<br>', 1, 0, NULL, NULL, NULL, 2, '5-7 days', 0, 'HandBags', NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 1, 1, 1, 1, '2022-11-16 12:08:36', '2022-11-16 21:20:33', 1, '11/17/2022', NULL, NULL, 0, 0),
(193, '0d15719z8j', 'normal', NULL, 32, 5, 7, NULL, NULL, 'Hand Bags 2', 'hand-bags-2-0d15719z8j', 'peqfycgZSpn4.jpg', 'mXU9KhV1Cp5g.jpg', NULL, NULL, NULL, NULL, '#000000,#ffffff', 45, 104, 'Hand BagsHand BagsHand BagsHand BagsHand BagsHand BagsHand Bags<br>', NULL, 'Hand BagsHand BagsHand BagsHand BagsHand Bags<br>', 1, 0, NULL, NULL, NULL, 2, '5-7 days', 0, 'HandBags', NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 1, 1, 1, 1, '2022-11-16 12:09:18', '2022-11-16 21:20:24', 1, '11/17/2022', NULL, NULL, 0, 0),
(194, '18W57606Ik', 'normal', NULL, 32, 5, 7, NULL, NULL, 'Hand Bags 3', 'hand-bags-3-18w57606ik', 'alT5CL11qt56.jpg', 'dptA1Lac4Spe.jpg', NULL, NULL, NULL, NULL, '#000000,#ffffff', 75, 207, 'Hand BagsHand BagsHand BagsHand BagsHand BagsHand BagsHand Bags<br>', NULL, 'Hand BagsHand BagsHand BagsHand BagsHand BagsHand Bags<br>', 1, 0, NULL, NULL, NULL, 2, '5-7 days', 0, 'HandBags', NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 1, 1, 1, 1, '2022-11-16 12:09:59', '2022-11-16 21:20:14', 1, '11/17/2022', NULL, NULL, 0, 0),
(195, 'SP05840z90', 'normal', NULL, 32, 5, 9, NULL, NULL, 'Shoes', 'shoes-sp05840z90', 'zrN2We8gUe1D.jpg', '4KAEm7epUzaa.jpg', NULL, NULL, NULL, NULL, '#000000', 150, 321, 'ShoesShoesShoesShoesShoesShoesShoesShoesShoes<br>', NULL, 'ShoesShoesShoesShoesShoesShoes<br>', 1, 0, NULL, NULL, NULL, 2, '5-7 days', 0, 'Shoes', NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 1, 1, 1, 1, '2022-11-16 12:11:21', '2022-11-16 21:20:05', 1, '11/17/2022', NULL, NULL, 0, 0),
(196, 'ylO5884mxC', 'normal', NULL, 32, 5, 9, NULL, NULL, 'Shoes 2', 'shoes-2-ylo5884mxc', 'oS1nUzW8rq52.jpg', 'ULT3uj0popv0.jpg', NULL, NULL, NULL, NULL, '#000000', 172, 250, 'ShoesShoesShoesShoesShoesShoesShoesShoesShoes<br>', NULL, 'ShoesShoesShoesShoesShoesShoesShoesShoesShoes<br>', 1, 0, NULL, NULL, NULL, 2, '5-7 days', 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 1, 1, 1, 1, '2022-11-16 12:11:55', '2022-11-16 21:19:57', 1, '11/17/2022', NULL, NULL, 0, 0),
(197, 'pGk5918K7J', 'normal', NULL, 32, 5, 9, NULL, NULL, 'Shoes 3', 'shoes-3-pgk5918k7j', 'bTL0l5ZUPaBX.jpg', 'wqlXzNHf64xH.jpg', NULL, NULL, NULL, NULL, '#000000', 175, 224, 'ShoesShoesShoesShoesShoesShoes<br>', NULL, 'ShoesShoesShoesShoesShoes<br>', 1, 0, NULL, NULL, NULL, 2, '5-7 days', 0, NULL, NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 1, 1, 1, 1, '2022-11-16 12:13:15', '2022-11-16 21:19:49', 1, '11/17/2022', NULL, NULL, 0, 0),
(198, 'xyR6057mUZ', 'normal', NULL, 32, 5, 8, NULL, NULL, 'clothes 2', 'clothes-2-xyr6057muz', 'cpDRn0zfobWO.jpg', 'JS9Q1vLnP6kd.jpg', NULL, NULL, NULL, NULL, '#000000', 165, 275, 'clothes&nbsp;clothes&nbsp;clothes&nbsp;clothes&nbsp;clothes&nbsp;clothes&nbsp;clothes&nbsp;clothes&nbsp;<br>', NULL, 'clothes&nbsp;clothes&nbsp;clothes&nbsp;clothes&nbsp;clothes&nbsp;clothes&nbsp;<br>', 1, 0, NULL, NULL, NULL, 2, '5-7 days', 0, 'clothes', NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 1, 1, 1, 1, '2022-11-16 12:15:03', '2022-11-16 21:19:41', 1, '11/17/2022', NULL, NULL, 0, 0),
(199, 'Qgx6112oa8', 'normal', NULL, 32, 5, 8, NULL, NULL, 'clothes 3', 'clothes-3-qgx6112oa8', 'SRAAsK2BJofE.jpg', 'h34VEPZ13wON.jpg', NULL, NULL, NULL, NULL, '#000000', 145, 200, 'clothes&nbsp;clothes&nbsp;clothes&nbsp;clothes&nbsp;clothes&nbsp;<br>', NULL, 'clothes&nbsp;clothes&nbsp;clothes&nbsp;clothes&nbsp;clothes&nbsp;<br>', 1, 0, NULL, NULL, NULL, 2, '5-7 days', 0, 'clothes', NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2022-11-16 12:16:03', '2022-11-16 12:16:03', 0, NULL, '10', '5', 0, 0),
(200, '9Kl61664Ju', 'normal', NULL, 32, 5, 7, NULL, NULL, 'clothes 4', 'clothes-4-9kl61664ju', 'rJVUmXc3UCo0.jpg', 'IbwLyS5zhFGO.jpg', NULL, 'S,M,L', '4,5,15', '0,0,0', '#000000', 185, 299, 'clothes&nbsp;clothes&nbsp;clothes&nbsp;clothes&nbsp;clothes&nbsp;clothes&nbsp;clothes&nbsp;<br>', NULL, 'clothes&nbsp;clothes&nbsp;clothes&nbsp;clothes&nbsp;clothes&nbsp;<br>', 1, 0, NULL, NULL, NULL, 2, NULL, 0, 'clothes', NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 1, 1, 1, 1, '2022-11-16 12:17:24', '2022-11-16 21:19:28', 1, '11/17/2022', NULL, NULL, 0, 0),
(201, 'MYC63215Ye', 'normal', NULL, 32, 7, 5, NULL, NULL, 'Iphone 14 promax 1T', 'iphone-14-promax-1t-myc63215ye', 'LEcyhex9g5EF.jpg', 'GhbdKXYSM0Mn.jpg', NULL, NULL, NULL, NULL, '#000000,#a19999', 1000, 2000, '<font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">Iphone 14 promax 1TIphone 14 promax 1TIphone 14 promax 1TIphone 14 promax 1TIphone 14 promax 1T</font></font><br>', NULL, '<font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">Iphone 14 promax 1TIphone 14 promax 1TIphone 14 promax 1T</font></font><br>', 1, 0, NULL, NULL, NULL, 2, '5-7 days', 0, 'iphone', NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 1, 1, 1, 1, '2022-11-16 12:19:58', '2022-11-16 21:19:16', 1, '11/17/2022', NULL, NULL, 0, 0),
(202, 'Unz64009SO', 'normal', NULL, 32, 7, 5, NULL, NULL, 'Iphone 13 promax 1T', 'iphone-13-promax-1t-unz64009so', 'CKyReXHYLxCN.jpg', 'MabQ7hQJ10Fy.jpg', NULL, NULL, NULL, NULL, '#000000', 140, 238, 'Iphone 14 promax 1TIphone 14 prIphone 14 promax 1TIphone 14 promax 1TIphone 14 promax 1TIphone 14 promax 1TIphone 14 promax 1Tomax 1TIphone 14 promax 1TIphone 14 promax 1TIphone 14 promax 1T<br>', NULL, 'Iphone 14 promax 1TIphone 14 promax 1TIphone 14 promax 1TIphone 14 promax 1T<br>', 1, 0, NULL, NULL, NULL, 2, '5-7 days', 0, 'iphone', NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '2022-11-16 12:20:41', '2022-11-16 12:20:41', 0, NULL, NULL, NULL, 0, 0),
(203, 'cyg64939pu', 'normal', NULL, 32, 7, 3, NULL, NULL, 'Samsung galaxy C280', 'samsung-galaxy-c280-cyg64939pu', 'Odk1ppYVico8.jpg', 'fnwjxIja78TC.jpg', NULL, NULL, NULL, NULL, '#000000', 1200, 2400, 'Samsung galaxy C280Samsung galaxy C280Samsung galaxy C280Samsung galaxy C280<br>', NULL, 'Samsung galaxy C280Samsung galaxy C280Samsung galaxy C280Samsung galaxy C280<br>', 1, 0, NULL, NULL, NULL, 2, '5-7 days', 0, 'samsung', NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 1, 1, 1, 1, '2022-11-16 12:23:03', '2022-11-16 21:23:18', 1, '11/18/2022', NULL, NULL, 0, 0),
(204, 'LU56586CvW', 'normal', NULL, 32, 7, 3, NULL, NULL, 'Samsung B211', 'samsung-b211-lu56586cvw', 'IIsnjLiYVyQJ.jpg', 'BcJK0gvscgrO.jpg', NULL, NULL, NULL, NULL, '#000000,#c72020', 850, 1500, 'Samsung B211Samsung B211Samsung B211<br>', NULL, 'Samsung B211Samsung B211Samsung B211<br>', 1, 2, NULL, NULL, NULL, 2, '5-7 days', 0, 'samsung', NULL, NULL, 'Physical', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 1, 1, 1, 1, '2022-11-16 12:26:00', '2022-11-16 21:22:55', 1, '11/18/2022', NULL, NULL, 0, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_clicks`
--

CREATE TABLE `product_clicks` (
  `id` int(191) NOT NULL,
  `product_id` int(191) NOT NULL,
  `date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `product_clicks`
--

INSERT INTO `product_clicks` (`id`, `product_id`, `date`) VALUES
(38, 95, '2022-11-15'),
(44, 181, '2022-11-16'),
(47, 182, '2022-11-16'),
(48, 183, '2022-11-16'),
(49, 184, '2022-11-16'),
(50, 182, '2022-11-16'),
(51, 184, '2022-11-16'),
(52, 184, '2022-11-16'),
(53, 184, '2022-11-16'),
(54, 184, '2022-11-16'),
(55, 181, '2022-11-16'),
(57, 183, '2022-11-16'),
(58, 185, '2022-11-16'),
(59, 185, '2022-11-16'),
(60, 184, '2022-11-16'),
(61, 183, '2022-11-16'),
(62, 185, '2022-11-16'),
(63, 185, '2022-11-16'),
(64, 185, '2022-11-16'),
(65, 185, '2022-11-16'),
(66, 185, '2022-11-16'),
(67, 185, '2022-11-16'),
(68, 95, '2022-11-16'),
(69, 181, '2022-11-16'),
(70, 204, '2022-11-16'),
(71, 204, '2022-11-16'),
(72, 181, '2022-11-17'),
(73, 182, '2022-11-17'),
(74, 183, '2022-11-17');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ratings`
--

CREATE TABLE `ratings` (
  `id` int(191) NOT NULL,
  `user_id` int(191) NOT NULL,
  `product_id` int(191) NOT NULL,
  `review` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rating` tinyint(2) NOT NULL,
  `review_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `ratings`
--

INSERT INTO `ratings` (`id`, `user_id`, `product_id`, `review`, `rating`, `review_date`) VALUES
(1, 29, 184, 'glassed good', 5, '2022-11-16 14:26:39');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `replies`
--

CREATE TABLE `replies` (
  `id` int(11) NOT NULL,
  `user_id` int(191) UNSIGNED NOT NULL,
  `comment_id` int(191) UNSIGNED NOT NULL,
  `text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `reports`
--

CREATE TABLE `reports` (
  `id` int(191) NOT NULL,
  `user_id` int(191) NOT NULL,
  `product_id` int(192) NOT NULL,
  `title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `reviews`
--

CREATE TABLE `reviews` (
  `id` int(10) UNSIGNED NOT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subtitle` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `reviews`
--

INSERT INTO `reviews` (`id`, `photo`, `title`, `subtitle`, `details`) VALUES
(4, '1668618602e40ff129a29c6362b85a601274d9495f.jpg', 'Minh Hoàng', 'CEO & Founder', 'Pain is important, and it will be followed by obesity tomorrow.'),
(5, '1668618503z3847121216613_1db9d1fcfd1d9ffe97505e2bc2a9e61e.jpg', 'Tam An', 'CEO & Founder', 'Pain is important, and it will be followed by obesity tomorrow.'),
(6, '1557343024img.jpg', 'Hữu Điểm', 'CEO & Founder', 'Pain is important, and it will be followed by obesity tomorrow.');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `roles`
--

CREATE TABLE `roles` (
  `id` int(191) NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `section` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `roles`
--

INSERT INTO `roles` (`id`, `name`, `section`) VALUES
(16, 'Manager', 'orders , products , affilate_products , customers , vendors , vendor_subscription_plans , categories , bulk_product_upload , product_discussion , set_coupons , blog , messages , general_settings , home_page_settings , menu_page_settings , emails_settings , payment_settings , social_settings , language_settings , seo_tools , subscribers'),
(18, 'Staff', 'orders , products , vendors , vendor_subscription_plans , categories , blog , home_page_settings , menu_page_settings , language_settings , seo_tools , subscribers');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `seotools`
--

CREATE TABLE `seotools` (
  `id` int(10) UNSIGNED NOT NULL,
  `google_analytics` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keys` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `seotools`
--

INSERT INTO `seotools` (`id`, `google_analytics`, `meta_keys`) VALUES
(1, '<script>//Google Analytics Scriptfffffffffffffffffffffffssssfffffs</script>', 'Genius,Ocean,Sea,Etc,Genius,Ocean,SeaGenius,Ocean,Sea,Etc,Genius,Ocean,SeaGenius,Ocean,Sea,Etc,Genius,Ocean,Sea');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `services`
--

CREATE TABLE `services` (
  `id` int(191) NOT NULL,
  `user_id` int(191) NOT NULL DEFAULT 0,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `services`
--

INSERT INTO `services` (`id`, `user_id`, `title`, `details`, `photo`) VALUES
(2, 0, 'FREE SHIPPING', 'Free Shipping All Order', '1561348133service1.png'),
(3, 0, 'PAYMENT METHOD', 'Secure Payment', '1561348138service2.png'),
(4, 0, '30 DAY RETURNS', '30-Day Return Policy', '1561348143service3.png'),
(5, 0, 'HELP CENTER', '24/7 Support System', '1561348147service4.png'),
(6, 13, 'FREE SHIPPING', 'Free Shipping All Order', '1563247602brand1.png'),
(7, 13, 'PAYMENT METHOD', 'Secure Payment', '1563247614brand2.png'),
(8, 13, '30 DAY RETURNS', '30-Day Return Policy', '1563247620brand3.png'),
(9, 13, 'HELP CENTER', '24/7 Support System', '1563247670brand4.png');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `shippings`
--

CREATE TABLE `shippings` (
  `id` int(11) NOT NULL,
  `user_id` int(191) NOT NULL DEFAULT 0,
  `title` text DEFAULT NULL,
  `subtitle` text DEFAULT NULL,
  `price` double NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `shippings`
--

INSERT INTO `shippings` (`id`, `user_id`, `title`, `subtitle`, `price`) VALUES
(1, 0, 'Free Shipping', '(10 - 12 days)', 0),
(2, 0, 'Express Shipping', '(5 - 6 days)', 10);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sliders`
--

CREATE TABLE `sliders` (
  `id` int(191) UNSIGNED NOT NULL,
  `subtitle_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subtitle_size` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subtitle_color` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subtitle_anime` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title_size` varchar(50) DEFAULT NULL,
  `title_color` varchar(50) DEFAULT NULL,
  `title_anime` varchar(50) DEFAULT NULL,
  `details_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details_size` varchar(50) DEFAULT NULL,
  `details_color` varchar(50) DEFAULT NULL,
  `details_anime` varchar(50) DEFAULT NULL,
  `photo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `sliders`
--

INSERT INTO `sliders` (`id`, `subtitle_text`, `subtitle_size`, `subtitle_color`, `subtitle_anime`, `title_text`, `title_size`, `title_color`, `title_anime`, `details_text`, `details_size`, `details_color`, `details_anime`, `photo`, `position`, `link`) VALUES
(8, 'World Fashion', '24', '#ffffff', 'slideInUp', 'Get Up to 40% Off', '60', '#ffffff', 'slideInDown', 'Highlight your personality  and look with these fabulous and exquisite fashion.', '16', '#ffffff', 'slideInRight', '1564224870012.jpg', 'slide-three', 'https://www.google.com/'),
(9, 'World Fashion', '24', '#ffffff', 'slideInUp', 'Get Up to 40% Off', '60', '#ffffff', 'slideInDown', 'Highlight your personality  and look with these fabulous and exquisite fashion.', '16', '#ffffff', 'slideInDown', '1564224753007.jpg', 'slide-one', 'https://www.google.com/'),
(10, 'World Fashion', '24', '#c32d2d', 'slideInUp', 'Get Up to 40% Off', '60', '#bc2727', 'slideInDown', 'Highlight your personality  and look with these fabulous and exquisite fashion.', '16', '#c51d1d', 'slideInLeft', '156422490902.jpg', 'slide-one', 'https://www.google.com/');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `socialsettings`
--

CREATE TABLE `socialsettings` (
  `id` int(10) UNSIGNED NOT NULL,
  `facebook` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gplus` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `twitter` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `linkedin` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dribble` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `f_status` tinyint(4) NOT NULL DEFAULT 1,
  `g_status` tinyint(4) NOT NULL DEFAULT 1,
  `t_status` tinyint(4) NOT NULL DEFAULT 1,
  `l_status` tinyint(4) NOT NULL DEFAULT 1,
  `d_status` tinyint(4) NOT NULL DEFAULT 1,
  `f_check` tinyint(10) DEFAULT NULL,
  `g_check` tinyint(10) DEFAULT NULL,
  `fclient_id` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fclient_secret` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fredirect` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gclient_id` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gclient_secret` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gredirect` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `socialsettings`
--

INSERT INTO `socialsettings` (`id`, `facebook`, `gplus`, `twitter`, `linkedin`, `dribble`, `f_status`, `g_status`, `t_status`, `l_status`, `d_status`, `f_check`, `g_check`, `fclient_id`, `fclient_secret`, `fredirect`, `gclient_id`, `gclient_secret`, `gredirect`) VALUES
(1, 'https://www.facebook.com/', 'https://plus.google.com/', 'https://twitter.com/', 'https://www.linkedin.com/', 'https://dribbble.com/', 1, 0, 1, 1, 0, 1, 1, '503140663460329', 'f66cd670ec43d14209a2728af26dcc43', 'https://localhost/geniuscart1.7.4/auth/facebook/callback', '904681031719-sh1aolu42k7l93ik0bkiddcboghbpcfi.apps.googleusercontent.com', 'yGBWmUpPtn5yWhDAsXnswEX3', 'http://localhost/geniuscart1.7.4/auth/google/callback');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `social_providers`
--

CREATE TABLE `social_providers` (
  `id` int(191) NOT NULL,
  `user_id` int(191) NOT NULL,
  `provider_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `provider` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `subcategories`
--

CREATE TABLE `subcategories` (
  `id` int(191) NOT NULL,
  `category_id` int(191) NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `subcategories`
--

INSERT INTO `subcategories` (`id`, `category_id`, `name`, `slug`, `status`) VALUES
(2, 4, 'TELEVISION', 'television', 0),
(3, 7, 'SAMSUNG', 'samsung', 1),
(4, 7, 'OPPO', 'oppo', 1),
(5, 7, 'IPHONE', 'iphone', 1),
(6, 5, 'ACCESSORIES', 'accessories', 1),
(7, 5, 'Hand Bags', 'hand-bags', 1),
(8, 5, 'CLOTHINGS', 'clothings', 1),
(9, 5, 'SHOES', 'shoes', 1),
(12, 7, 'LG', 'lg', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `subscribers`
--

CREATE TABLE `subscribers` (
  `id` int(191) NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `subscribers`
--

INSERT INTO `subscribers` (`id`, `email`) VALUES
(1, 'huudiem2510@gmail.com');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `subscriptions`
--

CREATE TABLE `subscriptions` (
  `id` int(11) NOT NULL,
  `title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL DEFAULT 0,
  `days` int(11) NOT NULL,
  `allowed_products` int(11) NOT NULL DEFAULT 0,
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `subscriptions`
--

INSERT INTO `subscriptions` (`id`, `title`, `currency`, `currency_code`, `price`, `days`, `allowed_products`, `details`) VALUES
(7, 'Unlimited', '$', 'USD', 250, 365, 0, '<div style=\"text-align: center;\"><span style=\"color: rgb(0, 0, 0);\">1. Advanced package</span></div><div><div style=\"text-align: center;\"><span style=\"color: rgb(0, 0, 0);\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 2. Unlimited product posting</span></div><div style=\"text-align: center;\"><span style=\"\" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" text-align:=\"\" justify;\"=\"\"><font color=\"#000000\">&nbsp; &nbsp; &nbsp; &nbsp; 3. Full function for sellers</font><br></span></div></div><blockquote style=\"margin: 0 0 0 40px; border: none; padding: 0px;\"><div><div style=\"text-align: center;\"><span style=\"\" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" text-align:=\"\" justify;\"=\"\"><font color=\"#000000\"><br></font></span></div></div></blockquote>'),
(8, 'Basic', '$', 'USD', 0, 30, 5, 'Basic package !');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fax` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_provider` tinyint(10) NOT NULL DEFAULT 0,
  `status` tinyint(10) NOT NULL DEFAULT 0,
  `verification_link` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified` enum('Yes','No') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'No',
  `affilate_code` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `affilate_income` double NOT NULL DEFAULT 0,
  `shop_name` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `owner_name` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shop_number` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shop_address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reg_number` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shop_message` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shop_details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shop_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `f_url` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `g_url` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `t_url` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `l_url` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_vendor` tinyint(1) NOT NULL DEFAULT 0,
  `f_check` tinyint(1) NOT NULL DEFAULT 0,
  `g_check` tinyint(1) NOT NULL DEFAULT 0,
  `t_check` tinyint(1) NOT NULL DEFAULT 0,
  `l_check` tinyint(1) NOT NULL DEFAULT 0,
  `mail_sent` tinyint(1) NOT NULL DEFAULT 0,
  `shipping_cost` double NOT NULL DEFAULT 0,
  `current_balance` double NOT NULL DEFAULT 0,
  `date` date DEFAULT NULL,
  `ban` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `photo`, `zip`, `city`, `country`, `address`, `phone`, `fax`, `email`, `password`, `remember_token`, `created_at`, `updated_at`, `is_provider`, `status`, `verification_link`, `email_verified`, `affilate_code`, `affilate_income`, `shop_name`, `owner_name`, `shop_number`, `shop_address`, `reg_number`, `shop_message`, `shop_details`, `shop_image`, `f_url`, `g_url`, `t_url`, `l_url`, `is_vendor`, `f_check`, `g_check`, `t_check`, `l_check`, `mail_sent`, `shipping_cost`, `current_balance`, `date`, `ban`) VALUES
(13, 'Vendor', '1557677677bouquet_PNG62.png', '1234', 'Washington, DC', 'Algeria', 'Space Needle 400 Broad St, Seattles', '3453453345453411', '23123121', 'vendor@gmail.com', '$2y$10$.4NrvXAeyToa4x07EkFvS.XIUEc/aXGsxe1onkQ.Udms4Sl2W9ZYq', 'HJu2C7ikS1fNW9RkNStQWJxMr1Nr6Rl6NRoblI4kbwSiZhdQXszqy7iN8QqC', '2018-03-07 18:05:44', '2022-11-16 12:04:22', 0, 2, '$2y$10$oIf1at.0LwscVwaX/8h.WuSwMKEAAsn8EJ.9P7mWzNUFIcEBQs8ry', 'Yes', '$2y$10$oIf1at.0LwscVwaX/8h.WuSwMKEAAsn8EJ.9P7mWzNUFIcEBQs8rysdfsdfds', 5000, 'Test Stores', 'User', '43543534', 'Space Needle 400 Broad St, Seattles', 'asdasd', 'sdf', '<br>', NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, 0, 0, 4978.02, '2019-11-24', 1),
(29, 'Hữu Điểm', NULL, NULL, NULL, NULL, 'hcm', '0971894618', NULL, 'huudiem2510@gmail.com', '$2y$10$vpqqFjPMYMg3KpUmly5fHODqIFe5DvRbGelyh4rvSWtzweFzfOD1y', NULL, '2022-11-15 08:47:32', '2022-11-16 03:28:28', 0, 0, 'ab9c009c5b43c90bee475627a7e85df4', 'Yes', '2b54589f99c766122bb1262d6f2e7ba3', 0, 'Shopping', 'điểm', '1', 'hcm', '45345', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, 0, 1, 0, 0, '2022-12-16', 0),
(31, 'Nhà bán hànga', NULL, NULL, NULL, NULL, 'hcm', '0971894618', NULL, 'satthucrisi3@gmail.com', '$2y$10$0wCk4z10li7OCwJwGQ13x.2TOP5Osi6LZ.bpoZecgjzW.eVi7cslG', NULL, '2022-11-16 03:16:55', '2022-11-16 03:16:55', 0, 0, 'e2210cff80e0f93e932632517cb48df4', 'Yes', '2251e01029c09f3b6f0fffa25a1110eb', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0),
(32, 'user', NULL, NULL, NULL, NULL, 'hcm', '0971894618', NULL, 'satthucrisi1@gmail.com', '$2y$10$R23hxFt1.AbLBeIwhTO0H.r70QmOk5aBxvRfg88yKYxhk2N38KUR2', NULL, '2022-11-16 06:41:00', '2022-11-16 07:20:09', 0, 0, 'aa5fa56b877fb3bac7b9fb42372179b3', 'Yes', '81dde8ca50187494736c455aefcc0dc5', 0, 'Shopping1', 'điểm1', '2001', 'hcm', '45345', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, 0, 1, 0, 26, '2022-12-16', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_notifications`
--

CREATE TABLE `user_notifications` (
  `id` int(191) NOT NULL,
  `user_id` int(191) NOT NULL,
  `order_number` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `user_notifications`
--

INSERT INTO `user_notifications` (`id`, `user_id`, `order_number`, `is_read`, `created_at`, `updated_at`) VALUES
(1, 13, 'wuiGJCKZxG', 1, '2020-10-03 01:18:53', '2022-11-16 02:40:27'),
(2, 13, '2KdAxvuaKa', 1, '2020-10-03 01:19:57', '2022-11-16 02:40:27'),
(3, 13, 'kQSUdfSLEP', 1, '2020-10-03 01:23:33', '2022-11-16 02:40:27'),
(4, 13, 'BSjsjZ0jKs', 1, '2020-10-03 01:30:45', '2022-11-16 02:40:27'),
(5, 13, 'M7MM5XZffF', 1, '2020-10-03 01:47:29', '2022-11-16 02:40:27'),
(6, 13, 'mYcCSQ72wd', 1, '2020-10-03 01:48:33', '2022-11-16 02:40:27'),
(7, 13, 'EWWmq8tvvn', 1, '2020-10-03 01:49:40', '2022-11-16 02:40:27'),
(8, 13, 'ixyc5Hy2T5', 1, '2020-10-10 21:33:46', '2022-11-16 02:40:27'),
(9, 13, 'L1Ak0uAZKH', 1, '2020-10-10 21:36:15', '2022-11-16 02:40:27'),
(10, 13, 'ENgdWeCTWw', 1, '2020-10-10 21:46:32', '2022-11-16 02:40:27'),
(11, 13, 'i2BmG2XTwq', 1, '2020-10-10 21:50:51', '2022-11-16 02:40:27'),
(12, 13, 'EnPNwg0HBW', 1, '2020-10-11 00:13:09', '2022-11-16 02:40:27'),
(13, 13, 'syo6qqw9tj', 1, '2020-10-11 00:14:22', '2022-11-16 02:40:27'),
(14, 13, 'OTrilq0ksT', 1, '2020-10-11 00:15:23', '2022-11-16 02:40:27'),
(15, 13, 'OUt8COG6y3', 1, '2020-10-11 00:16:01', '2022-11-16 02:40:27'),
(16, 13, 'uqcXeGbPpL', 1, '2020-10-11 00:17:02', '2022-11-16 02:40:27'),
(17, 13, 'Z6keKYmaHj', 1, '2020-10-11 00:18:19', '2022-11-16 02:40:27'),
(18, 13, 'optY8xBJtR', 1, '2020-10-11 00:20:17', '2022-11-16 02:40:27'),
(19, 13, 'OqqbWR2Tnb', 1, '2020-10-11 00:20:59', '2022-11-16 02:40:27'),
(20, 13, 'pbDNzHMpqB', 1, '2020-10-11 00:23:34', '2022-11-16 02:40:27'),
(21, 13, '3DvLJRHa5R', 1, '2020-10-11 00:24:04', '2022-11-16 02:40:27'),
(22, 32, 'bbzM8t5mGs', 1, '2022-11-16 07:14:19', '2022-11-16 08:33:56'),
(23, 32, 'tmRguwXEVj', 1, '2022-11-16 07:32:21', '2022-11-16 08:33:56'),
(24, 32, 'ou7py8XkMF', 1, '2022-11-16 07:49:02', '2022-11-16 08:33:56'),
(25, 32, 'hNnYGykfW5', 1, '2022-11-16 07:50:37', '2022-11-16 08:33:56'),
(26, 32, 'llQ5cPIBIx', 1, '2022-11-16 07:53:53', '2022-11-16 08:33:56'),
(27, 32, 'Tl5merQpOG', 1, '2022-11-16 07:55:40', '2022-11-16 08:33:56'),
(28, 32, 'CU7TiU2ysa', 1, '2022-11-16 08:02:18', '2022-11-16 08:33:56'),
(29, 32, 'lfGYrlNUxA', 1, '2022-11-16 08:08:44', '2022-11-16 08:33:56'),
(30, 13, 'cl21CD66WW', 0, '2022-11-16 08:14:20', '2022-11-16 08:14:20'),
(31, 13, 't6G0VN4qqs', 0, '2022-11-16 08:16:02', '2022-11-16 08:16:02'),
(32, 13, 'uCU7LVgPg6', 0, '2022-11-16 08:17:54', '2022-11-16 08:17:54'),
(33, 13, '7NXJjQnPZo', 0, '2022-11-16 08:25:39', '2022-11-16 08:25:39'),
(34, 32, '20rA4Wj43K', 1, '2022-11-16 08:27:41', '2022-11-16 08:33:56'),
(35, 32, 'JSdy9yzry1', 1, '2022-11-16 08:31:11', '2022-11-16 08:33:56');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_subscriptions`
--

CREATE TABLE `user_subscriptions` (
  `id` int(191) NOT NULL,
  `user_id` int(191) NOT NULL,
  `subscription_id` int(191) NOT NULL,
  `title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL DEFAULT 0,
  `days` int(11) NOT NULL,
  `allowed_products` int(11) NOT NULL DEFAULT 0,
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `method` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Free',
  `txnid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `charge_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `payment_number` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `user_subscriptions`
--

INSERT INTO `user_subscriptions` (`id`, `user_id`, `subscription_id`, `title`, `currency`, `currency_code`, `price`, `days`, `allowed_products`, `details`, `method`, `txnid`, `charge_id`, `created_at`, `updated_at`, `status`, `payment_number`) VALUES
(84, 13, 5, 'Standard', '$', 'NGN', 60, 45, 25, '<ol><li>Lorem ipsum dolor sit amet<br></li><li>Lorem ipsum dolor sit ame<br></li><li>Lorem ipsum dolor sit am<br></li></ol>', 'Paystack', '242099342', NULL, '2019-10-10 02:35:29', '2020-10-11 00:27:15', 1, NULL),
(85, 29, 8, 'Basic', '$', 'USD', 0, 30, 5, '<ol><li>Lorem ipsum dolor sit amet<br></li><li>Lorem ipsum dolor sit ame<br></li><li>Lorem ipsum dolor sit am<br></li></ol>', 'Free', NULL, NULL, '2022-11-16 03:28:28', '2022-11-16 10:16:44', 1, NULL),
(86, 32, 8, 'Basic', '$', 'USD', 0, 30, 5, '<ol><li>Lorem ipsum dolor sit amet<br></li><li>Lorem ipsum dolor sit ame<br></li><li>Lorem ipsum dolor sit am<br></li></ol>', 'Free', NULL, NULL, '2022-11-16 06:44:23', '2022-11-16 10:16:44', 1, NULL),
(87, 32, 7, 'Unlimited', '$', 'USD', 250, 365, 0, '<span style=\"color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" text-align:=\"\" justify;\"=\"\">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</span><br>', 'Paypal', NULL, NULL, '2022-11-16 09:33:10', '2022-11-16 10:19:00', 0, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `vendor_orders`
--

CREATE TABLE `vendor_orders` (
  `id` int(191) NOT NULL,
  `user_id` int(191) NOT NULL,
  `order_id` int(191) NOT NULL,
  `qty` int(191) NOT NULL,
  `price` double NOT NULL,
  `order_number` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('pending','processing','completed','declined','on delivery') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `vendor_orders`
--

INSERT INTO `vendor_orders` (`id`, `user_id`, `order_id`, `qty`, `price`, `order_number`, `status`) VALUES
(22, 32, 22, 1, 26, 'bbzM8t5mGs', 'completed'),
(23, 32, 23, 1, 26, 'tmRguwXEVj', 'pending'),
(24, 32, 24, 1, 26, 'ou7py8XkMF', 'pending'),
(25, 32, 25, 1, 26, 'hNnYGykfW5', 'pending'),
(26, 32, 26, 1, 26, 'llQ5cPIBIx', 'pending'),
(27, 32, 27, 1, 26, 'Tl5merQpOG', 'pending'),
(28, 32, 28, 1, 26, 'CU7TiU2ysa', 'pending'),
(29, 32, 29, 1, 26, 'lfGYrlNUxA', 'pending'),
(30, 13, 30, 1, 57.5, 'cl21CD66WW', 'pending'),
(31, 13, 31, 1, 57.5, 't6G0VN4qqs', 'pending'),
(32, 13, 32, 1, 57.5, 'uCU7LVgPg6', 'pending'),
(33, 13, 33, 1, 57.5, '7NXJjQnPZo', 'pending'),
(34, 32, 34, 1, 46, '20rA4Wj43K', 'pending'),
(35, 32, 35, 1, 46, 'JSdy9yzry1', 'pending');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `verifications`
--

CREATE TABLE `verifications` (
  `id` int(191) NOT NULL,
  `user_id` int(191) NOT NULL,
  `attachments` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('Pending','Verified','Declined') DEFAULT NULL,
  `text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin_warning` tinyint(1) NOT NULL DEFAULT 0,
  `warning_reason` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `verifications`
--

INSERT INTO `verifications` (`id`, `user_id`, `attachments`, `status`, `text`, `admin_warning`, `warning_reason`, `created_at`, `updated_at`) VALUES
(4, 13, '1573723849Baby.tux-800x800.png,1573723849Baby.tux-800x800.png', 'Verified', 'TEst', 0, NULL, '2019-11-14 03:30:49', '2019-11-14 03:34:06');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `wishlists`
--

CREATE TABLE `wishlists` (
  `id` int(191) UNSIGNED NOT NULL,
  `user_id` int(191) UNSIGNED NOT NULL,
  `product_id` int(191) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `withdraws`
--

CREATE TABLE `withdraws` (
  `id` int(191) NOT NULL,
  `user_id` int(191) DEFAULT NULL,
  `method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `acc_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `iban` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `acc_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `swift` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` float DEFAULT NULL,
  `fee` float DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status` enum('pending','completed','rejected') NOT NULL DEFAULT 'pending',
  `type` enum('user','vendor') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Chỉ mục cho bảng `admin_languages`
--
ALTER TABLE `admin_languages`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `admin_user_conversations`
--
ALTER TABLE `admin_user_conversations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `admin_user_messages`
--
ALTER TABLE `admin_user_messages`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `attributes`
--
ALTER TABLE `attributes`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `attribute_options`
--
ALTER TABLE `attribute_options`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `blog_categories`
--
ALTER TABLE `blog_categories`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `childcategories`
--
ALTER TABLE `childcategories`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `conversations`
--
ALTER TABLE `conversations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `counters`
--
ALTER TABLE `counters`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `email_templates`
--
ALTER TABLE `email_templates`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `favorite_sellers`
--
ALTER TABLE `favorite_sellers`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `galleries`
--
ALTER TABLE `galleries`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `generalsettings`
--
ALTER TABLE `generalsettings`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `order_tracks`
--
ALTER TABLE `order_tracks`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `pagesettings`
--
ALTER TABLE `pagesettings`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `partners`
--
ALTER TABLE `partners`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `payment_gateways`
--
ALTER TABLE `payment_gateways`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `pickups`
--
ALTER TABLE `pickups`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);
ALTER TABLE `products` ADD FULLTEXT KEY `name` (`name`);
ALTER TABLE `products` ADD FULLTEXT KEY `attributes` (`attributes`);

--
-- Chỉ mục cho bảng `product_clicks`
--
ALTER TABLE `product_clicks`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `ratings`
--
ALTER TABLE `ratings`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `replies`
--
ALTER TABLE `replies`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `seotools`
--
ALTER TABLE `seotools`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `shippings`
--
ALTER TABLE `shippings`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `socialsettings`
--
ALTER TABLE `socialsettings`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `social_providers`
--
ALTER TABLE `social_providers`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `subcategories`
--
ALTER TABLE `subcategories`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `subscribers`
--
ALTER TABLE `subscribers`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Chỉ mục cho bảng `user_notifications`
--
ALTER TABLE `user_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `user_subscriptions`
--
ALTER TABLE `user_subscriptions`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `vendor_orders`
--
ALTER TABLE `vendor_orders`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `verifications`
--
ALTER TABLE `verifications`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `withdraws`
--
ALTER TABLE `withdraws`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `admin_languages`
--
ALTER TABLE `admin_languages`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `admin_user_conversations`
--
ALTER TABLE `admin_user_conversations`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `admin_user_messages`
--
ALTER TABLE `admin_user_messages`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `attributes`
--
ALTER TABLE `attributes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT cho bảng `attribute_options`
--
ALTER TABLE `attribute_options`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=259;

--
-- AUTO_INCREMENT cho bảng `banners`
--
ALTER TABLE `banners`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT cho bảng `blog_categories`
--
ALTER TABLE `blog_categories`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT cho bảng `childcategories`
--
ALTER TABLE `childcategories`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT cho bảng `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `conversations`
--
ALTER TABLE `conversations`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `counters`
--
ALTER TABLE `counters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT cho bảng `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=247;

--
-- AUTO_INCREMENT cho bảng `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `email_templates`
--
ALTER TABLE `email_templates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `favorite_sellers`
--
ALTER TABLE `favorite_sellers`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `galleries`
--
ALTER TABLE `galleries`
  MODIFY `id` int(191) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=235;

--
-- AUTO_INCREMENT cho bảng `generalsettings`
--
ALTER TABLE `generalsettings`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT cho bảng `order_tracks`
--
ALTER TABLE `order_tracks`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT cho bảng `packages`
--
ALTER TABLE `packages`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `pagesettings`
--
ALTER TABLE `pagesettings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `partners`
--
ALTER TABLE `partners`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `payment_gateways`
--
ALTER TABLE `payment_gateways`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT cho bảng `pickups`
--
ALTER TABLE `pickups`
  MODIFY `id` int(191) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` int(191) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=205;

--
-- AUTO_INCREMENT cho bảng `product_clicks`
--
ALTER TABLE `product_clicks`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT cho bảng `ratings`
--
ALTER TABLE `ratings`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `replies`
--
ALTER TABLE `replies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `reports`
--
ALTER TABLE `reports`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT cho bảng `seotools`
--
ALTER TABLE `seotools`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `services`
--
ALTER TABLE `services`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `shippings`
--
ALTER TABLE `shippings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` int(191) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `socialsettings`
--
ALTER TABLE `socialsettings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `social_providers`
--
ALTER TABLE `social_providers`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `subcategories`
--
ALTER TABLE `subcategories`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT cho bảng `subscribers`
--
ALTER TABLE `subscribers`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT cho bảng `user_notifications`
--
ALTER TABLE `user_notifications`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT cho bảng `user_subscriptions`
--
ALTER TABLE `user_subscriptions`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT cho bảng `vendor_orders`
--
ALTER TABLE `vendor_orders`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT cho bảng `verifications`
--
ALTER TABLE `verifications`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` int(191) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT cho bảng `withdraws`
--
ALTER TABLE `withdraws`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

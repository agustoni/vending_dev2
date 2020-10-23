-- phpMyAdmin SQL Dump
-- version 4.9.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Waktu pembuatan: 23 Okt 2020 pada 18.04
-- Versi server: 5.6.49
-- Versi PHP: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `biruid_dev2_pusat`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `username` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` smallint(6) NOT NULL DEFAULT '10',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `verification_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `admins`
--

INSERT INTO `admins` (`id`, `email`, `username`, `auth_key`, `password_hash`, `password_reset_token`, `status`, `created_at`, `updated_at`, `verification_token`) VALUES
(1, 'admin@root.com', 'admin', 'vJa4XHyRKRN3TV7YzJtHv8bj34OJyE1K', '$2y$13$LvHyJwjet79Q5jB7.FRBH.3RF5XrKr1HgriH22hcpRCwZrNAiET5q', NULL, 10, 1594884826, 1594884826, 'Au2xkzwgqN-fgsFu5xri0IijDLWhfSBt_1594884826'),
(2, 'cust1@mail.com', 'customer1', '48Sb5M0nsriIGDK9eoBxeLVt-cwgd5Zd', '$2y$13$Y7k1ap8f2pULJUjyIoAg.OfIQ87FKcot6iGRBGqAs3H/6qMEIG/ci', NULL, 10, 1603097283, 1603097283, 'eBUpMp0RUXFAAa3O-Mj1_FdzhUTHbhCA_1603097283'),
(3, 'cust2@mail.com', 'customer2', 'OzTlNs-G4Ko53TcGasAGf-tnTga82bf3', '$2y$13$QJhhs/cpbAuwLjmGqDwAsOPFN4IOjYW9VMZWeOrwQ0kmwFCG4yVny', NULL, 10, 1603097344, 1603097344, 'uUe1L1zBw7Aszhg6zj8coEEqiSUo6Hkm_1603097344'),
(4, 'cust3@mail.com', 'customer3', 'L8Mbtr0rPazto9hn0VNtmQ8ijDr1U0VM', '$2y$13$xI/b4NbfKOmTgE8hMbP6e..fqQF5jusm27oJOS7q5q1nkoao32vam', NULL, 10, 1603097402, 1603097402, 'U4FNQYkt_AD0Im8YdO42UFaEc55n7z6H_1603097402'),
(5, 'customer4@mail.com', 'customer4', '2UQqz4t7hJYfAGsRE0K99lDhq8BOAikN', '$2y$13$VFIiM8rvJ7Wr1d4cAKF88uNyIIAT6rMqN3xoZYajjBIwIKRHIK3uu', NULL, 10, 1603363279, 1603367629, NULL),
(17, 'customer5@mail.com', 'customer5', 'MuRvXXazugjC96FZud7qUfLiR3T-ioaP', '$2y$13$FTSqANZ5Zx7Dwr6lBDUCAO6qPBoZbVLrzbNx6okzCeA8qFcnXF//q', NULL, 10, 1603449273, 1603449273, 'Ll4_qnf1l1_A7866eS1Jhp41DTaobOXv_1603449273');

-- --------------------------------------------------------

--
-- Struktur dari tabel `auth_assignment`
--

CREATE TABLE `auth_assignment` (
  `item_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `auth_assignment`
--

INSERT INTO `auth_assignment` (`item_name`, `user_id`, `created_at`) VALUES
('customer', '17', 1603449273),
('customer', '2', 1603109582),
('owner', '1', 1603434017);

-- --------------------------------------------------------

--
-- Struktur dari tabel `auth_item`
--

CREATE TABLE `auth_item` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `type` smallint(6) NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `rule_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` blob,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `auth_item`
--

INSERT INTO `auth_item` (`name`, `type`, `description`, `rule_name`, `data`, `created_at`, `updated_at`) VALUES
('/admin/*', 2, NULL, NULL, NULL, 1603096387, 1603096387),
('/admin/assignment/*', 2, NULL, NULL, NULL, 1603096387, 1603096387),
('/admin/assignment/assign', 2, NULL, NULL, NULL, 1603096387, 1603096387),
('/admin/assignment/index', 2, NULL, NULL, NULL, 1603096387, 1603096387),
('/admin/assignment/revoke', 2, NULL, NULL, NULL, 1603096387, 1603096387),
('/admin/assignment/view', 2, NULL, NULL, NULL, 1603096387, 1603096387),
('/admin/default/*', 2, NULL, NULL, NULL, 1603096387, 1603096387),
('/admin/default/index', 2, NULL, NULL, NULL, 1603096387, 1603096387),
('/admin/menu/*', 2, NULL, NULL, NULL, 1603096387, 1603096387),
('/admin/menu/create', 2, NULL, NULL, NULL, 1603096387, 1603096387),
('/admin/menu/delete', 2, NULL, NULL, NULL, 1603096387, 1603096387),
('/admin/menu/index', 2, NULL, NULL, NULL, 1603096387, 1603096387),
('/admin/menu/update', 2, NULL, NULL, NULL, 1603096387, 1603096387),
('/admin/menu/view', 2, NULL, NULL, NULL, 1603096387, 1603096387),
('/admin/permission/*', 2, NULL, NULL, NULL, 1603096387, 1603096387),
('/admin/permission/assign', 2, NULL, NULL, NULL, 1603096387, 1603096387),
('/admin/permission/create', 2, NULL, NULL, NULL, 1603096387, 1603096387),
('/admin/permission/delete', 2, NULL, NULL, NULL, 1603096387, 1603096387),
('/admin/permission/index', 2, NULL, NULL, NULL, 1603096387, 1603096387),
('/admin/permission/remove', 2, NULL, NULL, NULL, 1603096387, 1603096387),
('/admin/permission/update', 2, NULL, NULL, NULL, 1603096387, 1603096387),
('/admin/permission/view', 2, NULL, NULL, NULL, 1603096387, 1603096387),
('/admin/role/*', 2, NULL, NULL, NULL, 1603096387, 1603096387),
('/admin/role/assign', 2, NULL, NULL, NULL, 1603096387, 1603096387),
('/admin/role/create', 2, NULL, NULL, NULL, 1603096387, 1603096387),
('/admin/role/delete', 2, NULL, NULL, NULL, 1603096387, 1603096387),
('/admin/role/index', 2, NULL, NULL, NULL, 1603096387, 1603096387),
('/admin/role/remove', 2, NULL, NULL, NULL, 1603096387, 1603096387),
('/admin/role/update', 2, NULL, NULL, NULL, 1603096387, 1603096387),
('/admin/role/view', 2, NULL, NULL, NULL, 1603096387, 1603096387),
('/admin/route/*', 2, NULL, NULL, NULL, 1603096387, 1603096387),
('/admin/route/assign', 2, NULL, NULL, NULL, 1603096387, 1603096387),
('/admin/route/create', 2, NULL, NULL, NULL, 1603096387, 1603096387),
('/admin/route/index', 2, NULL, NULL, NULL, 1603096387, 1603096387),
('/admin/route/refresh', 2, NULL, NULL, NULL, 1603096387, 1603096387),
('/admin/route/remove', 2, NULL, NULL, NULL, 1603096387, 1603096387),
('/admin/rule/*', 2, NULL, NULL, NULL, 1603096387, 1603096387),
('/admin/rule/create', 2, NULL, NULL, NULL, 1603096387, 1603096387),
('/admin/rule/delete', 2, NULL, NULL, NULL, 1603096387, 1603096387),
('/admin/rule/index', 2, NULL, NULL, NULL, 1603096387, 1603096387),
('/admin/rule/update', 2, NULL, NULL, NULL, 1603096387, 1603096387),
('/admin/rule/view', 2, NULL, NULL, NULL, 1603096387, 1603096387),
('/admin/user/*', 2, NULL, NULL, NULL, 1603096387, 1603096387),
('/admin/user/activate', 2, NULL, NULL, NULL, 1603096387, 1603096387),
('/admin/user/change-password', 2, NULL, NULL, NULL, 1603096387, 1603096387),
('/admin/user/delete', 2, NULL, NULL, NULL, 1603096387, 1603096387),
('/admin/user/index', 2, NULL, NULL, NULL, 1603096387, 1603096387),
('/admin/user/login', 2, NULL, NULL, NULL, 1603096387, 1603096387),
('/admin/user/logout', 2, NULL, NULL, NULL, 1603096387, 1603096387),
('/admin/user/request-password-reset', 2, NULL, NULL, NULL, 1603096387, 1603096387),
('/admin/user/reset-password', 2, NULL, NULL, NULL, 1603096387, 1603096387),
('/admin/user/signup', 2, NULL, NULL, NULL, 1603096387, 1603096387),
('/admin/user/view', 2, NULL, NULL, NULL, 1603096387, 1603096387),
('/debug/*', 2, NULL, NULL, NULL, 1603096387, 1603096387),
('/debug/default/*', 2, NULL, NULL, NULL, 1603096387, 1603096387),
('/debug/default/db-explain', 2, NULL, NULL, NULL, 1603096387, 1603096387),
('/debug/default/download-mail', 2, NULL, NULL, NULL, 1603096387, 1603096387),
('/debug/default/index', 2, NULL, NULL, NULL, 1603096387, 1603096387),
('/debug/default/toolbar', 2, NULL, NULL, NULL, 1603096387, 1603096387),
('/debug/default/view', 2, NULL, NULL, NULL, 1603096387, 1603096387),
('/debug/user/*', 2, NULL, NULL, NULL, 1603096387, 1603096387),
('/debug/user/reset-identity', 2, NULL, NULL, NULL, 1603096387, 1603096387),
('/debug/user/set-identity', 2, NULL, NULL, NULL, 1603096387, 1603096387),
('/gii/*', 2, NULL, NULL, NULL, 1603096387, 1603096387),
('/gii/default/*', 2, NULL, NULL, NULL, 1603096387, 1603096387),
('/gii/default/action', 2, NULL, NULL, NULL, 1603096387, 1603096387),
('/gii/default/diff', 2, NULL, NULL, NULL, 1603096387, 1603096387),
('/gii/default/index', 2, NULL, NULL, NULL, 1603096387, 1603096387),
('/gii/default/preview', 2, NULL, NULL, NULL, 1603096387, 1603096387),
('/gii/default/view', 2, NULL, NULL, NULL, 1603096387, 1603096387),
('/site/*', 2, NULL, NULL, NULL, 1603096387, 1603096387),
('/site/captcha', 2, NULL, NULL, NULL, 1603096387, 1603096387),
('/site/contact', 2, NULL, NULL, NULL, 1603096387, 1603096387),
('/site/error', 2, NULL, NULL, NULL, 1603096387, 1603096387),
('/site/index', 2, NULL, NULL, NULL, 1603096387, 1603096387),
('/site/login', 2, NULL, NULL, NULL, 1603096387, 1603096387),
('/site/logout', 2, NULL, NULL, NULL, 1603096387, 1603096387),
('/site/signup', 2, NULL, NULL, NULL, 1603096651, 1603096651),
('customer', 1, NULL, NULL, NULL, 1603096464, 1603096464),
('customer access', 2, NULL, NULL, NULL, 1603096423, 1603096423),
('owner', 1, NULL, NULL, NULL, 1603096454, 1603096454),
('owner access', 2, NULL, NULL, NULL, 1603096397, 1603096397);

-- --------------------------------------------------------

--
-- Struktur dari tabel `auth_item_child`
--

CREATE TABLE `auth_item_child` (
  `parent` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `child` varchar(64) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `auth_item_child`
--

INSERT INTO `auth_item_child` (`parent`, `child`) VALUES
('owner access', '/admin/*'),
('owner access', '/admin/assignment/*'),
('owner access', '/admin/assignment/assign'),
('owner access', '/admin/assignment/index'),
('owner access', '/admin/assignment/revoke'),
('owner access', '/admin/assignment/view'),
('owner access', '/admin/default/*'),
('owner access', '/admin/default/index'),
('owner access', '/admin/menu/*'),
('owner access', '/admin/menu/create'),
('owner access', '/admin/menu/delete'),
('owner access', '/admin/menu/index'),
('owner access', '/admin/menu/update'),
('owner access', '/admin/menu/view'),
('owner access', '/admin/permission/*'),
('owner access', '/admin/permission/assign'),
('owner access', '/admin/permission/create'),
('owner access', '/admin/permission/delete'),
('owner access', '/admin/permission/index'),
('owner access', '/admin/permission/remove'),
('owner access', '/admin/permission/update'),
('owner access', '/admin/permission/view'),
('owner access', '/admin/role/*'),
('owner access', '/admin/role/assign'),
('owner access', '/admin/role/create'),
('owner access', '/admin/role/delete'),
('owner access', '/admin/role/index'),
('owner access', '/admin/role/remove'),
('owner access', '/admin/role/update'),
('owner access', '/admin/role/view'),
('owner access', '/admin/route/*'),
('owner access', '/admin/route/assign'),
('owner access', '/admin/route/create'),
('owner access', '/admin/route/index'),
('owner access', '/admin/route/refresh'),
('owner access', '/admin/route/remove'),
('owner access', '/admin/rule/*'),
('owner access', '/admin/rule/create'),
('owner access', '/admin/rule/delete'),
('owner access', '/admin/rule/index'),
('owner access', '/admin/rule/update'),
('owner access', '/admin/rule/view'),
('owner access', '/admin/user/*'),
('owner access', '/admin/user/activate'),
('owner access', '/admin/user/change-password'),
('owner access', '/admin/user/delete'),
('owner access', '/admin/user/index'),
('owner access', '/admin/user/login'),
('owner access', '/admin/user/logout'),
('owner access', '/admin/user/request-password-reset'),
('owner access', '/admin/user/reset-password'),
('owner access', '/admin/user/signup'),
('owner access', '/admin/user/view'),
('owner access', '/debug/*'),
('owner access', '/debug/default/*'),
('owner access', '/debug/default/db-explain'),
('owner access', '/debug/default/download-mail'),
('owner access', '/debug/default/index'),
('owner access', '/debug/default/toolbar'),
('owner access', '/debug/default/view'),
('owner access', '/debug/user/*'),
('owner access', '/debug/user/reset-identity'),
('owner access', '/debug/user/set-identity'),
('owner access', '/gii/*'),
('owner access', '/gii/default/*'),
('owner access', '/gii/default/action'),
('owner access', '/gii/default/diff'),
('owner access', '/gii/default/index'),
('owner access', '/gii/default/preview'),
('owner access', '/gii/default/view'),
('owner access', '/site/*'),
('owner access', '/site/captcha'),
('owner access', '/site/contact'),
('customer access', '/site/error'),
('owner access', '/site/error'),
('customer access', '/site/index'),
('owner access', '/site/index'),
('customer access', '/site/login'),
('owner access', '/site/login'),
('customer access', '/site/logout'),
('owner access', '/site/logout'),
('owner access', '/site/signup'),
('customer', 'customer access'),
('owner', 'owner access');

-- --------------------------------------------------------

--
-- Struktur dari tabel `auth_rule`
--

CREATE TABLE `auth_rule` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `data` blob,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `catridges`
--

CREATE TABLE `catridges` (
  `id` int(11) NOT NULL,
  `id_mtr_type` int(11) NOT NULL,
  `code` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL,
  `id_machine` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `catridges`
--

INSERT INTO `catridges` (`id`, `id_mtr_type`, `code`, `status`, `id_machine`) VALUES
(1, 1, '001001', 'empty', 'AA001'),
(2, 2, '002001', 'empty', 'AA001'),
(3, 3, '003001', 'empty', 'AA001'),
(4, 4, '004001', 'empty', 'AA001'),
(5, 5, '005001', 'empty', 'AA001'),
(6, 6, '006001', 'empty', 'AA001'),
(7, 7, '007001', 'empty', 'AA001'),
(8, 8, '008001', 'empty', 'AA001'),
(9, 9, '009001', 'empty', 'AA001'),
(10, 10, '010001', 'empty', 'AA001'),
(11, 1, '001002', 'empty', 'AA001'),
(12, 1, '001003', 'empty', 'AA001'),
(13, 2, '002002', 'empty', 'AA001'),
(14, 2, '002003', 'empty', 'AA001'),
(15, 11, '011001', 'empty', 'AA001');

-- --------------------------------------------------------

--
-- Struktur dari tabel `catridge_history`
--

CREATE TABLE `catridge_history` (
  `id` int(11) NOT NULL,
  `code` varchar(50) NOT NULL,
  `from` varchar(50) NOT NULL,
  `to` varchar(50) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `catridge_status`
--

CREATE TABLE `catridge_status` (
  `id` int(11) NOT NULL,
  `status` varchar(50) NOT NULL,
  `keterangan` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `machine`
--

CREATE TABLE `machine` (
  `machine_code` varchar(5) NOT NULL,
  `pos_id` varchar(11) DEFAULT NULL,
  `store_id` varchar(20) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `machine`
--

INSERT INTO `machine` (`machine_code`, `pos_id`, `store_id`, `user_id`) VALUES
('AA001', 'A01', 'ID2020081400023', 1),
('AA002', 'A02', 'ID2020081400024', 2),
('AA003', 'A03', 'ID2020081400025', 3),
('AA004', 'A04', 'ID2020081400026', 4),
('AA005', 'A05', 'ID2020081400027', 5);

-- --------------------------------------------------------

--
-- Struktur dari tabel `machine_rent`
--

CREATE TABLE `machine_rent` (
  `id` int(11) NOT NULL,
  `id_machine` varchar(50) NOT NULL,
  `id_customer` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `rent_start` datetime NOT NULL,
  `rent_end` datetime NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `machine_rent`
--

INSERT INTO `machine_rent` (`id`, `id_machine`, `id_customer`, `created_at`, `rent_start`, `rent_end`, `status`) VALUES
(2, '', 17, '2020-10-23 10:34:33', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `machine_status`
--

CREATE TABLE `machine_status` (
  `id` int(11) NOT NULL,
  `ctg_mi` int(11) NOT NULL,
  `occu_catch` int(11) NOT NULL,
  `trv_catch` int(11) NOT NULL,
  `occu_panci1` int(11) NOT NULL,
  `occu_panci2` int(11) NOT NULL,
  `occu_panci3` int(11) NOT NULL,
  `occu_saringan` int(11) NOT NULL,
  `trv_saringan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `materials`
--

CREATE TABLE `materials` (
  `id` int(11) NOT NULL,
  `id_machine` varchar(50) NOT NULL,
  `id_mtr_type` int(11) NOT NULL,
  `id_product` int(11) DEFAULT NULL,
  `material` varchar(50) NOT NULL,
  `is_topping` int(11) DEFAULT '0' COMMENT 'jika true, berarti topping',
  `price` int(11) DEFAULT NULL COMMENT 'isTopping = true',
  `icon` varchar(50) DEFAULT NULL,
  `stock` float NOT NULL,
  `init_stock` float NOT NULL,
  `parstock` float NOT NULL,
  `usages` int(11) DEFAULT NULL,
  `code` varchar(50) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `materials`
--

INSERT INTO `materials` (`id`, `id_machine`, `id_mtr_type`, `id_product`, `material`, `is_topping`, `price`, `icon`, `stock`, `init_stock`, `parstock`, `usages`, `code`, `status`) VALUES
(1, 'AA001', 1, 6, 'Catridge Indomie Soto 1', 0, NULL, NULL, 40, 50, 10, 1, '001001', 1),
(2, 'AA001', 1, 6, 'Catridge Indomie Soto 2', 0, NULL, NULL, 40, 50, 10, 1, '001002', 1),
(3, 'AA001', 1, 6, 'Catridge Indomie Soto 3', 0, NULL, NULL, 40, 50, 10, 1, '001003', 1),
(4, 'AA001', 2, 7, 'Catridge Sedap Goreng 1', 0, NULL, NULL, 40, 50, 10, 1, '002001', 1),
(5, 'AA001', 2, 7, 'Catridge Sedap Goreng 2', 0, NULL, NULL, 40, 50, 10, 1, '002002', 1),
(6, 'AA001', 2, 7, 'Catridge Sedap Goreng 3', 0, NULL, NULL, 40, 50, 10, 1, '002003', 1),
(7, 'AA001', 3, NULL, 'Catridge Bubuk Cabe', 0, NULL, NULL, 40, 100, 30, NULL, '003001', 1),
(8, 'AA001', 4, NULL, 'Catridge Bumbu Bubuk Indomie Soto', 0, NULL, NULL, 40, 150, 10, 1, '004001', 1),
(9, 'AA001', 12, NULL, 'Catridge Minyak Indomie Soto', 0, NULL, NULL, 40, 150, 10, 1, '012001', 1),
(10, 'AA001', 5, NULL, 'Catridge Bumbu Bubuk Sedap Goreng', 0, NULL, NULL, 40, 150, 10, 1, '005001', 1),
(11, 'AA001', 13, NULL, 'Catridge Minyak Sedap Goreng', 0, NULL, NULL, 40, 150, 10, 1, '013001', 1),
(12, 'AA001', 11, NULL, 'Catridge Kecap Goreng', 0, NULL, NULL, 40, 150, 10, 1, '011001', 1),
(13, 'AA001', 6, NULL, 'Keju', 1, 3000, 'cheese-icon.png', 40, 50, 10, 1, '006001', 1),
(14, 'AA001', 7, NULL, 'Kornet', 1, 5000, 'corned-beef-icon.png', 40, 50, 10, 1, '007001', 1),
(15, 'AA001', 8, NULL, 'Catridge Sendok', 0, NULL, NULL, 40, 150, 10, 1, '008001', 1),
(16, 'AA001', 9, NULL, 'Catridge Mangkok', 0, NULL, NULL, 40, 150, 10, 1, '009001', 1),
(17, 'AA001', 10, NULL, 'Catridge Air', 0, NULL, NULL, 40, 150, 10, 1, '010001', 1),
(18, 'AA002', 10, NULL, 'Catridge Air', 0, NULL, NULL, 0, 150, 10, 1, '010001', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `material_history`
--

CREATE TABLE `material_history` (
  `id` int(11) NOT NULL,
  `id_material` int(11) NOT NULL,
  `from` varchar(50) NOT NULL,
  `to` varchar(50) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `material_type`
--

CREATE TABLE `material_type` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `material_type`
--

INSERT INTO `material_type` (`id`, `name`) VALUES
(1, 'Indomie Soto'),
(2, 'Sedap Goreng'),
(3, 'Bubuk Cabe'),
(4, 'Bumbu Bubuk Indomie Soto'),
(5, 'Bumbu Bubuk Sedap Goreng'),
(6, 'Keju'),
(7, 'Kornet'),
(8, 'Sendok'),
(9, 'Mangkok'),
(10, 'Air'),
(11, 'Kecap Sedap Goreng'),
(12, 'Minyak Indomie Soto'),
(13, 'Minyak Sedap Goreng');

-- --------------------------------------------------------

--
-- Struktur dari tabel `menu`
--

CREATE TABLE `menu` (
  `id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `parent` int(11) DEFAULT NULL,
  `route` varchar(255) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `data` blob
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `menu`
--

INSERT INTO `menu` (`id`, `name`, `parent`, `route`, `order`, `data`) VALUES
(1, 'Dashboard', NULL, '/site/index', NULL, NULL),
(2, 'RBAC', NULL, NULL, NULL, NULL),
(3, 'RBAC Route', 2, '/admin/route/index', 1, NULL),
(4, 'RBAC Permission', 2, '/admin/permission/index', 2, NULL),
(5, 'RBAC Menu', 2, '/admin/menu/index', 3, NULL),
(6, 'RBAC Role', 2, '/admin/role/index', 4, NULL),
(7, 'RBAC Assignment', 2, '/admin/assignment/index', 5, NULL),
(8, 'RBAC User', 2, '/admin/user/index', 6, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `id_category` int(11) NOT NULL,
  `product` varchar(100) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `product`
--

INSERT INTO `product` (`id`, `id_category`, `product`, `image`, `sort`, `status`) VALUES
(1, 1, 'OVO', 'logo-ovo.jpg', 2, 1),
(2, 1, 'GoPay', 'logo-gopay.jpg', 3, 1),
(3, 1, 'Shopee', 'logo-shopee.jpg', 5, 1),
(4, 1, 'ETOLL Mandiri', NULL, 6, 0),
(5, 1, 'ETOLL BRI', NULL, 7, 0),
(6, 2, 'Indomie Soto', 'logo-indomie-soto.jpg', 1, 1),
(7, 2, 'Mie Sedap Goreng', 'logo-mie-sedap-goreng.jpg', 4, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `product_category`
--

CREATE TABLE `product_category` (
  `id` int(11) NOT NULL,
  `category` varchar(50) NOT NULL,
  `method` varchar(100) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `product_category`
--

INSERT INTO `product_category` (`id`, `category`, `method`, `status`) VALUES
(1, 'E-money', 'rajabiller.game', 1),
(2, 'Mie', NULL, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `product_detail`
--

CREATE TABLE `product_detail` (
  `id` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `code` varchar(10) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `selling_price` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `product_detail`
--

INSERT INTO `product_detail` (`id`, `id_product`, `name`, `code`, `price`, `selling_price`, `status`) VALUES
(1, 1, 'Saldo Ovo 20.000', 'OVO20H', 21000, 22000, 1),
(2, 1, 'Saldo Ovo 25.000', 'OVO25H', 26000, 27000, 1),
(3, 1, 'Saldo Ovo 30.000', 'OVO30H', 31000, 32000, 1),
(4, 1, 'Saldo Ovo 40.000', 'OVO40H', 41000, 42000, 1),
(5, 1, 'Saldo Ovo 50.000', 'OVO50H', 51000, 52000, 1),
(6, 1, 'Saldo Ovo 75.000', 'OVO75H', 76000, 77000, 1),
(7, 1, 'Saldo Ovo 100.000', 'OVO100H', 101000, 102000, 1),
(8, 1, 'Saldo Ovo 150.000', 'OVO150H', 151000, 152000, 1),
(9, 1, 'Saldo Ovo 200.000', 'OVO200H', 201000, 202000, 1),
(10, 1, 'Saldo Ovo 250.000', 'OVO250H', 251000, 252000, 1),
(11, 1, 'Saldo Ovo 300.000', 'OVO300H', 301000, 302000, 1),
(12, 1, 'Saldo Ovo 400.000', 'OVO400H', 401000, 402000, 1),
(13, 1, 'Saldo Ovo 500.000', 'OVO500H', 501000, 502000, 1),
(14, 1, 'Saldo Ovo 600.000', 'OVO600H', 601000, 602000, 1),
(15, 1, 'Saldo Ovo 700.000', 'OVO700H', 701000, 702000, 1),
(16, 1, 'Saldo Ovo 800.000', 'OVO800H', 801000, 802000, 1),
(17, 1, 'Saldo Ovo 900.000', 'OVO900H', 901000, 902000, 1),
(18, 1, 'Saldo Ovo 1.000.000', 'OVO1000H', 1001000, 1002000, 1),
(19, 2, 'Saldo Gojek Cust 10k', 'GJK10H', 10800, 11800, 1),
(20, 2, 'Saldo Gojek Cust 20k', 'GJK20H', 20800, 21800, 1),
(21, 2, 'Saldo Gojek Cust 25k', 'GJK25H', 25800, 26800, 1),
(22, 2, 'Saldo Gojek Cust 50k', 'GJK50H', 50800, 51800, 1),
(23, 2, 'Saldo Gojek Cust 75k', 'GJK75H', 75800, 76800, 1),
(24, 2, 'Saldo Gojek Cust 100k', 'GJK100H', 100800, 101800, 1),
(25, 2, 'Saldo Gojek Cust 150k', 'GJK150H', 150800, 151800, 1),
(26, 2, 'Saldo Gojek Cust 200k', 'GJK200H', 200800, 201800, 1),
(27, 2, 'Saldo Gojek Cust 300k', 'GJK300H', 300800, 301800, 1),
(28, 2, 'Saldo Gojek Cust 400k', 'GJK400H', 400800, 401800, 1),
(29, 2, 'Saldo Gojek Cust 500k', 'GJK500H', 500800, 501800, 1),
(30, 3, 'Saldo Shopee 20k', 'SHOP20H', 20375, 21375, 1),
(31, 3, 'Saldo Shopee 25k', 'SHOP25H', 25375, 26375, 1),
(32, 3, 'Saldo Shopee 30k', 'SHOP30H', 30375, 31375, 1),
(33, 3, 'Saldo Shopee 35k', 'SHOP35H', 35375, 36375, 1),
(34, 3, 'Saldo Shopee 40k', 'SHOP40H', 40375, 41375, 1),
(35, 3, 'Saldo Shopee 45k', 'SHOP45H', 45375, 46375, 1),
(36, 3, 'Saldo Shopee 50k', 'SHOP50H', 50375, 51375, 1),
(37, 3, 'Saldo Shopee 55k', 'SHOP55H', 55375, 56375, 1),
(38, 3, 'Saldo Shopee 60k', 'SHOP60H', 60375, 61375, 1),
(39, 3, 'Saldo Shopee 65k', 'SHOP65H', 650375, 651375, 1),
(40, 3, 'Saldo Shopee 70k', 'SHOP70H', 70375, 71375, 1),
(41, 3, 'Saldo Shopee 75k', 'SHOP75H', 75375, 76375, 1),
(42, 3, 'Saldo Shopee 80k', 'SHOP80H', 80375, 81375, 1),
(43, 3, 'Saldo Shopee 85k', 'SHOP85H', 85375, 86375, 1),
(44, 3, 'Saldo Shopee 90k', 'SHOP90H', 90375, 91375, 1),
(45, 3, 'Saldo Shopee 95k', 'SHOP95H', 95375, 96375, 1),
(46, 3, 'Saldo Shopee 100k', 'SHOP100H', 100375, 101375, 1),
(47, 3, 'Saldo Shopee 200k', 'SHOP200H', 200375, 201375, 1),
(48, 3, 'Saldo Shopee 300k', 'SHOP300H', 300375, 301375, 1),
(49, 3, 'Saldo Shopee 400k', 'SHOP400H', 400375, 401375, 1),
(50, 3, 'Saldo Shopee 500k', 'SHOP500H', 500375, 501375, 1),
(51, 4, 'Saldo Etoll Mandiri 25k', 'TOLM25H', 26350, 27350, 1),
(52, 4, 'Saldo Etoll Mandiri 50k', 'TOLM50H', 51150, 52150, 1),
(53, 4, 'Saldo Etoll Mandiri 100k', 'TOLM100H', 101150, 102150, 1),
(54, 4, 'Saldo Etoll Mandiri 150k', 'TOLM150H', 151150, 152150, 1),
(55, 4, 'Saldo Etoll Mandiri 200k', 'TOLM200H', 201150, 202150, 1),
(56, 4, 'Saldo Etoll Mandiri 300k', 'TOLM300H', 301150, 302150, 1),
(57, 4, 'Saldo Etoll Mandiri 500k', 'TOLM500H', 501800, 502800, 1),
(58, 5, 'Saldo Etoll Brizzi 20k', 'TOLBR20H', 20700, 21700, 1),
(59, 5, 'Saldo Etoll Brizzi 50k', 'TOLBR50H', 50700, 51700, 1),
(60, 5, 'Saldo Etoll Brizzi 75k', 'TOLBR75H', 75700, 76700, 1),
(61, 5, 'Saldo Etoll Brizzi 100k', 'TOLBR100H', 100700, 101700, 1),
(62, 5, 'Saldo Etoll Brizzi 250k', 'TOLBR250H', 250700, 251700, 1),
(63, 5, 'Saldo Etoll Brizzi 500k', 'TOLBR500H', 500700, 501700, 1),
(64, 5, 'Saldo Etoll Brizzi 750k', 'TOLBR750H', 750700, 751700, 1),
(65, 5, 'Saldo Etoll Brizzi 1000k', 'TOLBR1000H', 1000700, 1001700, 1),
(66, 6, 'Indomie Soto', NULL, NULL, 10000, 1),
(67, 7, 'Mie Sedap Goreng', NULL, NULL, 10000, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `spice_level`
--

CREATE TABLE `spice_level` (
  `id` int(11) NOT NULL,
  `level` varchar(50) NOT NULL,
  `usage` int(11) NOT NULL,
  `price` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `spice_level`
--

INSERT INTO `spice_level` (`id`, `level`, `usage`, `price`, `status`) VALUES
(1, 'Pedas - 0', 0, 0, 1),
(2, 'Pedas - 1', 10, 0, 1),
(3, 'Pedas - 2', 20, 2000, 1),
(4, 'Pedas - 3', 30, 3000, 1),
(5, 'Pedas - 4', 40, 4000, 1),
(6, 'Pedas - 5', 50, 5000, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbltransaksi`
--

CREATE TABLE `tbltransaksi` (
  `id` bigint(20) NOT NULL,
  `storeid` varchar(50) NOT NULL,
  `posid` varchar(50) NOT NULL,
  `trxno` varchar(50) NOT NULL,
  `reffno` varchar(50) NOT NULL,
  `amount` double NOT NULL,
  `trxdt` datetime NOT NULL,
  `pymstt` varchar(50) NOT NULL,
  `pymreff` varchar(50) NOT NULL,
  `pymdt` datetime NOT NULL,
  `issuerid` varchar(50) NOT NULL,
  `retreffno` varchar(50) NOT NULL,
  `payernm` varchar(50) NOT NULL,
  `payerphn` varchar(50) NOT NULL,
  `status` varchar(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbltransaksi`
--

INSERT INTO `tbltransaksi` (`id`, `storeid`, `posid`, `trxno`, `reffno`, `amount`, `trxdt`, `pymstt`, `pymreff`, `pymdt`, `issuerid`, `retreffno`, `payernm`, `payerphn`, `status`) VALUES
(1, 'ID2020081400023', 'A01', 'AA0012010200001', 'AA0012010200001', 13000, '2020-10-20 16:06:23', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(2, 'ID2020081400023', 'A01', 'AA0012005188202', 'AA0012005188329', 33000, '2020-03-13 10:39:20', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(3, 'ID2020081400023', 'A01', 'AA0012002212840', 'AA0012002213453', 402000, '2020-03-07 08:47:22', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(4, 'ID2020081400023', 'A01', 'AA0012009102157', 'AA0012009102715', 49000, '2020-01-10 08:12:19', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(5, 'ID2020081400023', 'A01', 'AA0012003021597', 'AA0012003022660', 802000, '2020-03-24 02:11:06', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(6, 'ID2020081400023', 'A01', 'AA0012001260377', 'AA0012001262182', 33000, '2020-08-18 02:02:03', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(7, 'ID2020081400023', 'A01', 'AA0012004246959', 'AA0012004245822', 41375, '2020-06-20 10:24:21', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(8, 'ID2020081400023', 'A01', 'AA0012009244191', 'AA0012009240919', 32000, '2020-02-03 04:18:54', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(9, 'ID2020081400023', 'A01', 'AA0012002240454', 'AA0012002244344', 96375, '2020-04-01 11:31:43', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(10, 'ID2020081400023', 'A01', 'AA0012010023131', 'AA0012010028419', 301800, '2020-08-14 09:25:47', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(11, 'ID2020081400023', 'A01', 'AA0012001054450', 'AA0012001055391', 33000, '2020-06-01 04:14:41', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(12, 'ID2020081400023', 'A01', 'AA0012001301833', 'AA0012001307509', 18000, '2020-10-19 08:56:43', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(13, 'ID2020081400023', 'A01', 'AA0012008026217', 'AA0012008024449', 802000, '2020-05-26 01:17:31', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(14, 'ID2020081400023', 'A01', 'AA0012003134386', 'AA0012003134355', 102000, '2020-06-01 03:15:29', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(15, 'ID2020081400023', 'A01', 'AA0012003107730', 'AA0012003107776', 77000, '2020-01-12 02:29:55', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(16, 'ID2020081400023', 'A01', 'AA0012001279601', 'AA0012001277029', 96375, '2020-09-06 04:41:20', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(17, 'ID2020081400023', 'A01', 'AA0012008086770', 'AA0012008083032', 26000, '2020-09-01 06:32:25', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(18, 'ID2020081400023', 'A01', 'AA0012003041937', 'AA0012003045344', 18000, '2020-03-17 11:17:07', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(19, 'ID2020081400023', 'A01', 'AA0012007219177', 'AA0012007217575', 33000, '2020-06-14 10:44:29', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(20, 'ID2020081400023', 'A01', 'AA0012008205062', 'AA0012008208219', 42000, '2020-01-09 06:57:25', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(21, 'ID2020081400023', 'A01', 'AA0012001199648', 'AA0012001191377', 28000, '2020-09-07 05:38:04', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(22, 'ID2020081400023', 'A01', 'AA0012003101743', 'AA0012003101861', 401800, '2020-02-08 06:13:48', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(23, 'ID2020081400023', 'A01', 'AA0012006188251', 'AA0012006184347', 49000, '2020-06-17 04:36:51', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(24, 'ID2020081400023', 'A01', 'AA0012005319186', 'AA0012005314265', 33000, '2020-06-27 05:39:58', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(25, 'ID2020081400023', 'A01', 'AA0012008136373', 'AA0012008139019', 54000, '2020-06-08 10:46:02', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(26, 'ID2020081400023', 'A01', 'AA0012006147475', 'AA0012006143143', 101700, '2020-07-28 12:04:55', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(27, 'ID2020081400023', 'A01', 'AA0012002028407', 'AA0012002024014', 36000, '2020-09-08 05:32:45', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(28, 'ID2020081400023', 'A01', 'AA0012001032965', 'AA0012001038876', 52000, '2020-02-10 06:42:06', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(29, 'ID2020081400023', 'A01', 'AA0012008093638', 'AA0012008091880', 36000, '2020-10-12 01:48:37', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(30, 'ID2020081400023', 'A01', 'AA0012003129130', 'AA0012003128563', 26000, '2020-05-21 06:53:30', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(31, 'ID2020081400023', 'A01', 'AA0012005223939', 'AA0012005223172', 18000, '2020-02-08 12:05:21', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(32, 'ID2020081400023', 'A01', 'AA0012009065814', 'AA0012009060745', 54000, '2020-08-29 03:35:31', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(33, 'ID2020081400023', 'A01', 'AA0012001032923', 'AA0012001033606', 48000, '2020-04-21 07:55:19', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(34, 'ID2020081400023', 'A01', 'AA0012007192063', 'AA0012007198305', 902000, '2020-06-04 02:22:05', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(35, 'ID2020081400023', 'A01', 'AA0012010054254', 'AA0012010058413', 31000, '2020-09-25 02:56:11', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(36, 'ID2020081400023', 'A01', 'AA0012003214795', 'AA0012003213176', 51800, '2020-02-08 11:08:53', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(37, 'ID2020081400023', 'A01', 'AA0012009099485', 'AA0012009094200', 26800, '2020-08-04 08:50:14', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(38, 'ID2020081400023', 'A01', 'AA0012005179167', 'AA0012005170340', 1001700, '2020-03-25 08:19:37', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(39, 'ID2020081400023', 'A01', 'AA0012006025222', 'AA0012006029687', 96375, '2020-05-27 07:49:21', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(40, 'ID2020081400023', 'A01', 'AA0012003133294', 'AA0012003130669', 101700, '2020-05-06 02:22:05', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(41, 'ID2020081400023', 'A01', 'AA0012004219113', 'AA0012004211131', 36000, '2020-07-09 09:20:21', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(42, 'ID2020081400023', 'A01', 'AA0012006075542', 'AA0012006077479', 28000, '2020-05-06 12:04:22', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(43, 'ID2020081400023', 'A01', 'AA0012009159507', 'AA0012009155486', 26375, '2020-07-25 04:04:24', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(44, 'ID2020081400023', 'A01', 'AA0012003140414', 'AA0012003149877', 15000, '2020-02-03 12:04:50', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(45, 'ID2020081400023', 'A01', 'AA0012003145872', 'AA0012003149838', 31000, '2020-10-03 12:48:44', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(46, 'ID2020081400023', 'A01', 'AA0012007311519', 'AA0012007313391', 11800, '2020-09-24 01:39:23', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(47, 'ID2020081400023', 'A01', 'AA0012003278657', 'AA0012003279399', 28000, '2020-05-03 11:45:52', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(48, 'ID2020081400023', 'A01', 'AA0012001113743', 'AA0012001113905', 18000, '2020-09-20 03:43:59', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(49, 'ID2020081400023', 'A01', 'AA0012008037872', 'AA0012008037231', 201375, '2020-07-02 01:41:35', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(50, 'ID2020081400023', 'A01', 'AA0012009031841', 'AA0012009031627', 13000, '2020-09-21 04:32:39', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(51, 'ID2020081400023', 'A01', 'AA0012003098565', 'AA0012003090951', 36000, '2020-05-23 09:29:44', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(52, 'ID2020081400024', 'A02', 'AA0022009157574', 'AA0022009154194', 42000, '2020-06-15 02:29:25', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(53, 'ID2020081400024', 'A02', 'AA0022003088815', 'AA0022003080237', 252000, '2020-04-03 08:30:25', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(54, 'ID2020081400024', 'A02', 'AA0022001144658', 'AA0022001148977', 651375, '2020-08-02 05:39:11', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(55, 'ID2020081400024', 'A02', 'AA0022003072225', 'AA0022003074940', 31000, '2020-05-14 07:14:48', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(56, 'ID2020081400024', 'A02', 'AA0022002292456', 'AA0022002295507', 902000, '2020-06-11 08:48:34', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(57, 'ID2020081400024', 'A02', 'AA0022002078198', 'AA0022002070772', 26000, '2020-08-06 07:01:15', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(58, 'ID2020081400024', 'A02', 'AA0022006150637', 'AA0022006156521', 61375, '2020-04-29 11:09:16', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(59, 'ID2020081400024', 'A02', 'AA0022009134147', 'AA0022009136915', 71375, '2020-06-09 03:19:55', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(60, 'ID2020081400024', 'A02', 'AA0022004060466', 'AA0022004062466', 44000, '2020-03-20 02:08:30', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(61, 'ID2020081400024', 'A02', 'AA0022001312463', 'AA0022001311409', 13000, '2020-08-05 05:42:23', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(62, 'ID2020081400024', 'A02', 'AA0022007186167', 'AA0022007183387', 51000, '2020-01-25 03:39:45', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(63, 'ID2020081400024', 'A02', 'AA0022005039758', 'AA0022005030239', 51800, '2020-10-06 10:50:43', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(64, 'ID2020081400024', 'A02', 'AA0022005091472', 'AA0022005095604', 152000, '2020-09-02 09:19:07', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(65, 'ID2020081400024', 'A02', 'AA0022004293522', 'AA0022004296567', 702000, '2020-06-17 05:12:01', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(66, 'ID2020081400024', 'A02', 'AA0022003192838', 'AA0022003192422', 52150, '2020-01-14 10:30:12', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(67, 'ID2020081400024', 'A02', 'AA0022006230043', 'AA0022006236028', 36000, '2020-01-19 02:12:57', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(68, 'ID2020081400024', 'A02', 'AA0022008179432', 'AA0022008178271', 91375, '2020-02-23 08:12:25', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(69, 'ID2020081400024', 'A02', 'AA0022004170273', 'AA0022004173741', 36000, '2020-08-16 01:34:32', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(70, 'ID2020081400024', 'A02', 'AA0022001212211', 'AA0022001218645', 41375, '2020-02-29 09:45:28', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(71, 'ID2020081400024', 'A02', 'AA0022006102110', 'AA0022006109923', 49000, '2020-01-22 06:20:35', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(72, 'ID2020081400024', 'A02', 'AA0022010074105', 'AA0022010076668', 31000, '2020-10-07 05:58:22', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(73, 'ID2020081400024', 'A02', 'AA0022010067989', 'AA0022010068749', 44000, '2020-05-11 03:26:11', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(74, 'ID2020081400024', 'A02', 'AA0022004109010', 'AA0022004107956', 15000, '2020-04-02 08:32:29', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(75, 'ID2020081400024', 'A02', 'AA0022005059418', 'AA0022005057381', 56375, '2020-09-30 02:12:47', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(76, 'ID2020081400024', 'A02', 'AA0022006062337', 'AA0022006069313', 301375, '2020-07-23 05:13:49', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(77, 'ID2020081400024', 'A02', 'AA0022002198746', 'AA0022002198102', 33000, '2020-03-24 01:14:55', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(78, 'ID2020081400024', 'A02', 'AA0022002083618', 'AA0022002084649', 302000, '2020-05-23 09:41:07', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(79, 'ID2020081400024', 'A02', 'AA0022004180407', 'AA0022004184420', 31000, '2020-02-05 08:27:20', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(80, 'ID2020081400024', 'A02', 'AA0022008197206', 'AA0022008193237', 1001700, '2020-04-04 06:44:26', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(81, 'ID2020081400024', 'A02', 'AA0022008137311', 'AA0022008133796', 18000, '2020-06-24 04:24:54', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(82, 'ID2020081400024', 'A02', 'AA0022007043055', 'AA0022007044232', 51700, '2020-01-24 06:29:53', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(83, 'ID2020081400024', 'A02', 'AA0022003036724', 'AA0022003037916', 28000, '2020-08-01 02:12:01', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(84, 'ID2020081400024', 'A02', 'AA0022002098775', 'AA0022002093919', 31375, '2020-05-21 10:05:27', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(85, 'ID2020081400024', 'A02', 'AA0022001118638', 'AA0022001117454', 502000, '2020-06-13 10:02:06', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(86, 'ID2020081400024', 'A02', 'AA0022006028502', 'AA0022006026466', 902000, '2020-09-08 04:12:11', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(87, 'ID2020081400024', 'A02', 'AA0022006197567', 'AA0022006199611', 102000, '2020-04-22 07:01:10', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(88, 'ID2020081400024', 'A02', 'AA0022004220083', 'AA0022004220931', 101700, '2020-01-12 09:00:38', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(89, 'ID2020081400024', 'A02', 'AA0022010018829', 'AA0022010010683', 15000, '2020-09-18 06:39:40', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(90, 'ID2020081400024', 'A02', 'AA0022001085384', 'AA0022001085189', 31000, '2020-07-18 04:39:34', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(91, 'ID2020081400024', 'A02', 'AA0022004177473', 'AA0022004171874', 301375, '2020-02-25 01:39:48', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(92, 'ID2020081400024', 'A02', 'AA0022003179844', 'AA0022003178926', 18000, '2020-03-15 09:31:09', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(93, 'ID2020081400024', 'A02', 'AA0022008028633', 'AA0022008023604', 21700, '2020-09-18 09:10:07', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(94, 'ID2020081400024', 'A02', 'AA0022007318200', 'AA0022007319082', 36000, '2020-08-21 10:12:38', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(95, 'ID2020081400024', 'A02', 'AA0022002013571', 'AA0022002018657', 31375, '2020-03-09 09:34:19', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(96, 'ID2020081400024', 'A02', 'AA0022001065124', 'AA0022001066160', 26800, '2020-02-13 05:18:59', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(97, 'ID2020081400024', 'A02', 'AA0022004194471', 'AA0022004193036', 21375, '2020-05-10 08:17:00', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(98, 'ID2020081400024', 'A02', 'AA0022003039894', 'AA0022003037671', 36000, '2020-04-22 09:08:34', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(99, 'ID2020081400024', 'A02', 'AA0022002181830', 'AA0022002186729', 501700, '2020-01-18 01:51:09', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(100, 'ID2020081400024', 'A02', 'AA0022007092874', 'AA0022007099837', 36000, '2020-09-17 10:32:30', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(101, 'ID2020081400024', 'A02', 'AA0022007063998', 'AA0022007067047', 51000, '2020-08-14 01:32:41', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(102, 'ID2020081400025', 'A03', 'AA0032009062271', 'AA0032009063260', 201800, '2020-04-09 03:20:28', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(103, 'ID2020081400025', 'A03', 'AA0032009040005', 'AA0032009046453', 81375, '2020-06-30 08:00:05', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(104, 'ID2020081400025', 'A03', 'AA0032010105795', 'AA0032010100384', 252000, '2020-02-05 11:45:31', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(105, 'ID2020081400025', 'A03', 'AA0032004093843', 'AA0032004097107', 48000, '2020-09-11 01:38:44', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(106, 'ID2020081400025', 'A03', 'AA0032005042901', 'AA0032005040875', 51700, '2020-08-18 07:15:39', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(107, 'ID2020081400025', 'A03', 'AA0032010106276', 'AA0032010107846', 15000, '2020-03-27 05:56:48', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(108, 'ID2020081400025', 'A03', 'AA0032004088963', 'AA0032004082697', 302150, '2020-05-15 02:07:20', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(109, 'ID2020081400025', 'A03', 'AA0032008263891', 'AA0032008261281', 54000, '2020-05-16 01:42:24', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(110, 'ID2020081400025', 'A03', 'AA0032004268324', 'AA0032004264817', 36000, '2020-01-25 06:36:52', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(111, 'ID2020081400025', 'A03', 'AA0032001102504', 'AA0032001106928', 11800, '2020-05-01 09:03:26', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(112, 'ID2020081400025', 'A03', 'AA0032009058516', 'AA0032009054190', 26375, '2020-01-28 01:34:42', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(113, 'ID2020081400025', 'A03', 'AA0032008042158', 'AA0032008045087', 13000, '2020-09-04 08:48:35', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(114, 'ID2020081400025', 'A03', 'AA0032002123583', 'AA0032002120103', 501700, '2020-03-30 10:28:53', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(115, 'ID2020081400025', 'A03', 'AA0032007291641', 'AA0032007295721', 33000, '2020-01-02 02:02:17', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(116, 'ID2020081400025', 'A03', 'AA0032006153121', 'AA0032006151001', 49000, '2020-03-11 12:50:55', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(117, 'ID2020081400025', 'A03', 'AA0032003227697', 'AA0032003225262', 31000, '2020-07-25 11:37:35', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(118, 'ID2020081400025', 'A03', 'AA0032008200739', 'AA0032008200733', 11800, '2020-02-12 09:28:33', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(119, 'ID2020081400025', 'A03', 'AA0032002034820', 'AA0032002039161', 602000, '2020-01-08 05:57:28', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(120, 'ID2020081400025', 'A03', 'AA0032006206880', 'AA0032006201718', 301375, '2020-01-22 04:07:56', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(121, 'ID2020081400025', 'A03', 'AA0032006110711', 'AA0032006115072', 31000, '2020-03-04 07:58:49', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(122, 'ID2020081400025', 'A03', 'AA0032009065225', 'AA0032009060258', 501375, '2020-02-13 12:29:34', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(123, 'ID2020081400025', 'A03', 'AA0032006278849', 'AA0032006271705', 48000, '2020-06-19 02:40:15', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(124, 'ID2020081400025', 'A03', 'AA0032001226670', 'AA0032001220464', 502800, '2020-03-26 03:26:03', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(125, 'ID2020081400025', 'A03', 'AA0032010027371', 'AA0032010026988', 33000, '2020-09-19 02:36:57', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(126, 'ID2020081400025', 'A03', 'AA0032009296462', 'AA0032009292022', 1002000, '2020-05-17 12:23:38', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(127, 'ID2020081400025', 'A03', 'AA0032010059161', 'AA0032010052472', 202150, '2020-03-25 08:04:49', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(128, 'ID2020081400025', 'A03', 'AA0032003103438', 'AA0032003102612', 21800, '2020-02-11 12:52:38', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(129, 'ID2020081400025', 'A03', 'AA0032001274857', 'AA0032001271390', 30000, '2020-02-05 02:49:46', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(130, 'ID2020081400025', 'A03', 'AA0032006140487', 'AA0032006140510', 31000, '2020-09-22 09:23:27', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(131, 'ID2020081400025', 'A03', 'AA0032005173463', 'AA0032005175806', 15000, '2020-09-27 07:00:31', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(132, 'ID2020081400025', 'A03', 'AA0032002237306', 'AA0032002238327', 56375, '2020-08-06 12:13:35', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(133, 'ID2020081400025', 'A03', 'AA0032001109987', 'AA0032001104736', 15000, '2020-02-03 05:06:17', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(134, 'ID2020081400025', 'A03', 'AA0032008012815', 'AA0032008015463', 30000, '2020-08-29 08:48:03', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(135, 'ID2020081400025', 'A03', 'AA0032007044671', 'AA0032007048562', 302000, '2020-07-21 06:34:02', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(136, 'ID2020081400025', 'A03', 'AA0032007230637', 'AA0032007235916', 76800, '2020-03-27 04:21:24', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(137, 'ID2020081400025', 'A03', 'AA0032001124264', 'AA0032001129189', 44000, '2020-10-14 09:50:40', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(138, 'ID2020081400025', 'A03', 'AA0032010068390', 'AA0032010066835', 49000, '2020-04-04 09:13:07', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(139, 'ID2020081400025', 'A03', 'AA0032001087769', 'AA0032001084927', 26800, '2020-03-18 10:44:29', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(140, 'ID2020081400025', 'A03', 'AA0032001097136', 'AA0032001093790', 45000, '2020-04-06 05:27:16', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(141, 'ID2020081400025', 'A03', 'AA0032001127142', 'AA0032001122002', 18000, '2020-03-17 11:48:25', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(142, 'ID2020081400025', 'A03', 'AA0032005253439', 'AA0032005254587', 101700, '2020-04-18 03:05:50', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(143, 'ID2020081400025', 'A03', 'AA0032002091332', 'AA0032002099357', 36000, '2020-02-18 02:55:23', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(144, 'ID2020081400025', 'A03', 'AA0032008295301', 'AA0032008295457', 18000, '2020-03-26 07:18:12', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(145, 'ID2020081400025', 'A03', 'AA0032006241188', 'AA0032006242780', 751700, '2020-06-27 04:41:40', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(146, 'ID2020081400025', 'A03', 'AA0032004051166', 'AA0032004055896', 18000, '2020-07-10 06:16:51', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(147, 'ID2020081400025', 'A03', 'AA0032002063042', 'AA0032002060253', 31000, '2020-04-29 07:11:46', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(148, 'ID2020081400025', 'A03', 'AA0032005134550', 'AA0032005138730', 501800, '2020-07-24 12:07:41', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(149, 'ID2020081400025', 'A03', 'AA0032003057612', 'AA0032003056813', 51000, '2020-10-10 08:12:07', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(150, 'ID2020081400025', 'A03', 'AA0032010018489', 'AA0032010011773', 52150, '2020-03-30 07:37:32', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(151, 'ID2020081400025', 'A03', 'AA0032001064108', 'AA0032001066110', 33000, '2020-02-25 10:21:04', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(152, 'ID2020081400026', 'A04', 'AA0042004214612', 'AA0042004216133', 51000, '2020-06-20 04:26:31', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(153, 'ID2020081400026', 'A04', 'AA0042004250589', 'AA0042004255674', 48000, '2020-09-29 01:11:19', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(154, 'ID2020081400026', 'A04', 'AA0042003212232', 'AA0042003212769', 301800, '2020-01-21 04:41:37', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(155, 'ID2020081400026', 'A04', 'AA0042004031642', 'AA0042004033161', 902000, '2020-02-20 01:13:06', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(156, 'ID2020081400026', 'A04', 'AA0042009192369', 'AA0042009199585', 18000, '2020-09-19 08:53:11', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(157, 'ID2020081400026', 'A04', 'AA0042007112127', 'AA0042007116352', 602000, '2020-08-02 09:45:18', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(158, 'ID2020081400026', 'A04', 'AA0042004274828', 'AA0042004272955', 13000, '2020-02-28 01:48:46', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(159, 'ID2020081400026', 'A04', 'AA0042003231561', 'AA0042003230624', 76800, '2020-07-19 01:58:32', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(160, 'ID2020081400026', 'A04', 'AA0042001247721', 'AA0042001248444', 51800, '2020-09-06 03:29:55', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(161, 'ID2020081400026', 'A04', 'AA0042005290583', 'AA0042005296247', 902000, '2020-08-04 08:20:23', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(162, 'ID2020081400026', 'A04', 'AA0042005276974', 'AA0042005279629', 18000, '2020-05-04 01:16:24', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(163, 'ID2020081400026', 'A04', 'AA0042007282322', 'AA0042007284863', 152000, '2020-06-11 09:40:29', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(164, 'ID2020081400026', 'A04', 'AA0042005243259', 'AA0042005249199', 651375, '2020-07-25 09:57:02', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(165, 'ID2020081400026', 'A04', 'AA0042002145889', 'AA0042002146006', 26800, '2020-05-30 02:38:41', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(166, 'ID2020081400026', 'A04', 'AA0042006033441', 'AA0042006032471', 18000, '2020-01-31 07:27:44', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(167, 'ID2020081400026', 'A04', 'AA0042005212752', 'AA0042005218761', 46000, '2020-09-06 02:50:28', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(168, 'ID2020081400026', 'A04', 'AA0042006033565', 'AA0042006033130', 43000, '2020-02-04 07:38:56', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(169, 'ID2020081400026', 'A04', 'AA0042001126532', 'AA0042001123604', 41000, '2020-02-28 06:18:35', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(170, 'ID2020081400026', 'A04', 'AA0042006255878', 'AA0042006251883', 152000, '2020-01-11 01:42:10', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(171, 'ID2020081400026', 'A04', 'AA0042007265491', 'AA0042007268973', 46000, '2020-02-04 10:33:59', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(172, 'ID2020081400026', 'A04', 'AA0042004285125', 'AA0042004283785', 26800, '2020-03-28 10:10:45', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(173, 'ID2020081400026', 'A04', 'AA0042001063257', 'AA0042001067325', 31000, '2020-06-05 11:00:59', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(174, 'ID2020081400026', 'A04', 'AA0042007314790', 'AA0042007314288', 54000, '2020-05-17 01:36:58', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(175, 'ID2020081400026', 'A04', 'AA0042006115089', 'AA0042006116911', 401800, '2020-03-22 04:33:23', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(176, 'ID2020081400026', 'A04', 'AA0042006195609', 'AA0042006195936', 76700, '2020-07-26 07:32:11', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(177, 'ID2020081400026', 'A04', 'AA0042007301118', 'AA0042007304857', 32000, '2020-05-04 05:19:39', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(178, 'ID2020081400026', 'A04', 'AA0042006163246', 'AA0042006162310', 51000, '2020-08-17 02:49:55', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(179, 'ID2020081400026', 'A04', 'AA0042008154634', 'AA0042008150964', 54000, '2020-01-06 02:01:47', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(180, 'ID2020081400026', 'A04', 'AA0042009249527', 'AA0042009244322', 502800, '2020-09-27 07:12:01', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(181, 'ID2020081400026', 'A04', 'AA0042003087695', 'AA0042003083340', 18000, '2020-03-05 09:04:29', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(182, 'ID2020081400026', 'A04', 'AA0042005036693', 'AA0042005033984', 81375, '2020-05-26 03:54:37', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(183, 'ID2020081400026', 'A04', 'AA0042009237390', 'AA0042009238847', 31000, '2020-10-15 07:43:54', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(184, 'ID2020081400026', 'A04', 'AA0042003290733', 'AA0042003292646', 21700, '2020-09-09 01:12:25', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(185, 'ID2020081400026', 'A04', 'AA0042001292308', 'AA0042001299653', 13000, '2020-03-29 08:32:18', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(186, 'ID2020081400026', 'A04', 'AA0042009195692', 'AA0042009192654', 152000, '2020-01-02 11:23:04', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(187, 'ID2020081400026', 'A04', 'AA0042001059349', 'AA0042001052968', 36000, '2020-08-19 11:11:27', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(188, 'ID2020081400026', 'A04', 'AA0042003183216', 'AA0042003189410', 31000, '2020-08-28 08:33:13', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(189, 'ID2020081400026', 'A04', 'AA0042005023221', 'AA0042005020161', 15000, '2020-02-25 11:50:57', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(190, 'ID2020081400026', 'A04', 'AA0042004180758', 'AA0042004186302', 51000, '2020-06-17 05:30:32', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(191, 'ID2020081400026', 'A04', 'AA0042005087097', 'AA0042005086944', 76375, '2020-07-23 03:00:49', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(192, 'ID2020081400026', 'A04', 'AA0042002121708', 'AA0042002125889', 602000, '2020-05-23 11:34:12', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(193, 'ID2020081400026', 'A04', 'AA0042002067033', 'AA0042002067112', 802000, '2020-08-16 09:27:04', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(194, 'ID2020081400026', 'A04', 'AA0042003100598', 'AA0042003109949', 101700, '2020-05-02 06:47:03', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(195, 'ID2020081400026', 'A04', 'AA0042002296933', 'AA0042002295897', 51000, '2020-10-08 11:44:43', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(196, 'ID2020081400026', 'A04', 'AA0042001246456', 'AA0042001246702', 15000, '2020-09-23 01:30:53', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(197, 'ID2020081400026', 'A04', 'AA0042005123032', 'AA0042005121541', 54000, '2020-01-15 10:10:03', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(198, 'ID2020081400026', 'A04', 'AA0042003061871', 'AA0042003068629', 751700, '2020-04-27 06:38:24', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(199, 'ID2020081400026', 'A04', 'AA0042007145226', 'AA0042007149293', 18000, '2020-09-14 02:48:04', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(200, 'ID2020081400026', 'A04', 'AA0042003268253', 'AA0042003263293', 22000, '2020-05-26 04:15:45', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(201, 'ID2020081400026', 'A04', 'AA0042009063787', 'AA0042009066199', 46375, '2020-01-19 01:05:01', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(202, 'ID2020081400027', 'A05', 'AA0052005298944', 'AA0052005292508', 202150, '2020-04-01 11:55:59', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(203, 'ID2020081400027', 'A05', 'AA0052001029277', 'AA0052001025937', 26000, '2020-08-26 11:24:34', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(204, 'ID2020081400027', 'A05', 'AA0052002272547', 'AA0052002273501', 252000, '2020-01-15 12:52:00', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(205, 'ID2020081400027', 'A05', 'AA0052009302710', 'AA0052009309217', 21700, '2020-01-01 09:57:02', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(206, 'ID2020081400027', 'A05', 'AA0052008088211', 'AA0052008086371', 31000, '2020-07-05 06:53:47', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(207, 'ID2020081400027', 'A05', 'AA0052009206791', 'AA0052009205232', 18000, '2020-04-14 12:08:12', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(208, 'ID2020081400027', 'A05', 'AA0052003294932', 'AA0052003292068', 401800, '2020-04-19 06:56:21', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(209, 'ID2020081400027', 'A05', 'AA0052010144011', 'AA0052010144167', 18000, '2020-08-06 02:26:53', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(210, 'ID2020081400027', 'A05', 'AA0052006050450', 'AA0052006056189', 46000, '2020-08-19 01:15:03', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(211, 'ID2020081400027', 'A05', 'AA0052004275263', 'AA0052004276854', 152150, '2020-05-22 01:24:07', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(212, 'ID2020081400027', 'A05', 'AA0052008185747', 'AA0052008184110', 33000, '2020-04-23 03:36:56', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(213, 'ID2020081400027', 'A05', 'AA0052002013704', 'AA0052002010164', 43000, '2020-09-03 11:02:01', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(214, 'ID2020081400027', 'A05', 'AA0052006124176', 'AA0052006123852', 36000, '2020-06-17 05:19:23', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(215, 'ID2020081400027', 'A05', 'AA0052003243743', 'AA0052003249975', 501375, '2020-05-13 03:20:14', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(216, 'ID2020081400027', 'A05', 'AA0052003149671', 'AA0052003144219', 18000, '2020-04-23 02:42:22', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(217, 'ID2020081400027', 'A05', 'AA0052002108621', 'AA0052002107014', 51000, '2020-03-10 12:32:52', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(218, 'ID2020081400027', 'A05', 'AA0052009172584', 'AA0052009177272', 251700, '2020-10-02 11:28:33', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(219, 'ID2020081400027', 'A05', 'AA0052009101749', 'AA0052009106625', 15000, '2020-05-15 12:27:43', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(220, 'ID2020081400027', 'A05', 'AA0052004085832', 'AA0052004082141', 26800, '2020-03-18 06:05:28', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(221, 'ID2020081400027', 'A05', 'AA0052007176302', 'AA0052007177267', 31000, '2020-10-16 02:57:04', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(222, 'ID2020081400027', 'A05', 'AA0052001319259', 'AA0052001314740', 33000, '2020-08-22 11:52:50', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(223, 'ID2020081400027', 'A05', 'AA0052001299031', 'AA0052001295386', 31000, '2020-09-29 02:44:18', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(224, 'ID2020081400027', 'A05', 'AA0052008167480', 'AA0052008162975', 22000, '2020-09-02 08:46:37', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(225, 'ID2020081400027', 'A05', 'AA0052009232092', 'AA0052009235114', 31375, '2020-09-10 01:22:12', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(226, 'ID2020081400027', 'A05', 'AA0052007021768', 'AA0052007027334', 51800, '2020-05-19 10:17:24', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(227, 'ID2020081400027', 'A05', 'AA0052002066864', 'AA0052002061536', 21800, '2020-09-18 12:08:32', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(228, 'ID2020081400027', 'A05', 'AA0052001242895', 'AA0052001240364', 13000, '2020-06-20 06:55:44', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(229, 'ID2020081400027', 'A05', 'AA0052010100431', 'AA0052010100376', 31000, '2020-06-27 02:12:43', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(230, 'ID2020081400027', 'A05', 'AA0052006140650', 'AA0052006149565', 86375, '2020-07-13 06:00:31', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(231, 'ID2020081400027', 'A05', 'AA0052003140811', 'AA0052003148264', 201800, '2020-01-17 09:57:01', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(232, 'ID2020081400027', 'A05', 'AA0052007270548', 'AA0052007278209', 36000, '2020-08-12 11:53:39', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(233, 'ID2020081400027', 'A05', 'AA0052004293389', 'AA0052004298712', 18000, '2020-03-11 10:32:58', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(234, 'ID2020081400027', 'A05', 'AA0052002052427', 'AA0052002055189', 31000, '2020-06-24 01:58:10', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(235, 'ID2020081400027', 'A05', 'AA0052010113575', 'AA0052010117061', 15000, '2020-05-03 06:07:37', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(236, 'ID2020081400027', 'A05', 'AA0052007301785', 'AA0052007309934', 13000, '2020-05-19 01:34:49', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(237, 'ID2020081400027', 'A05', 'AA0052010128317', 'AA0052010124004', 76375, '2020-02-14 08:31:34', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(238, 'ID2020081400027', 'A05', 'AA0052004120944', 'AA0052004121367', 13000, '2020-05-13 04:47:23', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(239, 'ID2020081400027', 'A05', 'AA0052005309065', 'AA0052005304669', 51375, '2020-05-18 02:32:30', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(240, 'ID2020081400027', 'A05', 'AA0052007045742', 'AA0052007043029', 31000, '2020-04-28 08:13:15', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(241, 'ID2020081400027', 'A05', 'AA0052002192680', 'AA0052002190349', 15000, '2020-04-22 03:41:52', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(242, 'ID2020081400027', 'A05', 'AA0052007231277', 'AA0052007235459', 52000, '2020-09-22 07:48:59', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(243, 'ID2020081400027', 'A05', 'AA0052004094034', 'AA0052004099390', 13000, '2020-10-11 12:30:37', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(244, 'ID2020081400027', 'A05', 'AA0052009131027', 'AA0052009135439', 26000, '2020-05-10 10:13:29', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(245, 'ID2020081400027', 'A05', 'AA0052007192125', 'AA0052007196198', 41375, '2020-09-11 06:14:04', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(246, 'ID2020081400027', 'A05', 'AA0052005049529', 'AA0052005046104', 33000, '2020-09-04 05:00:15', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(247, 'ID2020081400027', 'A05', 'AA0052008309553', 'AA0052008308735', 81375, '2020-07-05 03:39:38', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(248, 'ID2020081400027', 'A05', 'AA0052009108115', 'AA0052009100690', 15000, '2020-05-08 11:04:22', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(249, 'ID2020081400027', 'A05', 'AA0052007073796', 'AA0052007073122', 76375, '2020-09-22 10:47:57', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(250, 'ID2020081400027', 'A05', 'AA0052004141448', 'AA0052004140094', 33000, '2020-06-14 03:15:00', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(251, 'ID2020081400027', 'A05', 'AA0052005192688', 'AA0052005195552', 13000, '2020-07-15 11:51:47', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(252, 'ID2020081400023', 'A01', 'AA0012010173810', 'AA0012010179707', 902000, '2020-10-14 09:15:26', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(253, 'ID2020081400023', 'A01', 'AA0012010124445', 'AA0012010126620', 501375, '2020-10-16 02:43:11', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(254, 'ID2020081400023', 'A01', 'AA0012010097148', 'AA0012010093595', 41375, '2020-10-14 07:45:13', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(255, 'ID2020081400023', 'A01', 'AA0012010180419', 'AA0012010186442', 22000, '2020-10-03 02:22:25', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(256, 'ID2020081400023', 'A01', 'AA0012010059642', 'AA0012010055083', 31375, '2020-10-16 04:18:06', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(257, 'ID2020081400023', 'A01', 'AA0012010071305', 'AA0012010070038', 44000, '2020-10-11 06:14:14', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(258, 'ID2020081400023', 'A01', 'AA0012010198796', 'AA0012010191274', 26800, '2020-10-15 04:49:04', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(259, 'ID2020081400023', 'A01', 'AA0012010173472', 'AA0012010179252', 151800, '2020-10-19 09:34:06', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(260, 'ID2020081400023', 'A01', 'AA0012010150216', 'AA0012010152345', 51000, '2020-10-06 04:40:19', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(261, 'ID2020081400023', 'A01', 'AA0012010105483', 'AA0012010101666', 201800, '2020-10-18 05:57:13', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(262, 'ID2020081400023', 'A01', 'AA0012010059098', 'AA0012010050666', 602000, '2020-10-11 10:15:22', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(263, 'ID2020081400023', 'A01', 'AA0012010152351', 'AA0012010156085', 18000, '2020-10-13 11:10:52', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(264, 'ID2020081400023', 'A01', 'AA0012010165609', 'AA0012010167033', 44000, '2020-10-17 12:18:46', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(265, 'ID2020081400023', 'A01', 'AA0012010083625', 'AA0012010082393', 15000, '2020-10-05 11:12:59', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(266, 'ID2020081400023', 'A01', 'AA0012010061698', 'AA0012010063434', 651375, '2020-10-13 11:26:52', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(267, 'ID2020081400023', 'A01', 'AA0012010074182', 'AA0012010079276', 32000, '2020-10-16 07:46:07', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(268, 'ID2020081400023', 'A01', 'AA0012010117123', 'AA0012010118839', 13000, '2020-10-07 02:20:27', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(269, 'ID2020081400023', 'A01', 'AA0012010179163', 'AA0012010170362', 36000, '2020-10-08 06:35:57', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(270, 'ID2020081400023', 'A01', 'AA0012010176116', 'AA0012010171546', 302150, '2020-10-01 10:30:38', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(271, 'ID2020081400023', 'A01', 'AA0012010155009', 'AA0012010154599', 26000, '2020-10-10 06:41:39', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(272, 'ID2020081400023', 'A01', 'AA0012010157173', 'AA0012010156215', 651375, '2020-10-20 02:33:33', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(273, 'ID2020081400023', 'A01', 'AA0012010114487', 'AA0012010117980', 27000, '2020-10-05 04:10:10', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(274, 'ID2020081400023', 'A01', 'AA0012010104411', 'AA0012010109610', 41375, '2020-10-02 07:05:59', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(275, 'ID2020081400023', 'A01', 'AA0012010036321', 'AA0012010039261', 501375, '2020-10-08 10:59:37', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(276, 'ID2020081400023', 'A01', 'AA0012010163269', 'AA0012010160866', 46000, '2020-10-08 04:25:51', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(277, 'ID2020081400023', 'A01', 'AA0012010027138', 'AA0012010024761', 15000, '2020-10-19 08:49:08', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(278, 'ID2020081400023', 'A01', 'AA0012010155178', 'AA0012010155739', 31000, '2020-10-13 07:44:41', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(279, 'ID2020081400023', 'A01', 'AA0012010205055', 'AA0012010207382', 602000, '2020-10-11 05:23:47', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(280, 'ID2020081400023', 'A01', 'AA0012010172209', 'AA0012010178342', 18000, '2020-10-14 04:18:14', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(281, 'ID2020081400023', 'A01', 'AA0012010025480', 'AA0012010026322', 11800, '2020-10-14 10:22:10', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(282, 'ID2020081400023', 'A01', 'AA0012010083926', 'AA0012010088707', 18000, '2020-10-09 12:45:14', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(283, 'ID2020081400023', 'A01', 'AA0012010152378', 'AA0012010151655', 86375, '2020-10-15 03:51:52', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(284, 'ID2020081400023', 'A01', 'AA0012010093718', 'AA0012010090145', 33000, '2020-10-02 10:11:27', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(285, 'ID2020081400023', 'A01', 'AA0012010045112', 'AA0012010049483', 31000, '2020-10-06 10:35:48', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(286, 'ID2020081400023', 'A01', 'AA0012010046628', 'AA0012010040051', 18000, '2020-10-05 09:38:40', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(287, 'ID2020081400023', 'A01', 'AA0012010137418', 'AA0012010139006', 28000, '2020-10-02 10:08:14', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(288, 'ID2020081400023', 'A01', 'AA0012010105498', 'AA0012010107408', 18000, '2020-10-09 06:42:41', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(289, 'ID2020081400023', 'A01', 'AA0012010209489', 'AA0012010206203', 15000, '2020-10-02 10:57:31', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(290, 'ID2020081400023', 'A01', 'AA0012010191861', 'AA0012010195427', 49000, '2020-10-07 07:29:02', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(291, 'ID2020081400023', 'A01', 'AA0012010156358', 'AA0012010153722', 46000, '2020-10-19 07:44:19', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(292, 'ID2020081400023', 'A01', 'AA0012010042127', 'AA0012010049986', 15000, '2020-10-09 12:27:59', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(293, 'ID2020081400023', 'A01', 'AA0012010194996', 'AA0012010196281', 201375, '2020-10-05 09:21:29', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(294, 'ID2020081400023', 'A01', 'AA0012010040573', 'AA0012010045255', 151800, '2020-10-09 03:50:11', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(295, 'ID2020081400023', 'A01', 'AA0012010208871', 'AA0012010207415', 251700, '2020-10-04 06:58:23', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(296, 'ID2020081400023', 'A01', 'AA0012010071627', 'AA0012010073172', 51000, '2020-10-16 03:25:29', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(297, 'ID2020081400023', 'A01', 'AA0012010114804', 'AA0012010115179', 54000, '2020-10-04 09:19:42', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(298, 'ID2020081400023', 'A01', 'AA0012010066687', 'AA0012010064311', 46000, '2020-10-17 06:57:44', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(299, 'ID2020081400023', 'A01', 'AA0012010180693', 'AA0012010180424', 31000, '2020-10-16 11:54:57', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(300, 'ID2020081400023', 'A01', 'AA0012010136766', 'AA0012010136396', 31000, '2020-10-15 08:18:11', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(301, 'ID2020081400023', 'A01', 'AA0012010033193', 'AA0012010031228', 96375, '2020-10-17 12:25:31', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(302, 'ID2020081400024', 'A02', 'AA0022010181745', 'AA0022010189475', 31000, '2020-10-11 11:13:08', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(303, 'ID2020081400024', 'A02', 'AA0022010109603', 'AA0022010105475', 49000, '2020-10-11 07:28:53', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(304, 'ID2020081400024', 'A02', 'AA0022010081517', 'AA0022010084785', 15000, '2020-10-03 07:03:08', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(305, 'ID2020081400024', 'A02', 'AA0022010036345', 'AA0022010034594', 77000, '2020-10-14 12:38:24', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(306, 'ID2020081400024', 'A02', 'AA0022010010101', 'AA0022010018443', 13000, '2020-10-14 02:47:48', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(307, 'ID2020081400024', 'A02', 'AA0022010145693', 'AA0022010141890', 902000, '2020-10-14 01:14:56', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(308, 'ID2020081400024', 'A02', 'AA0022010073966', 'AA0022010077810', 31000, '2020-10-09 12:08:39', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(309, 'ID2020081400024', 'A02', 'AA0022010166032', 'AA0022010168363', 54000, '2020-10-15 03:04:49', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(310, 'ID2020081400024', 'A02', 'AA0022010146262', 'AA0022010143809', 46000, '2020-10-10 08:37:38', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(311, 'ID2020081400024', 'A02', 'AA0022010024697', 'AA0022010020967', 602000, '2020-10-11 07:47:45', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(312, 'ID2020081400024', 'A02', 'AA0022010095737', 'AA0022010098107', 76800, '2020-10-14 03:53:26', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(313, 'ID2020081400024', 'A02', 'AA0022010200269', 'AA0022010202405', 702000, '2020-10-20 06:40:02', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(314, 'ID2020081400024', 'A02', 'AA0022010135480', 'AA0022010131639', 18000, '2020-10-08 03:42:51', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(315, 'ID2020081400024', 'A02', 'AA0022010164210', 'AA0022010163920', 751700, '2020-10-10 02:22:55', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(316, 'ID2020081400024', 'A02', 'AA0022010177169', 'AA0022010178193', 602000, '2020-10-02 08:51:16', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(317, 'ID2020081400024', 'A02', 'AA0022010026404', 'AA0022010025629', 18000, '2020-10-03 10:46:01', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(318, 'ID2020081400024', 'A02', 'AA0022010209197', 'AA0022010205523', 602000, '2020-10-03 12:38:02', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(319, 'ID2020081400024', 'A02', 'AA0022010030427', 'AA0022010037654', 27350, '2020-10-04 06:37:36', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(320, 'ID2020081400024', 'A02', 'AA0022010089604', 'AA0022010082880', 18000, '2020-10-20 07:44:45', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(321, 'ID2020081400024', 'A02', 'AA0022010118874', 'AA0022010116443', 33000, '2020-10-18 04:46:03', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1');
INSERT INTO `tbltransaksi` (`id`, `storeid`, `posid`, `trxno`, `reffno`, `amount`, `trxdt`, `pymstt`, `pymreff`, `pymdt`, `issuerid`, `retreffno`, `payernm`, `payerphn`, `status`) VALUES
(322, 'ID2020081400024', 'A02', 'AA0022010020845', 'AA0022010022192', 31375, '2020-10-08 10:56:18', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(323, 'ID2020081400024', 'A02', 'AA0022010135351', 'AA0022010138575', 13000, '2020-10-16 09:48:58', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(324, 'ID2020081400024', 'A02', 'AA0022010186427', 'AA0022010187328', 602000, '2020-10-14 04:21:33', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(325, 'ID2020081400024', 'A02', 'AA0022010114793', 'AA0022010118549', 76800, '2020-10-01 06:00:22', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(326, 'ID2020081400024', 'A02', 'AA0022010148643', 'AA0022010144597', 15000, '2020-10-05 02:34:55', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(327, 'ID2020081400024', 'A02', 'AA0022010205797', 'AA0022010208996', 11800, '2020-10-01 03:03:18', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(328, 'ID2020081400024', 'A02', 'AA0022010173887', 'AA0022010176995', 301375, '2020-10-07 11:47:56', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(329, 'ID2020081400024', 'A02', 'AA0022010078723', 'AA0022010079372', 41000, '2020-10-07 04:32:58', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(330, 'ID2020081400024', 'A02', 'AA0022010071782', 'AA0022010070942', 15000, '2020-10-19 11:08:20', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(331, 'ID2020081400024', 'A02', 'AA0022010033876', 'AA0022010036362', 251700, '2020-10-04 06:28:24', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(332, 'ID2020081400024', 'A02', 'AA0022010181300', 'AA0022010188270', 18000, '2020-10-04 04:25:53', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(333, 'ID2020081400024', 'A02', 'AA0022010133428', 'AA0022010132107', 151800, '2020-10-18 05:47:25', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(334, 'ID2020081400024', 'A02', 'AA0022010093885', 'AA0022010094760', 18000, '2020-10-15 07:55:36', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(335, 'ID2020081400024', 'A02', 'AA0022010173539', 'AA0022010174338', 101800, '2020-10-19 11:58:03', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(336, 'ID2020081400024', 'A02', 'AA0022010149852', 'AA0022010144471', 502800, '2020-10-17 08:33:15', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(337, 'ID2020081400024', 'A02', 'AA0022010175773', 'AA0022010177562', 71375, '2020-10-09 06:46:52', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(338, 'ID2020081400024', 'A02', 'AA0022010088614', 'AA0022010084380', 71375, '2020-10-14 04:32:34', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(339, 'ID2020081400024', 'A02', 'AA0022010160288', 'AA0022010165460', 28000, '2020-10-18 12:07:23', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(340, 'ID2020081400024', 'A02', 'AA0022010045619', 'AA0022010041194', 26375, '2020-10-20 08:42:17', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(341, 'ID2020081400024', 'A02', 'AA0022010046109', 'AA0022010040588', 54000, '2020-10-20 06:15:47', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(342, 'ID2020081400024', 'A02', 'AA0022010145372', 'AA0022010142575', 32000, '2020-10-12 03:29:20', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(343, 'ID2020081400024', 'A02', 'AA0022010130990', 'AA0022010137762', 76800, '2020-10-20 09:08:19', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(344, 'ID2020081400024', 'A02', 'AA0022010152446', 'AA0022010152463', 36000, '2020-10-06 05:54:07', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(345, 'ID2020081400024', 'A02', 'AA0022010106101', 'AA0022010108908', 33000, '2020-10-04 03:09:49', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(346, 'ID2020081400024', 'A02', 'AA0022010205900', 'AA0022010208172', 202000, '2020-10-15 02:41:27', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(347, 'ID2020081400024', 'A02', 'AA0022010169340', 'AA0022010166298', 45000, '2020-10-19 06:38:11', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(348, 'ID2020081400024', 'A02', 'AA0022010111617', 'AA0022010115654', 81375, '2020-10-08 07:52:40', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(349, 'ID2020081400024', 'A02', 'AA0022010012535', 'AA0022010010567', 41000, '2020-10-01 10:09:02', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(350, 'ID2020081400024', 'A02', 'AA0022010140003', 'AA0022010141062', 31000, '2020-10-10 12:26:19', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(351, 'ID2020081400024', 'A02', 'AA0022010116987', 'AA0022010115633', 30000, '2020-10-15 02:39:59', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(352, 'ID2020081400025', 'A03', 'AA0032010112392', 'AA0032010115152', 302150, '2020-10-19 10:22:13', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(353, 'ID2020081400025', 'A03', 'AA0032010041594', 'AA0032010047946', 28000, '2020-10-02 11:29:06', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(354, 'ID2020081400025', 'A03', 'AA0032010062424', 'AA0032010069084', 22000, '2020-10-18 07:44:46', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(355, 'ID2020081400025', 'A03', 'AA0032010146925', 'AA0032010140052', 51700, '2020-10-03 02:02:22', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(356, 'ID2020081400025', 'A03', 'AA0032010189379', 'AA0032010188770', 501700, '2020-10-13 06:43:27', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(357, 'ID2020081400025', 'A03', 'AA0032010048102', 'AA0032010041420', 1001700, '2020-10-18 06:44:22', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(358, 'ID2020081400025', 'A03', 'AA0032010197467', 'AA0032010191517', 96375, '2020-10-14 07:25:42', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(359, 'ID2020081400025', 'A03', 'AA0032010208915', 'AA0032010209633', 27350, '2020-10-09 09:51:49', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(360, 'ID2020081400025', 'A03', 'AA0032010097076', 'AA0032010090685', 48000, '2020-10-17 03:16:32', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(361, 'ID2020081400025', 'A03', 'AA0032010019780', 'AA0032010010317', 18000, '2020-10-13 01:46:31', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(362, 'ID2020081400025', 'A03', 'AA0032010193253', 'AA0032010197656', 36000, '2020-10-07 09:21:49', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(363, 'ID2020081400025', 'A03', 'AA0032010205810', 'AA0032010208636', 27350, '2020-10-02 01:14:29', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(364, 'ID2020081400025', 'A03', 'AA0032010164828', 'AA0032010161199', 26000, '2020-10-19 02:05:59', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(365, 'ID2020081400025', 'A03', 'AA0032010178287', 'AA0032010176122', 101700, '2020-10-11 10:50:09', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(366, 'ID2020081400025', 'A03', 'AA0032010118656', 'AA0032010113073', 31000, '2020-10-13 09:45:14', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(367, 'ID2020081400025', 'A03', 'AA0032010168107', 'AA0032010169948', 46375, '2020-10-04 03:31:13', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(368, 'ID2020081400025', 'A03', 'AA0032010158615', 'AA0032010151152', 101700, '2020-10-10 04:25:01', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(369, 'ID2020081400025', 'A03', 'AA0032010175680', 'AA0032010172080', 49000, '2020-10-02 09:23:54', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(370, 'ID2020081400025', 'A03', 'AA0032010171499', 'AA0032010173289', 302150, '2020-10-17 03:33:41', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(371, 'ID2020081400025', 'A03', 'AA0032010089069', 'AA0032010083890', 46375, '2020-10-09 09:34:29', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(372, 'ID2020081400025', 'A03', 'AA0032010142241', 'AA0032010146505', 401375, '2020-10-18 10:05:11', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(373, 'ID2020081400025', 'A03', 'AA0032010177293', 'AA0032010174806', 751700, '2020-10-16 11:41:16', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(374, 'ID2020081400025', 'A03', 'AA0032010101516', 'AA0032010100025', 86375, '2020-10-01 04:44:30', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(375, 'ID2020081400025', 'A03', 'AA0032010149938', 'AA0032010142059', 802000, '2020-10-13 05:30:23', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(376, 'ID2020081400025', 'A03', 'AA0032010162203', 'AA0032010169381', 201375, '2020-10-05 09:45:03', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(377, 'ID2020081400025', 'A03', 'AA0032010209031', 'AA0032010208534', 52000, '2020-10-03 05:57:43', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(378, 'ID2020081400025', 'A03', 'AA0032010127033', 'AA0032010120900', 502800, '2020-10-14 07:45:10', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(379, 'ID2020081400025', 'A03', 'AA0032010184122', 'AA0032010189926', 18000, '2020-10-17 05:29:28', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(380, 'ID2020081400025', 'A03', 'AA0032010160492', 'AA0032010169886', 91375, '2020-10-04 12:55:35', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(381, 'ID2020081400025', 'A03', 'AA0032010123565', 'AA0032010120353', 36000, '2020-10-10 10:35:39', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(382, 'ID2020081400025', 'A03', 'AA0032010205635', 'AA0032010200304', 52000, '2020-10-11 06:32:40', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(383, 'ID2020081400025', 'A03', 'AA0032010092786', 'AA0032010090142', 36000, '2020-10-12 09:24:07', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(384, 'ID2020081400025', 'A03', 'AA0032010017508', 'AA0032010016420', 33000, '2020-10-07 03:36:46', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(385, 'ID2020081400025', 'A03', 'AA0032010173695', 'AA0032010171103', 49000, '2020-10-04 02:00:50', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(386, 'ID2020081400025', 'A03', 'AA0032010107817', 'AA0032010107785', 31000, '2020-10-17 04:58:45', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(387, 'ID2020081400025', 'A03', 'AA0032010164274', 'AA0032010164199', 1001700, '2020-10-13 02:34:08', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(388, 'ID2020081400025', 'A03', 'AA0032010198811', 'AA0032010197243', 702000, '2020-10-11 11:13:16', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(389, 'ID2020081400025', 'A03', 'AA0032010046609', 'AA0032010046718', 13000, '2020-10-05 02:20:59', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(390, 'ID2020081400025', 'A03', 'AA0032010078239', 'AA0032010075309', 91375, '2020-10-05 07:57:34', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(391, 'ID2020081400025', 'A03', 'AA0032010115227', 'AA0032010118516', 102000, '2020-10-09 07:35:07', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(392, 'ID2020081400025', 'A03', 'AA0032010161115', 'AA0032010169479', 31000, '2020-10-11 06:39:30', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(393, 'ID2020081400025', 'A03', 'AA0032010067092', 'AA0032010061573', 502000, '2020-10-07 08:23:18', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(394, 'ID2020081400025', 'A03', 'AA0032010139035', 'AA0032010131990', 102000, '2020-10-17 02:52:39', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(395, 'ID2020081400025', 'A03', 'AA0032010187551', 'AA0032010185329', 41000, '2020-10-15 08:08:09', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(396, 'ID2020081400025', 'A03', 'AA0032010022497', 'AA0032010027034', 18000, '2020-10-20 04:01:35', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(397, 'ID2020081400025', 'A03', 'AA0032010116829', 'AA0032010116218', 18000, '2020-10-12 06:19:14', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(398, 'ID2020081400025', 'A03', 'AA0032010078251', 'AA0032010079941', 49000, '2020-10-04 04:12:34', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(399, 'ID2020081400025', 'A03', 'AA0032010049623', 'AA0032010044045', 26800, '2020-10-18 07:56:16', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(400, 'ID2020081400025', 'A03', 'AA0032010068003', 'AA0032010066477', 21700, '2020-10-03 01:41:12', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(401, 'ID2020081400025', 'A03', 'AA0032010178756', 'AA0032010172075', 152150, '2020-10-13 08:34:45', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(402, 'ID2020081400026', 'A04', 'AA0042010141078', 'AA0042010142280', 28000, '2020-10-12 12:27:09', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(403, 'ID2020081400026', 'A04', 'AA0042010185047', 'AA0042010182052', 31375, '2020-10-08 06:12:22', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(404, 'ID2020081400026', 'A04', 'AA0042010180382', 'AA0042010185957', 54000, '2020-10-10 04:50:23', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(405, 'ID2020081400026', 'A04', 'AA0042010123362', 'AA0042010127873', 18000, '2020-10-19 07:03:20', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(406, 'ID2020081400026', 'A04', 'AA0042010032311', 'AA0042010032843', 36000, '2020-10-18 07:32:37', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(407, 'ID2020081400026', 'A04', 'AA0042010072450', 'AA0042010071371', 41375, '2020-10-02 02:26:56', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(408, 'ID2020081400026', 'A04', 'AA0042010198543', 'AA0042010193712', 101800, '2020-10-12 04:18:10', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(409, 'ID2020081400026', 'A04', 'AA0042010024118', 'AA0042010027949', 31375, '2020-10-18 01:16:24', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(410, 'ID2020081400026', 'A04', 'AA0042010189419', 'AA0042010184599', 43000, '2020-10-16 04:02:26', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(411, 'ID2020081400026', 'A04', 'AA0042010092766', 'AA0042010097749', 36000, '2020-10-05 11:36:51', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(412, 'ID2020081400026', 'A04', 'AA0042010185004', 'AA0042010187333', 26000, '2020-10-13 02:51:17', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(413, 'ID2020081400026', 'A04', 'AA0042010036907', 'AA0042010033480', 33000, '2020-10-20 03:54:23', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(414, 'ID2020081400026', 'A04', 'AA0042010109073', 'AA0042010101931', 13000, '2020-10-10 09:24:27', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(415, 'ID2020081400026', 'A04', 'AA0042010154648', 'AA0042010153187', 31000, '2020-10-05 04:28:03', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(416, 'ID2020081400026', 'A04', 'AA0042010136935', 'AA0042010139798', 33000, '2020-10-10 03:23:52', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(417, 'ID2020081400026', 'A04', 'AA0042010060764', 'AA0042010068900', 802000, '2020-10-17 10:00:50', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(418, 'ID2020081400026', 'A04', 'AA0042010028821', 'AA0042010025142', 501375, '2020-10-09 06:19:56', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(419, 'ID2020081400026', 'A04', 'AA0042010136014', 'AA0042010133925', 52150, '2020-10-18 06:24:00', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(420, 'ID2020081400026', 'A04', 'AA0042010101208', 'AA0042010106547', 76375, '2020-10-06 03:13:42', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(421, 'ID2020081400026', 'A04', 'AA0042010033333', 'AA0042010033732', 13000, '2020-10-17 06:33:44', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(422, 'ID2020081400026', 'A04', 'AA0042010089613', 'AA0042010083625', 201800, '2020-10-14 11:41:18', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(423, 'ID2020081400026', 'A04', 'AA0042010053486', 'AA0042010050927', 36375, '2020-10-08 04:00:34', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(424, 'ID2020081400026', 'A04', 'AA0042010199101', 'AA0042010197340', 36000, '2020-10-10 12:33:27', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(425, 'ID2020081400026', 'A04', 'AA0042010207953', 'AA0042010204957', 33000, '2020-10-09 07:15:42', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(426, 'ID2020081400026', 'A04', 'AA0042010204428', 'AA0042010203996', 36000, '2020-10-13 03:15:36', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(427, 'ID2020081400026', 'A04', 'AA0042010097700', 'AA0042010098971', 802000, '2020-10-06 12:43:59', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(428, 'ID2020081400026', 'A04', 'AA0042010161443', 'AA0042010160558', 401800, '2020-10-18 11:56:47', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(429, 'ID2020081400026', 'A04', 'AA0042010123637', 'AA0042010126995', 31375, '2020-10-02 12:19:38', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(430, 'ID2020081400026', 'A04', 'AA0042010014824', 'AA0042010019045', 52150, '2020-10-10 08:13:08', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(431, 'ID2020081400026', 'A04', 'AA0042010084039', 'AA0042010086021', 31000, '2020-10-19 08:26:06', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(432, 'ID2020081400026', 'A04', 'AA0042010064816', 'AA0042010069852', 36000, '2020-10-08 02:07:01', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(433, 'ID2020081400026', 'A04', 'AA0042010195974', 'AA0042010194287', 30000, '2020-10-10 01:21:17', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(434, 'ID2020081400026', 'A04', 'AA0042010025862', 'AA0042010025764', 27350, '2020-10-17 10:03:01', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(435, 'ID2020081400026', 'A04', 'AA0042010054531', 'AA0042010056987', 21800, '2020-10-08 08:25:48', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(436, 'ID2020081400026', 'A04', 'AA0042010092144', 'AA0042010091243', 13000, '2020-10-09 06:18:14', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(437, 'ID2020081400026', 'A04', 'AA0042010189592', 'AA0042010181240', 152000, '2020-10-04 05:53:53', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(438, 'ID2020081400026', 'A04', 'AA0042010012353', 'AA0042010013836', 31000, '2020-10-05 01:07:11', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(439, 'ID2020081400026', 'A04', 'AA0042010194967', 'AA0042010191343', 13000, '2020-10-16 01:01:48', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(440, 'ID2020081400026', 'A04', 'AA0042010026388', 'AA0042010025831', 56375, '2020-10-14 04:44:57', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(441, 'ID2020081400026', 'A04', 'AA0042010117563', 'AA0042010113667', 102000, '2020-10-07 11:09:16', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(442, 'ID2020081400026', 'A04', 'AA0042010192138', 'AA0042010190694', 30000, '2020-10-11 06:47:25', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(443, 'ID2020081400026', 'A04', 'AA0042010089154', 'AA0042010080256', 152000, '2020-10-18 08:16:38', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(444, 'ID2020081400026', 'A04', 'AA0042010097758', 'AA0042010098293', 31000, '2020-10-05 08:11:16', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(445, 'ID2020081400026', 'A04', 'AA0042010116976', 'AA0042010110509', 71375, '2020-10-06 03:18:15', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(446, 'ID2020081400026', 'A04', 'AA0042010178238', 'AA0042010178289', 32000, '2020-10-01 09:33:54', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(447, 'ID2020081400026', 'A04', 'AA0042010105978', 'AA0042010105600', 502000, '2020-10-02 10:24:50', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(448, 'ID2020081400026', 'A04', 'AA0042010120471', 'AA0042010129715', 49000, '2020-10-16 03:21:10', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(449, 'ID2020081400026', 'A04', 'AA0042010112925', 'AA0042010117516', 51800, '2020-10-15 11:34:03', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(450, 'ID2020081400026', 'A04', 'AA0042010038806', 'AA0042010036467', 21800, '2020-10-06 07:53:03', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(451, 'ID2020081400026', 'A04', 'AA0042010187564', 'AA0042010185612', 27000, '2020-10-15 09:08:14', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(452, 'ID2020081400027', 'A05', 'AA0052010124004', 'AA0052010121188', 52150, '2020-10-04 07:33:03', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(453, 'ID2020081400027', 'A05', 'AA0052010105560', 'AA0052010102984', 49000, '2020-10-17 02:25:48', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(454, 'ID2020081400027', 'A05', 'AA0052010180698', 'AA0052010180346', 1001700, '2020-10-16 05:01:41', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(455, 'ID2020081400027', 'A05', 'AA0052010052352', 'AA0052010050779', 101375, '2020-10-15 06:53:33', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(456, 'ID2020081400027', 'A05', 'AA0052010052209', 'AA0052010054738', 26000, '2020-10-05 08:04:30', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(457, 'ID2020081400027', 'A05', 'AA0052010040199', 'AA0052010043971', 44000, '2020-10-05 05:55:07', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(458, 'ID2020081400027', 'A05', 'AA0052010070704', 'AA0052010072656', 71375, '2020-10-06 10:55:29', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(459, 'ID2020081400027', 'A05', 'AA0052010072744', 'AA0052010076444', 202000, '2020-10-11 03:33:55', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(460, 'ID2020081400027', 'A05', 'AA0052010131064', 'AA0052010131042', 152150, '2020-10-19 10:20:45', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(461, 'ID2020081400027', 'A05', 'AA0052010145338', 'AA0052010146703', 26375, '2020-10-08 07:35:21', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(462, 'ID2020081400027', 'A05', 'AA0052010196744', 'AA0052010194221', 52000, '2020-10-02 10:31:16', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(463, 'ID2020081400027', 'A05', 'AA0052010084614', 'AA0052010082317', 51000, '2020-10-14 07:48:09', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(464, 'ID2020081400027', 'A05', 'AA0052010167382', 'AA0052010166631', 501375, '2020-10-04 09:18:22', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(465, 'ID2020081400027', 'A05', 'AA0052010176575', 'AA0052010177516', 33000, '2020-10-05 06:44:53', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(466, 'ID2020081400027', 'A05', 'AA0052010060952', 'AA0052010060258', 502800, '2020-10-03 07:36:12', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(467, 'ID2020081400027', 'A05', 'AA0052010167046', 'AA0052010169641', 15000, '2020-10-06 02:35:20', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(468, 'ID2020081400027', 'A05', 'AA0052010174808', 'AA0052010170089', 42000, '2020-10-12 03:30:46', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(469, 'ID2020081400027', 'A05', 'AA0052010102612', 'AA0052010108350', 71375, '2020-10-02 02:36:09', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(470, 'ID2020081400027', 'A05', 'AA0052010025213', 'AA0052010028530', 49000, '2020-10-07 05:12:56', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(471, 'ID2020081400027', 'A05', 'AA0052010182487', 'AA0052010189121', 702000, '2020-10-01 09:00:30', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(472, 'ID2020081400027', 'A05', 'AA0052010151639', 'AA0052010152982', 31000, '2020-10-06 06:22:47', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(473, 'ID2020081400027', 'A05', 'AA0052010157146', 'AA0052010153701', 91375, '2020-10-08 01:52:20', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(474, 'ID2020081400027', 'A05', 'AA0052010018974', 'AA0052010012003', 36000, '2020-10-14 10:13:07', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(475, 'ID2020081400027', 'A05', 'AA0052010118926', 'AA0052010110578', 18000, '2020-10-03 10:17:34', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(476, 'ID2020081400027', 'A05', 'AA0052010069282', 'AA0052010066275', 31000, '2020-10-03 03:24:55', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(477, 'ID2020081400027', 'A05', 'AA0052010170088', 'AA0052010175377', 46000, '2020-10-02 01:58:24', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(478, 'ID2020081400027', 'A05', 'AA0052010076611', 'AA0052010077430', 402000, '2020-10-20 08:02:38', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(479, 'ID2020081400027', 'A05', 'AA0052010109186', 'AA0052010106159', 48000, '2020-10-11 10:40:31', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(480, 'ID2020081400027', 'A05', 'AA0052010209726', 'AA0052010208595', 56375, '2020-10-06 01:03:39', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(481, 'ID2020081400027', 'A05', 'AA0052010102353', 'AA0052010101005', 76375, '2020-10-05 02:03:01', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(482, 'ID2020081400027', 'A05', 'AA0052010087354', 'AA0052010081336', 11800, '2020-10-07 07:31:57', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(483, 'ID2020081400027', 'A05', 'AA0052010043432', 'AA0052010046657', 13000, '2020-10-03 10:29:33', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(484, 'ID2020081400027', 'A05', 'AA0052010033571', 'AA0052010035548', 51000, '2020-10-16 08:47:02', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(485, 'ID2020081400027', 'A05', 'AA0052010129020', 'AA0052010123046', 44000, '2020-10-08 01:52:47', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(486, 'ID2020081400027', 'A05', 'AA0052010151814', 'AA0052010153028', 33000, '2020-10-15 08:44:59', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(487, 'ID2020081400027', 'A05', 'AA0052010096333', 'AA0052010090818', 251700, '2020-10-11 12:10:14', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(488, 'ID2020081400027', 'A05', 'AA0052010182924', 'AA0052010187195', 902000, '2020-10-16 09:18:07', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(489, 'ID2020081400027', 'A05', 'AA0052010027923', 'AA0052010028909', 77000, '2020-10-08 11:22:18', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(490, 'ID2020081400027', 'A05', 'AA0052010168514', 'AA0052010161441', 77000, '2020-10-11 03:00:58', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(491, 'ID2020081400027', 'A05', 'AA0052010154713', 'AA0052010156838', 152150, '2020-10-12 03:09:15', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(492, 'ID2020081400027', 'A05', 'AA0052010157052', 'AA0052010154295', 48000, '2020-10-06 11:42:55', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(493, 'ID2020081400027', 'A05', 'AA0052010178931', 'AA0052010178294', 51375, '2020-10-03 06:13:59', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(494, 'ID2020081400027', 'A05', 'AA0052010117450', 'AA0052010110110', 152150, '2020-10-08 03:36:18', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(495, 'ID2020081400027', 'A05', 'AA0052010136050', 'AA0052010131737', 102150, '2020-10-10 05:04:42', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(496, 'ID2020081400027', 'A05', 'AA0052010129444', 'AA0052010127037', 651375, '2020-10-01 07:31:00', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(497, 'ID2020081400027', 'A05', 'AA0052010060214', 'AA0052010064614', 36000, '2020-10-15 07:35:38', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(498, 'ID2020081400027', 'A05', 'AA0052010102179', 'AA0052010101079', 32000, '2020-10-17 12:57:54', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(499, 'ID2020081400027', 'A05', 'AA0052010117788', 'AA0052010114326', 33000, '2020-10-13 05:27:17', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(500, 'ID2020081400027', 'A05', 'AA0052010184010', 'AA0052010183708', 28000, '2020-10-04 11:20:14', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(501, 'ID2020081400027', 'A05', 'AA0052010197192', 'AA0052010199723', 51000, '2020-10-11 01:49:06', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(503, 'ID2020081400023', 'A01', 'AA0012010219033', 'AA0012010219033', 22000, '2020-10-21 18:22:01', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1'),
(506, 'ID2020081400023', 'A01', 'AA0012010229034', 'AA0012010229034', 17000, '2020-10-22 15:20:41', 'PAID', '', '0000-00-00 00:00:00', '', '', '', '', '1');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaction_detail`
--

CREATE TABLE `transaction_detail` (
  `id` int(11) NOT NULL,
  `no_trx_master` varchar(50) NOT NULL,
  `id_prd_detail` int(11) NOT NULL,
  `topping` longtext,
  `spice` int(11) DEFAULT NULL,
  `price` int(11) NOT NULL,
  `no_trx_ppob` varchar(50) DEFAULT NULL,
  `customer_id` varchar(50) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `type` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `transaction_detail`
--

INSERT INTO `transaction_detail` (`id`, `no_trx_master`, `id_prd_detail`, `topping`, `spice`, `price`, `no_trx_ppob`, `customer_id`, `position`, `type`, `status`) VALUES
(1, 'AA0012010200001', 66, '[7]', 0, 13000, NULL, NULL, NULL, 2, 2),
(2, 'AA0012005188202', 66, '', 3, 18000, NULL, NULL, NULL, 2, 2),
(3, 'AA0012005188202', 67, '[6]', 3, 15000, NULL, NULL, NULL, 2, 2),
(4, 'AA0012002212840', 12, NULL, NULL, 402000, '695198289', '428169783537', NULL, 1, 2),
(5, 'AA0012009102157', 66, '[6,7]', 5, 18000, NULL, NULL, NULL, 2, 2),
(6, 'AA0012009102157', 67, '[7]', 5, 13000, NULL, NULL, NULL, 2, 2),
(7, 'AA0012009102157', 67, '', 2, 18000, NULL, NULL, NULL, 2, 2),
(8, 'AA0012003021597', 16, NULL, NULL, 802000, '456234678', '790900175628', NULL, 1, 2),
(9, 'AA0012001260377', 67, '[6]', 5, 15000, NULL, NULL, NULL, 2, 2),
(10, 'AA0012001260377', 66, '[6,7]', 1, 18000, NULL, NULL, NULL, 2, 2),
(11, 'AA0012004246959', 34, NULL, NULL, 41375, '593875820', '263901009034', NULL, 1, 2),
(12, 'AA0012009244191', 3, NULL, NULL, 32000, '247762946', '727004668062', NULL, 1, 2),
(13, 'AA0012002240454', 45, NULL, NULL, 96375, '958854577', '967523536113', NULL, 1, 2),
(14, 'AA0012010023131', 27, NULL, NULL, 301800, '496627022', '881864935091', NULL, 1, 2),
(15, 'AA0012001054450', 67, '[6]', 5, 15000, NULL, NULL, NULL, 2, 2),
(16, 'AA0012001054450', 67, '', 0, 18000, NULL, NULL, NULL, 2, 2),
(17, 'AA0012001301833', 66, '[6,7]', 0, 18000, NULL, NULL, NULL, 2, 2),
(18, 'AA0012008026217', 16, NULL, NULL, 802000, '758396582', '715803058689', NULL, 1, 2),
(19, 'AA0012003134386', 7, NULL, NULL, 102000, '288927532', '754782945803', NULL, 1, 2),
(20, 'AA0012003107730', 6, NULL, NULL, 77000, '904919947', '262073257898', NULL, 1, 2),
(21, 'AA0012001279601', 45, NULL, NULL, 96375, '066874756', '156744339590', NULL, 1, 2),
(22, 'AA0012008086770', 67, '[7]', 4, 13000, NULL, NULL, NULL, 2, 2),
(23, 'AA0012008086770', 66, '[7]', 1, 13000, NULL, NULL, NULL, 2, 2),
(24, 'AA0012003041937', 67, '', 5, 18000, NULL, NULL, NULL, 2, 2),
(25, 'AA0012007219177', 66, '', 5, 18000, NULL, NULL, NULL, 2, 2),
(26, 'AA0012007219177', 66, '[6]', 5, 15000, NULL, NULL, NULL, 2, 2),
(27, 'AA0012008205062', 4, NULL, NULL, 42000, '276171462', '130611079476', NULL, 1, 2),
(28, 'AA0012001199648', 67, '[7]', 4, 13000, NULL, NULL, NULL, 2, 2),
(29, 'AA0012001199648', 67, '[6]', 4, 15000, NULL, NULL, NULL, 2, 2),
(30, 'AA0012003101743', 28, NULL, NULL, 401800, '968993345', '676314351291', NULL, 1, 2),
(31, 'AA0012006188251', 67, '[6,7]', 3, 18000, NULL, NULL, NULL, 2, 2),
(32, 'AA0012006188251', 66, '[7]', 3, 13000, NULL, NULL, NULL, 2, 2),
(33, 'AA0012006188251', 66, '[6,7]', 4, 18000, NULL, NULL, NULL, 2, 2),
(34, 'AA0012005319186', 67, '', 1, 18000, NULL, NULL, NULL, 2, 2),
(35, 'AA0012005319186', 67, '[6]', 2, 15000, NULL, NULL, NULL, 2, 2),
(36, 'AA0012008136373', 66, '[6,7]', 1, 18000, NULL, NULL, NULL, 2, 2),
(37, 'AA0012008136373', 67, '', 3, 18000, NULL, NULL, NULL, 2, 2),
(38, 'AA0012008136373', 67, '[6,7]', 3, 18000, NULL, NULL, NULL, 2, 2),
(39, 'AA0012006147475', 61, NULL, NULL, 101700, '827833904', '759204826885', NULL, 1, 2),
(40, 'AA0012002028407', 67, '[6,7]', 2, 18000, NULL, NULL, NULL, 2, 2),
(41, 'AA0012002028407', 66, '', 3, 18000, NULL, NULL, NULL, 2, 2),
(42, 'AA0012001032965', 5, NULL, NULL, 52000, '921489900', '470765647370', NULL, 1, 2),
(43, 'AA0012008093638', 66, '', 2, 18000, NULL, NULL, NULL, 2, 2),
(44, 'AA0012008093638', 67, '[6,7]', 0, 18000, NULL, NULL, NULL, 2, 2),
(45, 'AA0012003129130', 67, '[7]', 5, 13000, NULL, NULL, NULL, 2, 2),
(46, 'AA0012003129130', 66, '[7]', 4, 13000, NULL, NULL, NULL, 2, 2),
(47, 'AA0012005223939', 67, '[6,7]', 2, 18000, NULL, NULL, NULL, 2, 2),
(48, 'AA0012009065814', 66, '', 4, 18000, NULL, NULL, NULL, 2, 2),
(49, 'AA0012009065814', 67, '[6,7]', 0, 18000, NULL, NULL, NULL, 2, 2),
(50, 'AA0012009065814', 67, '[6,7]', 0, 18000, NULL, NULL, NULL, 2, 2),
(51, 'AA0012001032923', 66, '[6,7]', 5, 18000, NULL, NULL, NULL, 2, 2),
(52, 'AA0012001032923', 67, '[6]', 4, 15000, NULL, NULL, NULL, 2, 2),
(53, 'AA0012001032923', 66, '[6]', 4, 15000, NULL, NULL, NULL, 2, 2),
(54, 'AA0012007192063', 17, NULL, NULL, 902000, '210114799', '590387916827', NULL, 1, 2),
(55, 'AA0012010054254', 66, '[6,7]', 3, 18000, NULL, NULL, NULL, 2, 2),
(56, 'AA0012010054254', 67, '[7]', 0, 13000, NULL, NULL, NULL, 2, 2),
(57, 'AA0012003214795', 22, NULL, NULL, 51800, '222148709', '338196680635', NULL, 1, 2),
(58, 'AA0012009099485', 21, NULL, NULL, 26800, '526568471', '514432068849', NULL, 1, 2),
(59, 'AA0012005179167', 65, NULL, NULL, 1001700, '623130556', '954700283440', NULL, 1, 2),
(60, 'AA0012006025222', 45, NULL, NULL, 96375, '872265185', '858260195474', NULL, 1, 2),
(61, 'AA0012003133294', 61, NULL, NULL, 101700, '948263928', '224338899650', NULL, 1, 2),
(62, 'AA0012004219113', 67, '', 3, 18000, NULL, NULL, NULL, 2, 2),
(63, 'AA0012004219113', 66, '', 4, 18000, NULL, NULL, NULL, 2, 2),
(64, 'AA0012006075542', 66, '[6]', 0, 15000, NULL, NULL, NULL, 2, 2),
(65, 'AA0012006075542', 66, '[7]', 3, 13000, NULL, NULL, NULL, 2, 2),
(66, 'AA0012009159507', 31, NULL, NULL, 26375, '320566100', '209967895958', NULL, 1, 2),
(67, 'AA0012003140414', 67, '[6]', 0, 15000, NULL, NULL, NULL, 2, 2),
(68, 'AA0012003145872', 66, '[7]', 4, 13000, NULL, NULL, NULL, 2, 2),
(69, 'AA0012003145872', 66, '[6,7]', 4, 18000, NULL, NULL, NULL, 2, 2),
(70, 'AA0012007311519', 19, NULL, NULL, 11800, '003541280', '747046679862', NULL, 1, 2),
(71, 'AA0012003278657', 67, '[7]', 0, 13000, NULL, NULL, NULL, 2, 2),
(72, 'AA0012003278657', 66, '[6]', 2, 15000, NULL, NULL, NULL, 2, 2),
(73, 'AA0012001113743', 66, '[6,7]', 1, 18000, NULL, NULL, NULL, 2, 2),
(74, 'AA0012008037872', 47, NULL, NULL, 201375, '342979590', '704758180968', NULL, 1, 2),
(75, 'AA0012009031841', 67, '[7]', 2, 13000, NULL, NULL, NULL, 2, 2),
(76, 'AA0012003098565', 67, '', 2, 18000, NULL, NULL, NULL, 2, 2),
(77, 'AA0012003098565', 67, '[6,7]', 5, 18000, NULL, NULL, NULL, 2, 2),
(78, 'AA0022009157574', 4, NULL, NULL, 42000, '424987683', '016104235010', NULL, 1, 2),
(79, 'AA0022003088815', 10, NULL, NULL, 252000, '515441297', '114634284454', NULL, 1, 2),
(80, 'AA0022001144658', 39, NULL, NULL, 651375, '152240070', '457686368472', NULL, 1, 2),
(81, 'AA0022003072225', 67, '', 3, 18000, NULL, NULL, NULL, 2, 2),
(82, 'AA0022003072225', 67, '[7]', 3, 13000, NULL, NULL, NULL, 2, 2),
(83, 'AA0022002292456', 17, NULL, NULL, 902000, '892653938', '701959063022', NULL, 1, 2),
(84, 'AA0022002078198', 66, '[7]', 5, 13000, NULL, NULL, NULL, 2, 2),
(85, 'AA0022002078198', 67, '[7]', 0, 13000, NULL, NULL, NULL, 2, 2),
(86, 'AA0022006150637', 38, NULL, NULL, 61375, '704550475', '912501650005', NULL, 1, 2),
(87, 'AA0022009134147', 40, NULL, NULL, 71375, '072417539', '180859368018', NULL, 1, 2),
(88, 'AA0022004060466', 67, '[7]', 3, 13000, NULL, NULL, NULL, 2, 2),
(89, 'AA0022004060466', 66, '', 0, 18000, NULL, NULL, NULL, 2, 2),
(90, 'AA0022004060466', 67, '[7]', 2, 13000, NULL, NULL, NULL, 2, 2),
(91, 'AA0022001312463', 67, '[7]', 0, 13000, NULL, NULL, NULL, 2, 2),
(92, 'AA0022007186167', 67, '[6,7]', 2, 18000, NULL, NULL, NULL, 2, 2),
(93, 'AA0022007186167', 67, '[6,7]', 0, 18000, NULL, NULL, NULL, 2, 2),
(94, 'AA0022007186167', 67, '[6]', 4, 15000, NULL, NULL, NULL, 2, 2),
(95, 'AA0022005039758', 22, NULL, NULL, 51800, '018296838', '416360067804', NULL, 1, 2),
(96, 'AA0022005091472', 8, NULL, NULL, 152000, '359568767', '366368496694', NULL, 1, 2),
(97, 'AA0022004293522', 15, NULL, NULL, 702000, '413233052', '487764045846', NULL, 1, 2),
(98, 'AA0022003192838', 52, NULL, NULL, 52150, '273089222', '392639092145', NULL, 1, 2),
(99, 'AA0022006230043', 66, '', 5, 18000, NULL, NULL, NULL, 2, 2),
(100, 'AA0022006230043', 66, '[6,7]', 5, 18000, NULL, NULL, NULL, 2, 2),
(101, 'AA0022008179432', 44, NULL, NULL, 91375, '643731039', '053905265479', NULL, 1, 2),
(102, 'AA0022004170273', 67, '', 4, 18000, NULL, NULL, NULL, 2, 2),
(103, 'AA0022004170273', 67, '[6,7]', 2, 18000, NULL, NULL, NULL, 2, 2),
(104, 'AA0022001212211', 34, NULL, NULL, 41375, '159055576', '408127807783', NULL, 1, 2),
(105, 'AA0022006102110', 66, '[6,7]', 0, 18000, NULL, NULL, NULL, 2, 2),
(106, 'AA0022006102110', 67, '[7]', 2, 13000, NULL, NULL, NULL, 2, 2),
(107, 'AA0022006102110', 67, '', 5, 18000, NULL, NULL, NULL, 2, 2),
(108, 'AA0022010074105', 66, '[6,7]', 5, 18000, NULL, NULL, NULL, 2, 2),
(109, 'AA0022010074105', 67, '[7]', 5, 13000, NULL, NULL, NULL, 2, 2),
(110, 'AA0022010067989', 66, '', 1, 18000, NULL, NULL, NULL, 2, 2),
(111, 'AA0022010067989', 67, '[7]', 5, 13000, NULL, NULL, NULL, 2, 2),
(112, 'AA0022010067989', 67, '[7]', 3, 13000, NULL, NULL, NULL, 2, 2),
(113, 'AA0022004109010', 67, '[6]', 4, 15000, NULL, NULL, NULL, 2, 2),
(114, 'AA0022005059418', 37, NULL, NULL, 56375, '706342863', '777997457350', NULL, 1, 2),
(115, 'AA0022006062337', 48, NULL, NULL, 301375, '141260439', '873834971311', NULL, 1, 2),
(116, 'AA0022002198746', 67, '[6]', 5, 15000, NULL, NULL, NULL, 2, 2),
(117, 'AA0022002198746', 66, '[6,7]', 2, 18000, NULL, NULL, NULL, 2, 2),
(118, 'AA0022002083618', 11, NULL, NULL, 302000, '622845917', '493290835752', NULL, 1, 2),
(119, 'AA0022004180407', 67, '[7]', 1, 13000, NULL, NULL, NULL, 2, 2),
(120, 'AA0022004180407', 66, '', 5, 18000, NULL, NULL, NULL, 2, 2),
(121, 'AA0022008197206', 65, NULL, NULL, 1001700, '066984373', '359166688199', NULL, 1, 2),
(122, 'AA0022008137311', 66, '[6,7]', 5, 18000, NULL, NULL, NULL, 2, 2),
(123, 'AA0022007043055', 59, NULL, NULL, 51700, '457394932', '338579337912', NULL, 1, 2),
(124, 'AA0022003036724', 66, '[7]', 5, 13000, NULL, NULL, NULL, 2, 2),
(125, 'AA0022003036724', 66, '[6]', 0, 15000, NULL, NULL, NULL, 2, 2),
(126, 'AA0022002098775', 32, NULL, NULL, 31375, '010877038', '967367787340', NULL, 1, 2),
(127, 'AA0022001118638', 13, NULL, NULL, 502000, '760590035', '016628055585', NULL, 1, 2),
(128, 'AA0022006028502', 17, NULL, NULL, 902000, '136688840', '812886269159', NULL, 1, 2),
(129, 'AA0022006197567', 7, NULL, NULL, 102000, '410828818', '580757058482', NULL, 1, 2),
(130, 'AA0022004220083', 61, NULL, NULL, 101700, '853963517', '998068817861', NULL, 1, 2),
(131, 'AA0022010018829', 66, '[6]', 0, 15000, NULL, NULL, NULL, 2, 2),
(132, 'AA0022001085384', 67, '[6,7]', 1, 18000, NULL, NULL, NULL, 2, 2),
(133, 'AA0022001085384', 66, '[7]', 1, 13000, NULL, NULL, NULL, 2, 2),
(134, 'AA0022004177473', 48, NULL, NULL, 301375, '668380759', '748811577782', NULL, 1, 2),
(135, 'AA0022003179844', 66, '', 0, 18000, NULL, NULL, NULL, 2, 2),
(136, 'AA0022008028633', 58, NULL, NULL, 21700, '403248954', '080327946756', NULL, 1, 2),
(137, 'AA0022007318200', 67, '[6,7]', 2, 18000, NULL, NULL, NULL, 2, 2),
(138, 'AA0022007318200', 66, '', 0, 18000, NULL, NULL, NULL, 2, 2),
(139, 'AA0022002013571', 32, NULL, NULL, 31375, '347434820', '762474018980', NULL, 1, 2),
(140, 'AA0022001065124', 21, NULL, NULL, 26800, '400731408', '512414645927', NULL, 1, 2),
(141, 'AA0022004194471', 30, NULL, NULL, 21375, '852918973', '067661456445', NULL, 1, 2),
(142, 'AA0022003039894', 66, '[6,7]', 0, 18000, NULL, NULL, NULL, 2, 2),
(143, 'AA0022003039894', 66, '[6,7]', 4, 18000, NULL, NULL, NULL, 2, 2),
(144, 'AA0022002181830', 63, NULL, NULL, 501700, '550601006', '275177176220', NULL, 1, 2),
(145, 'AA0022007092874', 66, '', 0, 18000, NULL, NULL, NULL, 2, 2),
(146, 'AA0022007092874', 67, '[6,7]', 1, 18000, NULL, NULL, NULL, 2, 2),
(147, 'AA0022007063998', 66, '', 3, 18000, NULL, NULL, NULL, 2, 2),
(148, 'AA0022007063998', 66, '[6]', 4, 15000, NULL, NULL, NULL, 2, 2),
(149, 'AA0022007063998', 67, '[6,7]', 1, 18000, NULL, NULL, NULL, 2, 2),
(150, 'AA0032009062271', 26, NULL, NULL, 201800, '553248847', '197113912467', NULL, 1, 2),
(151, 'AA0032009040005', 42, NULL, NULL, 81375, '844898814', '147563224859', NULL, 1, 2),
(152, 'AA0032010105795', 10, NULL, NULL, 252000, '269757684', '830261660042', NULL, 1, 2),
(153, 'AA0032004093843', 67, '[6]', 4, 15000, NULL, NULL, NULL, 2, 2),
(154, 'AA0032004093843', 67, '[6]', 2, 15000, NULL, NULL, NULL, 2, 2),
(155, 'AA0032004093843', 66, '[6,7]', 4, 18000, NULL, NULL, NULL, 2, 2),
(156, 'AA0032005042901', 59, NULL, NULL, 51700, '741367660', '002447322484', NULL, 1, 2),
(157, 'AA0032010106276', 66, '[6]', 2, 15000, NULL, NULL, NULL, 2, 2),
(158, 'AA0032004088963', 56, NULL, NULL, 302150, '783877972', '438903704214', NULL, 1, 2),
(159, 'AA0032008263891', 66, '', 3, 18000, NULL, NULL, NULL, 2, 2),
(160, 'AA0032008263891', 66, '[6,7]', 3, 18000, NULL, NULL, NULL, 2, 2),
(161, 'AA0032008263891', 67, '[6,7]', 3, 18000, NULL, NULL, NULL, 2, 2),
(162, 'AA0032004268324', 67, '[6,7]', 1, 18000, NULL, NULL, NULL, 2, 2),
(163, 'AA0032004268324', 66, '[6,7]', 5, 18000, NULL, NULL, NULL, 2, 2),
(164, 'AA0032001102504', 19, NULL, NULL, 11800, '684148428', '380930061994', NULL, 1, 2),
(165, 'AA0032009058516', 31, NULL, NULL, 26375, '311184528', '530917804140', NULL, 1, 2),
(166, 'AA0032008042158', 67, '[7]', 5, 13000, NULL, NULL, NULL, 2, 2),
(167, 'AA0032002123583', 63, NULL, NULL, 501700, '121899659', '289347347904', NULL, 1, 2),
(168, 'AA0032007291641', 67, '[6,7]', 4, 18000, NULL, NULL, NULL, 2, 2),
(169, 'AA0032007291641', 67, '[6]', 0, 15000, NULL, NULL, NULL, 2, 2),
(170, 'AA0032006153121', 67, '[7]', 4, 13000, NULL, NULL, NULL, 2, 2),
(171, 'AA0032006153121', 67, '', 2, 18000, NULL, NULL, NULL, 2, 2),
(172, 'AA0032006153121', 66, '[6,7]', 3, 18000, NULL, NULL, NULL, 2, 2),
(173, 'AA0032003227697', 66, '[7]', 0, 13000, NULL, NULL, NULL, 2, 2),
(174, 'AA0032003227697', 67, '', 2, 18000, NULL, NULL, NULL, 2, 2),
(175, 'AA0032008200739', 19, NULL, NULL, 11800, '612514536', '979312092555', NULL, 1, 2),
(176, 'AA0032002034820', 14, NULL, NULL, 602000, '153072269', '280034688065', NULL, 1, 2),
(177, 'AA0032006206880', 48, NULL, NULL, 301375, '768427107', '835722652882', NULL, 1, 2),
(178, 'AA0032006110711', 66, '[7]', 4, 13000, NULL, NULL, NULL, 2, 2),
(179, 'AA0032006110711', 66, '', 1, 18000, NULL, NULL, NULL, 2, 2),
(180, 'AA0032009065225', 50, NULL, NULL, 501375, '413386020', '757756481303', NULL, 1, 2),
(181, 'AA0032006278849', 66, '[6]', 4, 15000, NULL, NULL, NULL, 2, 2),
(182, 'AA0032006278849', 66, '[6]', 0, 15000, NULL, NULL, NULL, 2, 2),
(183, 'AA0032006278849', 66, '', 1, 18000, NULL, NULL, NULL, 2, 2),
(184, 'AA0032001226670', 57, NULL, NULL, 502800, '408733170', '920785482755', NULL, 1, 2),
(185, 'AA0032010027371', 67, '', 2, 18000, NULL, NULL, NULL, 2, 2),
(186, 'AA0032010027371', 66, '[6]', 0, 15000, NULL, NULL, NULL, 2, 2),
(187, 'AA0032009296462', 18, NULL, NULL, 1002000, '819889475', '253092346229', NULL, 1, 2),
(188, 'AA0032010059161', 55, NULL, NULL, 202150, '283170020', '203165516719', NULL, 1, 2),
(189, 'AA0032003103438', 20, NULL, NULL, 21800, '561935154', '418741554919', NULL, 1, 2),
(190, 'AA0032001274857', 66, '[6]', 3, 15000, NULL, NULL, NULL, 2, 2),
(191, 'AA0032001274857', 66, '[6]', 2, 15000, NULL, NULL, NULL, 2, 2),
(192, 'AA0032006140487', 67, '[7]', 0, 13000, NULL, NULL, NULL, 2, 2),
(193, 'AA0032006140487', 66, '[6,7]', 0, 18000, NULL, NULL, NULL, 2, 2),
(194, 'AA0032005173463', 66, '[6]', 4, 15000, NULL, NULL, NULL, 2, 2),
(195, 'AA0032002237306', 37, NULL, NULL, 56375, '474526601', '389186823939', NULL, 1, 2),
(196, 'AA0032001109987', 67, '[6]', 5, 15000, NULL, NULL, NULL, 2, 2),
(197, 'AA0032008012815', 66, '[6]', 1, 15000, NULL, NULL, NULL, 2, 2),
(198, 'AA0032008012815', 67, '[6]', 4, 15000, NULL, NULL, NULL, 2, 2),
(199, 'AA0032007044671', 11, NULL, NULL, 302000, '009678964', '558196826000', NULL, 1, 2),
(200, 'AA0032007230637', 23, NULL, NULL, 76800, '910074940', '237655813120', NULL, 1, 2),
(201, 'AA0032001124264', 66, '[7]', 0, 13000, NULL, NULL, NULL, 2, 2),
(202, 'AA0032001124264', 67, '[6,7]', 2, 18000, NULL, NULL, NULL, 2, 2),
(203, 'AA0032001124264', 67, '[7]', 2, 13000, NULL, NULL, NULL, 2, 2),
(204, 'AA0032010068390', 67, '[7]', 2, 13000, NULL, NULL, NULL, 2, 2),
(205, 'AA0032010068390', 66, '[6,7]', 1, 18000, NULL, NULL, NULL, 2, 2),
(206, 'AA0032010068390', 67, '', 5, 18000, NULL, NULL, NULL, 2, 2),
(207, 'AA0032001087769', 21, NULL, NULL, 26800, '193556962', '902324882343', NULL, 1, 2),
(208, 'AA0032001097136', 67, '[6]', 3, 15000, NULL, NULL, NULL, 2, 2),
(209, 'AA0032001097136', 66, '[6]', 3, 15000, NULL, NULL, NULL, 2, 2),
(210, 'AA0032001097136', 67, '[6]', 1, 15000, NULL, NULL, NULL, 2, 2),
(211, 'AA0032001127142', 67, '', 0, 18000, NULL, NULL, NULL, 2, 2),
(212, 'AA0032005253439', 61, NULL, NULL, 101700, '013189325', '746928452324', NULL, 1, 2),
(213, 'AA0032002091332', 66, '', 5, 18000, NULL, NULL, NULL, 2, 2),
(214, 'AA0032002091332', 66, '[6,7]', 2, 18000, NULL, NULL, NULL, 2, 2),
(215, 'AA0032008295301', 66, '[6,7]', 2, 18000, NULL, NULL, NULL, 2, 2),
(216, 'AA0032006241188', 64, NULL, NULL, 751700, '508574668', '620876557514', NULL, 1, 2),
(217, 'AA0032004051166', 67, '', 5, 18000, NULL, NULL, NULL, 2, 2),
(218, 'AA0032002063042', 67, '[7]', 3, 13000, NULL, NULL, NULL, 2, 2),
(219, 'AA0032002063042', 66, '', 2, 18000, NULL, NULL, NULL, 2, 2),
(220, 'AA0032005134550', 29, NULL, NULL, 501800, '565355781', '116328297646', NULL, 1, 2),
(221, 'AA0032003057612', 67, '[6]', 5, 15000, NULL, NULL, NULL, 2, 2),
(222, 'AA0032003057612', 67, '[6,7]', 2, 18000, NULL, NULL, NULL, 2, 2),
(223, 'AA0032003057612', 67, '', 2, 18000, NULL, NULL, NULL, 2, 2),
(224, 'AA0032010018489', 52, NULL, NULL, 52150, '297404759', '015193088652', NULL, 1, 2),
(225, 'AA0032001064108', 66, '[6]', 3, 15000, NULL, NULL, NULL, 2, 2),
(226, 'AA0032001064108', 67, '[6,7]', 1, 18000, NULL, NULL, NULL, 2, 2),
(227, 'AA0042004214612', 67, '[6]', 2, 15000, NULL, NULL, NULL, 2, 2),
(228, 'AA0042004214612', 66, '', 1, 18000, NULL, NULL, NULL, 2, 2),
(229, 'AA0042004214612', 67, '', 5, 18000, NULL, NULL, NULL, 2, 2),
(230, 'AA0042004250589', 66, '', 4, 18000, NULL, NULL, NULL, 2, 2),
(231, 'AA0042004250589', 67, '[6]', 2, 15000, NULL, NULL, NULL, 2, 2),
(232, 'AA0042004250589', 66, '[6]', 4, 15000, NULL, NULL, NULL, 2, 2),
(233, 'AA0042003212232', 27, NULL, NULL, 301800, '432387090', '592633218150', NULL, 1, 2),
(234, 'AA0042004031642', 17, NULL, NULL, 902000, '872182107', '601550721247', NULL, 1, 2),
(235, 'AA0042009192369', 66, '', 5, 18000, NULL, NULL, NULL, 2, 2),
(236, 'AA0042007112127', 14, NULL, NULL, 602000, '328702217', '147645227702', NULL, 1, 2),
(237, 'AA0042004274828', 67, '[7]', 4, 13000, NULL, NULL, NULL, 2, 2),
(238, 'AA0042003231561', 23, NULL, NULL, 76800, '954139455', '299055196320', NULL, 1, 2),
(239, 'AA0042001247721', 22, NULL, NULL, 51800, '222668980', '306094134084', NULL, 1, 2),
(240, 'AA0042005290583', 17, NULL, NULL, 902000, '820143637', '323134413166', NULL, 1, 2),
(241, 'AA0042005276974', 67, '', 5, 18000, NULL, NULL, NULL, 2, 2),
(242, 'AA0042007282322', 8, NULL, NULL, 152000, '760475642', '877597457204', NULL, 1, 2),
(243, 'AA0042005243259', 39, NULL, NULL, 651375, '566870282', '770057083673', NULL, 1, 2),
(244, 'AA0042002145889', 21, NULL, NULL, 26800, '063994568', '132842874447', NULL, 1, 2),
(245, 'AA0042006033441', 67, '', 2, 18000, NULL, NULL, NULL, 2, 2),
(246, 'AA0042005212752', 66, '[6]', 4, 15000, NULL, NULL, NULL, 2, 2),
(247, 'AA0042005212752', 66, '[7]', 5, 13000, NULL, NULL, NULL, 2, 2),
(248, 'AA0042005212752', 66, '[6,7]', 4, 18000, NULL, NULL, NULL, 2, 2),
(249, 'AA0042006033565', 66, '[6]', 4, 15000, NULL, NULL, NULL, 2, 2),
(250, 'AA0042006033565', 66, '[6]', 3, 15000, NULL, NULL, NULL, 2, 2),
(251, 'AA0042006033565', 66, '[7]', 5, 13000, NULL, NULL, NULL, 2, 2),
(252, 'AA0042001126532', 66, '[6]', 5, 15000, NULL, NULL, NULL, 2, 2),
(253, 'AA0042001126532', 66, '[7]', 3, 13000, NULL, NULL, NULL, 2, 2),
(254, 'AA0042001126532', 66, '[7]', 5, 13000, NULL, NULL, NULL, 2, 2),
(255, 'AA0042006255878', 8, NULL, NULL, 152000, '997303858', '744670098084', NULL, 1, 2),
(256, 'AA0042007265491', 67, '[6]', 4, 15000, NULL, NULL, NULL, 2, 2),
(257, 'AA0042007265491', 66, '', 0, 18000, NULL, NULL, NULL, 2, 2),
(258, 'AA0042007265491', 66, '[7]', 0, 13000, NULL, NULL, NULL, 2, 2),
(259, 'AA0042004285125', 21, NULL, NULL, 26800, '289184128', '299707825756', NULL, 1, 2),
(260, 'AA0042001063257', 67, '[7]', 1, 13000, NULL, NULL, NULL, 2, 2),
(261, 'AA0042001063257', 67, '[6,7]', 5, 18000, NULL, NULL, NULL, 2, 2),
(262, 'AA0042007314790', 66, '', 5, 18000, NULL, NULL, NULL, 2, 2),
(263, 'AA0042007314790', 66, '[6,7]', 1, 18000, NULL, NULL, NULL, 2, 2),
(264, 'AA0042007314790', 66, '[6,7]', 1, 18000, NULL, NULL, NULL, 2, 2),
(265, 'AA0042006115089', 28, NULL, NULL, 401800, '905632341', '009936676397', NULL, 1, 2),
(266, 'AA0042006195609', 60, NULL, NULL, 76700, '227730272', '265751431172', NULL, 1, 2),
(267, 'AA0042007301118', 3, NULL, NULL, 32000, '322406957', '756921188314', NULL, 1, 2),
(268, 'AA0042006163246', 66, '[6,7]', 3, 18000, NULL, NULL, NULL, 2, 2),
(269, 'AA0042006163246', 66, '[6,7]', 2, 18000, NULL, NULL, NULL, 2, 2),
(270, 'AA0042006163246', 67, '[6]', 1, 15000, NULL, NULL, NULL, 2, 2),
(271, 'AA0042008154634', 66, '[6,7]', 1, 18000, NULL, NULL, NULL, 2, 2),
(272, 'AA0042008154634', 67, '', 2, 18000, NULL, NULL, NULL, 2, 2),
(273, 'AA0042008154634', 66, '', 0, 18000, NULL, NULL, NULL, 2, 2),
(274, 'AA0042009249527', 57, NULL, NULL, 502800, '658527220', '574895128019', NULL, 1, 2),
(275, 'AA0042003087695', 67, '[6,7]', 1, 18000, NULL, NULL, NULL, 2, 2),
(276, 'AA0042005036693', 42, NULL, NULL, 81375, '668282335', '609577199859', NULL, 1, 2),
(277, 'AA0042009237390', 67, '[6,7]', 4, 18000, NULL, NULL, NULL, 2, 2),
(278, 'AA0042009237390', 67, '[7]', 0, 13000, NULL, NULL, NULL, 2, 2),
(279, 'AA0042003290733', 58, NULL, NULL, 21700, '503762103', '154406391020', NULL, 1, 2),
(280, 'AA0042001292308', 67, '[7]', 5, 13000, NULL, NULL, NULL, 2, 2),
(281, 'AA0042009195692', 8, NULL, NULL, 152000, '775112645', '360567225359', NULL, 1, 2),
(282, 'AA0042001059349', 66, '[6,7]', 2, 18000, NULL, NULL, NULL, 2, 2),
(283, 'AA0042001059349', 66, '', 3, 18000, NULL, NULL, NULL, 2, 2),
(284, 'AA0042003183216', 66, '[7]', 3, 13000, NULL, NULL, NULL, 2, 2),
(285, 'AA0042003183216', 66, '', 1, 18000, NULL, NULL, NULL, 2, 2),
(286, 'AA0042005023221', 67, '[6]', 1, 15000, NULL, NULL, NULL, 2, 2),
(287, 'AA0042004180758', 67, '[6]', 2, 15000, NULL, NULL, NULL, 2, 2),
(288, 'AA0042004180758', 66, '', 5, 18000, NULL, NULL, NULL, 2, 2),
(289, 'AA0042004180758', 67, '[6,7]', 3, 18000, NULL, NULL, NULL, 2, 2),
(290, 'AA0042005087097', 41, NULL, NULL, 76375, '888895548', '758944748034', NULL, 1, 2),
(291, 'AA0042002121708', 14, NULL, NULL, 602000, '644175868', '370563061737', NULL, 1, 2),
(292, 'AA0042002067033', 16, NULL, NULL, 802000, '270834176', '244420829209', NULL, 1, 2),
(293, 'AA0042003100598', 61, NULL, NULL, 101700, '188987572', '880343271672', NULL, 1, 2),
(294, 'AA0042002296933', 67, '[6]', 4, 15000, NULL, NULL, NULL, 2, 2),
(295, 'AA0042002296933', 66, '[6,7]', 4, 18000, NULL, NULL, NULL, 2, 2),
(296, 'AA0042002296933', 66, '', 3, 18000, NULL, NULL, NULL, 2, 2),
(297, 'AA0042001246456', 66, '[6]', 5, 15000, NULL, NULL, NULL, 2, 2),
(298, 'AA0042005123032', 67, '', 1, 18000, NULL, NULL, NULL, 2, 2),
(299, 'AA0042005123032', 67, '', 1, 18000, NULL, NULL, NULL, 2, 2),
(300, 'AA0042005123032', 66, '[6,7]', 3, 18000, NULL, NULL, NULL, 2, 2),
(301, 'AA0042003061871', 64, NULL, NULL, 751700, '244443078', '584339693570', NULL, 1, 2),
(302, 'AA0042007145226', 67, '', 2, 18000, NULL, NULL, NULL, 2, 2),
(303, 'AA0042003268253', 1, NULL, NULL, 22000, '259250322', '084239692504', NULL, 1, 2),
(304, 'AA0042009063787', 35, NULL, NULL, 46375, '538358520', '704860103721', NULL, 1, 2),
(305, 'AA0052005298944', 55, NULL, NULL, 202150, '923094750', '235842820784', NULL, 1, 2),
(306, 'AA0052001029277', 67, '[7]', 0, 13000, NULL, NULL, NULL, 2, 2),
(307, 'AA0052001029277', 67, '[7]', 3, 13000, NULL, NULL, NULL, 2, 2),
(308, 'AA0052002272547', 10, NULL, NULL, 252000, '704908823', '567956941032', NULL, 1, 2),
(309, 'AA0052009302710', 58, NULL, NULL, 21700, '414066842', '835793641472', NULL, 1, 2),
(310, 'AA0052008088211', 66, '', 4, 18000, NULL, NULL, NULL, 2, 2),
(311, 'AA0052008088211', 66, '[7]', 1, 13000, NULL, NULL, NULL, 2, 2),
(312, 'AA0052009206791', 67, '[6,7]', 2, 18000, NULL, NULL, NULL, 2, 2),
(313, 'AA0052003294932', 28, NULL, NULL, 401800, '684227584', '708276559611', NULL, 1, 2),
(314, 'AA0052010144011', 66, '[6,7]', 3, 18000, NULL, NULL, NULL, 2, 2),
(315, 'AA0052006050450', 67, '', 0, 18000, NULL, NULL, NULL, 2, 2),
(316, 'AA0052006050450', 66, '[7]', 2, 13000, NULL, NULL, NULL, 2, 2),
(317, 'AA0052006050450', 66, '[6]', 5, 15000, NULL, NULL, NULL, 2, 2),
(318, 'AA0052004275263', 54, NULL, NULL, 152150, '433719493', '100613014783', NULL, 1, 2),
(319, 'AA0052008185747', 66, '[6]', 4, 15000, NULL, NULL, NULL, 2, 2),
(320, 'AA0052008185747', 66, '[6,7]', 3, 18000, NULL, NULL, NULL, 2, 2),
(321, 'AA0052002013704', 66, '[6]', 5, 15000, NULL, NULL, NULL, 2, 2),
(322, 'AA0052002013704', 67, '[6]', 3, 15000, NULL, NULL, NULL, 2, 2),
(323, 'AA0052002013704', 67, '[7]', 3, 13000, NULL, NULL, NULL, 2, 2),
(324, 'AA0052006124176', 66, '[6,7]', 1, 18000, NULL, NULL, NULL, 2, 2),
(325, 'AA0052006124176', 67, '[6,7]', 5, 18000, NULL, NULL, NULL, 2, 2),
(326, 'AA0052003243743', 50, NULL, NULL, 501375, '022582726', '269613069248', NULL, 1, 2),
(327, 'AA0052003149671', 67, '', 4, 18000, NULL, NULL, NULL, 2, 2),
(328, 'AA0052002108621', 66, '', 1, 18000, NULL, NULL, NULL, 2, 2),
(329, 'AA0052002108621', 67, '[6,7]', 3, 18000, NULL, NULL, NULL, 2, 2),
(330, 'AA0052002108621', 67, '[6]', 2, 15000, NULL, NULL, NULL, 2, 2),
(331, 'AA0052009172584', 62, NULL, NULL, 251700, '892050083', '494807137436', NULL, 1, 2),
(332, 'AA0052009101749', 66, '[6]', 5, 15000, NULL, NULL, NULL, 2, 2),
(333, 'AA0052004085832', 21, NULL, NULL, 26800, '853679326', '675074613864', NULL, 1, 2),
(334, 'AA0052007176302', 67, '[7]', 4, 13000, NULL, NULL, NULL, 2, 2),
(335, 'AA0052007176302', 67, '[6,7]', 4, 18000, NULL, NULL, NULL, 2, 2),
(336, 'AA0052001319259', 67, '[6]', 1, 15000, NULL, NULL, NULL, 2, 2),
(337, 'AA0052001319259', 67, '', 4, 18000, NULL, NULL, NULL, 2, 2),
(338, 'AA0052001299031', 67, '[6,7]', 0, 18000, NULL, NULL, NULL, 2, 2),
(339, 'AA0052001299031', 66, '[7]', 3, 13000, NULL, NULL, NULL, 2, 2),
(340, 'AA0052008167480', 1, NULL, NULL, 22000, '604600180', '777813759719', NULL, 1, 2),
(341, 'AA0052009232092', 32, NULL, NULL, 31375, '708334348', '845528333024', NULL, 1, 2),
(342, 'AA0052007021768', 22, NULL, NULL, 51800, '952407861', '075962004333', NULL, 1, 2),
(343, 'AA0052002066864', 20, NULL, NULL, 21800, '834735123', '342709816338', NULL, 1, 2),
(344, 'AA0052001242895', 66, '[7]', 0, 13000, NULL, NULL, NULL, 2, 2),
(345, 'AA0052010100431', 66, '[7]', 2, 13000, NULL, NULL, NULL, 2, 2),
(346, 'AA0052010100431', 67, '[6,7]', 1, 18000, NULL, NULL, NULL, 2, 2),
(347, 'AA0052006140650', 43, NULL, NULL, 86375, '342563495', '596558383576', NULL, 1, 2),
(348, 'AA0052003140811', 26, NULL, NULL, 201800, '516934380', '974358640519', NULL, 1, 2),
(349, 'AA0052007270548', 67, '', 2, 18000, NULL, NULL, NULL, 2, 2),
(350, 'AA0052007270548', 66, '', 3, 18000, NULL, NULL, NULL, 2, 2),
(351, 'AA0052004293389', 67, '[6,7]', 5, 18000, NULL, NULL, NULL, 2, 2),
(352, 'AA0052002052427', 67, '[6,7]', 0, 18000, NULL, NULL, NULL, 2, 2),
(353, 'AA0052002052427', 67, '[7]', 0, 13000, NULL, NULL, NULL, 2, 2),
(354, 'AA0052010113575', 66, '[6]', 0, 15000, NULL, NULL, NULL, 2, 2),
(355, 'AA0052007301785', 67, '[7]', 2, 13000, NULL, NULL, NULL, 2, 2),
(356, 'AA0052010128317', 41, NULL, NULL, 76375, '295458418', '030936816741', NULL, 1, 2),
(357, 'AA0052004120944', 67, '[7]', 5, 13000, NULL, NULL, NULL, 2, 2),
(358, 'AA0052005309065', 36, NULL, NULL, 51375, '964545066', '392771702402', NULL, 1, 2),
(359, 'AA0052007045742', 67, '[7]', 3, 13000, NULL, NULL, NULL, 2, 2),
(360, 'AA0052007045742', 66, '', 1, 18000, NULL, NULL, NULL, 2, 2),
(361, 'AA0052002192680', 67, '[6]', 1, 15000, NULL, NULL, NULL, 2, 2),
(362, 'AA0052007231277', 5, NULL, NULL, 52000, '951439609', '286655979803', NULL, 1, 2),
(363, 'AA0052004094034', 67, '[7]', 0, 13000, NULL, NULL, NULL, 2, 2),
(364, 'AA0052009131027', 66, '[7]', 0, 13000, NULL, NULL, NULL, 2, 2),
(365, 'AA0052009131027', 67, '[7]', 1, 13000, NULL, NULL, NULL, 2, 2),
(366, 'AA0052007192125', 34, NULL, NULL, 41375, '177993371', '081861263863', NULL, 1, 2),
(367, 'AA0052005049529', 66, '[6,7]', 4, 18000, NULL, NULL, NULL, 2, 2),
(368, 'AA0052005049529', 67, '[6]', 1, 15000, NULL, NULL, NULL, 2, 2),
(369, 'AA0052008309553', 42, NULL, NULL, 81375, '703234962', '244630516726', NULL, 1, 2),
(370, 'AA0052009108115', 67, '[6]', 1, 15000, NULL, NULL, NULL, 2, 2),
(371, 'AA0052007073796', 41, NULL, NULL, 76375, '652511347', '955846012575', NULL, 1, 2),
(372, 'AA0052004141448', 66, '[6,7]', 3, 18000, NULL, NULL, NULL, 2, 2),
(373, 'AA0052004141448', 66, '[6]', 5, 15000, NULL, NULL, NULL, 2, 2),
(374, 'AA0052005192688', 67, '[7]', 5, 13000, NULL, NULL, NULL, 2, 2),
(375, 'AA0012010173810', 17, NULL, NULL, 902000, '670216100', '015438490566', NULL, 1, 2),
(376, 'AA0012010124445', 50, NULL, NULL, 501375, '659704519', '089838478327', NULL, 1, 2),
(377, 'AA0012010097148', 34, NULL, NULL, 41375, '272915335', '717962598810', NULL, 1, 2),
(378, 'AA0012010180419', 1, NULL, NULL, 22000, '781219803', '030197700947', NULL, 1, 2),
(379, 'AA0012010059642', 32, NULL, NULL, 31375, '467776090', '600229354625', NULL, 1, 2),
(380, 'AA0012010071305', 66, '[7]', 0, 13000, NULL, NULL, NULL, 2, 2),
(381, 'AA0012010071305', 66, '[6,7]', 1, 18000, NULL, NULL, NULL, 2, 2),
(382, 'AA0012010071305', 67, '[7]', 1, 13000, NULL, NULL, NULL, 2, 2),
(383, 'AA0012010198796', 21, NULL, NULL, 26800, '920352350', '028695412814', NULL, 1, 2),
(384, 'AA0012010173472', 25, NULL, NULL, 151800, '622972601', '231412908156', NULL, 1, 2),
(385, 'AA0012010150216', 67, '[6]', 0, 15000, NULL, NULL, NULL, 2, 2),
(386, 'AA0012010150216', 67, '', 3, 18000, NULL, NULL, NULL, 2, 2),
(387, 'AA0012010150216', 66, '[6,7]', 1, 18000, NULL, NULL, NULL, 2, 2),
(388, 'AA0012010105483', 26, NULL, NULL, 201800, '836785253', '284924105967', NULL, 1, 2),
(389, 'AA0012010059098', 14, NULL, NULL, 602000, '809812179', '221031548281', NULL, 1, 2),
(390, 'AA0012010152351', 66, '', 5, 18000, NULL, NULL, NULL, 2, 2),
(391, 'AA0012010165609', 66, '[7]', 0, 13000, NULL, NULL, NULL, 2, 2),
(392, 'AA0012010165609', 67, '', 5, 18000, NULL, NULL, NULL, 2, 2),
(393, 'AA0012010165609', 67, '[7]', 4, 13000, NULL, NULL, NULL, 2, 2),
(394, 'AA0012010083625', 66, '[6]', 5, 15000, NULL, NULL, NULL, 2, 2),
(395, 'AA0012010061698', 39, NULL, NULL, 651375, '268553021', '872269640195', NULL, 1, 2),
(396, 'AA0012010074182', 3, NULL, NULL, 32000, '986695811', '044249043046', NULL, 1, 2),
(397, 'AA0012010117123', 67, '[7]', 5, 13000, NULL, NULL, NULL, 2, 2),
(398, 'AA0012010179163', 66, '[6,7]', 2, 18000, NULL, NULL, NULL, 2, 2),
(399, 'AA0012010179163', 67, '', 0, 18000, NULL, NULL, NULL, 2, 2),
(400, 'AA0012010176116', 56, NULL, NULL, 302150, '392476276', '475634168730', NULL, 1, 2),
(401, 'AA0012010155009', 67, '[7]', 0, 13000, NULL, NULL, NULL, 2, 2),
(402, 'AA0012010155009', 67, '[7]', 5, 13000, NULL, NULL, NULL, 2, 2),
(403, 'AA0012010157173', 39, NULL, NULL, 651375, '014335088', '308064770476', NULL, 1, 2),
(404, 'AA0012010114487', 2, NULL, NULL, 27000, '888635642', '161440304498', NULL, 1, 2),
(405, 'AA0012010104411', 34, NULL, NULL, 41375, '032993964', '068977379568', NULL, 1, 2),
(406, 'AA0012010036321', 50, NULL, NULL, 501375, '230466055', '873378859940', NULL, 1, 2),
(407, 'AA0012010163269', 67, '[7]', 1, 13000, NULL, NULL, NULL, 2, 2),
(408, 'AA0012010163269', 67, '', 2, 18000, NULL, NULL, NULL, 2, 2),
(409, 'AA0012010163269', 67, '[6]', 2, 15000, NULL, NULL, NULL, 2, 2),
(410, 'AA0012010027138', 67, '[6]', 5, 15000, NULL, NULL, NULL, 2, 2),
(411, 'AA0012010155178', 66, '', 0, 18000, NULL, NULL, NULL, 2, 2),
(412, 'AA0012010155178', 66, '[7]', 5, 13000, NULL, NULL, NULL, 2, 2),
(413, 'AA0012010205055', 14, NULL, NULL, 602000, '054457434', '722938147058', NULL, 1, 2),
(414, 'AA0012010172209', 67, '', 0, 18000, NULL, NULL, NULL, 2, 2),
(415, 'AA0012010025480', 19, NULL, NULL, 11800, '104709015', '189758572786', NULL, 1, 2),
(416, 'AA0012010083926', 66, '[6,7]', 1, 18000, NULL, NULL, NULL, 2, 2),
(417, 'AA0012010152378', 43, NULL, NULL, 86375, '984994985', '160027793717', NULL, 1, 2),
(418, 'AA0012010093718', 66, '', 4, 18000, NULL, NULL, NULL, 2, 2),
(419, 'AA0012010093718', 67, '[6]', 5, 15000, NULL, NULL, NULL, 2, 2),
(420, 'AA0012010045112', 67, '[6,7]', 4, 18000, NULL, NULL, NULL, 2, 2),
(421, 'AA0012010045112', 66, '[7]', 5, 13000, NULL, NULL, NULL, 2, 2),
(422, 'AA0012010046628', 67, '', 4, 18000, NULL, NULL, NULL, 2, 2),
(423, 'AA0012010137418', 67, '[6]', 4, 15000, NULL, NULL, NULL, 2, 2),
(424, 'AA0012010137418', 67, '[7]', 5, 13000, NULL, NULL, NULL, 2, 2),
(425, 'AA0012010105498', 67, '[6,7]', 5, 18000, NULL, NULL, NULL, 2, 2),
(426, 'AA0012010209489', 66, '[6]', 5, 15000, NULL, NULL, NULL, 2, 2),
(427, 'AA0012010191861', 67, '', 5, 18000, NULL, NULL, NULL, 2, 2),
(428, 'AA0012010191861', 66, '', 3, 18000, NULL, NULL, NULL, 2, 2),
(429, 'AA0012010191861', 66, '[7]', 1, 13000, NULL, NULL, NULL, 2, 2),
(430, 'AA0012010156358', 66, '[7]', 1, 13000, NULL, NULL, NULL, 2, 2),
(431, 'AA0012010156358', 66, '[6,7]', 3, 18000, NULL, NULL, NULL, 2, 2),
(432, 'AA0012010156358', 67, '[6]', 1, 15000, NULL, NULL, NULL, 2, 2),
(433, 'AA0012010042127', 66, '[6]', 0, 15000, NULL, NULL, NULL, 2, 2),
(434, 'AA0012010194996', 47, NULL, NULL, 201375, '874568647', '966942049451', NULL, 1, 2),
(435, 'AA0012010040573', 25, NULL, NULL, 151800, '167151066', '482479283963', NULL, 1, 2),
(436, 'AA0012010208871', 62, NULL, NULL, 251700, '546098480', '929445852562', NULL, 1, 2),
(437, 'AA0012010071627', 67, '[6,7]', 2, 18000, NULL, NULL, NULL, 2, 2),
(438, 'AA0012010071627', 66, '[6]', 0, 15000, NULL, NULL, NULL, 2, 2),
(439, 'AA0012010071627', 66, '', 2, 18000, NULL, NULL, NULL, 2, 2),
(440, 'AA0012010114804', 66, '[6,7]', 2, 18000, NULL, NULL, NULL, 2, 2),
(441, 'AA0012010114804', 66, '', 5, 18000, NULL, NULL, NULL, 2, 2),
(442, 'AA0012010114804', 66, '[6,7]', 1, 18000, NULL, NULL, NULL, 2, 2),
(443, 'AA0012010066687', 67, '[6]', 2, 15000, NULL, NULL, NULL, 2, 2),
(444, 'AA0012010066687', 66, '[7]', 0, 13000, NULL, NULL, NULL, 2, 2),
(445, 'AA0012010066687', 66, '[6,7]', 3, 18000, NULL, NULL, NULL, 2, 2),
(446, 'AA0012010180693', 66, '', 2, 18000, NULL, NULL, NULL, 2, 2),
(447, 'AA0012010180693', 66, '[7]', 5, 13000, NULL, NULL, NULL, 2, 2),
(448, 'AA0012010136766', 67, '[7]', 1, 13000, NULL, NULL, NULL, 2, 2),
(449, 'AA0012010136766', 67, '[6,7]', 2, 18000, NULL, NULL, NULL, 2, 2),
(450, 'AA0012010033193', 45, NULL, NULL, 96375, '606929801', '286510786047', NULL, 1, 2),
(451, 'AA0022010181745', 66, '[6,7]', 2, 18000, NULL, NULL, NULL, 2, 2),
(452, 'AA0022010181745', 67, '[7]', 3, 13000, NULL, NULL, NULL, 2, 2),
(453, 'AA0022010109603', 66, '', 0, 18000, NULL, NULL, NULL, 2, 2),
(454, 'AA0022010109603', 66, '[7]', 2, 13000, NULL, NULL, NULL, 2, 2),
(455, 'AA0022010109603', 66, '[6,7]', 5, 18000, NULL, NULL, NULL, 2, 2),
(456, 'AA0022010081517', 66, '[6]', 0, 15000, NULL, NULL, NULL, 2, 2),
(457, 'AA0022010036345', 6, NULL, NULL, 77000, '997629266', '183118424738', NULL, 1, 2),
(458, 'AA0022010010101', 67, '[7]', 1, 13000, NULL, NULL, NULL, 2, 2),
(459, 'AA0022010145693', 17, NULL, NULL, 902000, '731944420', '252784472492', NULL, 1, 2),
(460, 'AA0022010073966', 67, '[7]', 5, 13000, NULL, NULL, NULL, 2, 2),
(461, 'AA0022010073966', 66, '', 4, 18000, NULL, NULL, NULL, 2, 2),
(462, 'AA0022010166032', 67, '', 3, 18000, NULL, NULL, NULL, 2, 2),
(463, 'AA0022010166032', 66, '[6,7]', 1, 18000, NULL, NULL, NULL, 2, 2),
(464, 'AA0022010166032', 66, '[6,7]', 4, 18000, NULL, NULL, NULL, 2, 2),
(465, 'AA0022010146262', 67, '[6,7]', 0, 18000, NULL, NULL, NULL, 2, 2),
(466, 'AA0022010146262', 66, '[6]', 5, 15000, NULL, NULL, NULL, 2, 2),
(467, 'AA0022010146262', 66, '[7]', 5, 13000, NULL, NULL, NULL, 2, 2),
(468, 'AA0022010024697', 14, NULL, NULL, 602000, '520851407', '576128650139', NULL, 1, 2),
(469, 'AA0022010095737', 23, NULL, NULL, 76800, '438465931', '042701682991', NULL, 1, 2),
(470, 'AA0022010200269', 15, NULL, NULL, 702000, '510477905', '466652354594', NULL, 1, 2),
(471, 'AA0022010135480', 66, '', 4, 18000, NULL, NULL, NULL, 2, 2),
(472, 'AA0022010164210', 64, NULL, NULL, 751700, '956724218', '821524182719', NULL, 1, 2),
(473, 'AA0022010177169', 14, NULL, NULL, 602000, '240763252', '190718687267', NULL, 1, 2),
(474, 'AA0022010026404', 66, '[6,7]', 2, 18000, NULL, NULL, NULL, 2, 2),
(475, 'AA0022010209197', 14, NULL, NULL, 602000, '589924302', '040193107853', NULL, 1, 2),
(476, 'AA0022010030427', 51, NULL, NULL, 27350, '935882762', '369882701842', NULL, 1, 2),
(477, 'AA0022010089604', 67, '[6,7]', 4, 18000, NULL, NULL, NULL, 2, 2),
(478, 'AA0022010118874', 66, '[6]', 4, 15000, NULL, NULL, NULL, 2, 2),
(479, 'AA0022010118874', 67, '[6,7]', 1, 18000, NULL, NULL, NULL, 2, 2),
(480, 'AA0022010020845', 32, NULL, NULL, 31375, '189116775', '882699875281', NULL, 1, 2),
(481, 'AA0022010135351', 66, '[7]', 5, 13000, NULL, NULL, NULL, 2, 2),
(482, 'AA0022010186427', 14, NULL, NULL, 602000, '421176228', '933555631987', NULL, 1, 2),
(483, 'AA0022010114793', 23, NULL, NULL, 76800, '070093103', '082963174932', NULL, 1, 2),
(484, 'AA0022010148643', 67, '[6]', 1, 15000, NULL, NULL, NULL, 2, 2),
(485, 'AA0022010205797', 19, NULL, NULL, 11800, '689526146', '168114799457', NULL, 1, 2),
(486, 'AA0022010173887', 48, NULL, NULL, 301375, '814186020', '052943866741', NULL, 1, 2),
(487, 'AA0022010078723', 66, '[6]', 4, 15000, NULL, NULL, NULL, 2, 2),
(488, 'AA0022010078723', 66, '[7]', 5, 13000, NULL, NULL, NULL, 2, 2),
(489, 'AA0022010078723', 66, '[7]', 0, 13000, NULL, NULL, NULL, 2, 2),
(490, 'AA0022010071782', 67, '[6]', 1, 15000, NULL, NULL, NULL, 2, 2),
(491, 'AA0022010033876', 62, NULL, NULL, 251700, '152716191', '444092748031', NULL, 1, 2),
(492, 'AA0022010181300', 66, '', 1, 18000, NULL, NULL, NULL, 2, 2),
(493, 'AA0022010133428', 25, NULL, NULL, 151800, '807748461', '258015468121', NULL, 1, 2),
(494, 'AA0022010093885', 66, '[6,7]', 2, 18000, NULL, NULL, NULL, 2, 2),
(495, 'AA0022010173539', 24, NULL, NULL, 101800, '398979468', '832694652639', NULL, 1, 2),
(496, 'AA0022010149852', 57, NULL, NULL, 502800, '778734806', '451353955279', NULL, 1, 2),
(497, 'AA0022010175773', 40, NULL, NULL, 71375, '251370498', '073725104807', NULL, 1, 2),
(498, 'AA0022010088614', 40, NULL, NULL, 71375, '140570720', '380508891403', NULL, 1, 2),
(499, 'AA0022010160288', 66, '[6]', 2, 15000, NULL, NULL, NULL, 2, 2),
(500, 'AA0022010160288', 67, '[7]', 3, 13000, NULL, NULL, NULL, 2, 2),
(501, 'AA0022010045619', 31, NULL, NULL, 26375, '346691381', '849532795396', NULL, 1, 2),
(502, 'AA0022010046109', 66, '', 2, 18000, NULL, NULL, NULL, 2, 2),
(503, 'AA0022010046109', 67, '', 5, 18000, NULL, NULL, NULL, 2, 2),
(504, 'AA0022010046109', 66, '[6,7]', 1, 18000, NULL, NULL, NULL, 2, 2),
(505, 'AA0022010145372', 3, NULL, NULL, 32000, '898709888', '753366356300', NULL, 1, 2),
(506, 'AA0022010130990', 23, NULL, NULL, 76800, '878610715', '434613016053', NULL, 1, 2),
(507, 'AA0022010152446', 67, '[6,7]', 4, 18000, NULL, NULL, NULL, 2, 2),
(508, 'AA0022010152446', 67, '', 1, 18000, NULL, NULL, NULL, 2, 2),
(509, 'AA0022010106101', 66, '', 4, 18000, NULL, NULL, NULL, 2, 2),
(510, 'AA0022010106101', 67, '[6]', 4, 15000, NULL, NULL, NULL, 2, 2),
(511, 'AA0022010205900', 9, NULL, NULL, 202000, '811781283', '302566750456', NULL, 1, 2),
(512, 'AA0022010169340', 66, '[6]', 0, 15000, NULL, NULL, NULL, 2, 2),
(513, 'AA0022010169340', 67, '[6]', 0, 15000, NULL, NULL, NULL, 2, 2),
(514, 'AA0022010169340', 67, '[6]', 1, 15000, NULL, NULL, NULL, 2, 2),
(515, 'AA0022010111617', 42, NULL, NULL, 81375, '353775430', '530551721013', NULL, 1, 2),
(516, 'AA0022010012535', 67, '[7]', 5, 13000, NULL, NULL, NULL, 2, 2),
(517, 'AA0022010012535', 67, '[6]', 4, 15000, NULL, NULL, NULL, 2, 2),
(518, 'AA0022010012535', 67, '[7]', 1, 13000, NULL, NULL, NULL, 2, 2),
(519, 'AA0022010140003', 67, '[7]', 3, 13000, NULL, NULL, NULL, 2, 2),
(520, 'AA0022010140003', 66, '', 0, 18000, NULL, NULL, NULL, 2, 2),
(521, 'AA0022010116987', 66, '[6]', 3, 15000, NULL, NULL, NULL, 2, 2),
(522, 'AA0022010116987', 66, '[6]', 3, 15000, NULL, NULL, NULL, 2, 2),
(523, 'AA0032010112392', 56, NULL, NULL, 302150, '077231001', '529436086240', NULL, 1, 2),
(524, 'AA0032010041594', 67, '[6]', 4, 15000, NULL, NULL, NULL, 2, 2),
(525, 'AA0032010041594', 67, '[7]', 3, 13000, NULL, NULL, NULL, 2, 2),
(526, 'AA0032010062424', 1, NULL, NULL, 22000, '730494047', '366872125637', NULL, 1, 2),
(527, 'AA0032010146925', 59, NULL, NULL, 51700, '148887768', '707683925818', NULL, 1, 2),
(528, 'AA0032010189379', 63, NULL, NULL, 501700, '478831885', '230586198634', NULL, 1, 2),
(529, 'AA0032010048102', 65, NULL, NULL, 1001700, '747156505', '397647117186', NULL, 1, 2),
(530, 'AA0032010197467', 45, NULL, NULL, 96375, '863772193', '026028588374', NULL, 1, 2),
(531, 'AA0032010208915', 51, NULL, NULL, 27350, '529367864', '569476321729', NULL, 1, 2),
(532, 'AA0032010097076', 67, '[6]', 3, 15000, NULL, NULL, NULL, 2, 2),
(533, 'AA0032010097076', 67, '[6]', 4, 15000, NULL, NULL, NULL, 2, 2),
(534, 'AA0032010097076', 66, '[6,7]', 0, 18000, NULL, NULL, NULL, 2, 2),
(535, 'AA0032010019780', 67, '', 4, 18000, NULL, NULL, NULL, 2, 2),
(536, 'AA0032010193253', 67, '[6,7]', 0, 18000, NULL, NULL, NULL, 2, 2),
(537, 'AA0032010193253', 67, '[6,7]', 3, 18000, NULL, NULL, NULL, 2, 2),
(538, 'AA0032010205810', 51, NULL, NULL, 27350, '122959883', '245659492516', NULL, 1, 2),
(539, 'AA0032010164828', 67, '[7]', 5, 13000, NULL, NULL, NULL, 2, 2),
(540, 'AA0032010164828', 66, '[7]', 5, 13000, NULL, NULL, NULL, 2, 2),
(541, 'AA0032010178287', 61, NULL, NULL, 101700, '923502296', '668216793418', NULL, 1, 2),
(542, 'AA0032010118656', 66, '[7]', 3, 13000, NULL, NULL, NULL, 2, 2),
(543, 'AA0032010118656', 66, '[6,7]', 5, 18000, NULL, NULL, NULL, 2, 2),
(544, 'AA0032010168107', 35, NULL, NULL, 46375, '206680425', '395383336506', NULL, 1, 2),
(545, 'AA0032010158615', 61, NULL, NULL, 101700, '581263103', '445562881474', NULL, 1, 2),
(546, 'AA0032010175680', 67, '', 0, 18000, NULL, NULL, NULL, 2, 2),
(547, 'AA0032010175680', 67, '[6,7]', 3, 18000, NULL, NULL, NULL, 2, 2),
(548, 'AA0032010175680', 66, '[7]', 1, 13000, NULL, NULL, NULL, 2, 2),
(549, 'AA0032010171499', 56, NULL, NULL, 302150, '862154510', '420268317411', NULL, 1, 2),
(550, 'AA0032010089069', 35, NULL, NULL, 46375, '513020269', '570465522099', NULL, 1, 2),
(551, 'AA0032010142241', 49, NULL, NULL, 401375, '263574371', '218663975836', NULL, 1, 2),
(552, 'AA0032010177293', 64, NULL, NULL, 751700, '452650362', '574861947493', NULL, 1, 2),
(553, 'AA0032010101516', 43, NULL, NULL, 86375, '460660072', '368829494024', NULL, 1, 2),
(554, 'AA0032010149938', 16, NULL, NULL, 802000, '086639457', '860888644760', NULL, 1, 2),
(555, 'AA0032010162203', 47, NULL, NULL, 201375, '008637070', '810153016178', NULL, 1, 2),
(556, 'AA0032010209031', 5, NULL, NULL, 52000, '281069819', '622910707729', NULL, 1, 2),
(557, 'AA0032010127033', 57, NULL, NULL, 502800, '854183423', '809918929016', NULL, 1, 2),
(558, 'AA0032010184122', 67, '', 1, 18000, NULL, NULL, NULL, 2, 2),
(559, 'AA0032010160492', 44, NULL, NULL, 91375, '839108234', '722929294527', NULL, 1, 2),
(560, 'AA0032010123565', 66, '[6,7]', 5, 18000, NULL, NULL, NULL, 2, 2),
(561, 'AA0032010123565', 66, '', 4, 18000, NULL, NULL, NULL, 2, 2),
(562, 'AA0032010205635', 5, NULL, NULL, 52000, '687857282', '204151397537', NULL, 1, 2),
(563, 'AA0032010092786', 66, '[6,7]', 1, 18000, NULL, NULL, NULL, 2, 2),
(564, 'AA0032010092786', 67, '', 2, 18000, NULL, NULL, NULL, 2, 2),
(565, 'AA0032010017508', 66, '[6]', 2, 15000, NULL, NULL, NULL, 2, 2),
(566, 'AA0032010017508', 67, '[6,7]', 1, 18000, NULL, NULL, NULL, 2, 2),
(567, 'AA0032010173695', 67, '[6,7]', 0, 18000, NULL, NULL, NULL, 2, 2),
(568, 'AA0032010173695', 67, '', 2, 18000, NULL, NULL, NULL, 2, 2),
(569, 'AA0032010173695', 66, '[7]', 0, 13000, NULL, NULL, NULL, 2, 2),
(570, 'AA0032010107817', 66, '[7]', 2, 13000, NULL, NULL, NULL, 2, 2),
(571, 'AA0032010107817', 67, '', 1, 18000, NULL, NULL, NULL, 2, 2),
(572, 'AA0032010164274', 65, NULL, NULL, 1001700, '971157063', '518733790530', NULL, 1, 2),
(573, 'AA0032010198811', 15, NULL, NULL, 702000, '709740409', '501309427613', NULL, 1, 2),
(574, 'AA0032010046609', 67, '[7]', 3, 13000, NULL, NULL, NULL, 2, 2),
(575, 'AA0032010078239', 44, NULL, NULL, 91375, '727113521', '608951889979', NULL, 1, 2),
(576, 'AA0032010115227', 7, NULL, NULL, 102000, '107432340', '625938924672', NULL, 1, 2),
(577, 'AA0032010161115', 67, '', 0, 18000, NULL, NULL, NULL, 2, 2),
(578, 'AA0032010161115', 66, '[7]', 1, 13000, NULL, NULL, NULL, 2, 2),
(579, 'AA0032010067092', 13, NULL, NULL, 502000, '647319055', '452880908614', NULL, 1, 2),
(580, 'AA0032010139035', 7, NULL, NULL, 102000, '550411244', '730109218634', NULL, 1, 2),
(581, 'AA0032010187551', 66, '[7]', 0, 13000, NULL, NULL, NULL, 2, 2),
(582, 'AA0032010187551', 66, '[7]', 4, 13000, NULL, NULL, NULL, 2, 2),
(583, 'AA0032010187551', 67, '[6]', 2, 15000, NULL, NULL, NULL, 2, 2),
(584, 'AA0032010022497', 66, '', 0, 18000, NULL, NULL, NULL, 2, 2),
(585, 'AA0032010116829', 67, '', 4, 18000, NULL, NULL, NULL, 2, 2),
(586, 'AA0032010078251', 66, '[6,7]', 3, 18000, NULL, NULL, NULL, 2, 2),
(587, 'AA0032010078251', 67, '[6,7]', 4, 18000, NULL, NULL, NULL, 2, 2),
(588, 'AA0032010078251', 66, '[7]', 1, 13000, NULL, NULL, NULL, 2, 2),
(589, 'AA0032010049623', 21, NULL, NULL, 26800, '551440711', '558863589716', NULL, 1, 2),
(590, 'AA0032010068003', 58, NULL, NULL, 21700, '468801152', '712225393474', NULL, 1, 2),
(591, 'AA0032010178756', 54, NULL, NULL, 152150, '468171786', '534020625126', NULL, 1, 2),
(592, 'AA0042010141078', 67, '[6]', 0, 15000, NULL, NULL, NULL, 2, 2),
(593, 'AA0042010141078', 66, '[7]', 0, 13000, NULL, NULL, NULL, 2, 2),
(594, 'AA0042010185047', 32, NULL, NULL, 31375, '748985974', '115643288120', NULL, 1, 2),
(595, 'AA0042010180382', 66, '', 2, 18000, NULL, NULL, NULL, 2, 2),
(596, 'AA0042010180382', 66, '', 3, 18000, NULL, NULL, NULL, 2, 2),
(597, 'AA0042010180382', 66, '', 3, 18000, NULL, NULL, NULL, 2, 2),
(598, 'AA0042010123362', 66, '[6,7]', 2, 18000, NULL, NULL, NULL, 2, 2),
(599, 'AA0042010032311', 67, '', 1, 18000, NULL, NULL, NULL, 2, 2),
(600, 'AA0042010032311', 67, '[6,7]', 1, 18000, NULL, NULL, NULL, 2, 2),
(601, 'AA0042010072450', 34, NULL, NULL, 41375, '360321819', '767284719441', NULL, 1, 2),
(602, 'AA0042010198543', 24, NULL, NULL, 101800, '270984322', '469489687397', NULL, 1, 2),
(603, 'AA0042010024118', 32, NULL, NULL, 31375, '533814065', '767887610466', NULL, 1, 2),
(604, 'AA0042010189419', 66, '[6]', 5, 15000, NULL, NULL, NULL, 2, 2),
(605, 'AA0042010189419', 66, '[6]', 5, 15000, NULL, NULL, NULL, 2, 2),
(606, 'AA0042010189419', 67, '[7]', 2, 13000, NULL, NULL, NULL, 2, 2),
(607, 'AA0042010092766', 67, '', 2, 18000, NULL, NULL, NULL, 2, 2),
(608, 'AA0042010092766', 67, '[6,7]', 3, 18000, NULL, NULL, NULL, 2, 2),
(609, 'AA0042010185004', 66, '[7]', 1, 13000, NULL, NULL, NULL, 2, 2),
(610, 'AA0042010185004', 67, '[7]', 5, 13000, NULL, NULL, NULL, 2, 2),
(611, 'AA0042010036907', 66, '', 5, 18000, NULL, NULL, NULL, 2, 2),
(612, 'AA0042010036907', 67, '[6]', 1, 15000, NULL, NULL, NULL, 2, 2),
(613, 'AA0042010109073', 66, '[7]', 2, 13000, NULL, NULL, NULL, 2, 2),
(614, 'AA0042010154648', 66, '[7]', 4, 13000, NULL, NULL, NULL, 2, 2),
(615, 'AA0042010154648', 67, '', 4, 18000, NULL, NULL, NULL, 2, 2),
(616, 'AA0042010136935', 66, '[6,7]', 2, 18000, NULL, NULL, NULL, 2, 2),
(617, 'AA0042010136935', 67, '[6]', 2, 15000, NULL, NULL, NULL, 2, 2),
(618, 'AA0042010060764', 16, NULL, NULL, 802000, '878973874', '541472686056', NULL, 1, 2),
(619, 'AA0042010028821', 50, NULL, NULL, 501375, '105251192', '519686829737', NULL, 1, 2),
(620, 'AA0042010136014', 52, NULL, NULL, 52150, '729722072', '982001889620', NULL, 1, 2),
(621, 'AA0042010101208', 41, NULL, NULL, 76375, '768178933', '515957151402', NULL, 1, 2),
(622, 'AA0042010033333', 66, '[7]', 1, 13000, NULL, NULL, NULL, 2, 2),
(623, 'AA0042010089613', 26, NULL, NULL, 201800, '841757814', '649861801866', NULL, 1, 2),
(624, 'AA0042010053486', 33, NULL, NULL, 36375, '119525798', '590375250162', NULL, 1, 2),
(625, 'AA0042010199101', 66, '', 4, 18000, NULL, NULL, NULL, 2, 2),
(626, 'AA0042010199101', 67, '[6,7]', 2, 18000, NULL, NULL, NULL, 2, 2),
(627, 'AA0042010207953', 66, '[6]', 0, 15000, NULL, NULL, NULL, 2, 2),
(628, 'AA0042010207953', 66, '[6,7]', 1, 18000, NULL, NULL, NULL, 2, 2),
(629, 'AA0042010204428', 66, '', 4, 18000, NULL, NULL, NULL, 2, 2),
(630, 'AA0042010204428', 67, '[6,7]', 0, 18000, NULL, NULL, NULL, 2, 2),
(631, 'AA0042010097700', 16, NULL, NULL, 802000, '417201285', '125618967756', NULL, 1, 2),
(632, 'AA0042010161443', 28, NULL, NULL, 401800, '119324923', '365392713765', NULL, 1, 2),
(633, 'AA0042010123637', 32, NULL, NULL, 31375, '811562522', '495563706564', NULL, 1, 2),
(634, 'AA0042010014824', 52, NULL, NULL, 52150, '060666277', '397529187085', NULL, 1, 2),
(635, 'AA0042010084039', 66, '[7]', 0, 13000, NULL, NULL, NULL, 2, 2),
(636, 'AA0042010084039', 66, '[6,7]', 5, 18000, NULL, NULL, NULL, 2, 2),
(637, 'AA0042010064816', 67, '', 1, 18000, NULL, NULL, NULL, 2, 2),
(638, 'AA0042010064816', 66, '', 2, 18000, NULL, NULL, NULL, 2, 2),
(639, 'AA0042010195974', 66, '[6]', 5, 15000, NULL, NULL, NULL, 2, 2),
(640, 'AA0042010195974', 66, '[6]', 3, 15000, NULL, NULL, NULL, 2, 2),
(641, 'AA0042010025862', 51, NULL, NULL, 27350, '199513587', '969992980595', NULL, 1, 2),
(642, 'AA0042010054531', 20, NULL, NULL, 21800, '433127513', '858918751124', NULL, 1, 2),
(643, 'AA0042010092144', 66, '[7]', 5, 13000, NULL, NULL, NULL, 2, 2),
(644, 'AA0042010189592', 8, NULL, NULL, 152000, '432786552', '572283339695', NULL, 1, 2),
(645, 'AA0042010012353', 67, '', 0, 18000, NULL, NULL, NULL, 2, 2),
(646, 'AA0042010012353', 66, '[7]', 2, 13000, NULL, NULL, NULL, 2, 2),
(647, 'AA0042010194967', 66, '[7]', 0, 13000, NULL, NULL, NULL, 2, 2),
(648, 'AA0042010026388', 37, NULL, NULL, 56375, '954042297', '716361103058', NULL, 1, 2),
(649, 'AA0042010117563', 7, NULL, NULL, 102000, '697242839', '328730247804', NULL, 1, 2),
(650, 'AA0042010192138', 67, '[6]', 0, 15000, NULL, NULL, NULL, 2, 2),
(651, 'AA0042010192138', 66, '[6]', 5, 15000, NULL, NULL, NULL, 2, 2),
(652, 'AA0042010089154', 8, NULL, NULL, 152000, '741365185', '913679381996', NULL, 1, 2),
(653, 'AA0042010097758', 67, '[6,7]', 2, 18000, NULL, NULL, NULL, 2, 2),
(654, 'AA0042010097758', 67, '[7]', 1, 13000, NULL, NULL, NULL, 2, 2),
(655, 'AA0042010116976', 40, NULL, NULL, 71375, '640931310', '651750558172', NULL, 1, 2),
(656, 'AA0042010178238', 3, NULL, NULL, 32000, '645513917', '348694416163', NULL, 1, 2),
(657, 'AA0042010105978', 13, NULL, NULL, 502000, '205061280', '630727273524', NULL, 1, 2),
(658, 'AA0042010120471', 67, '[7]', 2, 13000, NULL, NULL, NULL, 2, 2),
(659, 'AA0042010120471', 67, '[6,7]', 0, 18000, NULL, NULL, NULL, 2, 2),
(660, 'AA0042010120471', 67, '', 2, 18000, NULL, NULL, NULL, 2, 2),
(661, 'AA0042010112925', 22, NULL, NULL, 51800, '908132988', '675081559410', NULL, 1, 2),
(662, 'AA0042010038806', 20, NULL, NULL, 21800, '584479652', '379564146625', NULL, 1, 2);
INSERT INTO `transaction_detail` (`id`, `no_trx_master`, `id_prd_detail`, `topping`, `spice`, `price`, `no_trx_ppob`, `customer_id`, `position`, `type`, `status`) VALUES
(663, 'AA0042010187564', 2, NULL, NULL, 27000, '171781145', '022104944142', NULL, 1, 2),
(664, 'AA0052010124004', 52, NULL, NULL, 52150, '651464137', '074271331335', NULL, 1, 2),
(665, 'AA0052010105560', 67, '[6,7]', 4, 18000, NULL, NULL, NULL, 2, 2),
(666, 'AA0052010105560', 67, '[7]', 4, 13000, NULL, NULL, NULL, 2, 2),
(667, 'AA0052010105560', 67, '', 4, 18000, NULL, NULL, NULL, 2, 2),
(668, 'AA0052010180698', 65, NULL, NULL, 1001700, '909329974', '875472623756', NULL, 1, 2),
(669, 'AA0052010052352', 46, NULL, NULL, 101375, '347591267', '147797566499', NULL, 1, 2),
(670, 'AA0052010052209', 67, '[7]', 4, 13000, NULL, NULL, NULL, 2, 2),
(671, 'AA0052010052209', 66, '[7]', 4, 13000, NULL, NULL, NULL, 2, 2),
(672, 'AA0052010040199', 66, '', 5, 18000, NULL, NULL, NULL, 2, 2),
(673, 'AA0052010040199', 67, '[7]', 4, 13000, NULL, NULL, NULL, 2, 2),
(674, 'AA0052010040199', 67, '[7]', 0, 13000, NULL, NULL, NULL, 2, 2),
(675, 'AA0052010070704', 40, NULL, NULL, 71375, '053680479', '872999774492', NULL, 1, 2),
(676, 'AA0052010072744', 9, NULL, NULL, 202000, '558329491', '793117934609', NULL, 1, 2),
(677, 'AA0052010131064', 54, NULL, NULL, 152150, '466338054', '142081759407', NULL, 1, 2),
(678, 'AA0052010145338', 31, NULL, NULL, 26375, '472428194', '998218944488', NULL, 1, 2),
(679, 'AA0052010196744', 5, NULL, NULL, 52000, '589331631', '708202770179', NULL, 1, 2),
(680, 'AA0052010084614', 67, '[6,7]', 0, 18000, NULL, NULL, NULL, 2, 2),
(681, 'AA0052010084614', 67, '[6]', 0, 15000, NULL, NULL, NULL, 2, 2),
(682, 'AA0052010084614', 67, '', 5, 18000, NULL, NULL, NULL, 2, 2),
(683, 'AA0052010167382', 50, NULL, NULL, 501375, '882338039', '279770241225', NULL, 1, 2),
(684, 'AA0052010176575', 66, '[6]', 1, 15000, NULL, NULL, NULL, 2, 2),
(685, 'AA0052010176575', 67, '[6,7]', 0, 18000, NULL, NULL, NULL, 2, 2),
(686, 'AA0052010060952', 57, NULL, NULL, 502800, '641813042', '438950671098', NULL, 1, 2),
(687, 'AA0052010167046', 67, '[6]', 4, 15000, NULL, NULL, NULL, 2, 2),
(688, 'AA0052010174808', 4, NULL, NULL, 42000, '056413736', '432864256019', NULL, 1, 2),
(689, 'AA0052010102612', 40, NULL, NULL, 71375, '949714381', '783860301928', NULL, 1, 2),
(690, 'AA0052010025213', 67, '[6,7]', 2, 18000, NULL, NULL, NULL, 2, 2),
(691, 'AA0052010025213', 66, '[7]', 1, 13000, NULL, NULL, NULL, 2, 2),
(692, 'AA0052010025213', 66, '[6,7]', 3, 18000, NULL, NULL, NULL, 2, 2),
(693, 'AA0052010182487', 15, NULL, NULL, 702000, '045783033', '622125109626', NULL, 1, 2),
(694, 'AA0052010151639', 66, '[7]', 1, 13000, NULL, NULL, NULL, 2, 2),
(695, 'AA0052010151639', 66, '', 1, 18000, NULL, NULL, NULL, 2, 2),
(696, 'AA0052010157146', 44, NULL, NULL, 91375, '744079415', '022890894797', NULL, 1, 2),
(697, 'AA0052010018974', 66, '', 2, 18000, NULL, NULL, NULL, 2, 2),
(698, 'AA0052010018974', 66, '[6,7]', 3, 18000, NULL, NULL, NULL, 2, 2),
(699, 'AA0052010118926', 66, '', 4, 18000, NULL, NULL, NULL, 2, 2),
(700, 'AA0052010069282', 66, '[7]', 5, 13000, NULL, NULL, NULL, 2, 2),
(701, 'AA0052010069282', 67, '[6,7]', 0, 18000, NULL, NULL, NULL, 2, 2),
(702, 'AA0052010170088', 67, '[6]', 3, 15000, NULL, NULL, NULL, 2, 2),
(703, 'AA0052010170088', 66, '[7]', 1, 13000, NULL, NULL, NULL, 2, 2),
(704, 'AA0052010170088', 66, '', 4, 18000, NULL, NULL, NULL, 2, 2),
(705, 'AA0052010076611', 12, NULL, NULL, 402000, '485887056', '756843199078', NULL, 1, 2),
(706, 'AA0052010109186', 66, '', 4, 18000, NULL, NULL, NULL, 2, 2),
(707, 'AA0052010109186', 67, '[6]', 0, 15000, NULL, NULL, NULL, 2, 2),
(708, 'AA0052010109186', 66, '[6]', 4, 15000, NULL, NULL, NULL, 2, 2),
(709, 'AA0052010209726', 37, NULL, NULL, 56375, '005136638', '319004373439', NULL, 1, 2),
(710, 'AA0052010102353', 41, NULL, NULL, 76375, '876406359', '783109196834', NULL, 1, 1),
(711, 'AA0052010087354', 19, NULL, NULL, 11800, '625595577', '985170736156', NULL, 1, 1),
(712, 'AA0052010043432', 67, '[7]', 3, 13000, NULL, NULL, NULL, 2, 2),
(713, 'AA0052010033571', 66, '[6,7]', 5, 18000, NULL, NULL, NULL, 2, 1),
(714, 'AA0052010033571', 67, '[6,7]', 1, 18000, NULL, NULL, NULL, 2, 1),
(715, 'AA0052010033571', 66, '[6]', 5, 15000, NULL, NULL, NULL, 2, 1),
(716, 'AA0052010129020', 66, '[7]', 3, 13000, NULL, NULL, NULL, 2, 1),
(717, 'AA0052010129020', 66, '', 0, 18000, NULL, NULL, NULL, 2, 1),
(718, 'AA0052010129020', 67, '[7]', 0, 13000, NULL, NULL, NULL, 2, 1),
(719, 'AA0052010151814', 66, '[6]', 5, 15000, NULL, NULL, NULL, 2, 1),
(720, 'AA0052010151814', 67, '', 2, 18000, NULL, NULL, NULL, 2, 1),
(721, 'AA0052010096333', 62, NULL, NULL, 251700, '839586649', '718911257208', NULL, 1, 1),
(722, 'AA0052010182924', 17, NULL, NULL, 902000, '023904505', '931105395739', NULL, 1, 1),
(723, 'AA0052010027923', 6, NULL, NULL, 77000, '813021600', '506967046350', NULL, 1, 1),
(724, 'AA0052010168514', 6, NULL, NULL, 77000, '050778299', '384530186276', NULL, 1, 1),
(725, 'AA0052010154713', 54, NULL, NULL, 152150, '627980290', '191418594344', NULL, 1, 1),
(726, 'AA0052010157052', 67, '[6]', 4, 15000, NULL, NULL, NULL, 2, 1),
(727, 'AA0052010157052', 66, '[6]', 5, 15000, NULL, NULL, NULL, 2, 1),
(728, 'AA0052010157052', 67, '', 3, 18000, NULL, NULL, NULL, 2, 1),
(729, 'AA0052010178931', 36, NULL, NULL, 51375, '157443426', '846199612330', NULL, 1, 1),
(730, 'AA0052010117450', 54, NULL, NULL, 152150, '390699273', '706487841338', NULL, 1, 1),
(731, 'AA0052010136050', 53, NULL, NULL, 102150, '914852705', '596710258584', NULL, 1, 1),
(732, 'AA0052010129444', 39, NULL, NULL, 651375, '002276576', '308407686583', NULL, 1, 1),
(733, 'AA0052010060214', 67, '[6,7]', 1, 18000, NULL, NULL, NULL, 2, 1),
(734, 'AA0052010060214', 67, '[6,7]', 3, 18000, NULL, NULL, NULL, 2, 1),
(735, 'AA0052010102179', 3, NULL, NULL, 32000, '446770638', '047666844700', NULL, 1, 1),
(736, 'AA0052010117788', 67, '[6]', 3, 15000, NULL, NULL, NULL, 2, 1),
(737, 'AA0052010117788', 67, '[6,7]', 0, 18000, NULL, NULL, NULL, 2, 1),
(738, 'AA0052010184010', 67, '[6]', 1, 15000, NULL, NULL, NULL, 2, 1),
(739, 'AA0052010184010', 67, '[7]', 0, 13000, NULL, NULL, NULL, 2, 1),
(740, 'AA0052010197192', 67, '', 3, 18000, NULL, NULL, NULL, 2, 1),
(741, 'AA0052010197192', 66, '[6]', 0, 15000, NULL, NULL, NULL, 2, 1),
(742, 'AA0052010197192', 67, '', 1, 18000, NULL, NULL, NULL, 2, 1),
(745, 'AA0012010219033', 1, NULL, NULL, 22000, '504', '12', NULL, 1, 1),
(746, 'AA0012010219034', 1, NULL, NULL, 22000, '504', '2', NULL, 1, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaction_master`
--

CREATE TABLE `transaction_master` (
  `id` int(11) NOT NULL,
  `no_trx` varchar(50) NOT NULL,
  `created_at` datetime NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `total_price` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `status` varchar(50) NOT NULL DEFAULT '1',
  `flag` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `transaction_master`
--

INSERT INTO `transaction_master` (`id`, `no_trx`, `created_at`, `name`, `total_price`, `type`, `status`, `flag`) VALUES
(1, 'AA0012010200001', '2020-10-20 04:06:25', 'test', 13000, 2, '2', 1),
(2, 'AA0012005188202', '2020-03-13 10:39:20', 'test', 33000, 2, '2', 1),
(3, 'AA0012002212840', '2020-03-07 08:47:22', 'test', 402000, 1, '2', 1),
(4, 'AA0012009102157', '2020-01-10 08:12:19', 'test', 49000, 2, '2', 1),
(5, 'AA0012003021597', '2020-03-24 02:11:06', 'test', 802000, 1, '2', 1),
(6, 'AA0012001260377', '2020-08-18 02:02:03', 'test', 33000, 2, '2', 1),
(7, 'AA0012004246959', '2020-06-20 10:24:21', 'test', 41375, 1, '2', 1),
(8, 'AA0012009244191', '2020-02-03 04:18:54', 'test', 32000, 1, '2', 1),
(9, 'AA0012002240454', '2020-04-01 11:31:43', 'test', 96375, 1, '2', 1),
(10, 'AA0012010023131', '2020-08-14 09:25:47', 'test', 301800, 1, '2', 1),
(11, 'AA0012001054450', '2020-06-01 04:14:41', 'test', 33000, 2, '2', 1),
(12, 'AA0012001301833', '2020-10-19 08:56:43', 'test', 18000, 2, '2', 1),
(13, 'AA0012008026217', '2020-05-26 01:17:31', 'test', 802000, 1, '2', 1),
(14, 'AA0012003134386', '2020-06-01 03:15:29', 'test', 102000, 1, '2', 1),
(15, 'AA0012003107730', '2020-01-12 02:29:55', 'test', 77000, 1, '2', 1),
(16, 'AA0012001279601', '2020-09-06 04:41:20', 'test', 96375, 1, '2', 1),
(17, 'AA0012008086770', '2020-09-01 06:32:25', 'test', 26000, 2, '2', 1),
(18, 'AA0012003041937', '2020-03-17 11:17:07', 'test', 18000, 2, '2', 1),
(19, 'AA0012007219177', '2020-06-14 10:44:29', 'test', 33000, 2, '2', 1),
(20, 'AA0012008205062', '2020-01-09 06:57:25', 'test', 42000, 1, '2', 1),
(21, 'AA0012001199648', '2020-09-07 05:38:04', 'test', 28000, 2, '2', 1),
(22, 'AA0012003101743', '2020-02-08 06:13:48', 'test', 401800, 1, '2', 1),
(23, 'AA0012006188251', '2020-06-17 04:36:51', 'test', 49000, 2, '2', 1),
(24, 'AA0012005319186', '2020-06-27 05:39:58', 'test', 33000, 2, '2', 1),
(25, 'AA0012008136373', '2020-06-08 10:46:02', 'test', 54000, 2, '2', 1),
(26, 'AA0012006147475', '2020-07-28 12:04:55', 'test', 101700, 1, '2', 1),
(27, 'AA0012002028407', '2020-09-08 05:32:45', 'test', 36000, 2, '2', 1),
(28, 'AA0012001032965', '2020-02-10 06:42:06', 'test', 52000, 1, '2', 1),
(29, 'AA0012008093638', '2020-10-12 01:48:37', 'test', 36000, 2, '2', 1),
(30, 'AA0012003129130', '2020-05-21 06:53:30', 'test', 26000, 2, '2', 1),
(31, 'AA0012005223939', '2020-02-08 12:05:21', 'test', 18000, 2, '2', 1),
(32, 'AA0012009065814', '2020-08-29 03:35:31', 'test', 54000, 2, '2', 1),
(33, 'AA0012001032923', '2020-04-21 07:55:19', 'test', 48000, 2, '2', 1),
(34, 'AA0012007192063', '2020-06-04 02:22:05', 'test', 902000, 1, '2', 1),
(35, 'AA0012010054254', '2020-09-25 02:56:11', 'test', 31000, 2, '2', 1),
(36, 'AA0012003214795', '2020-02-08 11:08:53', 'test', 51800, 1, '2', 1),
(37, 'AA0012009099485', '2020-08-04 08:50:14', 'test', 26800, 1, '2', 1),
(38, 'AA0012005179167', '2020-03-25 08:19:37', 'test', 1001700, 1, '2', 1),
(39, 'AA0012006025222', '2020-05-27 07:49:21', 'test', 96375, 1, '2', 1),
(40, 'AA0012003133294', '2020-05-06 02:22:05', 'test', 101700, 1, '2', 1),
(41, 'AA0012004219113', '2020-07-09 09:20:21', 'test', 36000, 2, '2', 1),
(42, 'AA0012006075542', '2020-05-06 12:04:22', 'test', 28000, 2, '2', 1),
(43, 'AA0012009159507', '2020-07-25 04:04:24', 'test', 26375, 1, '2', 1),
(44, 'AA0012003140414', '2020-02-03 12:04:50', 'test', 15000, 2, '2', 1),
(45, 'AA0012003145872', '2020-10-03 12:48:44', 'test', 31000, 2, '2', 1),
(46, 'AA0012007311519', '2020-09-24 01:39:23', 'test', 11800, 1, '2', 1),
(47, 'AA0012003278657', '2020-05-03 11:45:52', 'test', 28000, 2, '2', 1),
(48, 'AA0012001113743', '2020-09-20 03:43:59', 'test', 18000, 2, '2', 1),
(49, 'AA0012008037872', '2020-07-02 01:41:35', 'test', 201375, 1, '2', 1),
(50, 'AA0012009031841', '2020-09-21 04:32:39', 'test', 13000, 2, '2', 1),
(51, 'AA0012003098565', '2020-05-23 09:29:44', 'test', 36000, 2, '2', 1),
(52, 'AA0022009157574', '2020-06-15 02:29:25', 'test', 42000, 1, '2', 1),
(53, 'AA0022003088815', '2020-04-03 08:30:25', 'test', 252000, 1, '2', 1),
(54, 'AA0022001144658', '2020-08-02 05:39:11', 'test', 651375, 1, '2', 1),
(55, 'AA0022003072225', '2020-05-14 07:14:48', 'test', 31000, 2, '2', 1),
(56, 'AA0022002292456', '2020-06-11 08:48:34', 'test', 902000, 1, '2', 1),
(57, 'AA0022002078198', '2020-08-06 07:01:15', 'test', 26000, 2, '2', 1),
(58, 'AA0022006150637', '2020-04-29 11:09:16', 'test', 61375, 1, '2', 1),
(59, 'AA0022009134147', '2020-06-09 03:19:55', 'test', 71375, 1, '2', 1),
(60, 'AA0022004060466', '2020-03-20 02:08:30', 'test', 44000, 2, '2', 1),
(61, 'AA0022001312463', '2020-08-05 05:42:23', 'test', 13000, 2, '2', 1),
(62, 'AA0022007186167', '2020-01-25 03:39:45', 'test', 51000, 2, '2', 1),
(63, 'AA0022005039758', '2020-10-06 10:50:43', 'test', 51800, 1, '2', 1),
(64, 'AA0022005091472', '2020-09-02 09:19:07', 'test', 152000, 1, '2', 1),
(65, 'AA0022004293522', '2020-06-17 05:12:01', 'test', 702000, 1, '2', 1),
(66, 'AA0022003192838', '2020-01-14 10:30:12', 'test', 52150, 1, '2', 1),
(67, 'AA0022006230043', '2020-01-19 02:12:57', 'test', 36000, 2, '2', 1),
(68, 'AA0022008179432', '2020-02-23 08:12:25', 'test', 91375, 1, '2', 1),
(69, 'AA0022004170273', '2020-08-16 01:34:32', 'test', 36000, 2, '2', 1),
(70, 'AA0022001212211', '2020-02-29 09:45:28', 'test', 41375, 1, '2', 1),
(71, 'AA0022006102110', '2020-01-22 06:20:35', 'test', 49000, 2, '2', 1),
(72, 'AA0022010074105', '2020-10-07 05:58:22', 'test', 31000, 2, '2', 1),
(73, 'AA0022010067989', '2020-05-11 03:26:11', 'test', 44000, 2, '2', 1),
(74, 'AA0022004109010', '2020-04-02 08:32:29', 'test', 15000, 2, '2', 1),
(75, 'AA0022005059418', '2020-09-30 02:12:47', 'test', 56375, 1, '2', 1),
(76, 'AA0022006062337', '2020-07-23 05:13:49', 'test', 301375, 1, '2', 1),
(77, 'AA0022002198746', '2020-03-24 01:14:55', 'test', 33000, 2, '2', 1),
(78, 'AA0022002083618', '2020-05-23 09:41:07', 'test', 302000, 1, '2', 1),
(79, 'AA0022004180407', '2020-02-05 08:27:20', 'test', 31000, 2, '2', 1),
(80, 'AA0022008197206', '2020-04-04 06:44:26', 'test', 1001700, 1, '2', 1),
(81, 'AA0022008137311', '2020-06-24 04:24:54', 'test', 18000, 2, '2', 1),
(82, 'AA0022007043055', '2020-01-24 06:29:53', 'test', 51700, 1, '2', 1),
(83, 'AA0022003036724', '2020-08-01 02:12:01', 'test', 28000, 2, '2', 1),
(84, 'AA0022002098775', '2020-05-21 10:05:27', 'test', 31375, 1, '2', 1),
(85, 'AA0022001118638', '2020-06-13 10:02:06', 'test', 502000, 1, '2', 1),
(86, 'AA0022006028502', '2020-09-08 04:12:11', 'test', 902000, 1, '2', 1),
(87, 'AA0022006197567', '2020-04-22 07:01:10', 'test', 102000, 1, '2', 1),
(88, 'AA0022004220083', '2020-01-12 09:00:38', 'test', 101700, 1, '2', 1),
(89, 'AA0022010018829', '2020-09-18 06:39:40', 'test', 15000, 2, '2', 1),
(90, 'AA0022001085384', '2020-07-18 04:39:34', 'test', 31000, 2, '2', 1),
(91, 'AA0022004177473', '2020-02-25 01:39:48', 'test', 301375, 1, '2', 1),
(92, 'AA0022003179844', '2020-03-15 09:31:09', 'test', 18000, 2, '2', 1),
(93, 'AA0022008028633', '2020-09-18 09:10:07', 'test', 21700, 1, '2', 1),
(94, 'AA0022007318200', '2020-08-21 10:12:38', 'test', 36000, 2, '2', 1),
(95, 'AA0022002013571', '2020-03-09 09:34:19', 'test', 31375, 1, '2', 1),
(96, 'AA0022001065124', '2020-02-13 05:18:59', 'test', 26800, 1, '2', 1),
(97, 'AA0022004194471', '2020-05-10 08:17:00', 'test', 21375, 1, '2', 1),
(98, 'AA0022003039894', '2020-04-22 09:08:34', 'test', 36000, 2, '2', 1),
(99, 'AA0022002181830', '2020-01-18 01:51:09', 'test', 501700, 1, '2', 1),
(100, 'AA0022007092874', '2020-09-17 10:32:30', 'test', 36000, 2, '2', 1),
(101, 'AA0022007063998', '2020-08-14 01:32:41', 'test', 51000, 2, '2', 1),
(102, 'AA0032009062271', '2020-04-09 03:20:28', 'test', 201800, 1, '2', 1),
(103, 'AA0032009040005', '2020-06-30 08:00:05', 'test', 81375, 1, '2', 1),
(104, 'AA0032010105795', '2020-02-05 11:45:31', 'test', 252000, 1, '2', 1),
(105, 'AA0032004093843', '2020-09-11 01:38:44', 'test', 48000, 2, '2', 1),
(106, 'AA0032005042901', '2020-08-18 07:15:39', 'test', 51700, 1, '2', 1),
(107, 'AA0032010106276', '2020-03-27 05:56:48', 'test', 15000, 2, '2', 1),
(108, 'AA0032004088963', '2020-05-15 02:07:20', 'test', 302150, 1, '2', 1),
(109, 'AA0032008263891', '2020-05-16 01:42:24', 'test', 54000, 2, '2', 1),
(110, 'AA0032004268324', '2020-01-25 06:36:52', 'test', 36000, 2, '2', 1),
(111, 'AA0032001102504', '2020-05-01 09:03:26', 'test', 11800, 1, '2', 1),
(112, 'AA0032009058516', '2020-01-28 01:34:42', 'test', 26375, 1, '2', 1),
(113, 'AA0032008042158', '2020-09-04 08:48:35', 'test', 13000, 2, '2', 1),
(114, 'AA0032002123583', '2020-03-30 10:28:53', 'test', 501700, 1, '2', 1),
(115, 'AA0032007291641', '2020-01-02 02:02:17', 'test', 33000, 2, '2', 1),
(116, 'AA0032006153121', '2020-03-11 12:50:55', 'test', 49000, 2, '2', 1),
(117, 'AA0032003227697', '2020-07-25 11:37:35', 'test', 31000, 2, '2', 1),
(118, 'AA0032008200739', '2020-02-12 09:28:33', 'test', 11800, 1, '2', 1),
(119, 'AA0032002034820', '2020-01-08 05:57:28', 'test', 602000, 1, '2', 1),
(120, 'AA0032006206880', '2020-01-22 04:07:56', 'test', 301375, 1, '2', 1),
(121, 'AA0032006110711', '2020-03-04 07:58:49', 'test', 31000, 2, '2', 1),
(122, 'AA0032009065225', '2020-02-13 12:29:34', 'test', 501375, 1, '2', 1),
(123, 'AA0032006278849', '2020-06-19 02:40:15', 'test', 48000, 2, '2', 1),
(124, 'AA0032001226670', '2020-03-26 03:26:03', 'test', 502800, 1, '2', 1),
(125, 'AA0032010027371', '2020-09-19 02:36:57', 'test', 33000, 2, '2', 1),
(126, 'AA0032009296462', '2020-05-17 12:23:38', 'test', 1002000, 1, '2', 1),
(127, 'AA0032010059161', '2020-03-25 08:04:49', 'test', 202150, 1, '2', 1),
(128, 'AA0032003103438', '2020-02-11 12:52:38', 'test', 21800, 1, '2', 1),
(129, 'AA0032001274857', '2020-02-05 02:49:46', 'test', 30000, 2, '2', 1),
(130, 'AA0032006140487', '2020-09-22 09:23:27', 'test', 31000, 2, '2', 1),
(131, 'AA0032005173463', '2020-09-27 07:00:31', 'test', 15000, 2, '2', 1),
(132, 'AA0032002237306', '2020-08-06 12:13:35', 'test', 56375, 1, '2', 1),
(133, 'AA0032001109987', '2020-02-03 05:06:17', 'test', 15000, 2, '2', 1),
(134, 'AA0032008012815', '2020-08-29 08:48:03', 'test', 30000, 2, '2', 1),
(135, 'AA0032007044671', '2020-07-21 06:34:02', 'test', 302000, 1, '2', 1),
(136, 'AA0032007230637', '2020-03-27 04:21:24', 'test', 76800, 1, '2', 1),
(137, 'AA0032001124264', '2020-10-14 09:50:40', 'test', 44000, 2, '2', 1),
(138, 'AA0032010068390', '2020-04-04 09:13:07', 'test', 49000, 2, '2', 1),
(139, 'AA0032001087769', '2020-03-18 10:44:29', 'test', 26800, 1, '2', 1),
(140, 'AA0032001097136', '2020-04-06 05:27:16', 'test', 45000, 2, '2', 1),
(141, 'AA0032001127142', '2020-03-17 11:48:25', 'test', 18000, 2, '2', 1),
(142, 'AA0032005253439', '2020-04-18 03:05:50', 'test', 101700, 1, '2', 1),
(143, 'AA0032002091332', '2020-02-18 02:55:23', 'test', 36000, 2, '2', 1),
(144, 'AA0032008295301', '2020-03-26 07:18:12', 'test', 18000, 2, '2', 1),
(145, 'AA0032006241188', '2020-06-27 04:41:40', 'test', 751700, 1, '2', 1),
(146, 'AA0032004051166', '2020-07-10 06:16:51', 'test', 18000, 2, '2', 1),
(147, 'AA0032002063042', '2020-04-29 07:11:46', 'test', 31000, 2, '2', 1),
(148, 'AA0032005134550', '2020-07-24 12:07:41', 'test', 501800, 1, '2', 1),
(149, 'AA0032003057612', '2020-10-10 08:12:07', 'test', 51000, 2, '2', 1),
(150, 'AA0032010018489', '2020-03-30 07:37:32', 'test', 52150, 1, '2', 1),
(151, 'AA0032001064108', '2020-02-25 10:21:04', 'test', 33000, 2, '2', 1),
(152, 'AA0042004214612', '2020-06-20 04:26:31', 'test', 51000, 2, '2', 1),
(153, 'AA0042004250589', '2020-09-29 01:11:19', 'test', 48000, 2, '2', 1),
(154, 'AA0042003212232', '2020-01-21 04:41:37', 'test', 301800, 1, '2', 1),
(155, 'AA0042004031642', '2020-02-20 01:13:06', 'test', 902000, 1, '2', 1),
(156, 'AA0042009192369', '2020-09-19 08:53:11', 'test', 18000, 2, '2', 1),
(157, 'AA0042007112127', '2020-08-02 09:45:18', 'test', 602000, 1, '2', 1),
(158, 'AA0042004274828', '2020-02-28 01:48:46', 'test', 13000, 2, '2', 1),
(159, 'AA0042003231561', '2020-07-19 01:58:32', 'test', 76800, 1, '2', 1),
(160, 'AA0042001247721', '2020-09-06 03:29:55', 'test', 51800, 1, '2', 1),
(161, 'AA0042005290583', '2020-08-04 08:20:23', 'test', 902000, 1, '2', 1),
(162, 'AA0042005276974', '2020-05-04 01:16:24', 'test', 18000, 2, '2', 1),
(163, 'AA0042007282322', '2020-06-11 09:40:29', 'test', 152000, 1, '2', 1),
(164, 'AA0042005243259', '2020-07-25 09:57:02', 'test', 651375, 1, '2', 1),
(165, 'AA0042002145889', '2020-05-30 02:38:41', 'test', 26800, 1, '2', 1),
(166, 'AA0042006033441', '2020-01-31 07:27:44', 'test', 18000, 2, '2', 1),
(167, 'AA0042005212752', '2020-09-06 02:50:28', 'test', 46000, 2, '2', 1),
(168, 'AA0042006033565', '2020-02-04 07:38:56', 'test', 43000, 2, '2', 1),
(169, 'AA0042001126532', '2020-02-28 06:18:35', 'test', 41000, 2, '2', 1),
(170, 'AA0042006255878', '2020-01-11 01:42:10', 'test', 152000, 1, '2', 1),
(171, 'AA0042007265491', '2020-02-04 10:33:59', 'test', 46000, 2, '2', 1),
(172, 'AA0042004285125', '2020-03-28 10:10:45', 'test', 26800, 1, '2', 1),
(173, 'AA0042001063257', '2020-06-05 11:00:59', 'test', 31000, 2, '2', 1),
(174, 'AA0042007314790', '2020-05-17 01:36:58', 'test', 54000, 2, '2', 1),
(175, 'AA0042006115089', '2020-03-22 04:33:23', 'test', 401800, 1, '2', 1),
(176, 'AA0042006195609', '2020-07-26 07:32:11', 'test', 76700, 1, '2', 1),
(177, 'AA0042007301118', '2020-05-04 05:19:39', 'test', 32000, 1, '2', 1),
(178, 'AA0042006163246', '2020-08-17 02:49:55', 'test', 51000, 2, '2', 1),
(179, 'AA0042008154634', '2020-01-06 02:01:47', 'test', 54000, 2, '2', 1),
(180, 'AA0042009249527', '2020-09-27 07:12:01', 'test', 502800, 1, '2', 1),
(181, 'AA0042003087695', '2020-03-05 09:04:29', 'test', 18000, 2, '2', 1),
(182, 'AA0042005036693', '2020-05-26 03:54:37', 'test', 81375, 1, '2', 1),
(183, 'AA0042009237390', '2020-10-15 07:43:54', 'test', 31000, 2, '2', 1),
(184, 'AA0042003290733', '2020-09-09 01:12:25', 'test', 21700, 1, '2', 1),
(185, 'AA0042001292308', '2020-03-29 08:32:18', 'test', 13000, 2, '2', 1),
(186, 'AA0042009195692', '2020-01-02 11:23:04', 'test', 152000, 1, '2', 1),
(187, 'AA0042001059349', '2020-08-19 11:11:27', 'test', 36000, 2, '2', 1),
(188, 'AA0042003183216', '2020-08-28 08:33:13', 'test', 31000, 2, '2', 1),
(189, 'AA0042005023221', '2020-02-25 11:50:57', 'test', 15000, 2, '2', 1),
(190, 'AA0042004180758', '2020-06-17 05:30:32', 'test', 51000, 2, '2', 1),
(191, 'AA0042005087097', '2020-07-23 03:00:49', 'test', 76375, 1, '2', 1),
(192, 'AA0042002121708', '2020-05-23 11:34:12', 'test', 602000, 1, '2', 1),
(193, 'AA0042002067033', '2020-08-16 09:27:04', 'test', 802000, 1, '2', 1),
(194, 'AA0042003100598', '2020-05-02 06:47:03', 'test', 101700, 1, '2', 1),
(195, 'AA0042002296933', '2020-10-08 11:44:43', 'test', 51000, 2, '2', 1),
(196, 'AA0042001246456', '2020-09-23 01:30:53', 'test', 15000, 2, '2', 1),
(197, 'AA0042005123032', '2020-01-15 10:10:03', 'test', 54000, 2, '2', 1),
(198, 'AA0042003061871', '2020-04-27 06:38:24', 'test', 751700, 1, '2', 1),
(199, 'AA0042007145226', '2020-09-14 02:48:04', 'test', 18000, 2, '2', 1),
(200, 'AA0042003268253', '2020-05-26 04:15:45', 'test', 22000, 1, '2', 1),
(201, 'AA0042009063787', '2020-01-19 01:05:01', 'test', 46375, 1, '2', 1),
(202, 'AA0052005298944', '2020-04-01 11:55:59', 'test', 202150, 1, '2', 1),
(203, 'AA0052001029277', '2020-08-26 11:24:34', 'test', 26000, 2, '2', 1),
(204, 'AA0052002272547', '2020-01-15 12:52:00', 'test', 252000, 1, '2', 1),
(205, 'AA0052009302710', '2020-01-01 09:57:02', 'test', 21700, 1, '2', 1),
(206, 'AA0052008088211', '2020-07-05 06:53:47', 'test', 31000, 2, '2', 1),
(207, 'AA0052009206791', '2020-04-14 12:08:12', 'test', 18000, 2, '2', 1),
(208, 'AA0052003294932', '2020-04-19 06:56:21', 'test', 401800, 1, '2', 1),
(209, 'AA0052010144011', '2020-08-06 02:26:53', 'test', 18000, 2, '2', 1),
(210, 'AA0052006050450', '2020-08-19 01:15:03', 'test', 46000, 2, '2', 1),
(211, 'AA0052004275263', '2020-05-22 01:24:07', 'test', 152150, 1, '2', 1),
(212, 'AA0052008185747', '2020-04-23 03:36:56', 'test', 33000, 2, '2', 1),
(213, 'AA0052002013704', '2020-09-03 11:02:01', 'test', 43000, 2, '2', 1),
(214, 'AA0052006124176', '2020-06-17 05:19:23', 'test', 36000, 2, '2', 1),
(215, 'AA0052003243743', '2020-05-13 03:20:14', 'test', 501375, 1, '2', 1),
(216, 'AA0052003149671', '2020-04-23 02:42:22', 'test', 18000, 2, '2', 1),
(217, 'AA0052002108621', '2020-03-10 12:32:52', 'test', 51000, 2, '2', 1),
(218, 'AA0052009172584', '2020-10-02 11:28:33', 'test', 251700, 1, '2', 1),
(219, 'AA0052009101749', '2020-05-15 12:27:43', 'test', 15000, 2, '2', 1),
(220, 'AA0052004085832', '2020-03-18 06:05:28', 'test', 26800, 1, '2', 1),
(221, 'AA0052007176302', '2020-10-16 02:57:04', 'test', 31000, 2, '2', 1),
(222, 'AA0052001319259', '2020-08-22 11:52:50', 'test', 33000, 2, '2', 1),
(223, 'AA0052001299031', '2020-09-29 02:44:18', 'test', 31000, 2, '2', 1),
(224, 'AA0052008167480', '2020-09-02 08:46:37', 'test', 22000, 1, '2', 1),
(225, 'AA0052009232092', '2020-09-10 01:22:12', 'test', 31375, 1, '2', 1),
(226, 'AA0052007021768', '2020-05-19 10:17:24', 'test', 51800, 1, '2', 1),
(227, 'AA0052002066864', '2020-09-18 12:08:32', 'test', 21800, 1, '2', 1),
(228, 'AA0052001242895', '2020-06-20 06:55:44', 'test', 13000, 2, '2', 1),
(229, 'AA0052010100431', '2020-06-27 02:12:43', 'test', 31000, 2, '2', 1),
(230, 'AA0052006140650', '2020-07-13 06:00:31', 'test', 86375, 1, '2', 1),
(231, 'AA0052003140811', '2020-01-17 09:57:01', 'test', 201800, 1, '2', 1),
(232, 'AA0052007270548', '2020-08-12 11:53:39', 'test', 36000, 2, '2', 1),
(233, 'AA0052004293389', '2020-03-11 10:32:58', 'test', 18000, 2, '2', 1),
(234, 'AA0052002052427', '2020-06-24 01:58:10', 'test', 31000, 2, '2', 1),
(235, 'AA0052010113575', '2020-05-03 06:07:37', 'test', 15000, 2, '2', 1),
(236, 'AA0052007301785', '2020-05-19 01:34:49', 'test', 13000, 2, '2', 1),
(237, 'AA0052010128317', '2020-02-14 08:31:34', 'test', 76375, 1, '2', 1),
(238, 'AA0052004120944', '2020-05-13 04:47:23', 'test', 13000, 2, '2', 1),
(239, 'AA0052005309065', '2020-05-18 02:32:30', 'test', 51375, 1, '2', 1),
(240, 'AA0052007045742', '2020-04-28 08:13:15', 'test', 31000, 2, '2', 1),
(241, 'AA0052002192680', '2020-04-22 03:41:52', 'test', 15000, 2, '2', 1),
(242, 'AA0052007231277', '2020-09-22 07:48:59', 'test', 52000, 1, '2', 1),
(243, 'AA0052004094034', '2020-10-11 12:30:37', 'test', 13000, 2, '2', 1),
(244, 'AA0052009131027', '2020-05-10 10:13:29', 'test', 26000, 2, '2', 1),
(245, 'AA0052007192125', '2020-09-11 06:14:04', 'test', 41375, 1, '2', 1),
(246, 'AA0052005049529', '2020-09-04 05:00:15', 'test', 33000, 2, '2', 1),
(247, 'AA0052008309553', '2020-07-05 03:39:38', 'test', 81375, 1, '2', 1),
(248, 'AA0052009108115', '2020-05-08 11:04:22', 'test', 15000, 2, '2', 1),
(249, 'AA0052007073796', '2020-09-22 10:47:57', 'test', 76375, 1, '2', 1),
(250, 'AA0052004141448', '2020-06-14 03:15:00', 'test', 33000, 2, '2', 1),
(251, 'AA0052005192688', '2020-07-15 11:51:47', 'test', 13000, 2, '2', 1),
(252, 'AA0012010173810', '2020-10-14 09:15:26', 'test', 902000, 1, '2', 1),
(253, 'AA0012010124445', '2020-10-16 02:43:11', 'test', 501375, 1, '2', 1),
(254, 'AA0012010097148', '2020-10-14 07:45:13', 'test', 41375, 1, '2', 1),
(255, 'AA0012010180419', '2020-10-03 02:22:25', 'test', 22000, 1, '2', 1),
(256, 'AA0012010059642', '2020-10-16 04:18:06', 'test', 31375, 1, '2', 1),
(257, 'AA0012010071305', '2020-10-11 06:14:14', 'test', 44000, 2, '2', 1),
(258, 'AA0012010198796', '2020-10-15 04:49:04', 'test', 26800, 1, '2', 1),
(259, 'AA0012010173472', '2020-10-19 09:34:06', 'test', 151800, 1, '2', 1),
(260, 'AA0012010150216', '2020-10-06 04:40:19', 'test', 51000, 2, '2', 1),
(261, 'AA0012010105483', '2020-10-18 05:57:13', 'test', 201800, 1, '2', 1),
(262, 'AA0012010059098', '2020-10-11 10:15:22', 'test', 602000, 1, '2', 1),
(263, 'AA0012010152351', '2020-10-13 11:10:52', 'test', 18000, 2, '2', 1),
(264, 'AA0012010165609', '2020-10-17 12:18:46', 'test', 44000, 2, '2', 1),
(265, 'AA0012010083625', '2020-10-05 11:12:59', 'test', 15000, 2, '2', 1),
(266, 'AA0012010061698', '2020-10-13 11:26:52', 'test', 651375, 1, '2', 1),
(267, 'AA0012010074182', '2020-10-16 07:46:07', 'test', 32000, 1, '2', 1),
(268, 'AA0012010117123', '2020-10-07 02:20:27', 'test', 13000, 2, '2', 1),
(269, 'AA0012010179163', '2020-10-08 06:35:57', 'test', 36000, 2, '2', 1),
(270, 'AA0012010176116', '2020-10-01 10:30:38', 'test', 302150, 1, '2', 1),
(271, 'AA0012010155009', '2020-10-10 06:41:39', 'test', 26000, 2, '2', 1),
(272, 'AA0012010157173', '2020-10-20 02:33:33', 'test', 651375, 1, '2', 1),
(273, 'AA0012010114487', '2020-10-05 04:10:10', 'test', 27000, 1, '2', 1),
(274, 'AA0012010104411', '2020-10-02 07:05:59', 'test', 41375, 1, '2', 1),
(275, 'AA0012010036321', '2020-10-08 10:59:37', 'test', 501375, 1, '2', 1),
(276, 'AA0012010163269', '2020-10-08 04:25:51', 'test', 46000, 2, '2', 1),
(277, 'AA0012010027138', '2020-10-19 08:49:08', 'test', 15000, 2, '2', 1),
(278, 'AA0012010155178', '2020-10-13 07:44:41', 'test', 31000, 2, '2', 1),
(279, 'AA0012010205055', '2020-10-11 05:23:47', 'test', 602000, 1, '2', 1),
(280, 'AA0012010172209', '2020-10-14 04:18:14', 'test', 18000, 2, '2', 1),
(281, 'AA0012010025480', '2020-10-14 10:22:10', 'test', 11800, 1, '2', 1),
(282, 'AA0012010083926', '2020-10-09 12:45:14', 'test', 18000, 2, '2', 1),
(283, 'AA0012010152378', '2020-10-15 03:51:52', 'test', 86375, 1, '2', 1),
(284, 'AA0012010093718', '2020-10-02 10:11:27', 'test', 33000, 2, '2', 1),
(285, 'AA0012010045112', '2020-10-06 10:35:48', 'test', 31000, 2, '2', 1),
(286, 'AA0012010046628', '2020-10-05 09:38:40', 'test', 18000, 2, '2', 1),
(287, 'AA0012010137418', '2020-10-02 10:08:14', 'test', 28000, 2, '2', 1),
(288, 'AA0012010105498', '2020-10-09 06:42:41', 'test', 18000, 2, '2', 1),
(289, 'AA0012010209489', '2020-10-02 10:57:31', 'test', 15000, 2, '2', 1),
(290, 'AA0012010191861', '2020-10-07 07:29:02', 'test', 49000, 2, '2', 1),
(291, 'AA0012010156358', '2020-10-19 07:44:19', 'test', 46000, 2, '2', 1),
(292, 'AA0012010042127', '2020-10-09 12:27:59', 'test', 15000, 2, '2', 1),
(293, 'AA0012010194996', '2020-10-05 09:21:29', 'test', 201375, 1, '2', 1),
(294, 'AA0012010040573', '2020-10-09 03:50:11', 'test', 151800, 1, '2', 1),
(295, 'AA0012010208871', '2020-10-04 06:58:23', 'test', 251700, 1, '2', 1),
(296, 'AA0012010071627', '2020-10-16 03:25:29', 'test', 51000, 2, '2', 1),
(297, 'AA0012010114804', '2020-10-04 09:19:42', 'test', 54000, 2, '2', 1),
(298, 'AA0012010066687', '2020-10-17 06:57:44', 'test', 46000, 2, '2', 1),
(299, 'AA0012010180693', '2020-10-16 11:54:57', 'test', 31000, 2, '2', 1),
(300, 'AA0012010136766', '2020-10-15 08:18:11', 'test', 31000, 2, '2', 1),
(301, 'AA0012010033193', '2020-10-17 12:25:31', 'test', 96375, 1, '2', 1),
(302, 'AA0022010181745', '2020-10-11 11:13:08', 'test', 31000, 2, '2', 1),
(303, 'AA0022010109603', '2020-10-11 07:28:53', 'test', 49000, 2, '2', 1),
(304, 'AA0022010081517', '2020-10-03 07:03:08', 'test', 15000, 2, '2', 1),
(305, 'AA0022010036345', '2020-10-14 12:38:24', 'test', 77000, 1, '2', 1),
(306, 'AA0022010010101', '2020-10-14 02:47:48', 'test', 13000, 2, '2', 1),
(307, 'AA0022010145693', '2020-10-14 01:14:56', 'test', 902000, 1, '2', 1),
(308, 'AA0022010073966', '2020-10-09 12:08:39', 'test', 31000, 2, '2', 1),
(309, 'AA0022010166032', '2020-10-15 03:04:49', 'test', 54000, 2, '2', 1),
(310, 'AA0022010146262', '2020-10-10 08:37:38', 'test', 46000, 2, '2', 1),
(311, 'AA0022010024697', '2020-10-11 07:47:45', 'test', 602000, 1, '2', 1),
(312, 'AA0022010095737', '2020-10-14 03:53:26', 'test', 76800, 1, '2', 1),
(313, 'AA0022010200269', '2020-10-20 06:40:02', 'test', 702000, 1, '2', 1),
(314, 'AA0022010135480', '2020-10-08 03:42:51', 'test', 18000, 2, '2', 1),
(315, 'AA0022010164210', '2020-10-10 02:22:55', 'test', 751700, 1, '2', 1),
(316, 'AA0022010177169', '2020-10-02 08:51:16', 'test', 602000, 1, '2', 1),
(317, 'AA0022010026404', '2020-10-03 10:46:01', 'test', 18000, 2, '2', 1),
(318, 'AA0022010209197', '2020-10-03 12:38:02', 'test', 602000, 1, '2', 1),
(319, 'AA0022010030427', '2020-10-04 06:37:36', 'test', 27350, 1, '2', 1),
(320, 'AA0022010089604', '2020-10-20 07:44:45', 'test', 18000, 2, '2', 1),
(321, 'AA0022010118874', '2020-10-18 04:46:03', 'test', 33000, 2, '2', 1),
(322, 'AA0022010020845', '2020-10-08 10:56:18', 'test', 31375, 1, '2', 1),
(323, 'AA0022010135351', '2020-10-16 09:48:58', 'test', 13000, 2, '2', 1),
(324, 'AA0022010186427', '2020-10-14 04:21:33', 'test', 602000, 1, '2', 1),
(325, 'AA0022010114793', '2020-10-01 06:00:22', 'test', 76800, 1, '2', 1),
(326, 'AA0022010148643', '2020-10-05 02:34:55', 'test', 15000, 2, '2', 1),
(327, 'AA0022010205797', '2020-10-01 03:03:18', 'test', 11800, 1, '2', 1),
(328, 'AA0022010173887', '2020-10-07 11:47:56', 'test', 301375, 1, '2', 1),
(329, 'AA0022010078723', '2020-10-07 04:32:58', 'test', 41000, 2, '2', 1),
(330, 'AA0022010071782', '2020-10-19 11:08:20', 'test', 15000, 2, '2', 1),
(331, 'AA0022010033876', '2020-10-04 06:28:24', 'test', 251700, 1, '2', 1),
(332, 'AA0022010181300', '2020-10-04 04:25:53', 'test', 18000, 2, '2', 1),
(333, 'AA0022010133428', '2020-10-18 05:47:25', 'test', 151800, 1, '2', 1),
(334, 'AA0022010093885', '2020-10-15 07:55:36', 'test', 18000, 2, '2', 1),
(335, 'AA0022010173539', '2020-10-19 11:58:03', 'test', 101800, 1, '2', 1),
(336, 'AA0022010149852', '2020-10-17 08:33:15', 'test', 502800, 1, '2', 1),
(337, 'AA0022010175773', '2020-10-09 06:46:52', 'test', 71375, 1, '2', 1),
(338, 'AA0022010088614', '2020-10-14 04:32:34', 'test', 71375, 1, '2', 1),
(339, 'AA0022010160288', '2020-10-18 12:07:23', 'test', 28000, 2, '2', 1),
(340, 'AA0022010045619', '2020-10-20 08:42:17', 'test', 26375, 1, '2', 1),
(341, 'AA0022010046109', '2020-10-20 06:15:47', 'test', 54000, 2, '2', 1),
(342, 'AA0022010145372', '2020-10-12 03:29:20', 'test', 32000, 1, '2', 1),
(343, 'AA0022010130990', '2020-10-20 09:08:19', 'test', 76800, 1, '2', 1),
(344, 'AA0022010152446', '2020-10-06 05:54:07', 'test', 36000, 2, '2', 1),
(345, 'AA0022010106101', '2020-10-04 03:09:49', 'test', 33000, 2, '2', 1),
(346, 'AA0022010205900', '2020-10-15 02:41:27', 'test', 202000, 1, '2', 1),
(347, 'AA0022010169340', '2020-10-19 06:38:11', 'test', 45000, 2, '2', 1),
(348, 'AA0022010111617', '2020-10-08 07:52:40', 'test', 81375, 1, '2', 1),
(349, 'AA0022010012535', '2020-10-01 10:09:02', 'test', 41000, 2, '2', 1),
(350, 'AA0022010140003', '2020-10-10 12:26:19', 'test', 31000, 2, '2', 1),
(351, 'AA0022010116987', '2020-10-15 02:39:59', 'test', 30000, 2, '2', 1),
(352, 'AA0032010112392', '2020-10-19 10:22:13', 'test', 302150, 1, '2', 1),
(353, 'AA0032010041594', '2020-10-02 11:29:06', 'test', 28000, 2, '2', 1),
(354, 'AA0032010062424', '2020-10-18 07:44:46', 'test', 22000, 1, '2', 1),
(355, 'AA0032010146925', '2020-10-03 02:02:22', 'test', 51700, 1, '2', 1),
(356, 'AA0032010189379', '2020-10-13 06:43:27', 'test', 501700, 1, '2', 1),
(357, 'AA0032010048102', '2020-10-18 06:44:22', 'test', 1001700, 1, '2', 1),
(358, 'AA0032010197467', '2020-10-14 07:25:42', 'test', 96375, 1, '2', 1),
(359, 'AA0032010208915', '2020-10-09 09:51:49', 'test', 27350, 1, '2', 1),
(360, 'AA0032010097076', '2020-10-17 03:16:32', 'test', 48000, 2, '2', 1),
(361, 'AA0032010019780', '2020-10-13 01:46:31', 'test', 18000, 2, '2', 1),
(362, 'AA0032010193253', '2020-10-07 09:21:49', 'test', 36000, 2, '2', 1),
(363, 'AA0032010205810', '2020-10-02 01:14:29', 'test', 27350, 1, '2', 1),
(364, 'AA0032010164828', '2020-10-19 02:05:59', 'test', 26000, 2, '2', 1),
(365, 'AA0032010178287', '2020-10-11 10:50:09', 'test', 101700, 1, '2', 1),
(366, 'AA0032010118656', '2020-10-13 09:45:14', 'test', 31000, 2, '2', 1),
(367, 'AA0032010168107', '2020-10-04 03:31:13', 'test', 46375, 1, '2', 1),
(368, 'AA0032010158615', '2020-10-10 04:25:01', 'test', 101700, 1, '2', 1),
(369, 'AA0032010175680', '2020-10-02 09:23:54', 'test', 49000, 2, '2', 1),
(370, 'AA0032010171499', '2020-10-17 03:33:41', 'test', 302150, 1, '2', 1),
(371, 'AA0032010089069', '2020-10-09 09:34:29', 'test', 46375, 1, '2', 1),
(372, 'AA0032010142241', '2020-10-18 10:05:11', 'test', 401375, 1, '2', 1),
(373, 'AA0032010177293', '2020-10-16 11:41:16', 'test', 751700, 1, '2', 1),
(374, 'AA0032010101516', '2020-10-01 04:44:30', 'test', 86375, 1, '2', 1),
(375, 'AA0032010149938', '2020-10-13 05:30:23', 'test', 802000, 1, '2', 1),
(376, 'AA0032010162203', '2020-10-05 09:45:03', 'test', 201375, 1, '2', 1),
(377, 'AA0032010209031', '2020-10-03 05:57:43', 'test', 52000, 1, '2', 1),
(378, 'AA0032010127033', '2020-10-14 07:45:10', 'test', 502800, 1, '2', 1),
(379, 'AA0032010184122', '2020-10-17 05:29:28', 'test', 18000, 2, '2', 1),
(380, 'AA0032010160492', '2020-10-04 12:55:35', 'test', 91375, 1, '2', 1),
(381, 'AA0032010123565', '2020-10-10 10:35:39', 'test', 36000, 2, '2', 1),
(382, 'AA0032010205635', '2020-10-11 06:32:40', 'test', 52000, 1, '2', 1),
(383, 'AA0032010092786', '2020-10-12 09:24:07', 'test', 36000, 2, '2', 1),
(384, 'AA0032010017508', '2020-10-07 03:36:46', 'test', 33000, 2, '2', 1),
(385, 'AA0032010173695', '2020-10-04 02:00:50', 'test', 49000, 2, '2', 1),
(386, 'AA0032010107817', '2020-10-17 04:58:45', 'test', 31000, 2, '2', 1),
(387, 'AA0032010164274', '2020-10-13 02:34:08', 'test', 1001700, 1, '2', 1),
(388, 'AA0032010198811', '2020-10-11 11:13:16', 'test', 702000, 1, '2', 1),
(389, 'AA0032010046609', '2020-10-05 02:20:59', 'test', 13000, 2, '2', 1),
(390, 'AA0032010078239', '2020-10-05 07:57:34', 'test', 91375, 1, '2', 1),
(391, 'AA0032010115227', '2020-10-09 07:35:07', 'test', 102000, 1, '2', 1),
(392, 'AA0032010161115', '2020-10-11 06:39:30', 'test', 31000, 2, '2', 1),
(393, 'AA0032010067092', '2020-10-07 08:23:18', 'test', 502000, 1, '2', 1),
(394, 'AA0032010139035', '2020-10-17 02:52:39', 'test', 102000, 1, '2', 1),
(395, 'AA0032010187551', '2020-10-15 08:08:09', 'test', 41000, 2, '2', 1),
(396, 'AA0032010022497', '2020-10-20 04:01:35', 'test', 18000, 2, '2', 1),
(397, 'AA0032010116829', '2020-10-12 06:19:14', 'test', 18000, 2, '2', 1),
(398, 'AA0032010078251', '2020-10-04 04:12:34', 'test', 49000, 2, '2', 1),
(399, 'AA0032010049623', '2020-10-18 07:56:16', 'test', 26800, 1, '2', 1),
(400, 'AA0032010068003', '2020-10-03 01:41:12', 'test', 21700, 1, '2', 1),
(401, 'AA0032010178756', '2020-10-13 08:34:45', 'test', 152150, 1, '2', 1),
(402, 'AA0042010141078', '2020-10-12 12:27:09', 'test', 28000, 2, '2', 1),
(403, 'AA0042010185047', '2020-10-08 06:12:22', 'test', 31375, 1, '2', 1),
(404, 'AA0042010180382', '2020-10-10 04:50:23', 'test', 54000, 2, '2', 1),
(405, 'AA0042010123362', '2020-10-19 07:03:20', 'test', 18000, 2, '2', 1),
(406, 'AA0042010032311', '2020-10-18 07:32:37', 'test', 36000, 2, '2', 1),
(407, 'AA0042010072450', '2020-10-02 02:26:56', 'test', 41375, 1, '2', 1),
(408, 'AA0042010198543', '2020-10-12 04:18:10', 'test', 101800, 1, '2', 1),
(409, 'AA0042010024118', '2020-10-18 01:16:24', 'test', 31375, 1, '2', 1),
(410, 'AA0042010189419', '2020-10-16 04:02:26', 'test', 43000, 2, '2', 1),
(411, 'AA0042010092766', '2020-10-05 11:36:51', 'test', 36000, 2, '2', 1),
(412, 'AA0042010185004', '2020-10-13 02:51:17', 'test', 26000, 2, '2', 1),
(413, 'AA0042010036907', '2020-10-20 03:54:23', 'test', 33000, 2, '2', 1),
(414, 'AA0042010109073', '2020-10-10 09:24:27', 'test', 13000, 2, '2', 1),
(415, 'AA0042010154648', '2020-10-05 04:28:03', 'test', 31000, 2, '2', 1),
(416, 'AA0042010136935', '2020-10-10 03:23:52', 'test', 33000, 2, '2', 1),
(417, 'AA0042010060764', '2020-10-17 10:00:50', 'test', 802000, 1, '2', 1),
(418, 'AA0042010028821', '2020-10-09 06:19:56', 'test', 501375, 1, '2', 1),
(419, 'AA0042010136014', '2020-10-18 06:24:00', 'test', 52150, 1, '2', 1),
(420, 'AA0042010101208', '2020-10-06 03:13:42', 'test', 76375, 1, '2', 1),
(421, 'AA0042010033333', '2020-10-17 06:33:44', 'test', 13000, 2, '2', 1),
(422, 'AA0042010089613', '2020-10-14 11:41:18', 'test', 201800, 1, '2', 1),
(423, 'AA0042010053486', '2020-10-08 04:00:34', 'test', 36375, 1, '2', 1),
(424, 'AA0042010199101', '2020-10-10 12:33:27', 'test', 36000, 2, '2', 1),
(425, 'AA0042010207953', '2020-10-09 07:15:42', 'test', 33000, 2, '2', 1),
(426, 'AA0042010204428', '2020-10-13 03:15:36', 'test', 36000, 2, '2', 1),
(427, 'AA0042010097700', '2020-10-06 12:43:59', 'test', 802000, 1, '2', 1),
(428, 'AA0042010161443', '2020-10-18 11:56:47', 'test', 401800, 1, '2', 1),
(429, 'AA0042010123637', '2020-10-02 12:19:38', 'test', 31375, 1, '2', 1),
(430, 'AA0042010014824', '2020-10-10 08:13:08', 'test', 52150, 1, '2', 1),
(431, 'AA0042010084039', '2020-10-19 08:26:06', 'test', 31000, 2, '2', 1),
(432, 'AA0042010064816', '2020-10-08 02:07:01', 'test', 36000, 2, '2', 1),
(433, 'AA0042010195974', '2020-10-10 01:21:17', 'test', 30000, 2, '2', 1),
(434, 'AA0042010025862', '2020-10-17 10:03:01', 'test', 27350, 1, '2', 1),
(435, 'AA0042010054531', '2020-10-08 08:25:48', 'test', 21800, 1, '2', 1),
(436, 'AA0042010092144', '2020-10-09 06:18:14', 'test', 13000, 2, '2', 1),
(437, 'AA0042010189592', '2020-10-04 05:53:53', 'test', 152000, 1, '2', 1),
(438, 'AA0042010012353', '2020-10-05 01:07:11', 'test', 31000, 2, '2', 1),
(439, 'AA0042010194967', '2020-10-16 01:01:48', 'test', 13000, 2, '2', 1),
(440, 'AA0042010026388', '2020-10-14 04:44:57', 'test', 56375, 1, '2', 1),
(441, 'AA0042010117563', '2020-10-07 11:09:16', 'test', 102000, 1, '2', 1),
(442, 'AA0042010192138', '2020-10-11 06:47:25', 'test', 30000, 2, '2', 1),
(443, 'AA0042010089154', '2020-10-18 08:16:38', 'test', 152000, 1, '2', 1),
(444, 'AA0042010097758', '2020-10-05 08:11:16', 'test', 31000, 2, '2', 1),
(445, 'AA0042010116976', '2020-10-06 03:18:15', 'test', 71375, 1, '2', 1),
(446, 'AA0042010178238', '2020-10-01 09:33:54', 'test', 32000, 1, '2', 1),
(447, 'AA0042010105978', '2020-10-02 10:24:50', 'test', 502000, 1, '2', 1),
(448, 'AA0042010120471', '2020-10-16 03:21:10', 'test', 49000, 2, '2', 1),
(449, 'AA0042010112925', '2020-10-15 11:34:03', 'test', 51800, 1, '2', 1),
(450, 'AA0042010038806', '2020-10-06 07:53:03', 'test', 21800, 1, '2', 1),
(451, 'AA0042010187564', '2020-10-15 09:08:14', 'test', 27000, 1, '2', 1),
(452, 'AA0052010124004', '2020-10-04 07:33:03', 'test', 52150, 1, '2', 1),
(453, 'AA0052010105560', '2020-10-17 02:25:48', 'test', 49000, 2, '2', 1),
(454, 'AA0052010180698', '2020-10-16 05:01:41', 'test', 1001700, 1, '2', 1),
(455, 'AA0052010052352', '2020-10-15 06:53:33', 'test', 101375, 1, '2', 1),
(456, 'AA0052010052209', '2020-10-05 08:04:30', 'test', 26000, 2, '2', 1),
(457, 'AA0052010040199', '2020-10-05 05:55:07', 'test', 44000, 2, '2', 1),
(458, 'AA0052010070704', '2020-10-06 10:55:29', 'test', 71375, 1, '2', 1),
(459, 'AA0052010072744', '2020-10-11 03:33:55', 'test', 202000, 1, '2', 1),
(460, 'AA0052010131064', '2020-10-19 10:20:45', 'test', 152150, 1, '2', 1),
(461, 'AA0052010145338', '2020-10-08 07:35:21', 'test', 26375, 1, '2', 1),
(462, 'AA0052010196744', '2020-10-02 10:31:16', 'test', 52000, 1, '2', 1),
(463, 'AA0052010084614', '2020-10-14 07:48:09', 'test', 51000, 2, '2', 1),
(464, 'AA0052010167382', '2020-10-04 09:18:22', 'test', 501375, 1, '2', 1),
(465, 'AA0052010176575', '2020-10-05 06:44:53', 'test', 33000, 2, '2', 1),
(466, 'AA0052010060952', '2020-10-03 07:36:12', 'test', 502800, 1, '2', 1),
(467, 'AA0052010167046', '2020-10-06 02:35:20', 'test', 15000, 2, '2', 1),
(468, 'AA0052010174808', '2020-10-12 03:30:46', 'test', 42000, 1, '2', 1),
(469, 'AA0052010102612', '2020-10-02 02:36:09', 'test', 71375, 1, '2', 1),
(470, 'AA0052010025213', '2020-10-07 05:12:56', 'test', 49000, 2, '2', 1),
(471, 'AA0052010182487', '2020-10-01 09:00:30', 'test', 702000, 1, '2', 1),
(472, 'AA0052010151639', '2020-10-06 06:22:47', 'test', 31000, 2, '2', 1),
(473, 'AA0052010157146', '2020-10-08 01:52:20', 'test', 91375, 1, '2', 1),
(474, 'AA0052010018974', '2020-10-14 10:13:07', 'test', 36000, 2, '2', 1),
(475, 'AA0052010118926', '2020-10-03 10:17:34', 'test', 18000, 2, '2', 1),
(476, 'AA0052010069282', '2020-10-03 03:24:55', 'test', 31000, 2, '2', 1),
(477, 'AA0052010170088', '2020-10-02 01:58:24', 'test', 46000, 2, '2', 1),
(478, 'AA0052010076611', '2020-10-20 08:02:38', 'test', 402000, 1, '2', 1),
(479, 'AA0052010109186', '2020-10-11 10:40:31', 'test', 48000, 2, '2', 1),
(480, 'AA0052010209726', '2020-10-06 01:03:39', 'test', 56375, 1, '2', 1),
(481, 'AA0052010102353', '2020-10-05 02:03:01', 'test', 76375, 1, '1', 0),
(482, 'AA0052010087354', '2020-10-07 07:31:57', 'test', 11800, 1, '1', 0),
(483, 'AA0052010043432', '2020-10-03 10:29:33', 'test', 13000, 2, '2', 1),
(484, 'AA0052010033571', '2020-10-16 08:47:02', 'test', 51000, 2, '1', 0),
(485, 'AA0052010129020', '2020-10-08 01:52:47', 'test', 44000, 2, '1', 0),
(486, 'AA0052010151814', '2020-10-15 08:44:59', 'test', 33000, 2, '1', 0),
(487, 'AA0052010096333', '2020-10-11 12:10:14', 'test', 251700, 1, '1', 0),
(488, 'AA0052010182924', '2020-10-16 09:18:07', 'test', 902000, 1, '1', 0),
(489, 'AA0052010027923', '2020-10-08 11:22:18', 'test', 77000, 1, '1', 0),
(490, 'AA0052010168514', '2020-10-11 03:00:58', 'test', 77000, 1, '1', 0),
(491, 'AA0052010154713', '2020-10-12 03:09:15', 'test', 152150, 1, '1', 0),
(492, 'AA0052010157052', '2020-10-06 11:42:55', 'test', 48000, 2, '1', 0),
(493, 'AA0052010178931', '2020-10-03 06:13:59', 'test', 51375, 1, '1', 0),
(494, 'AA0052010117450', '2020-10-08 03:36:18', 'test', 152150, 1, '1', 0),
(495, 'AA0052010136050', '2020-10-10 05:04:42', 'test', 102150, 1, '1', 0),
(496, 'AA0052010129444', '2020-10-01 07:31:00', 'test', 651375, 1, '1', 0),
(497, 'AA0052010060214', '2020-10-15 07:35:38', 'test', 36000, 2, '1', 0),
(498, 'AA0052010102179', '2020-10-17 12:57:54', 'test', 32000, 1, '1', 0),
(499, 'AA0052010117788', '2020-10-13 05:27:17', 'test', 33000, 2, '1', 0),
(500, 'AA0052010184010', '2020-10-04 11:20:14', 'test', 28000, 2, '1', 0),
(501, 'AA0052010197192', '2020-10-11 01:49:06', 'test', 51000, 2, '1', 0),
(503, 'AA0012010219033', '2020-10-21 06:22:02', 'test', 22000, 1, '1', 0),
(504, 'AA0012010219034', '2020-10-21 06:51:42', 'test', 22000, 1, '1', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaction_out`
--

CREATE TABLE `transaction_out` (
  `id` int(11) NOT NULL,
  `id_machine` int(11) NOT NULL,
  `id_trx_detail` int(11) NOT NULL,
  `id_material` int(11) NOT NULL,
  `amount` float NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `auth_assignment`
--
ALTER TABLE `auth_assignment`
  ADD PRIMARY KEY (`item_name`,`user_id`),
  ADD KEY `idx-auth_assignment-user_id` (`user_id`);

--
-- Indeks untuk tabel `auth_item`
--
ALTER TABLE `auth_item`
  ADD PRIMARY KEY (`name`),
  ADD KEY `rule_name` (`rule_name`),
  ADD KEY `idx-auth_item-type` (`type`);

--
-- Indeks untuk tabel `auth_item_child`
--
ALTER TABLE `auth_item_child`
  ADD PRIMARY KEY (`parent`,`child`),
  ADD KEY `child` (`child`);

--
-- Indeks untuk tabel `auth_rule`
--
ALTER TABLE `auth_rule`
  ADD PRIMARY KEY (`name`);

--
-- Indeks untuk tabel `catridges`
--
ALTER TABLE `catridges`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `catridge_history`
--
ALTER TABLE `catridge_history`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `catridge_status`
--
ALTER TABLE `catridge_status`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `machine`
--
ALTER TABLE `machine`
  ADD PRIMARY KEY (`machine_code`);

--
-- Indeks untuk tabel `machine_rent`
--
ALTER TABLE `machine_rent`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `machine_status`
--
ALTER TABLE `machine_status`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `materials`
--
ALTER TABLE `materials`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `material_history`
--
ALTER TABLE `material_history`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `material_type`
--
ALTER TABLE `material_type`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent` (`parent`);

--
-- Indeks untuk tabel `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `product_category`
--
ALTER TABLE `product_category`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `product_detail`
--
ALTER TABLE `product_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `spice_level`
--
ALTER TABLE `spice_level`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tbltransaksi`
--
ALTER TABLE `tbltransaksi`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `transaction_detail`
--
ALTER TABLE `transaction_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `transaction_master`
--
ALTER TABLE `transaction_master`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `no_trx_unique` (`no_trx`);

--
-- Indeks untuk tabel `transaction_out`
--
ALTER TABLE `transaction_out`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT untuk tabel `catridges`
--
ALTER TABLE `catridges`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT untuk tabel `catridge_history`
--
ALTER TABLE `catridge_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `catridge_status`
--
ALTER TABLE `catridge_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `machine_rent`
--
ALTER TABLE `machine_rent`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `machine_status`
--
ALTER TABLE `machine_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `materials`
--
ALTER TABLE `materials`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT untuk tabel `material_history`
--
ALTER TABLE `material_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `material_type`
--
ALTER TABLE `material_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT untuk tabel `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `product_category`
--
ALTER TABLE `product_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `product_detail`
--
ALTER TABLE `product_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT untuk tabel `spice_level`
--
ALTER TABLE `spice_level`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `tbltransaksi`
--
ALTER TABLE `tbltransaksi`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=507;

--
-- AUTO_INCREMENT untuk tabel `transaction_detail`
--
ALTER TABLE `transaction_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=747;

--
-- AUTO_INCREMENT untuk tabel `transaction_master`
--
ALTER TABLE `transaction_master`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=505;

--
-- AUTO_INCREMENT untuk tabel `transaction_out`
--
ALTER TABLE `transaction_out`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

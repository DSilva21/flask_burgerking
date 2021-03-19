-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- 생성 시간: 21-03-19 09:16
-- 서버 버전: 10.4.17-MariaDB
-- PHP 버전: 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 데이터베이스: `burger`
--

-- --------------------------------------------------------

--
-- 테이블 구조 `menu`
--

CREATE TABLE `menu` (
  `burger_id` int(11) NOT NULL,
  `burger_name` varchar(20) COLLATE euckr_bin NOT NULL,
  `price` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=euckr COLLATE=euckr_bin;

--
-- 테이블의 덤프 데이터 `menu`
--

INSERT INTO `menu` (`burger_id`, `burger_name`, `price`) VALUES
(1, '스테커와퍼', 15000),
(2, '바비큐킹치킨버거', 5000),
(3, '붉은대게와퍼', 3000),
(4, '묻고더블세트', 5000),
(5, '기네스와퍼', 6000),
(6, '핫도그', 7000),
(7, '와퍼', 6000),
(8, '인기메뉴세트', 15000);

--
-- 덤프된 테이블의 인덱스
--

--
-- 테이블의 인덱스 `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`burger_id`);

--
-- 덤프된 테이블의 AUTO_INCREMENT
--

--
-- 테이블의 AUTO_INCREMENT `menu`
--
ALTER TABLE `menu`
  MODIFY `burger_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

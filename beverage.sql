-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- 생성 시간: 21-03-19 09:17
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
-- 테이블 구조 `beverage`
--

CREATE TABLE `beverage` (
  `be_id` int(11) NOT NULL,
  `be_name` varchar(20) COLLATE euckr_bin NOT NULL,
  `price` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=euckr COLLATE=euckr_bin;

--
-- 테이블의 덤프 데이터 `beverage`
--

INSERT INTO `beverage` (`be_id`, `be_name`, `price`) VALUES
(1, '콜라', 2000),
(2, '사이다', 2000),
(3, '환타', 2000),
(4, '주스', 2500),
(5, '커피', 3000);

--
-- 덤프된 테이블의 인덱스
--

--
-- 테이블의 인덱스 `beverage`
--
ALTER TABLE `beverage`
  ADD PRIMARY KEY (`be_id`);

--
-- 덤프된 테이블의 AUTO_INCREMENT
--

--
-- 테이블의 AUTO_INCREMENT `beverage`
--
ALTER TABLE `beverage`
  MODIFY `be_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

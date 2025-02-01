-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
-- Версия сервера: 8.0.30
-- Версия PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `FirstGauge`
--

CREATE DATABASE `FirstGauge`;
use `FirstGauge`;

-- --------------------------------------------------------

--
-- Структура таблицы `payment`
--

CREATE TABLE `payment` (
  `id` bigint NOT NULL,
  `user` int DEFAULT NULL,
  `sum` double NOT NULL,
  `date_payment` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `Service`
--

CREATE TABLE `Service` (
  `id` int NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `price` decimal(7,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `service_orders`
--

CREATE TABLE `service_orders` (
  `id` bigint NOT NULL,
  `user` int DEFAULT NULL,
  `service` int DEFAULT NULL,
  `date_order` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `Tariff`
--

CREATE TABLE `Tariff` (
  `id` int NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `price` decimal(7,2) DEFAULT NULL,
  `firerate` int DEFAULT NULL,
  `mass` int DEFAULT NULL,
  `barrell` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `Tariff`
--

INSERT INTO `Tariff` (`id`, `title`, `price`, `firerate`, `mass`, `barrell`) VALUES
(1, 'АКМ дерево', '1099.99', 600, 3100, 415),
(2, 'M4A1 Стандарт', '1699.99', 850, 2680, 370),
(3, 'АК-12 обр. 2016', '2199.99', 700, 3500, 415),
(4, 'SR-25 Rifle', '2899.99', 500, 4310, 508),
(5, 'Kriss Vector 9x19 Gen.2 SMG', '2659.99', 1500, 2540, 140),
(6, 'SCAR-H CQC', '3429.99', 600, 3512, 330),
(7, 'Benelli M4 Super 90', '2699.99', 250, 3800, 470),
(8, 'Glock 17 Gen.5', '1679.99', 330, 625, 114);

-- --------------------------------------------------------

--
-- Структура таблицы `tariff_orders`
--

CREATE TABLE `tariff_orders` (
  `id` bigint NOT NULL,
  `user` int DEFAULT NULL,
  `tariff` int DEFAULT NULL,
  `date_order` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `User`
--

CREATE TABLE `User` (
  `id` int NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `surname` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` varchar(250) DEFAULT NULL,
  `balance` decimal(7,2) DEFAULT '0.00',
  `password` varchar(256) DEFAULT NULL,
  `is_admin` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Индексы таблицы `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK84ao1elbe72os6v3s0jn666ra` (`user`);

--
-- Индексы таблицы `Service`
--
ALTER TABLE `Service`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `service_orders`
--
ALTER TABLE `service_orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK4ya10362ga4h37q2v7doy75p0` (`service`),
  ADD KEY `FKi6eaoad3gybvrdft758i2r1c4` (`user`);

--
-- Индексы таблицы `Tariff`
--
ALTER TABLE `Tariff`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `tariff_orders`
--
ALTER TABLE `tariff_orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKg5q20m44gllbl8bcwlavfbias` (`tariff`),
  ADD KEY `FKq93hout0tckggumm74msthrgu` (`user`);

--
-- Индексы таблицы `User`
--
ALTER TABLE `User`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `payment`
--
ALTER TABLE `payment`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `Service`
--
ALTER TABLE `Service`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `service_orders`
--
ALTER TABLE `service_orders`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `Tariff`
--
ALTER TABLE `Tariff`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `tariff_orders`
--
ALTER TABLE `tariff_orders`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `User`
--
ALTER TABLE `User`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `FK84ao1elbe72os6v3s0jn666ra` FOREIGN KEY (`user`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`user`) REFERENCES `User` (`id`);

--
-- Ограничения внешнего ключа таблицы `service_orders`
--
ALTER TABLE `service_orders`
  ADD CONSTRAINT `FK4ya10362ga4h37q2v7doy75p0` FOREIGN KEY (`service`) REFERENCES `service` (`id`),
  ADD CONSTRAINT `FKi6eaoad3gybvrdft758i2r1c4` FOREIGN KEY (`user`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `service_orders_ibfk_1` FOREIGN KEY (`user`) REFERENCES `User` (`id`),
  ADD CONSTRAINT `service_orders_ibfk_2` FOREIGN KEY (`service`) REFERENCES `Service` (`id`);

--
-- Ограничения внешнего ключа таблицы `tariff_orders`
--
ALTER TABLE `tariff_orders`
  ADD CONSTRAINT `FKg5q20m44gllbl8bcwlavfbias` FOREIGN KEY (`tariff`) REFERENCES `tariff` (`id`),
  ADD CONSTRAINT `FKq93hout0tckggumm74msthrgu` FOREIGN KEY (`user`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `tariff_orders_ibfk_1` FOREIGN KEY (`user`) REFERENCES `User` (`id`),
  ADD CONSTRAINT `tariff_orders_ibfk_2` FOREIGN KEY (`tariff`) REFERENCES `Tariff` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

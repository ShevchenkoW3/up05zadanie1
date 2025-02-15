-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Фев 15 2025 г., 12:42
-- Версия сервера: 5.7.39
-- Версия PHP: 8.0.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `up05_zadanie1`
--

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE `categories` (
  `id_category` int(11) NOT NULL,
  `name_category` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`id_category`, `name_category`) VALUES
(1, 'Ремонт дорог'),
(2, 'Ремонт детских площадок'),
(3, 'Ремонт многоквартирных домов'),
(4, 'Ремонт торговых центров'),
(5, 'Ремонт электричества');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id_user` int(11) NOT NULL,
  `fio` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `login` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id_user`, `fio`, `email`, `login`, `password`, `role`) VALUES
(1, 'Иванов Иван Иванович', 'admin@yandex.ru', 'admin', 'adminWSR', 2),
(2, 'Сидоров Владимир Анатольевич', 'customer1@yandex.ru', 'customer1', 'customer1', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `zayavki`
--

CREATE TABLE `zayavki` (
  `id_zayavki` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_category` int(11) NOT NULL,
  `name_zayavka` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `img_issue` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `img_solved` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_zayavka` datetime DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `reason_cancel` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `zayavki`
--

INSERT INTO `zayavki` (`id_zayavki`, `id_user`, `id_category`, `name_zayavka`, `description`, `img_issue`, `img_solved`, `date_zayavka`, `status`, `reason_cancel`) VALUES
(8, 2, 1, 'Ямы на дорогах', 'Очень опасно ехать по таким дорогам', 'img/8_zayavka_1.jpg', 'img/8_solved_1.jpg', '2025-02-14 15:27:39', 2, NULL),
(9, 2, 3, 'Разрушенные лестницы', 'Очень неудобно подниматься по таким лестницам', 'img/9_zayavka_2.jpg', NULL, '2025-02-15 09:31:11', 3, 'У нас не хватает времени на выполнение вашей заявки');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id_category`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`);

--
-- Индексы таблицы `zayavki`
--
ALTER TABLE `zayavki`
  ADD PRIMARY KEY (`id_zayavki`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_category` (`id_category`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `id_category` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `zayavki`
--
ALTER TABLE `zayavki`
  MODIFY `id_zayavki` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `zayavki`
--
ALTER TABLE `zayavki`
  ADD CONSTRAINT `zayavki_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `zayavki_ibfk_2` FOREIGN KEY (`id_category`) REFERENCES `categories` (`id_category`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

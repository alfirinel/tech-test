-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Авг 07 2022 г., 22:39
-- Версия сервера: 5.7.33
-- Версия PHP: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `tech_test`
--

-- --------------------------------------------------------

--
-- Структура таблицы `agents`
--

CREATE TABLE `agents` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `surname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `patronymic` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `agents`
--

INSERT INTO `agents` (`id`, `name`, `surname`, `patronymic`) VALUES
(1, 'Ольга', 'Таран', ''),
(2, 'Дмитрий', 'Неделько', '');

-- --------------------------------------------------------

--
-- Структура таблицы `done`
--

CREATE TABLE `done` (
  `id` int(10) UNSIGNED NOT NULL,
  `request_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `in_progress`
--

CREATE TABLE `in_progress` (
  `id` int(10) UNSIGNED NOT NULL,
  `request_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `new`
--

CREATE TABLE `new` (
  `id` int(11) NOT NULL,
  `request_id` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `new`
--

INSERT INTO `new` (`id`, `request_id`) VALUES
(1, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `requests`
--

CREATE TABLE `requests` (
  `id` int(10) UNSIGNED NOT NULL,
  `agent_id` int(10) UNSIGNED NOT NULL,
  `disconnect` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `verification_cheapening` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `technical_issue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `other` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `total` varchar(255) COLLATE utf8mb4_unicode_ci GENERATED ALWAYS AS ((((`disconnect` + `verification_cheapening`) + `technical_issue`) + `other`)) STORED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `requests`
--

INSERT INTO `requests` (`id`, `agent_id`, `disconnect`, `verification_cheapening`, `technical_issue`, `other`, `created_at`, `updated_at`) VALUES
(1, 1, '161', '145', '108', '29', '2022-08-07 14:04:09', '2022-08-07 15:32:28'),
(2, 2, '159', '181', '133', '24', '2022-08-07 14:04:09', '2022-08-07 14:04:09');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `agents`
--
ALTER TABLE `agents`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `done`
--
ALTER TABLE `done`
  ADD PRIMARY KEY (`id`),
  ADD KEY `request_id` (`request_id`);

--
-- Индексы таблицы `in_progress`
--
ALTER TABLE `in_progress`
  ADD PRIMARY KEY (`id`),
  ADD KEY `request_id` (`request_id`);

--
-- Индексы таблицы `new`
--
ALTER TABLE `new`
  ADD PRIMARY KEY (`id`),
  ADD KEY `request_id` (`request_id`);

--
-- Индексы таблицы `requests`
--
ALTER TABLE `requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `agent_id` (`agent_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `agents`
--
ALTER TABLE `agents`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `done`
--
ALTER TABLE `done`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `in_progress`
--
ALTER TABLE `in_progress`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `new`
--
ALTER TABLE `new`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `requests`
--
ALTER TABLE `requests`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `done`
--
ALTER TABLE `done`
  ADD CONSTRAINT `done_ibfk_1` FOREIGN KEY (`request_id`) REFERENCES `requests` (`id`);

--
-- Ограничения внешнего ключа таблицы `in_progress`
--
ALTER TABLE `in_progress`
  ADD CONSTRAINT `in_progress_ibfk_1` FOREIGN KEY (`request_id`) REFERENCES `requests` (`id`);

--
-- Ограничения внешнего ключа таблицы `new`
--
ALTER TABLE `new`
  ADD CONSTRAINT `new_ibfk_1` FOREIGN KEY (`request_id`) REFERENCES `requests` (`id`);

--
-- Ограничения внешнего ключа таблицы `requests`
--
ALTER TABLE `requests`
  ADD CONSTRAINT `requests_ibfk_1` FOREIGN KEY (`agent_id`) REFERENCES `agents` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

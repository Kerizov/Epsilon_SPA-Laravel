-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Май 30 2022 г., 22:38
-- Версия сервера: 10.4.24-MariaDB
-- Версия PHP: 8.1.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

--
-- База данных: `epsilon_db`
--

-- --------------------------------------------------------

--
-- Структура таблицы `air_routes`
--

CREATE TABLE `air_routes` (
                              `id` bigint(20) UNSIGNED NOT NULL,
                              `carrier` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
                              `departure` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
                              `departure_city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
                              `time` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
                              `destination` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
                              `destination_city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
                              `arrival_date` date DEFAULT NULL,
                              `departure_date` date DEFAULT NULL,
                              `status_of_places` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                              `amount_places` int(11) DEFAULT NULL,
                              `price` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
                              `created_at` timestamp NULL DEFAULT NULL,
                              `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `air_routes`
--

INSERT INTO `air_routes` (`id`, `carrier`, `departure`, `departure_city`, `time`, `destination`, `destination_city`, `arrival_date`, `departure_date`, `status_of_places`, `amount_places`, `price`, `created_at`, `updated_at`) VALUES
(1, 'British airline', '9:50 SVO', 'Москва', '2 часа 0 минут', '11:50 ABA', 'Абакан', '2022-05-16', '2022-05-15', 'Эконом', 34, '9 000', NULL, NULL),
(2, 'Delta airline', '14:30 CIU', 'Солт Сте Мари', '5 часа 20 минут', '19:50 SVO', 'Москва', '2022-05-16', '2022-05-15', 'Бизнес', 45, '24 000', NULL, NULL),
(3, 'Аэрофлот', '16:20 LED', 'Санкт Петербург', '1 часа 30 минут', '17:50 SVO', 'Москва', '2022-05-16', '2022-05-15', 'Люкс', 23, '20 500', NULL, NULL),
(4, 'Ural airlines', '19:00 KUF', 'Самара', '4 часа 40 минут', '23:40 SVO', 'Москва', '2022-05-17', '2022-05-16', 'Бизнес', 34, '15 600', NULL, NULL),
(5, 'British airline', '10:20 SVO', 'Москва', '2 часа 0 минут', '12:20 LED', 'Санкт Петербург', '2022-05-17', '2022-05-16', 'Люкс', 11, '18 500', NULL, NULL),
(6, 'British airline', '14:20 SVO', 'Москва', '6 часа 10 минут', '18:30 KUF', 'Самара', '2022-05-17', '2022-05-16', 'Эконом', 34, '7 500', NULL, NULL),
(7, 'British airline', '16:40 SVO', 'Москва', '2 часа 50 минут', '19:30 CIU', 'Солт Сте Мари', '2022-05-17', '2022-05-16', 'Бизнес', 34, '19 500', NULL, NULL),
(8, 'Ural airlines', '12:10 KUF', 'Самара', '6 часа 30 минут', '18:40 LED', 'Санкт Петербург', '2022-05-17', '2022-05-16', 'Люкс', 34, '21 600', NULL, NULL),
(9, 'British airline', '10:10 SVO', 'Москва', '2 часа 0 минут', '12:10 ABA', 'Абакан', '2022-05-16', '2022-05-15', 'Эконом', 34, '8 000', NULL, NULL),
(10, 'British airline', '10:30 SVO', 'Москва', '2 часа 0 минут', '12:30 ABA', 'Абакан', '2022-05-16', '2022-05-15', 'Бизнес', 32, '12 000', NULL, NULL),
(11, 'British airline', '10:50 SVO', 'Москва', '2 часа 0 минут', '12:50 ABA', 'Абакан', '2022-05-16', '2022-05-15', 'Бизнес', 34, '12 000', NULL, NULL),
(12, 'British airline', '11:10 SVO', 'Москва', '2 часа 0 минут', '13:10 ABA', 'Абакан', '2022-05-16', '2022-05-15', 'Люкс', 23, '23 000', NULL, NULL),
(14, 'Аэрофлот', '9:55 SVO', 'Москва', '2 часа 0 минут', '11:55 ABA', 'Абакан', '2022-05-16', '2022-05-15', 'Эконом', 34, '8 900', NULL, NULL),
(15, 'Аэрофлот', '10:15 SVO', 'Москва', '2 часа 0 минут', '12:15 ABA', 'Абакан', '2022-05-16', '2022-05-15', 'Люкс', 34, '22 950', NULL, NULL),
(16, 'Аэрофлот', '10:35 SVO', 'Москва', '2 часа 0 минут', '12:35 ABA', 'Абакан', '2022-05-16', '2022-05-15', 'Эконом', 43, '7 740', NULL, NULL),
(17, 'British airline', '10:40 SVO', 'Москва', '2 часа 50 минут', '13:30 CIU', 'Солт Сте Мари', '2022-05-17', '2022-05-16', 'Эконом', 12, '8 300', NULL, NULL),
(18, 'British airline', '11:00 SVO', 'Москва', '2 часа 50 минут', '13:50 CIU', 'Солт Сте Мари', '2022-05-17', '2022-05-16', 'Бизнес', 45, '19 250', NULL, NULL),
(19, 'British airline', '12:20 SVO', 'Москва', '2 часа 0 минут', '14:20 LED', 'Санкт Петербург', '2022-05-17', '2022-05-16', 'Люкс', 34, '26 500', NULL, NULL),
(20, 'British airline', '16:20 SVO', 'Москва', '2 часа 0 минут', '18:20 LED', 'Санкт Петербург', '2022-05-18', '2022-05-17', 'Эконом', 34, '6 500', NULL, NULL),
(21, 'British airline', '18:20 SVO', 'Москва', '2 часа 0 минут', '20:20 LED', 'Санкт Петербург', '2022-05-18', '2022-05-17', 'Бизнес', 34, '16 200', NULL, NULL),
(22, 'Ural airlines', '14:10 KUF', 'Самара', '6 часа 30 минут', '20:40 LED', 'Санкт Петербург', '2022-05-18', '2022-05-17', 'Люкс', 34, '28 500', NULL, NULL),
(23, 'Ural airlines', '16:10 KUF', 'Самара', '6 часа 30 минут', '22:40 LED', 'Санкт Петербург', '2022-05-18', '2022-05-17', 'Эконом', 34, '6 200', NULL, NULL),
(24, 'Ural airlines', '18:10 KUF', 'Самара', '6 часа 30 минут', '01:40 LED', 'Санкт Петербург', '2022-05-18', '2022-05-17', 'Бизнес', 34, '19 900', NULL, NULL),
(25, 'Ural airlines', '12:00 KUF', 'Самара', '4 часа 40 минут', '16:40 SVO', 'Москва', '2022-05-18', '2022-05-17', 'Люкс', 34, '32 900', NULL, NULL),
(26, 'Ural airlines', '13:00 KUF', 'Самара', '4 часа 40 минут', '17:40 SVO', 'Москва', '2022-05-18', '2022-05-17', 'Эконом', 34, '5 950', NULL, NULL),
(27, 'Ural airlines', '14:00 KUF', 'Самара', '4 часа 40 минут', '18:40 SVO', 'Москва', '2022-05-18', '2022-05-17', 'Бизнес', 34, '15 950', NULL, NULL),
(28, 'Ural airlines', '15:00 KUF', 'Самара', '4 часа 40 минут', '19:40 SVO', 'Москва', '2022-05-18', '2022-05-17', 'Люкс', 34, '24 750', NULL, NULL),
(29, 'Ural airlines', '11:20 LED', 'Санкт Петербург', '2 часа 0 минут', '13:20 SVO', 'Москва', '2022-05-16', '2022-05-15', 'Эконом', 25, '7 100', NULL, NULL),
(30, 'Ural airlines', '12:20 LED', 'Санкт Петербург', '2 часа 0 минут', '14:20 SVO', 'Москва', '2022-05-16', '2022-05-15', 'Эконом', 25, '7 500', NULL, NULL),
(31, 'Ural airlines', '13:20 LED', 'Санкт Петербург', '2 часа 0 минут', '15:20 SVO', 'Москва', '2022-05-16', '2022-05-15', 'Эконом', 25, '7 700', NULL, NULL),
(32, 'Ural airlines', '15:20 LED', 'Санкт Петербург', '2 часа 0 минут', '17:20 SVO', 'Москва', '2022-05-17', '2022-05-16', 'Бизнес', 25, '18 700', NULL, NULL),
(33, 'Ural airlines', '11:25 LED', 'Санкт Петербург', '2 часа 0 минут', '13:25 ABA', 'Абакан', '2022-05-17', '2022-05-16', 'Эконом', 25, '8 300', NULL, NULL),
(34, 'Ural airlines', '13:25 LED', 'Санкт Петербург', '2 часа 0 минут', '15:25 ABA', 'Абакан', '2022-05-17', '2022-05-16', 'Бизнес', 25, '16 800', NULL, NULL),
(35, 'Delta airline', '12:30 CIU', 'Солт Сте Мари', '5 часа 20 минут', '17:50 SVO', 'Москва', '2022-05-18', '2022-05-17', 'Бизнес', 25, '17 500', NULL, NULL),
(36, 'Delta airline', '13:30 CIU', 'Солт Сте Мари', '5 часа 20 минут', '18:50 SVO', 'Москва', '2022-05-18', '2022-05-17', 'Люкс', 25, '32 800', NULL, NULL),
(37, 'Delta airline', '15:30 CIU', 'Солт Сте Мари', '5 часа 20 минут', '20:50 SVO', 'Москва', '2022-05-18', '2022-05-17', 'Люкс', 25, '31 800', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `bookings`
--

CREATE TABLE `bookings` (
                            `user_id` int(11) NOT NULL,
                            `air_route_id` int(11) NOT NULL,
                            `confirm` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `bookings`
--

INSERT INTO `bookings` (`user_id`, `air_route_id`, `confirm`) VALUES
(147, 1, 0),
(139, 19, 1),
(152, 5, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `cities`
--

CREATE TABLE `cities` (
                          `id` bigint(20) UNSIGNED NOT NULL,
                          `city_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
                          `created_at` timestamp NULL DEFAULT NULL,
                          `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `cities`
--

INSERT INTO `cities` (`id`, `city_name`, `created_at`, `updated_at`) VALUES
(1, 'Москва', NULL, NULL),
(2, 'Санкт Петербург', NULL, NULL),
(3, 'Абакан', NULL, NULL),
(4, 'Самара', NULL, NULL),
(5, 'Солт Сте Мари', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `failed_jobs`
--

CREATE TABLE `failed_jobs` (
                               `id` bigint(20) UNSIGNED NOT NULL,
                               `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
                               `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
                               `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
                               `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
                               `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
                               `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `migrations`
--

CREATE TABLE `migrations` (
                              `id` int(10) UNSIGNED NOT NULL,
                              `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
                              `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(21, '2014_10_12_000000_create_users_table', 1),
(22, '2014_10_12_100000_create_password_resets_table', 1),
(23, '2019_08_19_000000_create_failed_jobs_table', 1),
(24, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(25, '2022_04_15_203731_create_people_table', 1),
(29, '2022_04_17_053346_create_posts_table', 2),
(31, '2022_04_25_171402_add_column_verify_to_users_table', 3),
(33, '2022_04_25_171756_delete_columns_to_users_table', 4),
(34, '2022_04_27_201636_add_column_img_to_posts_table', 5),
(35, '2022_05_02_104801_rename_column_login', 6),
(38, '2022_05_10_131145_create_air_routes_table', 7),
(40, '2022_05_12_152349_create_country_table', 8),
(41, '2022_05_12_171342_create_cities_table', 9),
(47, '2022_05_13_203332_add_columns_to_air_routes_table', 10),
(48, '2022_05_14_060630_create_statuses_table', 11);

-- --------------------------------------------------------

--
-- Структура таблицы `password_resets`
--

CREATE TABLE `password_resets` (
                                   `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
                                   `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
                                   `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `people`
--

CREATE TABLE `people` (
                          `id` bigint(20) UNSIGNED NOT NULL,
                          `login` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
                          `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
                          `created_at` timestamp NULL DEFAULT NULL,
                          `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
                                          `id` bigint(20) UNSIGNED NOT NULL,
                                          `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
                                          `tokenable_id` bigint(20) UNSIGNED NOT NULL,
                                          `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
                                          `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
                                          `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                          `last_used_at` timestamp NULL DEFAULT NULL,
                                          `created_at` timestamp NULL DEFAULT NULL,
                                          `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `posts`
--

CREATE TABLE `posts` (
                         `id` int(10) UNSIGNED NOT NULL,
                         `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
                         `text` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
                         `img` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                         `created_at` timestamp NULL DEFAULT NULL,
                         `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `posts`
--

INSERT INTO `posts` (`id`, `title`, `text`, `img`, `created_at`, `updated_at`) VALUES
(1, 'Летать - легко!', 'Мы упрощаем путешествие от бронирования до полета и даем вам больше контроля. Узнайте,\r\n                как мы отменяем сборы за внесение изменений и упрощаем корректировку ваших планов\r\n                поездок.', '1', NULL, NULL),
(2, 'Почувствуй чистоту!', 'Мы делаем все возможное, чтобы обеспечить безопасное, здоровое и чистое путешествие. Забота о наших клиентах и сотрудниках является нашим главным приоритетом.', '3', NULL, NULL),
(5, 'В аэропортах Лондона отменены десятки рейсов', 'Десятки рейсов отменены в аэропортах Лондона из-за нехватки персонала на фоне наплыва пассажиров перед пасхальными праздничными выходными, пишет газета Guardian.', '2', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `statuses`
--

CREATE TABLE `statuses` (
                            `id` bigint(20) UNSIGNED NOT NULL,
                            `status_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
                            `created_at` timestamp NULL DEFAULT NULL,
                            `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `statuses`
--

INSERT INTO `statuses` (`id`, `status_name`, `created_at`, `updated_at`) VALUES
(1, 'Эконом', NULL, NULL),
(2, 'Бизнес', NULL, NULL),
(3, 'Люкс', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
                         `id` bigint(20) UNSIGNED NOT NULL,
                         `email` varchar(55) COLLATE utf8mb4_unicode_ci NOT NULL,
                         `firstname` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                         `lastname` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                         `phone_number` varchar(12) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                         `passport_series` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                         `passport_number` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                         `inn` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                         `mail_index` varchar(7) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                         `address` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                         `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
                         `email_verified_at` timestamp NULL DEFAULT NULL,
                         `role_id` int(11) DEFAULT NULL,
                         `created_at` timestamp NULL DEFAULT NULL,
                         `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `email`, `firstname`, `lastname`, `phone_number`, `passport_series`, `passport_number`, `inn`, `mail_index`, `address`, `password`, `email_verified_at`, `role_id`, `created_at`, `updated_at`) VALUES
(139, 'someMail@gmail.com', 'Степан', 'Коротаев', '+79773459983', '5555', '555555', '555555555555', '555555', 'ул. Тверская, д 6', '$2y$10$ND2Kzgi.fy0btGhKKe4Zu.UCyO05mLS.AVQNWAQDpgLttlBqYnh4W', NULL, NULL, '2022-05-14 05:12:25', '2022-05-29 15:11:47'),
(141, 'epsilon@gmail.com', 'Администратор', 'Главный', '+77777777777', '6666', '666666', '666666666666', '666666', 'не скажу', '$2y$10$o.yHJpXBHuLW243kX53FMOvACOV3UtE4zs1izgUscfBUHwfP094c.', NULL, NULL, '2022-05-17 17:03:32', '2022-05-22 15:32:30'),
(147, 'stepanok2200@gmail.com', 'Степан', 'Коротаев', NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$BypQ6sfzAMf831yWfYuc6uXCS7dXWADcbsyQe5FbPDi7priUPBGCu', NULL, NULL, '2022-05-23 17:49:56', '2022-05-23 17:49:56'),
(152, 'stepanok980@gmail.com', 'Степан', 'Коротаев', NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$lEYvtNsdF5TNryLADHEnYu5cMA5eErZ5R9JdSKW5Rd3I4za1d.apy', NULL, NULL, '2022-05-30 03:49:41', '2022-05-30 03:49:41');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `air_routes`
--
ALTER TABLE `air_routes`
    ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `cities`
--
ALTER TABLE `cities`
    ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `failed_jobs`
--
ALTER TABLE `failed_jobs`
    ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Индексы таблицы `migrations`
--
ALTER TABLE `migrations`
    ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `password_resets`
--
ALTER TABLE `password_resets`
    ADD KEY `password_resets_email_index` (`email`);

--
-- Индексы таблицы `people`
--
ALTER TABLE `people`
    ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
    ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Индексы таблицы `posts`
--
ALTER TABLE `posts`
    ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `statuses`
--
ALTER TABLE `statuses`
    ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
    ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_login_unique` (`email`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `air_routes`
--
ALTER TABLE `air_routes`
    MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT для таблицы `cities`
--
ALTER TABLE `cities`
    MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `failed_jobs`
--
ALTER TABLE `failed_jobs`
    MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
    MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT для таблицы `people`
--
ALTER TABLE `people`
    MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
    MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `posts`
--
ALTER TABLE `posts`
    MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `statuses`
--
ALTER TABLE `statuses`
    MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
    MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=153;
COMMIT;

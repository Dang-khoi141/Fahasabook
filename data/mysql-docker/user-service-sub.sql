CREATE DATABASE IF NOT EXISTS `hafasa_user_db`;
USE `hafasa_user_db`;

-- First create the users table (before addresses that references it)
CREATE TABLE IF NOT EXISTS `users` (
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `avatar` text DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('ACTIVE','DISABLED') DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK6dotkott2kjsp8vw4d0m25fb7` (`email`),
  UNIQUE KEY `UKr43af9ap4edm43mmtq01oddj6` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Insert users data before adding addresses that reference them
INSERT INTO `users` (`created_at`, `updated_at`, `avatar`, `email`, `id`, `name`, `password`, `username`, `status`) VALUES
	('2024-12-01 20:16:50.723267', '2024-12-01 20:16:50.723267', 'https://ui-avatars.com/api/?background=random&rounded=true&bold=true&name=anh+tuan', 'tuan@gmail.com', '0d42394b-35ac-4b8f-9e96-a513388d007d', 'anh tuan', '$2a$10$0syVww3PJqxeSe3BdBMs8eY4p19fTOsJzDtFEg4Uw1.IaGcEIiJ7W', 'anhtuan', 'ACTIVE'),
	('2025-05-03 01:01:27.838603', '2025-05-22 13:50:00.395375', 'https://ui-avatars.com/api/?background=random&rounded=true&bold=true&name=phuong', 'minhphuong4203@gmail.com', '2163053e-f24e-4df3-87ac-bae060c739ff', 'phuong4203', '$2a$10$7xUMog2f1VVsWu5pdnLWyejlfPNgfNGv0GcLX7g8vS9GjubhEKoUS', 'phuong', 'ACTIVE'),
	('2024-11-29 12:17:43.055830', '2024-11-30 10:35:36.371551', 'https://ui-avatars.com/api/?background=random&rounded=true&bold=true&name=Son+Tung', 'sontung@gmail.com', '268a4722-2abf-483a-a58b-ef41dc5d7537', 'Son Tung', '$2a$12$tgItNoXui3COVzcU3wXR3u4lYmm.GTvF8xmJjGGdI2H9dJ/1dWE1O', 'sontung', 'ACTIVE'),
	('2025-05-18 14:09:12.046331', '2025-05-18 20:31:10.019662', 'https://ui-avatars.com/api/?background=random&rounded=true&bold=true&name=minhphuong', 'phuong03@gmail.com', '73f6dc23-b362-4bf1-b3c8-2adb428ba9bb', 'minhphuong4203', '$2a$10$qRnC1f/MUAQe1KbuX8DYMuiQ8dvat6HCkpgKa2oSd7Wn7s1TpW8Q.', 'phuong123', 'ACTIVE'),
	('2024-11-25 14:23:09.381710', '2025-02-17 16:39:45.727756', 'https://ui-avatars.com/api/?background=random&rounded=true&bold=true&name=Anh+Tuan', 'atuandev@gmail.com', '9b1c2041-348d-4cb4-98e5-bbf229c4a17f', 'Nguyen Phan Anh Tuan', '$2a$10$3E31D3kD020WKsrwlBxR/.YTfXDS8qfEzb6YcR0XOX/KmmRHczn9a', 'admin', 'ACTIVE');

-- Now create the addresses table that references users
CREATE TABLE IF NOT EXISTS `addresses` (
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `id` varchar(255) NOT NULL,
  `receiver_name` varchar(255) DEFAULT NULL,
  `receiver_phone` varchar(255) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,  PRIMARY KEY (`id`),
  KEY `FK1fa36y2oqhao3wgg2rw1pi459` (`user_id`),
  CONSTRAINT `FK1fa36y2oqhao3wgg2rw1pi459` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `addresses` (`created_at`, `updated_at`, `address`, `id`, `receiver_name`, `receiver_phone`, `user_id`) VALUES
	('2024-11-30 10:37:03.673998', '2024-11-30 10:37:03.674057', '34/8b Tân Xuân 5', '00864ac4-9b20-4f67-a56a-21cf8fb0a748', 'Tuan Anh', '0982728717', '268a4722-2abf-483a-a58b-ef41dc5d7537'),
	('2025-05-18 20:43:47.030657', '2025-05-18 20:43:47.030657', '27', '09cff759-1ecc-4cf9-b92b-8e9e15a22fca', 'mi', '0900000000', '73f6dc23-b362-4bf1-b3c8-2adb428ba9bb'),
	('2024-11-27 20:30:33.603955', '2024-11-27 20:30:33.603955', 'Quận 12, HCM', '53a09f78-70cb-4547-ab3f-dbe2d78a9038', 'Boi boi', '0928123121', '9b1c2041-348d-4cb4-98e5-bbf229c4a17f'),
	('2025-05-03 11:31:42.307097', '2025-05-03 11:31:42.307097', '27 đường 13', '9e0ab412-295d-4b3c-8f09-d346a375e3d2', 'Phuong', '0937395054', '2163053e-f24e-4df3-87ac-bae060c739ff');

CREATE TABLE IF NOT EXISTS `invalidated_tokens` (
  `expiry_time` datetime(6) DEFAULT NULL,
  `id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `invalidated_tokens` (`expiry_time`, `id`) VALUES
	('2025-05-27 14:44:29.000000', '0132b942-922b-4f65-a455-0b454c39216d'),
	('2025-06-01 13:17:23.000000', '03747047-75ad-433b-9774-c28bd3f7b0f6'),
	('2025-05-24 18:21:31.000000', '08e3c536-567b-4f1b-86dc-0ead55377f31'),
	('2025-05-27 15:06:25.000000', '104e50dd-f97b-40e8-98ce-b2f92ebb45ac'),
	('2025-05-28 14:39:19.000000', '13116f18-a8fc-4225-8501-0e17bd110b68'),
	('2025-05-28 14:51:00.000000', '13e4025d-d108-4429-9ff6-7a8a169a6288'),
	('2025-05-27 15:46:07.000000', '174a38db-a5f8-4dce-8d0d-0cfe64eab05e'),
	('2025-05-27 15:22:45.000000', '177a30f6-0ab4-40a3-9e5b-da505da212fe'),
	('2025-05-23 19:15:31.000000', '17c52f21-c584-4b6d-b9b8-d60eafce4253'),
	('2025-06-01 13:15:51.000000', '1893274a-0f7f-4cb3-bea0-0a9026413755'),
	('2025-05-23 19:59:00.000000', '19600fdd-d6da-41f7-b447-1283576ea2e0'),
	('2025-05-23 19:15:31.000000', '1b26fff1-9299-4b9f-9ecb-f88bac8aecef'),
	('2025-05-24 18:21:31.000000', '1ea82eca-8ac8-4e82-b765-bb2486a4dfab'),
	('2025-05-27 14:51:37.000000', '1ef6a99b-0062-449e-88fb-698f56b9b273'),
	('2025-05-23 19:59:00.000000', '21e4a0e5-fbf5-43bd-87f3-38fd269d5636'),
	('2025-05-27 14:44:29.000000', '2b3aac1d-6191-4092-8b4e-c6287e4a9dca'),
	('2025-05-27 15:52:21.000000', '2d3f1ae8-69ab-425c-915c-0d15bc33c775'),
	('2025-05-27 15:06:25.000000', '307e4bfe-2bd1-48ae-b0f9-f902ae91eec5'),
	('2025-05-23 19:59:00.000000', '32129a87-a380-4df1-a644-a293e6117549'),
	('2025-05-28 14:51:00.000000', '324a75dd-3a8f-4711-b176-c8a61b80b8cf'),
	('2025-05-24 18:21:31.000000', '329ba886-c649-49e8-9195-07befb380eb1'),
	('2025-05-27 13:20:16.000000', '32dfcae8-5178-4aa9-80cd-884c5d7589db'),
	('2025-05-27 13:33:19.000000', '34462eb3-50fd-4d83-9120-fa9a274d2c70'),
	('2025-06-01 13:15:51.000000', '389034fb-0177-4953-94b0-c8d1f7313f4f'),
	('2025-05-24 15:12:33.000000', '3b6c8929-a37c-4339-8a68-039d0382592d'),
	('2025-05-24 18:21:31.000000', '3ee68545-1fff-4e27-b3e2-a72ae2ce8dd3'),
	('2025-06-01 13:17:23.000000', '448b09b3-4032-42e4-b9d1-e5d167ad0d47'),
	('2025-05-27 15:52:21.000000', '44f75527-8beb-4247-ad89-2998ad44e63a'),
	('2025-05-27 15:26:59.000000', '4ea803ca-4ce9-40e3-af49-31e2ed7100c5'),
	('2025-05-27 13:20:16.000000', '50638ebe-81a2-4c36-8c8e-77ad04c5ed9e'),
	('2025-05-27 15:22:45.000000', '5087b286-ae7b-4ee3-93e3-4f12475d8bcf'),
	('2025-05-27 15:34:33.000000', '51b5fb91-12a0-4d53-99ae-641d7a6f5e39'),
	('2025-05-24 15:12:33.000000', '52c7f363-26aa-454a-a8f8-a813e27c7d70'),
	('2025-05-24 18:21:31.000000', '5cc7e80c-8802-49b7-8e94-0048974d5048'),
	('2025-05-27 15:06:25.000000', '5eb998ef-800d-4c54-9f73-969e410b5e7b'),
	('2025-05-27 14:49:32.000000', '623c214d-f2e3-4ec1-b724-3290946123a9'),
	('2025-05-27 15:34:33.000000', '633a9afe-558f-431a-96ed-282af62b3d21'),
	('2025-05-27 15:34:33.000000', '64500e77-7a13-4605-ad65-9e3e5ae560b3'),
	('2025-05-27 13:33:19.000000', '67f88d9c-ca07-4267-91ef-3f26eed6f762'),
	('2025-05-27 13:43:22.000000', '6a03878f-d518-47e4-9642-baf9e65630ab'),
	('2025-05-27 14:49:32.000000', '6b30827e-8b19-4bab-9b3d-57c7cad72435'),
	('2025-05-24 15:12:33.000000', '6bbc0e6b-8a32-4f1c-8c49-acb80bd2d19e'),
	('2025-05-28 14:39:19.000000', '6e1a80fa-2f1d-481a-a7ac-1164aaab56e0'),
	('2025-05-27 15:26:59.000000', '6fb4efe3-e36d-48a1-9fc8-92470e03460f'),
	('2025-05-27 13:26:53.000000', '73a53d2e-66cb-4876-8b1e-912bb4ab3eaa'),
	('2025-05-27 15:46:07.000000', '75a79f5d-5eea-474a-9b9e-c0b8c9de3eed'),
	('2025-05-28 14:39:19.000000', '782be20b-86a5-41e6-a366-0406cc432320'),
	('2025-05-27 15:46:07.000000', '7a711fdb-899e-46bf-9a8f-2bb6e90c0f24'),
	('2025-05-23 19:15:31.000000', '7bcc2e7d-c61c-46c8-bfc8-08da05bd3d76'),
	('2025-06-01 13:15:51.000000', '7c43ed10-e01e-4bc8-b07d-3cdb2682c250'),
	('2025-05-27 14:51:37.000000', '7cbc0561-afb5-445d-9bd0-5e4fc85707ad'),
	('2025-06-01 13:17:23.000000', '7d3877b3-b2c5-43c4-a277-4d45c0208c03'),
	('2025-05-27 13:26:53.000000', '7f965f32-084e-482f-a277-49979e37ddcc'),
	('2025-05-27 14:44:29.000000', '83cb4eee-27ee-4b83-bade-e0b095060119'),
	('2025-05-27 13:43:22.000000', '8b103196-ecfc-4c57-83b8-c060c36a76a9'),
	('2025-05-24 15:12:33.000000', '8c78b0ca-bb10-4dac-b5ea-7ba5347666f9'),
	('2025-05-24 18:21:31.000000', '8cc85c15-ed78-4717-98b6-10514e3c96fb'),
	('2025-05-27 14:51:37.000000', '8f8ea5f0-eeaa-445e-adcc-29229363ccc6'),
	('2025-05-23 19:15:31.000000', '9a1bbb2d-ac9e-4c1b-bb00-9ee0e05c8bbe'),
	('2025-05-28 14:51:00.000000', '9eb03e74-173a-48de-9f29-d0fe5c991613'),
	('2025-05-27 15:22:45.000000', 'a0f438ad-a069-47ed-8fa3-a0fa2c522b6f'),
	('2025-05-23 19:59:00.000000', 'a28ad0f0-5220-4d81-901a-18c2b8985187'),
	('2025-05-27 15:52:21.000000', 'a2c2b64e-e887-49ba-b503-6a366e673922'),
	('2025-05-27 14:49:32.000000', 'a52001ff-01b3-4c94-a576-fa9f7e6161e7'),
	('2025-05-27 13:33:19.000000', 'a88d2751-55a9-486a-a1bb-fc86e2a52312'),
	('2025-05-27 15:26:59.000000', 'bbe1385c-d305-4169-8784-88dc2a2f12d5'),
	('2025-05-23 19:59:00.000000', 'be66b9f7-7c3d-44e4-9e27-6bd6ec0bfd6b'),
	('2025-05-24 15:12:33.000000', 'cc8dd917-6d91-47e5-83fc-0161f8eea048'),
	('2025-05-27 13:20:16.000000', 'ce911d94-dc93-47b9-a79d-4e0b3cbb9e06'),
	('2025-05-27 14:49:32.000000', 'd0d719bf-e2c3-4e18-b8fd-2e7e231f0b8e'),
	('2025-05-28 14:51:00.000000', 'd1ead63e-7752-4e21-a20b-1888745e588b'),
	('2025-05-27 15:46:07.000000', 'd3c8d9b7-8aca-4c82-8f7e-bec02336ff52'),
	('2025-05-24 15:12:33.000000', 'd496e6d7-627b-4e50-8a69-5aba4b442da9'),
	('2025-05-23 19:59:00.000000', 'dd78488e-a861-48db-848c-c973791e435f'),
	('2025-05-24 18:21:31.000000', 'df35a846-439a-49b9-a187-f9d4e26d74d5'),
	('2025-05-27 13:43:22.000000', 'df944b3e-db38-4eac-aac7-e0b34c727f0a'),
	('2025-05-27 15:06:25.000000', 'e82412d6-f996-4146-b204-74d0f9a124de'),
	('2025-05-27 13:33:19.000000', 'e841bd8f-4353-47f4-b2f4-f114fb935d5b'),
	('2025-05-27 13:43:22.000000', 'fb83c352-61ec-4d00-a528-6c8a4f381136'),
	('2025-05-27 13:26:53.000000', 'fc3d83c9-1a0a-4a1d-87f3-3b4f365594c0'),
	('2025-05-27 15:34:33.000000', 'fc4f14fa-2c74-4691-8ee1-7fd19838d16e'),
	('2025-05-27 15:26:59.000000', 'fca205e0-dfa7-4094-9d3f-662c69f0ba49');

CREATE TABLE IF NOT EXISTS `permissions` (
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `permissions` (`description`, `name`) VALUES
	('Add user', 'USER_ADD'),
	('Delete user', 'USER_DELETE');

CREATE TABLE IF NOT EXISTS `roles` (
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `roles` (`description`, `name`) VALUES
	('Admin role', 'ADMIN'),
	('User role', 'USER');

CREATE TABLE IF NOT EXISTS `roles_permissions` (
  `permissions_name` varchar(255) NOT NULL,
  `role_name` varchar(255) NOT NULL,
  PRIMARY KEY (`permissions_name`,`role_name`),
  KEY `FK6nw4jrj1tuu04j9rk7xwfssd6` (`role_name`),
  CONSTRAINT `FK6nw4jrj1tuu04j9rk7xwfssd6` FOREIGN KEY (`role_name`) REFERENCES `roles` (`name`),
  CONSTRAINT `FK9u1xpvjxbdnkca024o6fyr7uu` FOREIGN KEY (`permissions_name`) REFERENCES `permissions` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `users_roles` (
  `roles_name` varchar(255) NOT NULL,
  `user_id` varchar(255) NOT NULL,
  PRIMARY KEY (`roles_name`,`user_id`),
  KEY `FK2o0jvgh89lemvvo17cbqvdxaa` (`user_id`),
  CONSTRAINT `FK2o0jvgh89lemvvo17cbqvdxaa` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FKmi9sfx618v14gm89cyw408hqu` FOREIGN KEY (`roles_name`) REFERENCES `roles` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `users_roles` (`roles_name`, `user_id`) VALUES
	('USER', '0d42394b-35ac-4b8f-9e96-a513388d007d'),
	('ADMIN', '2163053e-f24e-4df3-87ac-bae060c739ff'),
	('USER', '268a4722-2abf-483a-a58b-ef41dc5d7537'),
	('USER', '73f6dc23-b362-4bf1-b3c8-2adb428ba9bb'),
	('ADMIN', '9b1c2041-348d-4cb4-98e5-bbf229c4a17f');

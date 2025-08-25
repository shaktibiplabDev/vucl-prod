SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+05:30";

CREATE TABLE `address_update` (
  `id` int(11) NOT NULL,
  `application_id` varchar(50) NOT NULL,
  `user_id` int(11) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `aadhaar_no` varchar(12) NOT NULL,
  `village` varchar(100) NOT NULL,
  `district` varchar(50) NOT NULL,
  `document_path` varchar(255) DEFAULT NULL,
  `mobile_no` varchar(10) NOT NULL,
  `post` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `landmark` varchar(100) DEFAULT NULL,
  `pincode` varchar(6) NOT NULL,
  `purpose` varchar(100) NOT NULL,
  `finger1` longtext DEFAULT NULL,
  `finger2` longtext DEFAULT NULL,
  `finger3` longtext DEFAULT NULL,
  `finger4` longtext DEFAULT NULL,
  `finger5` longtext DEFAULT NULL,
  `finger6` longtext DEFAULT NULL,
  `finger7` longtext DEFAULT NULL,
  `finger8` longtext DEFAULT NULL,
  `finger9` longtext DEFAULT NULL,
  `finger10` longtext DEFAULT NULL,
  `missing_fingers` varchar(50) DEFAULT NULL,
  `submitted_at` datetime NOT NULL,
  `status` enum('pending','approved','rejected','processing') NOT NULL DEFAULT 'pending',
  `approved_at` datetime DEFAULT NULL,
  `rejected_at` datetime DEFAULT NULL,
  `rejection_reason` text DEFAULT NULL,
  `is_urgent` tinyint(1) DEFAULT 0,
  `assigned_to` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `child_enroll` (
  `id` int(11) NOT NULL,
  `application_id` varchar(50) NOT NULL,
  `user_id` int(11) NOT NULL,
  `child_name` varchar(100) NOT NULL,
  `child_dob` date NOT NULL,
  `child_gender` enum('Male','Female','Other') NOT NULL,
  `child_birthplace` varchar(100) NOT NULL,
  `child_birth_hospital` varchar(100) DEFAULT NULL,
  `child_birth_weight` float DEFAULT NULL,
  `guardian_name` varchar(100) NOT NULL,
  `guardian_relation` varchar(50) NOT NULL,
  `guardian_aadhar` varchar(12) NOT NULL,
  `guardian_mobile` varchar(10) NOT NULL,
  `guardian_email` varchar(100) DEFAULT NULL,
  `address_line1` varchar(255) NOT NULL,
  `address_line2` varchar(255) DEFAULT NULL,
  `city` varchar(50) NOT NULL,
  `district` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `pincode` varchar(6) NOT NULL,
  `landmark` varchar(100) DEFAULT NULL,
  `birth_certificate_path` varchar(255) DEFAULT NULL,
  `hospital_discharge_path` varchar(255) DEFAULT NULL,
  `guardian_id_proof_path` varchar(255) DEFAULT NULL,
  `address_proof_path` varchar(255) DEFAULT NULL,
  `guardian_photo_path` varchar(255) DEFAULT NULL,
  `child_photo_path` varchar(255) DEFAULT NULL,
  `finger1` longtext DEFAULT NULL,
  `finger2` longtext DEFAULT NULL,
  `finger3` longtext DEFAULT NULL,
  `finger4` longtext DEFAULT NULL,
  `finger5` longtext DEFAULT NULL,
  `finger6` longtext DEFAULT NULL,
  `finger7` longtext DEFAULT NULL,
  `finger8` longtext DEFAULT NULL,
  `finger9` longtext DEFAULT NULL,
  `finger10` longtext DEFAULT NULL,
  `missing_fingers` varchar(50) DEFAULT NULL,
  `submitted_at` datetime NOT NULL,
  `status` enum('pending','approved','rejected','processing') NOT NULL DEFAULT 'pending',
  `approved_at` datetime DEFAULT NULL,
  `rejected_at` datetime DEFAULT NULL,
  `rejection_reason` text DEFAULT NULL,
  `is_urgent` tinyint(1) DEFAULT 0,
  `assigned_to` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `cron_jobs` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `file_path` varchar(255) NOT NULL,
  `last_run` datetime DEFAULT NULL,
  `status` enum('pending','running','success','failed') DEFAULT 'pending',
  `last_message` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `deposits` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `order_id` varchar(100) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `status` enum('pending','completed','failed','cancelled') DEFAULT 'pending',
  `payment_method` varchar(50) NOT NULL,
  `transaction_id` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `dob_update` (
  `id` int(11) NOT NULL,
  `application_id` varchar(50) NOT NULL,
  `user_id` int(11) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `aadhaar_no` varchar(12) NOT NULL,
  `village` varchar(100) NOT NULL,
  `district` varchar(50) NOT NULL,
  `candidate_photo_path` varchar(255) DEFAULT NULL,
  `mobile_no` varchar(10) NOT NULL,
  `old_dob` date NOT NULL,
  `post` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `supporting_docs_path` varchar(255) DEFAULT NULL,
  `new_dob` date NOT NULL,
  `father_name` varchar(100) NOT NULL,
  `landmark` varchar(100) DEFAULT NULL,
  `pincode` varchar(6) NOT NULL,
  `purpose` varchar(100) NOT NULL,
  `finger1` longtext DEFAULT NULL,
  `finger2` longtext DEFAULT NULL,
  `finger3` longtext DEFAULT NULL,
  `finger4` longtext DEFAULT NULL,
  `finger5` longtext DEFAULT NULL,
  `finger6` longtext DEFAULT NULL,
  `finger7` longtext DEFAULT NULL,
  `finger8` longtext DEFAULT NULL,
  `finger9` longtext DEFAULT NULL,
  `finger10` longtext DEFAULT NULL,
  `missing_fingers` varchar(50) DEFAULT NULL,
  `submitted_at` datetime NOT NULL,
  `status` enum('pending','approved','rejected','processing') NOT NULL DEFAULT 'pending',
  `approved_at` datetime DEFAULT NULL,
  `rejected_at` datetime DEFAULT NULL,
  `rejection_reason` text DEFAULT NULL,
  `is_urgent` tinyint(1) DEFAULT 0,
  `assigned_to` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `license_config` (
  `id` int(11) NOT NULL,
  `verify_type` varchar(50) NOT NULL DEFAULT 'non_envato',
  `product_id` varchar(100) NOT NULL,
  `license_code` varchar(150) NOT NULL,
  `client_name` varchar(100) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `login_history` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `browser` varchar(255) DEFAULT NULL,
  `device` varchar(255) DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `login_time` datetime NOT NULL,
  `success` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `mobile_email_updates` (
  `id` int(11) NOT NULL,
  `application_id` varchar(50) NOT NULL,
  `user_id` int(11) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `mobile_no` varchar(10) NOT NULL,
  `father_name` varchar(100) DEFAULT NULL,
  `aadhar_no` varchar(12) NOT NULL,
  `email_id` varchar(100) NOT NULL,
  `purpose` varchar(100) NOT NULL,
  `finger1` longtext DEFAULT NULL,
  `finger2` longtext DEFAULT NULL,
  `finger3` longtext DEFAULT NULL,
  `finger4` longtext DEFAULT NULL,
  `finger5` longtext DEFAULT NULL,
  `finger6` longtext DEFAULT NULL,
  `finger7` longtext DEFAULT NULL,
  `finger8` longtext DEFAULT NULL,
  `finger9` longtext DEFAULT NULL,
  `finger10` longtext DEFAULT NULL,
  `missing_fingers` varchar(50) DEFAULT NULL,
  `submitted_at` datetime NOT NULL,
  `status` enum('pending','approved','rejected','processing') NOT NULL DEFAULT 'pending',
  `approved_at` datetime DEFAULT NULL,
  `rejected_at` datetime DEFAULT NULL,
  `rejection_reason` text DEFAULT NULL,
  `is_urgent` tinyint(1) DEFAULT 0,
  `assigned_to` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `name_update` (
  `id` int(11) NOT NULL,
  `application_id` varchar(50) NOT NULL,
  `user_id` int(11) NOT NULL,
  `old_name` varchar(100) NOT NULL,
  `new_name` varchar(100) NOT NULL,
  `father_name` varchar(100) NOT NULL,
  `aadhaar_no` varchar(12) NOT NULL,
  `dob` date NOT NULL,
  `purpose` varchar(100) NOT NULL,
  `village_town` varchar(100) NOT NULL,
  `district` varchar(50) NOT NULL,
  `landmark` varchar(100) DEFAULT NULL,
  `pincode` varchar(6) NOT NULL,
  `candidate_photo_path` varchar(255) DEFAULT NULL,
  `supporting_document_path` varchar(255) DEFAULT NULL,
  `finger1` longtext DEFAULT NULL,
  `finger2` longtext DEFAULT NULL,
  `finger3` longtext DEFAULT NULL,
  `finger4` longtext DEFAULT NULL,
  `finger5` longtext DEFAULT NULL,
  `finger6` longtext DEFAULT NULL,
  `finger7` longtext DEFAULT NULL,
  `finger8` longtext DEFAULT NULL,
  `finger9` longtext DEFAULT NULL,
  `finger10` longtext DEFAULT NULL,
  `missing_fingers` varchar(50) DEFAULT NULL,
  `submitted_at` datetime NOT NULL,
  `status` enum('pending','approved','rejected','processing') NOT NULL DEFAULT 'pending',
  `approved_at` datetime DEFAULT NULL,
  `rejected_at` datetime DEFAULT NULL,
  `rejection_reason` text DEFAULT NULL,
  `is_urgent` tinyint(1) DEFAULT 0,
  `assigned_to` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `offline_transactions` (
  `id` int(11) NOT NULL,
  `deposit_id` int(11) NOT NULL,
  `upi_id` varchar(100) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `transaction_id` varchar(100) NOT NULL,
  `status` enum('pending','approved','rejected') NOT NULL DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `operator_services` (
  `id` int(11) NOT NULL,
  `operator_id` int(11) NOT NULL,
  `service_key` varchar(50) NOT NULL,
  `price` decimal(10,2) NOT NULL DEFAULT 0.00,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `otp_tokens` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `token` varchar(6) NOT NULL,
  `email` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `expires_at` datetime NOT NULL,
  `is_used` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `passport_applications` (
  `id` int(11) NOT NULL,
  `application_id` varchar(50) NOT NULL,
  `user_id` int(11) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `middle_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) NOT NULL,
  `dob_in_digit` varchar(10) NOT NULL,
  `gender` char(1) NOT NULL,
  `birth_place` varchar(100) NOT NULL,
  `father_name_english` varchar(100) NOT NULL,
  `mother_name_english` varchar(100) NOT NULL,
  `supose_name_english` varchar(100) DEFAULT NULL,
  `house_no` varchar(50) NOT NULL,
  `street` varchar(100) DEFAULT NULL,
  `city` varchar(100) NOT NULL,
  `state` varchar(50) NOT NULL,
  `pin_code` varchar(6) NOT NULL,
  `photo_path` varchar(255) DEFAULT NULL,
  `signature_path` varchar(255) DEFAULT NULL,
  `submitted_at` datetime NOT NULL,
  `status` enum('pending','processing','approved','rejected') NOT NULL DEFAULT 'pending',
  `processed_at` datetime DEFAULT NULL,
  `remarks` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `payment_settings` (
  `id` int(11) NOT NULL,
  `gateway_name` varchar(100) NOT NULL,
  `api_url` varchar(255) NOT NULL,
  `user_token` varchar(255) NOT NULL,
  `active` tinyint(1) DEFAULT 1,
  `is_primary` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `min_amt` decimal(10,2) NOT NULL DEFAULT 1.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `prices_list` (
  `id` int(11) NOT NULL,
  `service_key` varchar(50) NOT NULL,
  `service_name` varchar(100) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `is_assignable` tinyint(1) NOT NULL DEFAULT 1,
  `max_retail_price` decimal(10,2) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `prices_list` (`id`, `service_key`, `service_name`, `price`, `is_assignable`, `max_retail_price`, `description`, `is_active`, `created_at`) VALUES
(1, 'child-enrollment', 'Child Enrollment', 100.00, 1, 120.00, 'Fee for enrolling a new child', 1, '2025-05-10 23:49:16'),
(2, 'dob-update', 'Date of Birth Update', 100.00, 1, 120.00, 'Fee for updating date of birth', 1, '2025-05-10 23:49:16'),
(3, 'address-update', 'Address Update', 120.00, 1, 140.00, 'Fee for updating address', 1, '2025-05-10 23:49:16'),
(4, 'name-update', 'Name Update', 100.00, 1, 120.00, 'Fee for updating name', 1, '2025-05-10 23:49:16'),
(5, 'mobile-email-update', 'Mobile/Email Update', 75.00, 1, 100.00, 'Fee for updating mobile number or email address', 1, '2025-05-10 23:52:58'),
(6, 'passport-application', 'Passport Applications', 10.00, 0, 10.00, 'Print Passports Instantly', 1, '2025-05-30 23:57:35');

CREATE TABLE `required_software` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `download_link` varchar(255) NOT NULL,
  `version` varchar(50) NOT NULL,
  `file_size` varchar(20) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `site_global_settings` (
  `id` int(11) NOT NULL,
  `website_name` varchar(255) NOT NULL,
  `fees` decimal(10,2) NOT NULL DEFAULT 0.00,
  `fees_enabled` tinyint(1) NOT NULL DEFAULT 1,
  `support_email` varchar(255) DEFAULT NULL,
  `logo_url` varchar(500) DEFAULT NULL,
  `maintenance_mode` tinyint(1) NOT NULL DEFAULT 0,
  `code_version` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `site_global_settings` (`id`, `website_name`, `fees`, `fees_enabled`, `support_email`, `logo_url`, `maintenance_mode`, `code_version`) VALUES
(1, 'Versaero Panel', 2.50, 1, 'support@versaero.com', '', 0, '2.0.1');

CREATE TABLE `site_settings` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `value` text NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `site_settings` (`id`, `name`, `value`, `description`, `created_at`, `updated_at`) VALUES
(1, 'referral_commission_percentage', '5', 'Percentage of deposit amount given as referral commission', '2025-06-13 02:30:00', '2025-06-13 02:30:00'),
(2, 'distributor_commission_percentage', '10', 'Percentage of deposit amount given as distributor commission', '2025-06-13 02:30:00', '2025-06-13 02:30:00');

CREATE TABLE `transactions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `type` enum('deposit','withdraw','bonus') NOT NULL,
  `status` enum('pending','completed','failed','cancelled') NOT NULL,
  `related_order_id` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `transactions_list` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `type` enum('credit','debit') NOT NULL,
  `description` text DEFAULT NULL,
  `reference_id` varchar(100) DEFAULT NULL,
  `service_type` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `upi_payments` (
  `id` int(11) NOT NULL,
  `upi_id` varchar(100) NOT NULL,
  `qr_code_image` varchar(255) NOT NULL,
  `is_default` tinyint(1) DEFAULT 0,
  `active` tinyint(1) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `wallet` decimal(10,2) NOT NULL DEFAULT 0.00,
  `bonus_wallet` decimal(10,2) NOT NULL DEFAULT 0.00,
  `currency` varchar(5) NOT NULL DEFAULT '₹',
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `user_type` enum('admin','distributor','retailer','operator') NOT NULL,
  `fees_paid` tinyint(1) NOT NULL DEFAULT 0,
  `status` enum('active','inactive') DEFAULT 'active',
  `isbanned` enum('1','0') NOT NULL DEFAULT '0',
  `distributor_id` int(11) DEFAULT NULL,
  `referral_code` varchar(50) DEFAULT NULL,
  `distributor_code` varchar(255) DEFAULT NULL,
  `referred_by` int(11) DEFAULT NULL,
  `login_attempts` int(11) DEFAULT 0,
  `last_login` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `profile_image` varchar(255) DEFAULT 'default.png',
  `two_factor_enabled` tinyint(1) DEFAULT 0,
  `two_factor_secret` varchar(16) DEFAULT NULL,
  `email_verified` tinyint(1) DEFAULT 0,
  `verification_token` varchar(100) DEFAULT NULL,
  `token_expires` datetime DEFAULT NULL,
  `last_login_ip` varchar(45) DEFAULT NULL,
  `last_login_device` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `user_fingerprints` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `finger_index` tinyint(1) NOT NULL COMMENT '1-10 for different fingers',
  `iso_template` longtext NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `withdrawal_requests` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `amount` decimal(15,2) NOT NULL,
  `payment_method` enum('upi','bank_transfer','qr_code') NOT NULL,
  `upi_id` varchar(100) DEFAULT NULL,
  `bank_account_number` varchar(50) DEFAULT NULL,
  `bank_ifsc` varchar(20) DEFAULT NULL,
  `bank_name` varchar(100) DEFAULT NULL,
  `account_holder_name` varchar(100) DEFAULT NULL,
  `qr_code_image` varchar(255) DEFAULT NULL,
  `phone_number` varchar(20) NOT NULL,
  `status` enum('pending','approved','rejected','processed') NOT NULL DEFAULT 'pending',
  `admin_notes` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

ALTER TABLE `address_update`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `application_id` (`application_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `assigned_to` (`assigned_to`);

ALTER TABLE `child_enroll`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `application_id` (`application_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `assigned_to` (`assigned_to`);

ALTER TABLE `cron_jobs`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `deposits`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `order_id` (`order_id`),
  ADD KEY `user_id` (`user_id`);

ALTER TABLE `dob_update`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `application_id` (`application_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `assigned_to` (`assigned_to`);

ALTER TABLE `license_config`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `login_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

ALTER TABLE `mobile_email_updates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `application_id` (`application_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `assigned_to` (`assigned_to`);

ALTER TABLE `name_update`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `application_id` (`application_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `assigned_to` (`assigned_to`);

ALTER TABLE `offline_transactions`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `operator_services`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `operator_service` (`operator_id`,`service_key`),
  ADD KEY `service_key` (`service_key`);

ALTER TABLE `otp_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

ALTER TABLE `passport_applications`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `application_id_UNIQUE` (`application_id`),
  ADD KEY `user_id` (`user_id`);

ALTER TABLE `payment_settings`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `prices_list`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `service_key` (`service_key`);

ALTER TABLE `required_software`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `site_global_settings`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `site_settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

ALTER TABLE `transactions_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

ALTER TABLE `upi_payments`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `distributor_id` (`distributor_id`);

ALTER TABLE `user_fingerprints`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_finger` (`user_id`,`finger_index`);

ALTER TABLE `withdrawal_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `status` (`status`);

ALTER TABLE `address_update`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `child_enroll`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `cron_jobs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `deposits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `dob_update`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `license_config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `login_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `mobile_email_updates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `name_update`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `offline_transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `operator_services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `otp_tokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `passport_applications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `payment_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `prices_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

ALTER TABLE `required_software`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `site_global_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

ALTER TABLE `site_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

ALTER TABLE `transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `transactions_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `upi_payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `user_fingerprints`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `withdrawal_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `address_update`
  ADD CONSTRAINT `address_update_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `address_update_ibfk_2` FOREIGN KEY (`assigned_to`) REFERENCES `users` (`id`);

ALTER TABLE `child_enroll`
  ADD CONSTRAINT `child_enroll_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `child_enroll_ibfk_2` FOREIGN KEY (`assigned_to`) REFERENCES `users` (`id`);

ALTER TABLE `deposits`
  ADD CONSTRAINT `deposits_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

ALTER TABLE `dob_update`
  ADD CONSTRAINT `dob_update_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `dob_update_ibfk_2` FOREIGN KEY (`assigned_to`) REFERENCES `users` (`id`);

ALTER TABLE `login_history`
  ADD CONSTRAINT `login_history_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

ALTER TABLE `mobile_email_updates`
  ADD CONSTRAINT `mobile_email_updates_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `mobile_email_updates_ibfk_2` FOREIGN KEY (`assigned_to`) REFERENCES `users` (`id`);

ALTER TABLE `name_update`
  ADD CONSTRAINT `name_update_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `name_update_ibfk_2` FOREIGN KEY (`assigned_to`) REFERENCES `users` (`id`);

ALTER TABLE `operator_services`
  ADD CONSTRAINT `operator_services_ibfk_1` FOREIGN KEY (`operator_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `operator_services_ibfk_2` FOREIGN KEY (`service_key`) REFERENCES `prices_list` (`service_key`) ON DELETE CASCADE;

ALTER TABLE `otp_tokens`
  ADD CONSTRAINT `otp_tokens_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

ALTER TABLE `passport_applications`
  ADD CONSTRAINT `passport_applications_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

ALTER TABLE `transactions_list`
  ADD CONSTRAINT `transactions_list_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`distributor_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

ALTER TABLE `user_fingerprints`
  ADD CONSTRAINT `user_fingerprints_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

ALTER TABLE `withdrawal_requests`
  ADD CONSTRAINT `withdrawal_requests_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;
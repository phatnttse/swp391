CREATE DATABASE IF NOT EXISTS eFurniture;
USE eFurniture;



CREATE TABLE `user` (
  `user_id` varchar(255) PRIMARY KEY NOT NULL,
  `email` varchar(255) NOT NULL,
  `verified_email` varchar(10) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `given_name` varchar(255) NOT NULL,
  `family_name` varchar(255) NOT NULL,
  `phone` varchar(12) NOT NULL,
  `picture` varchar(255),
  `address` varchar(255),
  `date_of_birth` date,
  `role` int NOT NULL,
  `created_at` datetime
);

CREATE TABLE `role` (
  `role_id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL
);

CREATE TABLE `product` (
  `product_id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `category_id` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `price` int NOT NULL,
  `quantity` int NOT NULL,
  `discount` int,
  `thumbnail` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `created_at` datetime
);

CREATE TABLE `category` (
  `category_id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL
);

CREATE TABLE `order` (
  `order_id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(12) NOT NULL,
  `shipping_address` varchar(255) NOT NULL,
  `note` longtext,
  `status` varchar(50) NOT NULL,
  `payment_type` varchar(50) NOT NULL,
  `created_at` timestamp
);

CREATE TABLE `order_detail` (
  `id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `price` int NOT NULL,
  `transport_fee` int,
  `quantity` int NOT NULL,
  `total_money` int NOT NULL
);

CREATE TABLE `cart` (
  `cart_id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) NOT NULL,
  `product_id` int NOT NULL,
  `total_money` int NOT NULL
);

CREATE TABLE `payment` (
  `payment_id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) NOT NULL,
  `order_id` int NOT NULL
);

ALTER TABLE `product` ADD FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`);

ALTER TABLE `order` ADD FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

ALTER TABLE `cart` ADD FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

ALTER TABLE `cart` ADD FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`);

ALTER TABLE `payment` ADD FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

ALTER TABLE `order_detail` ADD FOREIGN KEY (`order_id`) REFERENCES `order` (`order_id`);

ALTER TABLE `order_detail` ADD FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`);

ALTER TABLE `user` ADD FOREIGN KEY (`role`) REFERENCES `role` (`role_id`);

ALTER TABLE `payment` ADD FOREIGN KEY (`order_id`) REFERENCES `order` (`order_id`);

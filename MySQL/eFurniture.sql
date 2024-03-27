CREATE DATABASE IF NOT EXISTS eFurniture;
USE eFurniture;


CREATE TABLE `users` (
    `user_id` VARCHAR(255) PRIMARY KEY NOT NULL,
    `email` VARCHAR(255) NOT NULL,
    `password` VARCHAR(255),
    `name` VARCHAR(255) NOT NULL,
    `given_name` VARCHAR(255) NOT NULL,
    `family_name` VARCHAR(255) NOT NULL,
    `phone` VARCHAR(12),
    `picture` VARCHAR(255),
    `address` VARCHAR(255),
    `google_id` VARCHAR(255),
    `role_id` INT NOT NULL,
	`created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `deleted` BOOLEAN DEFAULT FALSE NOT NULL
);


CREATE TABLE `roles` (
  `role_id` int PRIMARY KEY NOT NULL,
  `name` varchar(50) NOT NULL
);

CREATE TABLE `products` (
    `product_id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `category_id` INT NOT NULL,
    `title` VARCHAR(255) NOT NULL,
    `price` INT NOT NULL,
    `quantity` INT NOT NULL, 
    `discount` INT,
    `thumbnail` VARCHAR(255) NOT NULL,
    `description` LONGTEXT,
    `purchases` INT DEFAULT 0,
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `categories` (
  `category_id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `thumbnail` varchar(200) NULL
);


CREATE TABLE `wishlist` (
	`id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `product_id` INT NOT NULL,
	`user_id` VARCHAR(255) NOT NULL,
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `orders` (
    `order_id` VARCHAR(10) PRIMARY KEY NOT NULL,
    `user_id` VARCHAR(255) NOT NULL,
    `email` VARCHAR(255) NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `phone` VARCHAR(12) NOT NULL,
    `shipping_address` VARCHAR(255) NOT NULL,
    `note` LONGTEXT,
    `status` INT NOT NULL,
    `previous_status` INT NOT NULL,
    `payment_status` BOOLEAN NOT NULL,
    `payment_method` VARCHAR(50) NOT NULL,
    `amount` INT NOT NULL,
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `order_status` (
    `status_id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL
);

CREATE TABLE `order_details` (
    `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `order_id` VARCHAR(10) NOT NULL,
    `product_id` INT NOT NULL,
    `title` VARCHAR(255) NOT NULL,
    `price` INT NOT NULL,
    `quantity` INT NOT NULL,
    `thumbnail` VARCHAR(255) NOT NULL,
    `total_money` INT NOT NULL
);

CREATE TABLE `carts` (
    `cart_id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `user_id` VARCHAR(255) NOT NULL,
    `product_id` INT NOT NULL,
    `title` VARCHAR(255) NOT NULL,
    `thumbnail` VARCHAR(255) NOT NULL,
    `quantity` INT NOT NULL,
    `price` INT NOT NULL
);


CREATE TABLE `payments` (
    `payment_id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `user_id` VARCHAR(255) NOT NULL,
    `order_id` VARCHAR(10)  NOT NULL
);

CREATE TABLE `request_cancellations` (
    `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `user_id` VARCHAR(255) NOT NULL,
    `order_id` VARCHAR(10)  NOT NULL,
    `reason` VARCHAR(255),
    `request_status` boolean NOT NULL,
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO `order_status` (`name`) VALUES
    ('Đang chờ xác nhận'),
    ('Đã xác nhận'),
    ('Đã gửi cho đơn vị vận chuyển'),
    ('Đang giao hàng'),
    ('Giao hàng thành công'),
    ('Đang chờ xác nhận huỷ'),
    ('Đã huỷ');
    



DELIMITER $$

CREATE TRIGGER TR_Order_Update AFTER UPDATE ON orders 
FOR EACH ROW
BEGIN
    DECLARE product_quantity INT;
    DECLARE product_id_found INT;	

    -- Kiểm tra nếu trạng thái đơn hàng đã được thay đổi từ 4 (Đang giao hàng) sang 5 (Giao hàng thành công)
    IF OLD.status = 4 AND NEW.status = 5 THEN
        -- Tìm kiếm product_id từ bảng order_details dựa trên order_id
        SELECT od.product_id INTO product_id_found
        FROM order_details od
        WHERE od.order_id = NEW.order_id;

        -- Kiểm tra xem product_id đã được tìm thấy hay không
        IF product_id_found IS NOT NULL THEN
            -- Nếu tìm thấy product_id, tiến hành lấy số lượng sản phẩm từ bảng order_details
            SELECT od.quantity INTO product_quantity
            FROM order_details od
            WHERE od.order_id = NEW.order_id AND od.product_id = product_id_found;

            -- Giảm số lượng sản phẩm trong kho và tăng lượt mua
            UPDATE products 
            SET quantity = quantity - product_quantity,
                purchases = purchases + product_quantity
            WHERE product_id = product_id_found;
        END IF;
    END IF;
END$$

DELIMITER ;





ALTER TABLE `products` ADD FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`);

ALTER TABLE `orders` ADD FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

ALTER TABLE `carts` ADD FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

ALTER TABLE `carts` ADD FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

ALTER TABLE `payments` ADD FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

ALTER TABLE `order_details` ADD FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`);

ALTER TABLE `order_details` ADD FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

ALTER TABLE `users` ADD FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`);

ALTER TABLE `payments` ADD FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`);

ALTER TABLE `orders` ADD FOREIGN KEY (`status`) REFERENCES `order_status` (`status_id`);

ALTER TABLE `request_cancellations` ADD FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

ALTER TABLE `request_cancellations` ADD FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`);

ALTER TABLE `wishlist` ADD FOREIGN KEY (`user_id`) REFERENCES `users`(`user_id`);

ALTER TABLE `wishlist`ADD FOREIGN KEY (`product_id`) REFERENCES `products`(`product_id`);





INSERT INTO categories (category_id, name, thumbnail) VALUES
  (1, 'Bàn ăn', 'Bàn ăn 4 chân cao cấp.png'),
  (2, 'Đèn', 'Đèn bàn cao cấp 2.png'),
  (3, 'Ghế', 'Ghế trơn cao cấp.png'),
  (4, 'Giá treo', 'Giá treo quần áo cao cấp chân trụ.png'),
  (5, 'Kệ treo tường', 'Kệ treo tường xu hướng mới.png'),
  (6, 'Tủ quần áo', 'Tủ quần áo 3 cửa 6 ngăn.png');
  
  
INSERT INTO products (category_id, title, price, quantity, discount, thumbnail, description) VALUES 
(1, 'Bàn ăn 4 chân cao cấp', 5595000, 10, 10, 'Bàn ăn 4 chân cao cấp.png', 
'Được sản xuất với khung được sản xuất tại Ý, lắp ráp và may tại Bỉ, Đức, Pháp, Mỹ, Nhật với các loại vải và da cao cấp, chăn ga gối đệm của chúng tôi là 100% của Châu Âu. Không giống như các đối thủ cạnh tranh của chúng tôi, các cơ chế của chúng tôi được thực hiện qua nhiều năm và sẽ không thất bại.'),

(1, 'Bàn ăn đá thiêu kết', 3960000, 10, 15, 'Bàn ăn đá thiêu kết.png', 
'Được sản xuất với khung được sản xuất tại Ý, lắp ráp và may tại Bỉ, Đức, Pháp, Mỹ, Nhật với các loại vải và da cao cấp, chăn ga gối đệm của chúng tôi là 100% của Châu Âu. Không giống như các đối thủ cạnh tranh của chúng tôi, các cơ chế của chúng tôi được thực hiện qua nhiều năm và sẽ không thất bại.'),

(1, 'Bàn ăn MAEVE cao cấp', 10192000, 20, 20, 'Bàn ăn MAEVE cao cấp.png', 
'Được sản xuất với khung được sản xuất tại Ý, lắp ráp và may tại Bỉ, Đức, Pháp, Mỹ, Nhật với các loại vải và da cao cấp, chăn ga gối đệm của chúng tôi là 100% của Châu Âu. Không giống như các đối thủ cạnh tranh của chúng tôi, các cơ chế của chúng tôi được thực hiện qua nhiều năm và sẽ không thất bại.'),

(1, 'Bàn ăn 4 chân gia đình cao cấp', 5100000, 10, 19, 'Bàn ăn 4 chân gia đình cao cấp.png', 
'Được sản xuất với khung được sản xuất tại Ý, lắp ráp và may tại Bỉ, Đức, Pháp, Mỹ, Nhật với các loại vải và da cao cấp, chăn ga gối đệm của chúng tôi là 100% của Châu Âu. Không giống như các đối thủ cạnh tranh của chúng tôi, các cơ chế của chúng tôi được thực hiện qua nhiều năm và sẽ không thất bại.'),

(1, 'Bàn ăn mở rộng cao cấp', 2590000, 10, 20, 'Bàn ăn mở rộng cao cấp.png','Được sản xuất với khung được sản xuất tại Ý, lắp ráp và may tại Bỉ, Đức, Pháp, Mỹ, Nhật với các loại vải và da cao cấp, chăn ga gối đệm của chúng tôi là 100% của Châu Âu. Không giống như các đối thủ cạnh tranh của chúng tôi, các cơ chế của chúng tôi được thực hiện qua nhiều năm và sẽ không thất bại.'),

(1, 'Bàn gỗ cao cấp 4 chân', 2490000, 10, 20, 'Bàn gỗ cao cấp 4 chân.png', 
'Được sản xuất với khung được sản xuất tại Ý, lắp ráp và may tại Bỉ, Đức, Pháp, Mỹ, Nhật với các loại vải và da cao cấp, chăn ga gối đệm của chúng tôi là 100% của Châu Âu. Không giống như các đối thủ cạnh tranh của chúng tôi, các cơ chế của chúng tôi được thực hiện qua nhiều năm và sẽ không thất bại.');


INSERT INTO products (category_id, title, price, quantity, discount, thumbnail, description) VALUES 
(2, 'Đèn bàn cao cấp 1', 460000, 10, 15, 'Đèn bàn cao cấp 1.png', 
'Được sản xuất với khung được sản xuất tại Ý, lắp ráp và may tại Bỉ, Đức, Pháp, Mỹ, Nhật với các loại vải và da cao cấp, chăn ga gối đệm của chúng tôi là 100% của Châu Âu. Không giống như các đối thủ cạnh tranh của chúng tôi, các cơ chế của chúng tôi được thực hiện qua nhiều năm và sẽ không thất bại.'),

(2, 'Đèn bàn cao cấp 2', 1000000, 10, 15, 'Đèn bàn cao cấp 2.png', 
'Được sản xuất với khung được sản xuất tại Ý, lắp ráp và may tại Bỉ, Đức, Pháp, Mỹ, Nhật với các loại vải và da cao cấp, chăn ga gối đệm của chúng tôi là 100% của Châu Âu. Không giống như các đối thủ cạnh tranh của chúng tôi, các cơ chế của chúng tôi được thực hiện qua nhiều năm và sẽ không thất bại.'),

(2, 'Đèn bàn cao cấp 3', 4600000, 10, 15, 'Đèn bàn cao cấp 3.png', 
'Được sản xuất với khung được sản xuất tại Ý, lắp ráp và may tại Bỉ, Đức, Pháp, Mỹ, Nhật với các loại vải và da cao cấp, chăn ga gối đệm của chúng tôi là 100% của Châu Âu. Không giống như các đối thủ cạnh tranh của chúng tôi, các cơ chế của chúng tôi được thực hiện qua nhiều năm và sẽ không thất bại.'),

(2, 'Đèn bàn đồng thau cao cấp', 460000, 10, 15, 'Đèn bàn đồng thau cao cấp.png', 
'Được sản xuất với khung được sản xuất tại Ý, lắp ráp và may tại Bỉ, Đức, Pháp, Mỹ, Nhật với các loại vải và da cao cấp, chăn ga gối đệm của chúng tôi là 100% của Châu Âu. Không giống như các đối thủ cạnh tranh của chúng tôi, các cơ chế của chúng tôi được thực hiện qua nhiều năm và sẽ không thất bại.'),

(2, 'Đèn bàn Pug Dog', 2500000, 10, 15, 'Đèn bàn Pug Dog.png', 
'Được sản xuất với khung được sản xuất tại Ý, lắp ráp và may tại Bỉ, Đức, Pháp, Mỹ, Nhật với các loại vải và da cao cấp, chăn ga gối đệm của chúng tôi là 100% của Châu Âu. Không giống như các đối thủ cạnh tranh của chúng tôi, các cơ chế của chúng tôi được thực hiện qua nhiều năm và sẽ không thất bại.'),

(2, 'Đèn sàn bằng đá cẩm thạch', 460000, 10, 15, 'Đèn sàn bằng đá cẩm thạch.png', 
'Được sản xuất với khung được sản xuất tại Ý, lắp ráp và may tại Bỉ, Đức, Pháp, Mỹ, Nhật với các loại vải và da cao cấp, chăn ga gối đệm của chúng tôi là 100% của Châu Âu. Không giống như các đối thủ cạnh tranh của chúng tôi, các cơ chế của chúng tôi được thực hiện qua nhiều năm và sẽ không thất bại.');


INSERT INTO products (category_id, title, price, quantity, discount, thumbnail, description) VALUES 
(3, 'Ghế 4 chân cao cấp', 700000, 10, 15, 'Ghế 4 chân cao cấp.png', 
'Được sản xuất với khung được sản xuất tại Ý, lắp ráp và may tại Bỉ, Đức, Pháp, Mỹ, Nhật với các loại vải và da cao cấp, chăn ga gối đệm của chúng tôi là 100% của Châu Âu. Không giống như các đối thủ cạnh tranh của chúng tôi, các cơ chế của chúng tôi được thực hiện qua nhiều năm và sẽ không thất bại.'),

(3, 'Ghế ăn 4 chân cao cấp 1', 2300000, 10, 15, 'Ghế ăn 4 chân cao cấp 1.png', 
'Được sản xuất với khung được sản xuất tại Ý, lắp ráp và may tại Bỉ, Đức, Pháp, Mỹ, Nhật với các loại vải và da cao cấp, chăn ga gối đệm của chúng tôi là 100% của Châu Âu. Không giống như các đối thủ cạnh tranh của chúng tôi, các cơ chế của chúng tôi được thực hiện qua nhiều năm và sẽ không thất bại.'),

(3, 'Ghế ăn 4 chân cao cấp 2', 500000, 10, 15, 'Ghế ăn 4 chân cao cấp 2.png', 
'Được sản xuất với khung được sản xuất tại Ý, lắp ráp và may tại Bỉ, Đức, Pháp, Mỹ, Nhật với các loại vải và da cao cấp, chăn ga gối đệm của chúng tôi là 100% của Châu Âu. Không giống như các đối thủ cạnh tranh của chúng tôi, các cơ chế của chúng tôi được thực hiện qua nhiều năm và sẽ không thất bại.'),

(3, 'Ghế ăn cao cấp bản đặc biệt', 3400000, 10, 15, 'Ghế ăn cao cấp bản đặc biệt.png','Được sản xuất với khung được sản xuất tại Ý, lắp ráp và may tại Bỉ, Đức, Pháp, Mỹ, Nhật với các loại vải và da cao cấp, chăn ga gối đệm của chúng tôi là 100% của Châu Âu. Không giống như các đối thủ cạnh tranh của chúng tôi, các cơ chế của chúng tôi được thực hiện qua nhiều năm và sẽ không thất bại.'),

(3, 'Ghế dựa cao cấp', 600000, 10, 15, 'Ghế dựa cao cấp.png', 
'Được sản xuất với khung được sản xuất tại Ý, lắp ráp và may tại Bỉ, Đức, Pháp, Mỹ, Nhật với các loại vải và da cao cấp, chăn ga gối đệm của chúng tôi là 100% của Châu Âu. Không giống như các đối thủ cạnh tranh của chúng tôi, các cơ chế của chúng tôi được thực hiện qua nhiều năm và sẽ không thất bại.'),

(3, 'Ghế kiểu hiện đại 2024', 1000000, 10, 15, 'Ghế kiểu hiện đại 2024.png',
'Được sản xuất với khung được sản xuất tại Ý, lắp ráp và may tại Bỉ, Đức, Pháp, Mỹ, Nhật với các loại vải và da cao cấp, chăn ga gối đệm của chúng tôi là 100% của Châu Âu. Không giống như các đối thủ cạnh tranh của chúng tôi, các cơ chế của chúng tôi được thực hiện qua nhiều năm và sẽ không thất bại.'), 

(3, 'Ghế dựa phòng ăn cao cấp', 213000, 10, 15, 'Ghế dựa phòng ăn cao cấp.png', 
'Được sản xuất với khung được sản xuất tại Ý, lắp ráp và may tại Bỉ, Đức, Pháp, Mỹ, Nhật với các loại vải và da cao cấp, chăn ga gối đệm của chúng tôi là 100% của Châu Âu. Không giống như các đối thủ cạnh tranh của chúng tôi, các cơ chế của chúng tôi được thực hiện qua nhiều năm và sẽ không thất bại.'),

(3, 'Ghế trơn 4 chân cao cấp', 600000, 10, 15, 'Ghế trơn 4 chân cao cấp.png', 
'Được sản xuất với khung được sản xuất tại Ý, lắp ráp và may tại Bỉ, Đức, Pháp, Mỹ, Nhật với các loại vải và da cao cấp, chăn ga gối đệm của chúng tôi là 100% của Châu Âu. Không giống như các đối thủ cạnh tranh của chúng tôi, các cơ chế của chúng tôi được thực hiện qua nhiều năm và sẽ không thất bại.'),

(3, 'Ghế trơn cao cấp', 3000000, 10, 15, 'Ghế trơn cao cấp.png', 
'Được sản xuất với khung được sản xuất tại Ý, lắp ráp và may tại Bỉ, Đức, Pháp, Mỹ, Nhật với các loại vải và da cao cấp, chăn ga gối đệm của chúng tôi là 100% của Châu Âu. Không giống như các đối thủ cạnh tranh của chúng tôi, các cơ chế của chúng tôi được thực hiện qua nhiều năm và sẽ không thất bại.');

INSERT INTO products (category_id, title, price, quantity, discount, thumbnail, description) VALUES
(4, 'Giá treo cầu thang cao cấp', 670000, 10, 15, 'Giá treo cầu thang cao cấp.png', 
'Được sản xuất với khung được sản xuất tại Ý, lắp ráp và may tại Bỉ, Đức, Pháp, Mỹ, Nhật với các loại vải và da cao cấp, chăn ga gối đệm của chúng tôi là 100% của Châu Âu. Không giống như các đối thủ cạnh tranh của chúng tôi, các cơ chế của chúng tôi được thực hiện qua nhiều năm và sẽ không thất bại.'),

(4, 'Giá treo quần áo cao cấp 3 chân', 460000, 10, 15, 'Giá treo quần áo cao cấp 3 chân.png', 
'Được sản xuất với khung được sản xuất tại Ý, lắp ráp và may tại Bỉ, Đức, Pháp, Mỹ, Nhật với các loại vải và da cao cấp, chăn ga gối đệm của chúng tôi là 100% của Châu Âu. Không giống như các đối thủ cạnh tranh của chúng tôi, các cơ chế của chúng tôi được thực hiện qua nhiều năm và sẽ không thất bại.'),

(4, 'Giá treo quần áo cao cấp chân trụ', 800000, 10, 15, 'Giá treo quần áo cao cấp chân trụ.png', 
'Được sản xuất với khung được sản xuất tại Ý, lắp ráp và may tại Bỉ, Đức, Pháp, Mỹ, Nhật với các loại vải và da cao cấp, chăn ga gối đệm của chúng tôi là 100% của Châu Âu. Không giống như các đối thủ cạnh tranh của chúng tôi, các cơ chế của chúng tôi được thực hiện qua nhiều năm và sẽ không thất bại.'),

(4, 'Giá treo quần áo chân tròn', 1500000, 10, 15, 'Giá treo quần áo chân tròn.png', 
'Được sản xuất với khung được sản xuất tại Ý, lắp ráp và may tại Bỉ, Đức, Pháp, Mỹ, Nhật với các loại vải và da cao cấp, chăn ga gối đệm của chúng tôi là 100% của Châu Âu. Không giống như các đối thủ cạnh tranh của chúng tôi, các cơ chế của chúng tôi được thực hiện qua nhiều năm và sẽ không thất bại.');

 
 INSERT INTO products (category_id, title, price, quantity, discount, thumbnail, description) VALUES 
(5, 'Kệ treo tường cao cấp hình lưới', 565000, 10, 15, 'Kệ treo tường cao cấp hình lưới.png', 
'Được sản xuất với khung được sản xuất tại Ý, lắp ráp và may tại Bỉ, Đức, Pháp, Mỹ, Nhật với các loại vải và da cao cấp, chăn ga gối đệm của chúng tôi là 100% của Châu Âu. Không giống như các đối thủ cạnh tranh của chúng tôi, các cơ chế của chúng tôi được thực hiện qua nhiều năm và sẽ không thất bại.'),

(5, 'Kệ treo tường cao cấp', 900000, 10, 15, 'Kệ treo tường cao cấp.png','Được sản xuất với khung được sản xuất tại Ý, lắp ráp và may tại Bỉ, Đức, Pháp, Mỹ, Nhật với các loại vải và da cao cấp, chăn ga gối đệm của chúng tôi là 100% của Châu Âu. Không giống như các đối thủ cạnh tranh của chúng tôi, các cơ chế của chúng tôi được thực hiện qua nhiều năm và sẽ không thất bại.'),

(5, 'Kệ treo tường nghệ thuật cao cấp', 700000, 10, 15, 'Kệ treo tường nghệ thuật cao cấp.png', 
'Được sản xuất với khung được sản xuất tại Ý, lắp ráp và may tại Bỉ, Đức, Pháp, Mỹ, Nhật với các loại vải và da cao cấp, chăn ga gối đệm của chúng tôi là 100% của Châu Âu. Không giống như các đối thủ cạnh tranh của chúng tôi, các cơ chế của chúng tôi được thực hiện qua nhiều năm và sẽ không thất bại.'),

(5, 'Kệ treo tường xu hướng mới', 1500000, 10, 15, 'Kệ treo tường xu hướng mới.png', 
'Được sản xuất với khung được sản xuất tại Ý, lắp ráp và may tại Bỉ, Đức, Pháp, Mỹ, Nhật với các loại vải và da cao cấp, chăn ga gối đệm của chúng tôi là 100% của Châu Âu. Không giống như các đối thủ cạnh tranh của chúng tôi, các cơ chế của chúng tôi được thực hiện qua nhiều năm và sẽ không thất bại.');

INSERT INTO products (category_id, title, price, quantity, discount, thumbnail, description) VALUES 
(6, 'Tủ quần áo 3 cửa 2 ngăn', 4000000, 10, 15, 'Tủ quần áo 3 cửa 2 ngăn.png', 
'Được sản xuất với khung được sản xuất tại Ý, lắp ráp và may tại Bỉ, Đức, Pháp, Mỹ, Nhật với các loại vải và da cao cấp, chăn ga gối đệm của chúng tôi là 100% của Châu Âu. Không giống như các đối thủ cạnh tranh của chúng tôi, các cơ chế của chúng tôi được thực hiện qua nhiều năm và sẽ không thất bại.'),

(6, 'Tủ quần áo 3 cửa 5 ngăn cao cấp', 6000000, 10, 15, 'Tủ quần áo 3 cửa 5 ngăn cao cấp.png', 
'Được sản xuất với khung được sản xuất tại Ý, lắp ráp và may tại Bỉ, Đức, Pháp, Mỹ, Nhật với các loại vải và da cao cấp, chăn ga gối đệm của chúng tôi là 100% của Châu Âu. Không giống như các đối thủ cạnh tranh của chúng tôi, các cơ chế của chúng tôi được thực hiện qua nhiều năm và sẽ không thất bại.'),

(6, 'Tủ quần áo 3 cửa 6 ngăn cao cấp', 4500000, 10, 15, 'Tủ quần áo 3 cửa 6 ngăn cao cấp.png','Được sản xuất với khung được sản xuất tại Ý, lắp ráp và may tại Bỉ, Đức, Pháp, Mỹ, Nhật với các loại vải và da cao cấp, chăn ga gối đệm của chúng tôi là 100% của Châu Âu. Không giống như các đối thủ cạnh tranh của chúng tôi, các cơ chế của chúng tôi được thực hiện qua nhiều năm và sẽ không thất bại.'),

(5, 'Kệ treo tường nghệ thuật cao cấp', 1000000, 10, 15, 'Kệ treo tường nghệ thuật cao cấp.png', 
'Được sản xuất với khung được sản xuất tại Ý, lắp ráp và may tại Bỉ, Đức, Pháp, Mỹ, Nhật với các loại vải và da cao cấp, chăn ga gối đệm của chúng tôi là 100% của Châu Âu. Không giống như các đối thủ cạnh tranh của chúng tôi, các cơ chế của chúng tôi được thực hiện qua nhiều năm và sẽ không thất bại.'),

(5, 'Kệ treo tường xu hướng mới', 3000000, 10, 15, 'Kệ treo tường xu hướng mới.png', 
'Được sản xuất với khung được sản xuất tại Ý, lắp ráp và may tại Bỉ, Đức, Pháp, Mỹ, Nhật với các loại vải và da cao cấp, chăn ga gối đệm của chúng tôi là 100% của Châu Âu. Không giống như các đối thủ cạnh tranh của chúng tôi, các cơ chế của chúng tôi được thực hiện qua nhiều năm và sẽ không thất bại.');

INSERT INTO products (category_id, title, price, quantity, discount, thumbnail, description) VALUES 
(6, 'Tủ quần áo 3 cửa 2 ngăn', 1200000, 10, 15, 'Tủ quần áo 3 cửa 2 ngăn.png', 
'Được sản xuất với khung được sản xuất tại Ý, lắp ráp và may tại Bỉ, Đức, Pháp, Mỹ, Nhật với các loại vải và da cao cấp, chăn ga gối đệm của chúng tôi là 100% của Châu Âu. Không giống như các đối thủ cạnh tranh của chúng tôi, các cơ chế của chúng tôi được thực hiện qua nhiều năm và sẽ không thất bại.'),

(6, 'Tủ quần áo 3 cửa 5 ngăn cao cấp', 550000, 10, 15, 'Tủ quần áo 3 cửa 5 ngăn cao cấp.png', 
'Được sản xuất với khung được sản xuất tại Ý, lắp ráp và may tại Bỉ, Đức, Pháp, Mỹ, Nhật với các loại vải và da cao cấp, chăn ga gối đệm của chúng tôi là 100% của Châu Âu. Không giống như các đối thủ cạnh tranh của chúng tôi, các cơ chế của chúng tôi được thực hiện qua nhiều năm và sẽ không thất bại.'),

(6, 'Tủ quần áo 3 cửa 6 ngăn cao cấp', 330000, 10, 15, 'Tủ quần áo 3 cửa 6 ngăn cao cấp.png','Được sản xuất với khung được sản xuất tại Ý, lắp ráp và may tại Bỉ, Đức, Pháp, Mỹ, Nhật với các loại vải và da cao cấp, chăn ga gối đệm của chúng tôi là 100% của Châu Âu. Không giống như các đối thủ cạnh tranh của chúng tôi, các cơ chế của chúng tôi được thực hiện qua nhiều năm và sẽ không thất bại.'),

(6, 'Tủ quần áo 3 cửa 6 ngăn', 880000, 10, 15, 'Tủ quần áo 3 cửa 6 ngăn.png', 
'Được sản xuất với khung được sản xuất tại Ý, lắp ráp và may tại Bỉ, Đức, Pháp, Mỹ, Nhật với các loại vải và da cao cấp, chăn ga gối đệm của chúng tôi là 100% của Châu Âu. Không giống như các đối thủ cạnh tranh của chúng tôi, các cơ chế của chúng tôi được thực hiện qua nhiều năm và sẽ không thất bại.'),

(6, 'Tủ quần áo 3 cửa 8 ngăn', 770000, 10, 15, 'Tủ quần áo 3 cửa 8 ngăn.png', 
'Được sản xuất với khung được sản xuất tại Ý, lắp ráp và may tại Bỉ, Đức, Pháp, Mỹ, Nhật với các loại vải và da cao cấp, chăn ga gối đệm của chúng tôi là 100% của Châu Âu. Không giống như các đối thủ cạnh tranh của chúng tôi, các cơ chế của chúng tôi được thực hiện qua nhiều năm và sẽ không thất bại.');

 
 INSERT INTO roles (role_id, name) values
 (0,"User"),
 (1,"Staff"),
 (2,"Admin");
 

INSERT INTO `users` (`user_id`, `email`, `password`, `name`, `given_name`, `family_name`, `phone`, `picture`, `address`,`role_id`) 
VALUES ('123', 'staff@gmail.com', '$2a$10$wNGqMyi/jy8aURA1Bbm8.e6l90CY5A6FU0gmqKdLWC7BmWDYkoPpG', 'Staff', 'Staff', 'Staff', '1234567890', 'picture_url', 'Address', 1);

INSERT INTO `users` (`user_id`, `email`, `password`, `name`, `given_name`, `family_name`, `phone`, `picture`, `address`,`role_id`) 
VALUES ('123456', 'admin@gmail.com', '$2a$10$wNGqMyi/jy8aURA1Bbm8.e6l90CY5A6FU0gmqKdLWC7BmWDYkoPpG', 'Admin', 'Admin', 'Admin', '1234567890', 'picture_url', 'Address', 2);




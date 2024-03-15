CREATE DATABASE IF NOT EXISTS eFurniture;
USE eFurniture;


CREATE TABLE `user` (
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
	`created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE `role` (
  `role_id` int PRIMARY KEY NOT NULL,
  `name` varchar(50) NOT NULL
);

CREATE TABLE `product` (
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

CREATE TABLE `category` (
  `category_id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `thumbnail` varchar(200) NULL
);

CREATE TABLE `order` (
    `order_id` VARCHAR(10) PRIMARY KEY NOT NULL,
    `user_id` VARCHAR(255) NOT NULL,
    `email` VARCHAR(255) NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `phone` VARCHAR(12) NOT NULL,
    `shipping_address` VARCHAR(255) NOT NULL,
    `note` LONGTEXT,
    `status` INT NOT NULL,
    `payment_status` BOOLEAN NOT NULL,
    `payment_method` VARCHAR(50) NOT NULL,
    `amount` INT NOT NULL,
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `order_status` (
    `status_id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL
);

CREATE TABLE `order_detail` (
    `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `order_id` VARCHAR(10) NOT NULL,
    `product_id` INT NOT NULL,
    `title` VARCHAR(255) NOT NULL,
    `price` INT NOT NULL,
    `quantity` INT NOT NULL,
    `thumbnail` VARCHAR(255) NOT NULL,
    `total_money` INT NOT NULL
);

CREATE TABLE `cart` (
    `cart_id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `user_id` VARCHAR(255) NOT NULL,
    `product_id` INT NOT NULL,
    `title` VARCHAR(255) NOT NULL,
    `thumbnail` VARCHAR(255) NOT NULL,
    `quantity` INT NOT NULL,
    `price` INT NOT NULL
);


CREATE TABLE `payment` (
    `payment_id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `user_id` VARCHAR(255) NOT NULL,
    `order_id` VARCHAR(10)  NOT NULL
);

CREATE TABLE `request_cancellation` (
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

CREATE TRIGGER TR_OrderDetail_Insert AFTER INSERT ON order_detail 
FOR EACH ROW 
BEGIN
    DECLARE quantity_ordered INT;
    DECLARE order_status INT;

    -- Lấy số lượng sản phẩm và trạng thái của đơn hàng mới được thêm vào
    SELECT NEW.quantity, `status` INTO quantity_ordered, order_status
    FROM `order` 
    WHERE `order_id` = NEW.order_id;

    -- Kiểm tra nếu đơn hàng đã được thanh toán
    IF order_status = 1 THEN
        -- Giảm số lượng sản phẩm trong kho tương ứng
        UPDATE `product` 
        SET `quantity` = `quantity` - NEW.quantity
        WHERE `product_id` = NEW.product_id;
    END IF;
END$$

DELIMITER ;




ALTER TABLE `product` ADD FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`);

ALTER TABLE `order` ADD FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

ALTER TABLE `cart` ADD FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

ALTER TABLE `cart` ADD FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`);

ALTER TABLE `payment` ADD FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

ALTER TABLE `order_detail` ADD FOREIGN KEY (`order_id`) REFERENCES `order` (`order_id`);

ALTER TABLE `order_detail` ADD FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`);

ALTER TABLE `user` ADD FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`);

ALTER TABLE `payment` ADD FOREIGN KEY (`order_id`) REFERENCES `order` (`order_id`);

ALTER TABLE `order` ADD FOREIGN KEY (`status`) REFERENCES `order_status` (`status_id`);

ALTER TABLE `request_cancellation` ADD FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

ALTER TABLE `request_cancellation` ADD FOREIGN KEY (`order_id`) REFERENCES `order` (`order_id`);


INSERT INTO category (category_id, name, thumbnail) VALUES
  (1, 'Bồn tắm', 'bontam.jpg'),
  (2, 'Bồn cầu', 'boncau.jpg'),
  (3, 'Sen tắm', 'sentam.jpg'),
  (4, 'Tủ chậu Lavabo', 'tuchaulavabo.jpg'),
  (5, 'Vòi Lavabo', 'voilavabo.jpg'),
  (6, 'Phụ kiện', 'phukien.jpg');
  
INSERT INTO product (category_id, title, price, quantity, discount, thumbnail, description, created_at) VALUES 
(1, 'Bồn tắm Massage đặt góc', 5595000, 10, 10, 'Bồn tắm Massage đặt góc.jpg', 
'Kích thước (mm):  1500x1500x580mm
Nguồn điện : AC 220 V ± 15% / 50 Hz
Sục thủy lực, sục khím đổi màu
Mầu trắng trơn Acrylic
Công suất bơm Massage: Bơm 1: 0.75 KW & Bơm 2: 0.375 KW
Áp suất thường : 0.2 – 0.4 Mpa
Mực nước : 70 – 80 %
Đường ống cấp nước : Ø 15
Đường ống thoát nước : Ø42 ÷ Ø48
Gối đầu : 01
Chất liệu: Nhựa Acrylic, Men acrylic', '2024-01-24 12:00:00'),
(1, 'Bồn tắm nằm đặt sàn tròn', 3960000, 10, 15, 'Bồn tắm nằm đặt sàn tròn.jpg', 
'Kích thước: 1500x1500x630 mm
Chất liệu: nhựa Acrylic
Màu sắc: màu trắng
Bửng che: có
Trọng lượng: 40kg
Dung tích: 270 lít
Giá chưa bao gồm vòi nước & đã bao gồm bộ xả
Bảo hành: Sản phẩm 24 tháng – Linh kiện, phụ kiện 12 tháng', '2024-01-24 12:30:00'),
(1, 'Bồn tắm đặt sàn massage 1.8m gồm vòi', 10192000, 20, 20, 'Bồn tắm đặt sàn massage 1.8m gồm vòi.jpg', 
'Loại Bồn: Double MASSAGE Bathtub
Màu sắc: Trắng Bóng
Kích thước: 1800x1200x600 mm
Chất liệu: Cấu tạo hoàn toàn bằng sợi thủy tinh với lớp phủ Acrylic Lucite
Đã bao gồm vòi sen gắn thành', '2024-01-24 13:00:00'),
(1, 'Bồn tắm đặt sàn massage 1.69m', 5100000, 10, 19, 'Bồn tắm đặt sàn massage 1.69m.jpg', 
'Loại Bồn: Freestanding MASSAGE
Màu sắc: Trắng Bóng
Kích thước: 1690 x 810 x 760(mm)
Chất liệu: Cấu tạo hoàn toàn bằng sợi thủy tinh với lớp phủ Acrylic Lucite
Không bao gồm vòi sen', '2024-01-24 12:30:00'),
(1, 'Bồn tắm đặt sàn 1.37m', 2590000, 10, 20, 'Bồn tắm đặt sàn 1.37m.jpg', 
'Loại Bồn: Freestanding bath
Màu sắc: Trắng Bóng
Kích thước: 1370 x 720 x 720 (mm)
Chất liệu: Cấu tạo hoàn toàn bằng sợi thủy tinh với lớp phủ Acrylic Lucite
Không bao gồm vòi sen', '2024-01-24 12:30:00'),
(1, 'Bồn tắm đặt sàn 1.2m', 2490000, 10, 20, 'Bồn tắm đặt sàn 1.2m.jpg', 
'Kích thước: 1200x720x600 mm
Vật liệu: Acrylic Lucite kết hợp sợi thuỷ tinh 7 lớp
Loại bồn tắm: Ngâm nguyên khối đặt sàn hiện đại
Thiết kế: Theo công thái học
Nút nhấn xả: Chất liệu Đồng mạ Chrome
Tính năng: Chống trơn trượt chống vi khuẩn và dễ lau chùi giữ nhiệt
Công nghệ: Liền mạch', '2024-01-24 12:30:00'),
(1, 'Bồn tắm đặt sàn massage 1.7m', 4590000, 10, 20, 'Bồn tắm đặt sàn massage 1.7m.jpg', 
'Kích thước: 1700x800x580 mm
Vật liệu: Acrylic Lucite kết hợp sợi thuỷ tinh 7 lớp
Loại bồn tắm: Massage nguyên khối đặt sàn hiện đại
Thiết kế: Theo công thái học
Nút nhấn xả: Chất liệu Đồng mạ Chrome
Tính năng: Chống trơn trượt chống vi khuẩn và dễ lau chùi giữ nhiệt
Công nghệ: Liền mạch massage thuỷ lực đèn led 7 màu
Lọc nước ozon chống rò rỉ điện IPX5', '2024-01-24 12:30:00'),
(1, 'Bồn tắm đặt sàn 1.7m', 2990000, 10, 20, 'Bồn tắm đặt sàn 1.7m.jpg', 
'Kích thước: 1700x800x580 mm
Vật liệu: Acrylic Lucite kết hợp sợi thuỷ tinh 7 lớp
Loại bồn tắm: Ngâm nguyên khối đặt sàn hiện đại
Thiết kế: Theo công thái học
Nút nhấn xả: Chất liệu Đồng mạ Chrome
Tính năng: Chống trơn trượt chống vi khuẩn và dễ lau chùi giữ nhiệt
Công nghệ: Liền mạch', '2024-01-24 12:30:00'),
(1, 'Bồn tắm ngâm cao cấp, chất liệu Acrylic', 2590000, 10, 19, 'Bồn tắm ngâm cao cấp, chất liệu Acrylic.jpg', 
'Không có mô tả', '2024-01-24 12:30:00');

INSERT INTO product (category_id, title, price, quantity, discount, thumbnail, description, created_at) VALUES 
(2, 'Bồn cầu treo âm tường Mission', 460000, 10, 15, 'Bồn cầu treo âm tường Mission.jpg', 
'Bồn cầu két nước âm tường Mission
 Giảm trọng lượng sàn 900kg/1 phòng vệ sinh 3m2(do không phải tôn nền)
 Chống thấm tuyệt đối
 Hệ thống xả: Ngang
 Chế độ xả : Xả nhấn 2 chế độ 6/3L
 Công nghệ xả đẩy – hút không gây tiếng ồn Nắp bàn cầu rơi êm
 Áp lực nước : 0.05 MPa ~ 0.75 MPa
 Kích thước: 565 x 368 x 400mm
 Xuất xứ sản phẩm
 Công nghệ sản xuất : Italy
 Nơi sản xuất : China
 Tính năng bồn cầu treo tường Mission
 Thiết kế sang trọng, thẩm mĩ, dễ dàng sử dụng
 Tiết kiệm không gian do thiết kế két âm tường
 Men Nano nung: Diệt khuẩn, chống bám dính.
 Thiết kế treo tường làm giảm trọng lượng sản tối đa', '2024-01-24 12:00:00'),
(2, 'Bồn cầu treo tường thông minh', 2900000, 10, 12, 'Bồn cầu treo tường thông minh.jpg', 
'Trọng lượng chịu lực: 400KG.
 Công suất sưởi: 40-1420W
 Công nghệ: Tiêu chuẩn EN 1717 bảo vệ nguồn nước
 Nhiệt độ: 34 – 37 – 40
 Téc nước: Sử dụng téc nước âm tường
 Dây nguồn: 1,5 mét
 Kích thước: 580 x 380 x 450mm', '2024-01-24 12:00:00'),
(2, 'Bồn cầu treo tường tét nước âm, thân sứ tròn', 1450000, 10, 25, 'Bồn cầu treo tường tét nước âm, thân sứ tròn.jpg', 
'Hệ thống xả:  ECOMAX hiệu quả, tiết kiệm nước 
 Lượng nước xả: 4.8/3L 
 Áp lực nước: 0.05MPa~0.75MPa
 Nhiệt độ nung: 1280oC - kết tinh chất sứ bền bỉ, chịu trọng tải lên tới 300kg
 Lớp men Platinum 1280oC dày 0,6 - 0,8 mm sáng bóng vượt trội
 ION bạc ức chế sự phát triển của vi khuẩn
 Xuất xứ : Nhập khẩu chính hãng
 Bảo hành:  men 15 năm', '2024-01-24 12:00:00'),
(2, 'Bồn bán thông minh, cảm ứng đá chân xả nước', 465000, 10, 0, 'Bồn bán thông minh, cảm ứng đá chân xả nước.jpg', 
'Mã sp: KA5158
Chất liệu: Sứ nung tráng men nano cao cấp
Kiểu dáng: Bệt liền khối
Chế độ xả: Xả xoáy
Nút xả: 1 nút xả chạm tay, 1 nút xả đá chân, 1 gạt xịt rửa 
Dung tích xả: 4/5lit
Thương hiệu: Kanax
Xuất xứ: Trung quốc
Bảo hành: 5 năm', '2024-01-24 12:00:00'),
(2, 'Bồn cầu thông minh nắp ngồi hình chữ U', 1280000, 10, 14, 'Bồn cầu thông minh nắp ngồi hình chữ U.jpg', 
'Ứng Dụng: Phòng Tắm
điều khiển từ xa: Bao gồm
Thiết Kế Phong Cách: Hiện Đại
dịch vụ sau khi bán hàng: Trực Tuyến Hỗ Trợ Kỹ Thuật
Mô hình thoát nước: S-Trap
trọng lượng: 41-50kg', '2024-01-24 12:00:00'),
(2, 'Bồn cầu trứng thông minh cao cấp full chức năng', 1359000, 10, 10, 'Bồn cầu trứng thông minh cao cấp full chức năng.jpg', 
'Đèn led hiển thị nhiệt độ. 
 Chế độ đóng nắp êm. 
 Tự động đóng mở nắp.
 Chế độ vòi xịt hậu môn, xịt vệ sinh phụ nữ.', '2024-01-24 12:00:00'),
(2, 'Bồn cầu thông minh cao cấp full chức năng, tự động mở nắp', 1420000, 10, 0, 'Bồn cầu thông minh cao cấp full chức năng, tự động mở nắp.jpg', 
'Tên sản phẩm: Nhà Vệ Sinh thông minh K6908
 Bảo hành: 5 năm
 Mô hình Số: TX-42
 Chất liệu: Gốm
 Kiểu lắp đặt: Gắn sàn', '2024-01-24 12:00:00'),
(2, 'Bồn cầu thông minh cao cấp full chức năng, có xịt bọt', 1250000, 10, 16, 'Bồn cầu thông minh cao cấp full chức năng, có xịt bọt.jpg', 
'Các chức năng chính:
1.Đèn led hiển thị nhiệt độ. 
2.Chế độ đóng nắp êm. 
3.Tự động đóng mở nắp.
4.Chế độ vòi xịt hậu môn, xịt vệ sinh phụ nữ. 
5.Chế độ sấy khô. 
6.Chế độ làm ấm bệ ngồi.
7.Chế độ tự động xả. 
8.Cảm ứng đá chân mở nắp. 
9.Chống giật, chống rò rỉ điện.
10.Điều chỉnh nhiệt độ nước xịt. 
11. Điều chỉnh nhiệt độ sấy. 
12.Điều chỉnh nhiệt độ bệ ngồi.
13.Điều khiển từ xa. 
14.Khử mùi. 
15.Tự vệ sinh vòi xịt. 
16.Đèn led chiếu sáng ban đêm.
17.Tiết kiệm nước, tiết kiệm điện. 
18.Điều chỉnh áp lực vòi xịt. 
19.Điều chỉnh vị trí vòi xịt.
20.Chế độ xả khi mất điện.
21. Xả nước không phụ thuộc áp lực nguồn nước.', '2024-01-24 12:00:00');

INSERT INTO product (category_id, title, price, quantity, discount, thumbnail, description, created_at) VALUES 
(3, 'Sen tắm đồng thau phủ nano xám màn hình led', 450000, 10, 14, 'Sen tắm đồng thau phủ nano xám màn hình led.jpg', 
'Thương Hiệu: Lusenter
 Công Nghệ: Đức
 Bảo Hành Chính Hãng: 1 năm
 Chất liệu: Inox 304 đồng thau phủ NANO', '2024-01-24 12:00:00'),
(3, 'Sen phím bóng màn hình led xám', 575000, 10, 16, 'Sen phím bóng màn hình led xám.jpg', 
'Thương Hiệu: Lusenter
 Công Nghệ: Đức
 Bảo Hành Chính Hãng: 1 năm
 Chất liệu: Inox 304 bóng đồng thau Xám', '2024-01-24 12:00:00'),
(3, 'Sen cây bàn phím đồng mạ crom bóng cao cấp', 265000, 10, 38, 'Sen cây bàn phím đồng mạ crom bóng cao cấp.jpg', 
'Sản phẩm được thiết kế hiện đại,sang trọng tiện lợi cho người tiêu dùng
 Cấu tạo bởi đồng và 5 lớp mạ crom giúp sản phẩm luôn sáng bóng,chống bám bẩn và đẽ dàng lau chùi vệ sinh
 Lượng đồng lên tới 63% và 37% hợp chất khác là yếu tó khiến sản phẩm có độ bền cao
 Đầu vòi có 1 lớp lưới tạo bọt lọc nước giúp dòng nước chảy êm hơn và không bị bắn nước.
 Sản phẩm có 3 chức năng phun nước : vòi xả – sen tắm to – sen tắm nhỏ
 Sản phẩm an toàn không gây hại sức khoẻ,phù hợp với mọi nhà.', '2024-01-24 12:00:00'),
(3, 'Sen cây tắm mạ PVD màu ghi xám', 560000, 10, 20, 'Sen cây tắm mạ PVD màu ghi xám.jpg', 
'Sen cây sử dụng các phím độc lập, dễ dàng sự dụng cho trẻ nhỏ và người già
 Có màn hình hiển thị hiện độ, dễ dàng kiểm soát nhiệt độ nước sử dụng, tránh gây bỏng dát.
 Có thêm bộ xịt ghi xám đồng bộ, vệ sinh đồ đạc xuynh quaynh thật đơn giản.
 Chất liệu chủ yếu: Mạ PVD màu ghi xám không bong sơn
 Áp dụng phương pháp mạ điện tiên tiến siêu bền nano
 Chất liệu mạ: Crom màu ghi xám Gray
 Vòi phụ điều chỉnh
 Áp lực nước: 0.05MPa ~ 0.75MPa
 Thiết kế sang trọng
 Lớp mạ bền vững với thời gian
 Hãng sản xuất: Tera
 Công nghệ sản xuất: Hàn Quốc
 Sản xuất tại: Tera China', '2024-01-24 12:00:00');

INSERT INTO product (category_id, title, price, quantity, discount, thumbnail, description, created_at) VALUES 
(4, 'Tủ chậu lavabo phòng tắm kiêm máy giặt', 1350000, 10, 0, 'Tủ chậu lavabo phòng tắm kiêm máy giặt.jpg', 
'Tủ chậu lavabo kê máy giặt là một giải pháp thông minh để tiết kiệm không gian trong phòng tắm hoặc nhà vệ sinh. Nó kết hợp hai chức năng chính là tủ chậu lavabo và không gian để đặt máy giặt.
 Tủ chậu lavabo thường đi kèm với một chậu rửa, một vòi nước và các ngăn để lưu trữ đồ vật như xà bông, kem đánh răng, và các vật dụng nhà tắm khác. Phía dưới chậu rửa, có không gian để đặt máy giặt. Một số mẫu tủ chậu lavabo kê máy giặtcòn có thiết kế thông minh để che giấu máy giặt bên trong tủ, giúp tạo ra một diện mạo gọn gàng và tiết kiệm không gian.', '2024-01-24 12:00:00'),
(4, 'Tủ chậu lavabo liền khối 2 tầng', 559000, 10, 12, 'Tủ chậu lavabo liền khối 2 tầng.jpg', 
'Một giải pháp hoàn hảo để kết hợp tính thẩm mỹ và tính ứng dụng trong không gian phòng tắm của bạn. Với thiết kế độc đáo và chất lượng xuất sắc, tủ chậu lavabo liền khối 2 tầng là sự lựa chọn tuyệt vời để tăng cường sự tiện nghi và tạo điểm nhấn độc đáo cho phòng tắm của bạn.', '2024-01-24 12:00:00'),
(4, 'Tủ chậu bo tròn kèm tủ gương thông minh', 1020000, 10, 10, 'Tủ chậu bo tròn kèm tủ gương thông minh.jpg', 
'Chất liệu bồn rửa: Đá nhân tạo phủ NANO cao cấp kết cấu cứng, chống cháy, chống trầy xước mài mòn
 Chất liệu tủ gỗ plywood phủ melamine chống nước , chống ẩm
 Tất cả sản phầm đều đầy đủ phụ kiện gồm vòi rửa (bản cao cấp dây rút ) – dây cấp nóng lạnh , Xi phông thoát nước ngăn mùi.
 Mẫu tủ chậu lavabo mới 2023 bo tròn góc – Sự hoàn hảo trong thiết kế và chất lượng', '2024-01-24 12:00:00'),
(4, 'Bàn đá đôi chống xước, bề mặt bóng, chậu liền mép', 275000, 10, 18, 'Bàn đá đôi chống xước, bề mặt bóng, chậu liền mép.jpg', 
'Chất liệu: Đá nhân tạo chống xước cao cấp
 Màu sắc: Đen bóng
 Kiểu dáng: Hiện đại
 Chậu lavabo: Chậu sứ âm liền bàn
 Kích thước tầng trên: 50x80x15cm
 Kích thước tầng dưới: 50x80x10cm
 Trọng lượng bàn 2 bàn đá: 45kg
 Xuất xứ: Trung quốc
 Bảo hành: Bàn đá bảo hành 10 năm
 Gương led: Tủ Gương led cảm ứng KT 60x80cm sản xuất trong nước
 Vòi lavabo	Vòi lavabo nóng lạnh đồng mạ crom
 Giá đỡ	Giá đỡ inox + ốc vít
 Xiphong: Xiphong thoát chậu ruột gà đầu inox đuôi nhựa', '2024-01-24 12:00:00');
 
 INSERT INTO role (role_id, name) values
 (0,"User"),
 (1,"Staff"),
 (2,"Admin");
 

INSERT INTO `user` (`user_id`, `email`, `password`, `name`, `given_name`, `family_name`, `phone`, `picture`, `address`,`role_id`) 
VALUES ('123', 'staff@gmail.com', '$2a$10$wNGqMyi/jy8aURA1Bbm8.e6l90CY5A6FU0gmqKdLWC7BmWDYkoPpG', 'Staff', 'Staff', 'Staff', '1234567890', 'picture_url', 'Address', 1);




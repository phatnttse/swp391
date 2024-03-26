/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package phatntt.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.naming.NamingException;
import lombok.Cleanup;
import phatntt.dto.ChartDTO;
import phatntt.dto.OrderDTO;
import phatntt.util.DBConnect;
import phatntt.util.Key_Utils;

/**
 *
 * @author Admin
 */
public class OrdersDAO {

    public boolean createOrder(String orderId, String user_id, String email, String name, String phone, String shipping_address, String note, int status, String payment_method, boolean payment_status, int amount) throws SQLException, NamingException {
        boolean result = false;

        @Cleanup
        Connection con = DBConnect.createConnection();
        if (con != null) {
            String sql = "INSERT INTO `orders` (order_id, user_id, email, name, phone, shipping_address, note, status, payment_status, payment_method, amount, previous_status) "
                    + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            @Cleanup
            PreparedStatement stm = con.prepareStatement(sql);

            stm.setString(1, orderId);
            stm.setString(2, user_id);
            stm.setString(3, email);
            stm.setString(4, name);
            stm.setString(5, phone);
            stm.setString(6, shipping_address);
            stm.setString(7, note);
            stm.setInt(8, status);
            stm.setBoolean(9, payment_status);
            stm.setString(10, payment_method);
            stm.setInt(11, amount);
            stm.setInt(12, status);

            int affectedRows = stm.executeUpdate();
            result = affectedRows > 0;
        }

        return result;
    }

    public void addOrderDetail(String orderId, int productId, String title, int price, int quantity, String thumbnail, int totalMoney) throws SQLException, NamingException {

        @Cleanup
        Connection con = DBConnect.createConnection();
        if (con != null) {
            String sql = "INSERT INTO order_details (order_id, product_id, title, price, quantity, thumbnail, total_money) "
                    + "VALUES (?, ?, ?, ?, ?, ?, ?)";
            @Cleanup
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, orderId);
            stm.setInt(2, productId);
            stm.setString(3, title);
            stm.setInt(4, price);
            stm.setInt(5, quantity);
            stm.setString(6, thumbnail);
            stm.setInt(7, totalMoney);
            stm.executeUpdate();
        }

    }

    public boolean updateOrderStatus(String orderId, int statusId, boolean paymentStatus) throws SQLException, NamingException {
        boolean result = false;

        @Cleanup
        Connection con = DBConnect.createConnection();
        if (con != null) {
            if (statusId == 4) {
                paymentStatus = true;
            }
            String sql = "UPDATE `orders` SET status = ?, previous_status = ?, payment_status = ? WHERE order_id = ?";
            @Cleanup
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, statusId + 1);
            stm.setInt(2, statusId + 1);
            stm.setBoolean(3, paymentStatus);
            stm.setString(4, orderId);
            int affectedRows = stm.executeUpdate();

            if (affectedRows > 0) {
                result = true;
            }
        }

        return result;
    }

    public OrderDTO getOrderById(String orderId) throws SQLException, NamingException {
        OrderDTO order = null;

        @Cleanup
        Connection con = DBConnect.createConnection();
        if (con != null) {
            String sql = "SELECT o.*, os.name AS status_name "
                    + "FROM `orders` o "
                    + "INNER JOIN `order_status` os ON o.status = os.status_id "
                    + "WHERE o.order_id = ?";
            @Cleanup
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, orderId);
            @Cleanup
            ResultSet rs = stm.executeQuery();

            if (rs.next()) {
                order = OrderDTO.builder()
                        .orderId(rs.getString("order_id"))
                        .userId(rs.getString("user_id"))
                        .email(rs.getString("email"))
                        .name(rs.getString("name"))
                        .phone(rs.getString("phone"))
                        .address(rs.getString("shipping_address"))
                        .note(rs.getString("note"))
                        .status(rs.getInt("status"))
                        .paymentStatus(rs.getBoolean("payment_status"))
                        .paymentMethod(rs.getString("payment_method"))
                        .amount(rs.getInt("amount"))
                        .statusName(rs.getString("status_name"))
                        .createdAt(rs.getTimestamp("created_at"))
                        .build();
            }
        }

        return order;
    }

    public void clearCartByUserId(String userId) throws SQLException, NamingException {

        @Cleanup
        Connection con = DBConnect.createConnection();
        if (con != null) {
            String sql = "DELETE FROM carts WHERE user_id = ?";
            @Cleanup
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, userId);
            stm.executeUpdate();
        }

    }

    public List<OrderDTO> allOwnOrder(String user_id) throws SQLException, NamingException {
        List<OrderDTO> list = new ArrayList<>();

        @Cleanup
        Connection con = DBConnect.createConnection();
        if (con != null) {
            String sql = "SELECT \n"
                    + "    o.*,\n"
                    + "    os.name AS status_name,\n"
                    + "    SUM(od.total_money) AS total_order_price\n"
                    + "FROM \n"
                    + "    `orders` o\n"
                    + "JOIN \n"
                    + "    `order_details` od ON o.order_id = od.order_id\n"
                    + "JOIN \n"
                    + "    `order_status` os ON o.status = os.status_id\n"
                    + "WHERE \n"
                    + "    o.user_id = ? \n"
                    + "GROUP BY \n"
                    + "    o.order_id;";
            @Cleanup
            PreparedStatement stm = con.prepareCall(sql);
            stm.setString(1, user_id);
            @Cleanup
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                OrderDTO odto = OrderDTO.builder()
                        .orderId(rs.getString("order_id"))
                        .userId(user_id)
                        .email(rs.getString("email"))
                        .name(rs.getString("name"))
                        .phone(rs.getString("phone"))
                        .address(rs.getString("shipping_address"))
                        .note(rs.getString("note"))
                        .status(rs.getInt("status"))
                        .statusName(rs.getString("status_name"))
                        .paymentStatus(rs.getBoolean("payment_status"))
                        .paymentMethod(rs.getString("payment_method"))
                        .amount(rs.getInt("amount"))
                        .createdAt(rs.getTimestamp("created_at"))
                        .formattedPrice(Key_Utils.getInstance().formattedPrice(rs.getInt("total_order_price")))
                        .build();
                list.add(odto);
            }
        }

        return list;
    }

    public boolean requestToCancelOrder(String userId, String orderId, String reason)
            throws SQLException, NamingException {
        boolean result = false;

        @Cleanup
        Connection con = DBConnect.createConnection();
        if (con != null) {
            con.setAutoCommit(false);

            String insertRequestSql = "INSERT INTO request_cancellations (user_id, order_id, reason, request_status) VALUES (?, ?, ?, ?)";
            @Cleanup
            PreparedStatement stm = con.prepareStatement(insertRequestSql);
            stm.setString(1, userId);
            stm.setString(2, orderId);
            stm.setString(3, reason);
            stm.setBoolean(4, false);
            int rowsAffected = stm.executeUpdate();

            if (rowsAffected > 0) {
                String updateOrderSql = "UPDATE `orders` SET status = ? WHERE order_id = ? ";
                stm = con.prepareStatement(updateOrderSql);
                stm.setInt(1, 6);
                stm.setString(2, orderId);
                int updatedRows = stm.executeUpdate();

                if (updatedRows > 0) {
                    result = true;
                }
            }

            con.commit();
        }
        return result;
    }

    public Map<String, Integer> getTotalPurchasesByCategory() throws SQLException, NamingException {
        Map<String, Integer> totalPurchasesMap = new HashMap<>();

        @Cleanup
        Connection con = DBConnect.createConnection();
        if (con != null) {
            String sql = "SELECT c.name AS category_name, SUM(p.purchases) AS total_purchases "
                    + "FROM products p "
                    + "JOIN categories c ON p.category_id = c.category_id "
                    + "GROUP BY c.name";
            @Cleanup
            PreparedStatement stm = con.prepareStatement(sql);

            @Cleanup
            ResultSet rs = stm.executeQuery();

            // Duyệt qua kết quả truy vấn và lưu tổng lượt mua của từng danh mục vào Map
            while (rs.next()) {
                String categoryName = rs.getString("category_name");
                int totalPurchases = rs.getInt("total_purchases");
                totalPurchasesMap.put(categoryName, totalPurchases);
            }
        }
        return totalPurchasesMap;
    }

    public int calculateTotalRevenue() throws SQLException, NamingException {
        int totalRevenue = 0;

        try (Connection con = DBConnect.createConnection()) {
            if (con != null) {
                String sql = "SELECT SUM(amount) AS totalRevenue "
                        + "FROM orders "
                        + "WHERE status = 5";
                try (PreparedStatement statement = con.prepareStatement(sql)) {

                    try (ResultSet resultSet = statement.executeQuery()) {
                        if (resultSet.next()) {
                            totalRevenue = resultSet.getInt("totalRevenue");
                        }
                    }
                }
            }
        }

        return totalRevenue;
    }

    public List<ChartDTO> getRevenueByMonth() throws SQLException, NamingException {
        List<ChartDTO> revenueList = new ArrayList<>();

        @Cleanup
        Connection con = DBConnect.createConnection();
        if (con != null) {
            String sql = "SELECT MONTH(created_at) AS month, SUM(amount) AS total_revenue "
                    + "FROM orders "
                    + "WHERE status = 5 "
                    + "GROUP BY MONTH(created_at)";
            @Cleanup
            PreparedStatement stm = con.prepareStatement(sql);

            @Cleanup
            ResultSet rs = stm.executeQuery();

            // Duyệt qua kết quả truy vấn và tạo đối tượng ChartDTO tương ứng cho mỗi tháng
            while (rs.next()) {
                int month = rs.getInt("month");
                int revenue = rs.getInt("total_revenue");
                ChartDTO chart = ChartDTO.builder()
                        .date("Tháng " + month)
                        .value(revenue)
                        .build();
                revenueList.add(chart);
            }
        }

        return revenueList;
    }

    public boolean getPaymentStatusByOrderId(String orderId) throws SQLException, NamingException {
        boolean paymentStatus = false;

        @Cleanup
        Connection con = DBConnect.createConnection();
        if (con != null) {
            String sql = "SELECT payment_status FROM orders WHERE order_id = ?";
            @Cleanup
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, orderId);
            @Cleanup
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                paymentStatus = rs.getBoolean("payment_status");
            }
        }

        return paymentStatus;
    }

}

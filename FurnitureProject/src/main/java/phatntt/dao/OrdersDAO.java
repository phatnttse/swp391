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
import java.util.List;
import javax.naming.NamingException;
import lombok.Cleanup;
import phatntt.dto.OrderDTO;
import phatntt.dto.RequestCancellationDTO;
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
            String sql = "INSERT INTO `order` (order_id, user_id, email, name, phone, shipping_address, note, status, payment_status, payment_method, amount) "
                    + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
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

            int affectedRows = stm.executeUpdate();
            result = affectedRows > 0;
        }

        return result;
    }

    public void addOrderDetail(String orderId, int productId, String title, int price, int quantity, String thumbnail, int totalMoney) throws SQLException, NamingException {

        @Cleanup
        Connection con = DBConnect.createConnection();
        if (con != null) {
            String sql = "INSERT INTO order_detail (order_id, product_id, title, price, quantity, thumbnail, total_money) "
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

    public boolean cancelOrder(String orderId) throws SQLException, NamingException {
        boolean result = false;

        @Cleanup
        Connection con = DBConnect.createConnection();
        if (con != null) {
            String sql = "UPDATE `order` SET status = ? WHERE order_id = ?";
            @Cleanup
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, 5);
            stm.setString(2, orderId);
            int affectedRows = stm.executeUpdate();
            result = affectedRows > 0;
        }

        return result;
    }

    public void clearCartByUserId(String userId) throws SQLException, NamingException {

        @Cleanup
        Connection con = DBConnect.createConnection();
        if (con != null) {
            String sql = "DELETE FROM cart WHERE user_id = ?";
            @Cleanup
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, userId);
            stm.executeUpdate();
        }

    }

    public List<OrderDTO> getAllOrders() throws SQLException, NamingException {
        List<OrderDTO> orders = new ArrayList<>();

        @Cleanup
        Connection con = DBConnect.createConnection();
        if (con != null) {
            String sql = "SELECT o.*, os.name AS status_name "
                    + "FROM `order` o "
                    + "INNER JOIN `order_status` os ON o.status = os.status_id";
            @Cleanup
            PreparedStatement stm = con.prepareStatement(sql);
            @Cleanup
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                OrderDTO order = OrderDTO.builder()
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
                orders.add(order);
            }
        }

        return orders;
    }

    public OrderDTO getOrderById(String orderId) throws SQLException, NamingException {
        OrderDTO order = null;

        @Cleanup
        Connection con = DBConnect.createConnection();
        if (con != null) {
            String sql = "SELECT o.*, os.name AS status_name "
                    + "FROM `order` o "
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
                    + "    `order` o\n"
                    + "JOIN \n"
                    + "    `order_detail` od ON o.order_id = od.order_id\n"
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

    public List<OrderDTO> getOrdersByCondition(String condition) throws SQLException, NamingException {
        List<OrderDTO> orders = new ArrayList<>();

        @Cleanup
        Connection con = DBConnect.createConnection();
        if (con != null) {
            String sql = "SELECT o.*, os.name AS status_name "
                    + "FROM `order` o "
                    + "INNER JOIN `order_status` os ON o.status = os.status_id "
                    + condition;
            @Cleanup
            PreparedStatement stm = con.prepareStatement(sql);
            @Cleanup
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                OrderDTO order = OrderDTO.builder()
                        .orderId(rs.getString("order_id"))
                        .build();
                orders.add(order);
            }
        }

        return orders;
    }

    public boolean requestCancellation(String userId, String orderId, String reason)
            throws SQLException, NamingException {
        boolean result = false;

        @Cleanup
        Connection con = DBConnect.createConnection();
        if (con != null) {
            con.setAutoCommit(false);

            String insertRequestSql = "INSERT INTO request_cancellation (user_id, order_id, reason, request_status) VALUES (?, ?, ?, ?)";
            @Cleanup
            PreparedStatement stm = con.prepareStatement(insertRequestSql);
            stm.setString(1, userId);
            stm.setString(2, orderId);
            stm.setString(3, reason);
            stm.setBoolean(4, false);
            int rowsAffected = stm.executeUpdate();

            if (rowsAffected > 0) {
                String updateOrderSql = "UPDATE `order` SET status = ? WHERE order_id = ? ";
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

    public RequestCancellationDTO getRequestCancellationByOrderId(String orderId)
            throws SQLException, NamingException {

        @Cleanup
        Connection con = DBConnect.createConnection();
        if (con != null) {
            String sql = "SELECT id, user_id, reason, request_status, created_at FROM request_cancellation WHERE order_id = ?";
            @Cleanup
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, orderId);
            @Cleanup
            ResultSet rs = stm.executeQuery();

            if (rs.next()) {
                return RequestCancellationDTO.builder()
                        .id(rs.getInt("id"))
                        .userId(rs.getString("user_id"))
                        .orderId(orderId)
                        .reason(rs.getString("reason"))
                        .requestStatus(rs.getBoolean("request_status"))
                        .createdAt(rs.getTimestamp("created_at"))
                        .build();
            }
        }

        return null;
    }

    public List<RequestCancellationDTO> getAllRequestCancellations() throws SQLException, NamingException {
        List<RequestCancellationDTO> requestList = new ArrayList<>();

        @Cleanup
        Connection con = DBConnect.createConnection();
        if (con != null) {
            String sql = "SELECT rc.id, rc.user_id, o.name, o.email, o.phone, rc.order_id, rc.reason, rc.request_status, rc.created_at "
                    + "FROM request_cancellation rc "
                    + "JOIN `order` o ON rc.order_id = o.order_id";
            @Cleanup
            PreparedStatement stm = con.prepareStatement(sql);
            @Cleanup
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                RequestCancellationDTO request = RequestCancellationDTO.builder()
                        .id(rs.getInt("id"))
                        .userId(rs.getString("user_id"))
                        .name(rs.getString("name"))
                        .email(rs.getString("email"))
                        .phone(rs.getString("phone"))
                        .orderId(rs.getString("order_id"))
                        .reason(rs.getString("reason"))
                        .requestStatus(rs.getBoolean("request_status"))
                        .createdAt(rs.getTimestamp("created_at"))
                        .build();

                requestList.add(request);
            }

        }

        return requestList;
    }

    public void deleteRequestToCancelOrder(String orderId) throws SQLException, NamingException {

        @Cleanup
        Connection con = DBConnect.createConnection();
        if (con != null) {
            con.setAutoCommit(false);

            String sqlOrder = "UPDATE `order` SET status = ? WHERE order_id = ?";
            @Cleanup
            PreparedStatement stm = con.prepareStatement(sqlOrder);
            stm.setInt(1, 7);
            stm.setString(2, orderId);
            stm.executeUpdate();

            String sqlRequest = "UPDATE request_cancellation SET request_status = true WHERE order_id = ?";
            stm = con.prepareStatement(sqlRequest);
            stm.setString(1, orderId);
            stm.executeUpdate();

            con.commit();

        }
    }

}

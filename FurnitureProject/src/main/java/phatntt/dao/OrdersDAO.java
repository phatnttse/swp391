/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package phatntt.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;
import phatntt.dto.OrderDTO;
import phatntt.dto.RequestCancellationDTO;
import phatntt.util.DBConnect;
import phatntt.util.Key_Utils;

/**
 *
 * @author Admin
 */
public class OrdersDAO {

    private Connection con = null;
    private PreparedStatement stm = null;
    private ResultSet rs = null;

    public boolean createOrder(String orderId, String user_id, String email, String name, String phone, String shipping_address, String note, int status, String payment_method, boolean payment_status, int amount) throws SQLException, NamingException {
        boolean result = false;
        try {
            // Create connection
            con = DBConnect.createConnection();
            if (con != null) {
                // Prepare SQL statement
                String sql = "INSERT INTO `order` (order_id, user_id, email, name, phone, shipping_address, note, status, payment_status, payment_method, amount) "
                        + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
                stm = con.prepareStatement(sql);

                // Set values for parameters
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

                // Execute the query
                int affectedRows = stm.executeUpdate();

                // Check if the query was successful
                if (affectedRows > 0) {
                    result = true;
                }
            }
        } finally {

            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }

        return result;
    }

    public void addOrderDetail(String orderId, int productId, String title, int price, int quantity, String thumbnail, int totalMoney) throws SQLException, NamingException {

        try {
            con = DBConnect.createConnection();
            if (con != null) {
                String sql = "INSERT INTO order_detail (order_id, product_id, title, price, quantity, thumbnail, total_money) "
                        + "VALUES (?, ?, ?, ?, ?, ?, ?)";
                stm = con.prepareStatement(sql);
                stm.setString(1, orderId);
                stm.setInt(2, productId);
                stm.setString(3, title);
                stm.setInt(4, price);
                stm.setInt(5, quantity);
                stm.setString(6, thumbnail);
                stm.setInt(7, totalMoney);
                stm.executeUpdate();

            }
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }

    }

    public boolean cancelOrder(String orderId) throws SQLException, NamingException {
        boolean result = false;
        try {
            con = DBConnect.createConnection();
            if (con != null) {
                String sql = "UPDATE `order` SET status = ? WHERE order_id = ?";
                stm = con.prepareStatement(sql);
                stm.setInt(1, 5);
                stm.setString(2, orderId);
                int affectedRows = stm.executeUpdate();
                if (affectedRows > 0) {
                    result = true;
                }
            }
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return result;
    }

    public void clearCartByUserId(String userId) throws SQLException, NamingException {

        try {
            con = DBConnect.createConnection();
            if (con != null) {
                String sql = "DELETE FROM cart WHERE user_id = ?";
                stm = con.prepareStatement(sql);
                stm.setString(1, userId);
                stm.executeUpdate();
            }
        } finally {

            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }

    }

    public List<OrderDTO> getAllOrders() throws SQLException, NamingException {
        List<OrderDTO> orders = new ArrayList<>();

        try {
            con = DBConnect.createConnection();
            if (con != null) {
                String sql = "SELECT o.*, os.name AS status_name "
                        + "FROM `order` o "
                        + "INNER JOIN `order_status` os ON o.status = os.status_id";
                stm = con.prepareStatement(sql);
                rs = stm.executeQuery();

                while (rs.next()) {
                    OrderDTO order = new OrderDTO();
                    order.setOrderId(rs.getString("order_id")); // Set order_id as String
                    order.setUserId(rs.getString("user_id"));
                    order.setEmail(rs.getString("email"));
                    order.setName(rs.getString("name"));
                    order.setPhone(rs.getString("phone"));
                    order.setAddress(rs.getString("shipping_address"));
                    order.setNote(rs.getString("note"));
                    order.setStatus(rs.getInt("status"));
                    order.setPaymentStatus(rs.getBoolean("payment_status"));
                    order.setPaymentMethod(rs.getString("payment_method"));
                    order.setAmount(rs.getInt("amount"));
                    order.setStatusName(rs.getString("status_name"));
                    order.setCreatedAt(rs.getTimestamp("created_at")); // Set trạng thái bằng tên

                    orders.add(order);
                }
            }
        } finally {
            // Close resources
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }

        return orders;
    }

    public OrderDTO getOrderById(String orderId) throws SQLException, NamingException {
        OrderDTO order = null;
        try {
            con = DBConnect.createConnection();
            if (con != null) {
                String sql = "SELECT o.*, os.name AS status_name "
                        + "FROM `order` o "
                        + "INNER JOIN `order_status` os ON o.status = os.status_id "
                        + "WHERE o.order_id = ?";
                stm = con.prepareStatement(sql);
                stm.setString(1, orderId);
                rs = stm.executeQuery();

                if (rs.next()) {
                    order = new OrderDTO();
                    order.setOrderId(rs.getString("order_id")); // Set order_id as String
                    order.setUserId(rs.getString("user_id"));
                    order.setEmail(rs.getString("email"));
                    order.setName(rs.getString("name"));
                    order.setPhone(rs.getString("phone"));
                    order.setAddress(rs.getString("shipping_address"));
                    order.setNote(rs.getString("note"));
                    order.setStatus(rs.getInt("status"));
                    order.setPaymentStatus(rs.getBoolean("payment_status"));
                    order.setPaymentMethod(rs.getString("payment_method"));
                    order.setAmount(rs.getInt("amount"));
                    order.setStatusName(rs.getString("status_name"));
                    order.setCreatedAt(rs.getTimestamp("created_at"));
                }
            }
        } finally {
            // Close resources
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }

        return order;
    }

    public List<OrderDTO> allOwnOrder(String user_id) throws SQLException, NamingException {
        List<OrderDTO> list = new ArrayList<>();
        try {
            con = DBConnect.createConnection();
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
                stm = con.prepareCall(sql);
                stm.setString(1, user_id);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String order_id = rs.getString("order_id"); // Use String for order_id
                    String email = rs.getString("email");
                    String name = rs.getString("name");
                    String phone = rs.getString("phone");
                    String shipping_address = rs.getString("shipping_address");
                    String note = rs.getString("note");
                    int status = rs.getInt("status");
                    String statusName = rs.getString("status_name");
                    boolean payment_status = rs.getBoolean("payment_status");
                    String payment_method = rs.getString("payment_method");
                    int amount = rs.getInt("amount");
                    Timestamp created_at = rs.getTimestamp("created_at");
                    int priceOfOrder = rs.getInt("total_order_price");
                    OrderDTO odto = new OrderDTO(order_id, user_id, email, name, phone, shipping_address, note, status, statusName, payment_status, payment_method, amount, created_at);
                    odto.setFormattedPrice(Key_Utils.getInstance().formattedPrice(priceOfOrder));
                    list.add(odto);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return list;
    }

    public List<OrderDTO> getOrdersByCondition(String condition) throws SQLException, NamingException {
        List<OrderDTO> orders = new ArrayList<>();

        try {
            con = DBConnect.createConnection();
            if (con != null) {
                String sql = "SELECT o.*, os.name AS status_name "
                        + "FROM `order` o "
                        + "INNER JOIN `order_status` os ON o.status = os.status_id "
                        + condition;
                stm = con.prepareStatement(sql);
                rs = stm.executeQuery();

                while (rs.next()) {
                    OrderDTO order = new OrderDTO();
                    order.setOrderId(rs.getString("order_id")); // Set order_id as String
                    orders.add(order);
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }

        return orders;
    }

    public boolean RequestCancellation(String userId, String orderId, String reason)
            throws SQLException, NamingException {
        boolean result = false;

        try {
            con = DBConnect.createConnection();
            if (con != null) {
                // Start a transaction
                con.setAutoCommit(false);

                // Insert a new request_cancellation record
                String insertRequestSql = "INSERT INTO request_cancellation (user_id, order_id, reason, request_status) VALUES (?, ?, ?, ?)";
                stm = con.prepareStatement(insertRequestSql);
                stm.setString(1, userId);
                stm.setString(2, orderId);
                stm.setString(3, reason);
                stm.setBoolean(4, false);
                int rowsAffected = stm.executeUpdate();

                if (rowsAffected > 0) {
                    // Update the order status to 'Pending Cancellation Confirmation'
                    String updateOrderSql = "UPDATE `order` SET status = ? WHERE order_id = ? ";
                    stm = con.prepareStatement(updateOrderSql);
                    stm.setInt(1, 6);
                    stm.setString(2, orderId);
                    int updatedRows = stm.executeUpdate();

                    if (updatedRows > 0) {
                        result = true;
                    }
                }

                // Commit the transaction
                con.commit();
            }
        } catch (SQLException ex) {
            // Rollback the transaction in case of an exception
            if (con != null) {
                con.rollback();
            }
            throw ex;
        } finally {
            // Reset auto-commit mode and close resources
            if (con != null) {
                con.setAutoCommit(true);
                con.close();
            }
            if (stm != null) {
                stm.close();
            }
        }

        return result;
    }

    public RequestCancellationDTO getRequestCancellationByOrderId(String orderId)
            throws SQLException, NamingException {

        try {
            con = DBConnect.createConnection();
            if (con != null) {
                String sql = "SELECT id, user_id, reason, request_status, created_at FROM request_cancellation WHERE order_id = ?";
                stm = con.prepareStatement(sql);
                stm.setString(1, orderId);
                rs = stm.executeQuery();

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
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }

        return null;
    }

    public List<RequestCancellationDTO> getAllRequestCancellations() throws SQLException, NamingException {
        List<RequestCancellationDTO> requestList = new ArrayList<>();

        try {
            con = DBConnect.createConnection();
            if (con != null) {
                String sql = "SELECT rc.id, rc.user_id, u.name, u.email, u.phone, rc.order_id, rc.reason, rc.request_status, rc.created_at "
                        + "FROM request_cancellation rc "
                        + "JOIN user u ON rc.user_id = u.user_id";
                stm = con.prepareStatement(sql);
                rs = stm.executeQuery();

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
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }

        return requestList;
    }

}

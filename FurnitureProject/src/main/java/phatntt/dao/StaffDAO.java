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
import phatntt.dto.OrderDetailDTO;
import phatntt.dto.OrderStatusDTO;
import phatntt.dto.ProductsDTO;
import phatntt.dto.RequestCancellationDTO;
import phatntt.util.DBConnect;

/**
 *
 * @author Admin
 */
public class StaffDAO {

    public List<OrderDetailDTO> getOrderDetailsByOrderId(String orderId) throws SQLException, NamingException {
        List<OrderDetailDTO> orderDetails = new ArrayList<>();

        @Cleanup
        Connection con = DBConnect.createConnection();
        if (con != null) {
            String sql = "SELECT * FROM order_details WHERE order_id = ?";
            @Cleanup
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, orderId);
            @Cleanup
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                OrderDetailDTO orderDetail = OrderDetailDTO.builder()
                        .id(rs.getInt("id"))
                        .order_id(orderId)
                        .product_id(rs.getInt("product_id"))
                        .title(rs.getString("title"))
                        .price(rs.getInt("price"))
                        .quantity(rs.getInt("quantity"))
                        .thumbnail(rs.getString("thumbnail"))
                        .total_money(rs.getInt("total_money"))
                        .build();

                orderDetails.add(orderDetail);
            }
        }

        return orderDetails;
    }

    public List<OrderStatusDTO> getAllOrderStatus() throws SQLException, NamingException {
        List<OrderStatusDTO> orderStatusList = new ArrayList<>();

        @Cleanup
        Connection con = DBConnect.createConnection();
        if (con != null) {
            String sql = "SELECT * FROM order_status";
            @Cleanup
            PreparedStatement stm = con.prepareStatement(sql);
            @Cleanup
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                OrderStatusDTO orderStatus = OrderStatusDTO.builder()
                        .statusId(rs.getInt("status_id"))
                        .name(rs.getString("name"))
                        .build();

                orderStatusList.add(orderStatus);
            }
        }

        return orderStatusList;
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

    public List<OrderDTO> getAllOrders() throws SQLException, NamingException {
        List<OrderDTO> orders = new ArrayList<>();

        @Cleanup
        Connection con = DBConnect.createConnection();
        if (con != null) {
            String sql = "SELECT o.*, os.name AS status_name "
                    + "FROM `orders` o "
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
                        .status(rs.getInt("status"))
                        .statusName(rs.getString("status_name"))
                        .createdAt(rs.getTimestamp("created_at"))
                        .build();
                orders.add(order);
            }
        }

        return orders;
    }

    public List<OrderDTO> filterOrderByStatus(int status) throws SQLException, NamingException {
        List<OrderDTO> orders = new ArrayList<>();

        @Cleanup
        Connection con = DBConnect.createConnection();
        if (con != null) {
            String sql = "SELECT o.*, os.name AS status_name "
                    + "FROM `orders` o "
                    + "INNER JOIN `order_status` os ON o.status = os.status_id "
                    + "WHERE o.status = ?";
            @Cleanup
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, status);
            @Cleanup
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                OrderDTO order = OrderDTO.builder()
                        .orderId(rs.getString("order_id"))
                        .userId(rs.getString("user_id"))
                        .email(rs.getString("email"))
                        .name(rs.getString("name"))
                        .phone(rs.getString("phone"))
                        .status(rs.getInt("status"))
                        .statusName(rs.getString("status_name"))
                        .createdAt(rs.getTimestamp("created_at"))
                        .build();
                orders.add(order);
            }
        }

        return orders;
    }

    public List<OrderDTO> filterOrderByDate(String filterDate) throws SQLException, NamingException {
        List<OrderDTO> orders = new ArrayList<>();

        @Cleanup
        Connection con = DBConnect.createConnection();
        if (con != null) {
            String sql = "SELECT o.*, os.name AS status_name "
                    + "FROM `orders` o "
                    + "INNER JOIN `order_status` os ON o.status = os.status_id "
                    + "WHERE DATE(o.created_at) = ?";
            @Cleanup
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, filterDate);
            @Cleanup
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                OrderDTO order = OrderDTO.builder()
                        .orderId(rs.getString("order_id"))
                        .userId(rs.getString("user_id"))
                        .email(rs.getString("email"))
                        .name(rs.getString("name"))
                        .phone(rs.getString("phone"))
                        .status(rs.getInt("status"))
                        .statusName(rs.getString("status_name"))
                        .createdAt(rs.getTimestamp("created_at"))
                        .build();
                orders.add(order);
            }
        }

        return orders;
    }

    public List<OrderDTO> filterOrderByStatusAndDate(int status, String filterDate) throws SQLException, NamingException {
        List<OrderDTO> orders = new ArrayList<>();

        @Cleanup
        Connection con = DBConnect.createConnection();
        if (con != null) {
            String sql = "SELECT o.*, os.name AS status_name "
                    + "FROM `orders` o "
                    + "INNER JOIN `order_status` os ON o.status = os.status_id "
                    + "WHERE o.status = ? AND DATE(o.created_at) = ?";
            @Cleanup
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, status);
            stm.setString(2, filterDate);
            @Cleanup
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                OrderDTO order = OrderDTO.builder()
                        .orderId(rs.getString("order_id"))
                        .userId(rs.getString("user_id"))
                        .email(rs.getString("email"))
                        .name(rs.getString("name"))
                        .phone(rs.getString("phone"))
                        .status(rs.getInt("status"))
                        .statusName(rs.getString("status_name"))
                        .createdAt(rs.getTimestamp("created_at"))
                        .build();
                orders.add(order);
            }
        }

        return orders;
    }
    public String getStatusNameById(int statusId) throws SQLException, NamingException {
    String statusName = null;

    @Cleanup
    Connection con = DBConnect.createConnection();
    if (con != null) {
        String sql = "SELECT name FROM order_status WHERE status_id = ?";
        @Cleanup
        PreparedStatement stm = con.prepareStatement(sql);
        stm.setInt(1, statusId);
        @Cleanup
        ResultSet rs = stm.executeQuery();

        if (rs.next()) {
            statusName = rs.getString("name");
        }
    }

    return statusName;
}


    public List<OrderDTO> getOrdersByCondition(String condition) throws SQLException, NamingException {
        List<OrderDTO> orders = new ArrayList<>();

        @Cleanup
        Connection con = DBConnect.createConnection();
        if (con != null) {
            String sql = "SELECT o.*, os.name AS status_name "
                    + "FROM `orders` o "
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

    public void cancelOrderAndDeleteRequest(String orderId) throws SQLException, NamingException {

        @Cleanup
        Connection con = DBConnect.createConnection();
        if (con != null) {
            String deleteRequestSql = "DELETE FROM request_cancellations WHERE order_id = ?";
            @Cleanup
            PreparedStatement stmRequest = con.prepareStatement(deleteRequestSql);
            stmRequest.setString(1, orderId);
            stmRequest.executeUpdate();

            String updateOrderSql = "UPDATE `orders` SET status = ? WHERE order_id = ?";
            @Cleanup
            PreparedStatement stmOrder = con.prepareStatement(updateOrderSql);
            stmOrder.setInt(1, 7);
            stmOrder.setString(2, orderId);
            stmOrder.executeUpdate();

        }
    }

    public void refuseToCancelOrder(String orderId) throws SQLException, NamingException {
        @Cleanup
        Connection con = DBConnect.createConnection();
        if (con != null) {
            try {
                // Lấy giá trị previous_status từ bảng orders
                int previousStatus = getPreviousOrderStatus(orderId);

                // Xoá yêu cầu huỷ từ bảng request_cancellations
                String deleteRequestSql = "DELETE FROM request_cancellations WHERE order_id = ?";

                @Cleanup
                PreparedStatement stmRequest = con.prepareStatement(deleteRequestSql);
                stmRequest.setString(1, orderId);
                stmRequest.executeUpdate();

                // Cập nhật status bằng previous_status
                String updateOrderSql = "UPDATE orders SET status = ? WHERE order_id = ?";
                @Cleanup
                PreparedStatement stmOrder = con.prepareStatement(updateOrderSql);
                stmOrder.setInt(1, previousStatus);
                stmOrder.setString(2, orderId);
                stmOrder.executeUpdate();

            } catch (SQLException ex) {
                ex.printStackTrace();
                // Xử lý ngoại lệ
            }
        }
    }

// Phương thức để lấy giá trị previous_status từ bảng orders
    private int getPreviousOrderStatus(String orderId) throws SQLException, NamingException {
        int previousStatus = 0;

        @Cleanup
        Connection con = DBConnect.createConnection();
        String query = "SELECT previous_status FROM orders WHERE order_id = ?";

        @Cleanup
        PreparedStatement statement = con.prepareStatement(query);
        statement.setString(1, orderId);

        @Cleanup
        ResultSet rs = statement.executeQuery();

        if (rs.next()) {
            previousStatus = rs.getInt("previous_status");
        }

        return previousStatus;
    }

    public List<RequestCancellationDTO> getAllRequestCancellations() throws SQLException, NamingException {
        List<RequestCancellationDTO> requestList = new ArrayList<>();

        @Cleanup
        Connection con = DBConnect.createConnection();
        if (con != null) {
            String sql = "SELECT rc.id, rc.user_id, o.name, o.email, o.phone, o.amount, o.created_at AS order_date, rc.order_id, rc.reason, rc.request_status, rc.created_at "
                    + "FROM request_cancellations rc "
                    + "JOIN `orders` o ON rc.order_id = o.order_id";
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
                        .amount(rs.getInt("amount"))
                        .orderDate(rs.getTimestamp("order_date"))
                        .createdAt(rs.getTimestamp("created_at"))
                        .build();

                requestList.add(request);
            }

        }

        return requestList;
    }

    public boolean addProduct(ProductsDTO product) throws SQLException, NamingException {
        boolean result = false;

        @Cleanup
        Connection con = DBConnect.createConnection();
        if (con != null) {
            String sql = "INSERT INTO products(category_id, title, description, quantity, price, thumbnail, discount) "
                    + "VALUES (?, ?, ?, ?, ?, ?, ?)";
            @Cleanup
            PreparedStatement stm = con.prepareStatement(sql);

            stm.setInt(1, product.getCategoryId());
            stm.setString(2, product.getTitle());
            stm.setString(3, product.getDescription());
            stm.setInt(4, product.getQuantity());
            stm.setInt(5, product.getPrice());
            stm.setString(6, product.getThumbnail());
            stm.setInt(7, product.getDiscount());

            int rowsAffected = stm.executeUpdate();
            if (rowsAffected > 0) {
                result = true;
            }

        }
        return result;
    }

    public boolean deleteProduct(int productId) throws SQLException, NamingException {
        boolean result = false;

        @Cleanup
        Connection con = DBConnect.createConnection();
        if (con != null) {
            String sql = "DELETE FROM products WHERE product_id = ?";
            @Cleanup
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, productId);

            int rowsAffected = stm.executeUpdate();
            if (rowsAffected > 0) {
                result = true;
            }
        }
        return result;
    }

    public boolean acceptOrders(String orderId) throws SQLException, NamingException {
        boolean result = false;

        @Cleanup
        Connection con = DBConnect.createConnection();
        if (con != null) {
            String sql = "UPDATE `orders` "
                    + "SET status = 2 "
                    + "WHERE order_id = ?";
            @Cleanup
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, orderId);

            int rowsAffected = stm.executeUpdate();
            if (rowsAffected > 0) {
                result = true;
            }
        }
        return result;
    }

    public boolean updateProduct(ProductsDTO product) throws SQLException, NamingException {

        boolean result = false;

        @Cleanup
        Connection con = DBConnect.createConnection();
        if (con != null) {
            String sql = "UPDATE products "
                    + "SET category_id = ?, title = ?,  description = ?, price = ?,  quantity = ?, "
                    + " thumbnail = ?, discount = ? "
                    + "WHERE product_id = ?";
            @Cleanup
            PreparedStatement stm = con.prepareStatement(sql);

            stm.setInt(1, product.getCategoryId());
            stm.setString(2, product.getTitle());
            stm.setString(3, product.getDescription());
            stm.setInt(4, product.getPrice());
            stm.setInt(5, product.getQuantity());
            stm.setString(6, product.getThumbnail());
            stm.setInt(7, product.getDiscount());
            stm.setInt(8, product.getProductId());

            int affectedRows = stm.executeUpdate();
            if (affectedRows > 0) {
                result = true;
            }

        }

        return result;
    }

}

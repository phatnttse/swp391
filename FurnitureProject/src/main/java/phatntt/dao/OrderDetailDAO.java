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
import phatntt.dto.OrderDTO;
import phatntt.util.DBConnect;

/**
 *
 * @author Admin
 */
public class OrderDetailDAO {

    private Connection con = null;
    private PreparedStatement stm = null;
    private ResultSet rs = null;

    public void addOrderDetail(int orderId, int productId, String title, float price, int quantity, String thumbnail, float totalMoney) throws SQLException, NamingException {
       
        try {
            con = DBConnect.createConnection();
            if (con != null) {
                String sql = "INSERT INTO order_detail (order_id, product_id, title, price, quantity, thumbnail, total_money) "
                        + "VALUES (?, ?, ?, ?, ?, ?, ?)";
                stm = con.prepareStatement(sql);
                stm.setInt(1, orderId);
                stm.setInt(2, productId);
                stm.setString(3, title);
                stm.setFloat(4, price);
                stm.setInt(5, quantity);
                stm.setString(6, thumbnail);
                stm.setFloat(7, totalMoney);
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

    public OrderDTO getOrderById(int orderId) throws SQLException, NamingException {
        OrderDTO result = null;
        try {
            con = DBConnect.createConnection();
            if (con != null) {
                String sql = "SELECT * FROM `order` WHERE order_id = ?";
                stm = con.prepareStatement(sql);
                stm.setInt(1, orderId);
                rs = stm.executeQuery();
                if (rs.next()) {
                    // Khởi tạo một đối tượng OrderDTO và đổ dữ liệu từ ResultSet vào đối tượng này
                    result = new OrderDTO();
                    result.setOrder_id(rs.getInt("order_id"));
                    result.setUser_id(rs.getString("user_id"));
                    result.setEmail(rs.getString("email"));
                    result.setName(rs.getString("name"));
                    result.setPhone(rs.getString("phone"));
                    result.setAddress(rs.getString("shipping_address"));
                    result.setNote(rs.getString("note"));
                    result.setStatus(rs.getInt("status"));
                    result.setPayment_method(rs.getString("payment_method"));
                    result.setCreatedAt(rs.getTimestamp("created_at"));
                }
            }
        } finally {
            // Đảm bảo giải phóng tài nguyên
            try {
                if (rs != null) {
                    rs.close();
                }
                if (stm != null) {
                    stm.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException ex) {
                // Xử lý ngoại lệ nếu có
                ex.printStackTrace();
            }
        }
        return result;
    }

}

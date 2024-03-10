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
import phatntt.dto.OrderDetailDTO;
import phatntt.dto.OrderStatusDTO;
import phatntt.util.DBConnect;

/**
 *
 * @author Admin
 */
public class OrderDetailDAO {

    private Connection con = null;
    private PreparedStatement stm = null;
    private ResultSet rs = null;

    

    public List<OrderDetailDTO> getOrderDetailsByOrderId(String orderId) throws SQLException, NamingException {
        List<OrderDetailDTO> orderDetails = new ArrayList<>();

        try {
            con = DBConnect.createConnection();
            if (con != null) {
                String sql = "SELECT * FROM order_detail WHERE order_id = ?";
                stm = con.prepareStatement(sql);
                stm.setString(1, orderId);
                rs = stm.executeQuery();

                while (rs.next()) {
                    OrderDetailDTO orderDetail = new OrderDetailDTO();
                    orderDetail.setId(rs.getInt("id"));
                    orderDetail.setOrder_id(rs.getString("order_id")); // Set order_id as String
                    orderDetail.setProduct_id(rs.getInt("product_id"));
                    orderDetail.setTitle(rs.getString("title"));
                    orderDetail.setPrice(rs.getInt("price"));
                    orderDetail.setQuantity(rs.getInt("quantity"));
                    orderDetail.setThumbnail(rs.getString("thumbnail"));
                    orderDetail.setTotal_money(rs.getInt("total_money"));

                    orderDetails.add(orderDetail);
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

        return orderDetails;
    }

    public List<OrderStatusDTO> getAllOrderStatus() throws SQLException, NamingException {
        List<OrderStatusDTO> orderStatusList = new ArrayList<>();

        try {
            con = DBConnect.createConnection();
            if (con != null) {
                String sql = "SELECT * FROM order_status";
                stm = con.prepareStatement(sql);
                rs = stm.executeQuery();

                while (rs.next()) {
                    OrderStatusDTO orderStatus = new OrderStatusDTO();
                    orderStatus.setStatusId(rs.getInt("status_id"));
                    orderStatus.setName(rs.getString("name"));
                    orderStatusList.add(orderStatus);
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
        return orderStatusList;
    }

    public boolean updateOrderStatus(String orderId, int statusId, boolean paymentStatus) throws SQLException, NamingException {

        boolean result = false;

        try {
            con = DBConnect.createConnection();
            if (con != null) {

                String sql = "UPDATE `order` SET status = ? , payment_status = ? WHERE order_id = ?";
                stm = con.prepareStatement(sql);
                stm.setInt(1, statusId);
                stm.setBoolean(2, paymentStatus);
                 stm.setString(3, orderId);
                int affectedRows = stm.executeUpdate();

                if (affectedRows > 0) {
                    result = true;
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
        return result;
    }

    public List<OrderDetailDTO> getAllOrderDetail(String orderId)
            throws SQLException, NamingException {
        List<OrderDetailDTO> list = new ArrayList<>();
        try {
            con = DBConnect.createConnection();
            if (con != null) {
                String sql = "SELECT \n"
                        + "    od.*,\n"
                        + "    o.created_at AS order_created_at,\n"
                        + "    o.name AS order_status_name\n"
                        + "FROM \n"
                        + "    `order_detail` od\n"
                        + "JOIN \n"
                        + "    `order` o ON od.order_id = o.order_id\n"
                        + "WHERE \n"
                        + "    od.order_id = ? ";
                stm = con.prepareStatement(sql);
                stm.setString(1, orderId);
                rs = stm.executeQuery();

                while (rs.next()) {
                    /**
                     * private int id; private int order_id; private int
                     * product_id; private String title; private float price;
                     * private int quantity; private String thumbnail; private
                     * float total_money;
                     */
                    int id = rs.getInt("id");
                    int product_id = rs.getInt("product_id");
                    String title = rs.getString("title");
                    int price = rs.getInt("price");
                    int quantity = rs.getInt("quantity");
                    String thumbnail = rs.getString("thumbnail");
                    int totalMoney = rs.getInt("total_money");
                    Timestamp createAt = rs.getTimestamp("order_created_at");
                    String name = rs.getString("order_status_name");
                  

                    OrderDetailDTO dTO = new OrderDetailDTO(id, orderId, product_id, title, price, quantity, thumbnail, totalMoney, name,createAt);
                    dTO.setCreateAt(createAt);
                    dTO.setName(name);
                    list.add(dTO);
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
        return list;
    }


}

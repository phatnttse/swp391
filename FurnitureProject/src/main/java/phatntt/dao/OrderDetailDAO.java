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
import phatntt.dto.OrderDetailDTO;
import phatntt.util.DBConnect;

/**
 *
 * @author Admin
 */
public class OrderDetailDAO {

 public static List<OrderDetailDTO> getAllOrderDetail(String orderId) throws SQLException, NamingException {
        List<OrderDetailDTO> list = new ArrayList<>();
        @Cleanup
        Connection con = DBConnect.createConnection();
        String sql = "SELECT \n"
                + "    od.*,\n"
                + "    o.created_at AS order_created_at,\n"
                + "    o.name AS order_status_name\n"
                + "FROM \n"
                + "    `order_details` od\n"
                + "JOIN \n"
                + "    `orders` o ON od.order_id = o.order_id\n"
                + "WHERE \n"
                + "    od.order_id = ? ";
        @Cleanup
        PreparedStatement stm = con.prepareStatement(sql);
        stm.setString(1, orderId);
        @Cleanup
        ResultSet rs = stm.executeQuery();
        while (rs.next()) {
            OrderDetailDTO orderDetail = OrderDetailDTO.builder()
                    .id(rs.getInt("id"))
                    .order_id(orderId) // Set order_id as String
                    .product_id(rs.getInt("product_id"))
                    .title(rs.getString("title"))
                    .price(rs.getInt("price"))
                    .quantity(rs.getInt("quantity"))
                    .thumbnail(rs.getString("thumbnail"))
                    .total_money(rs.getInt("total_money"))
                    .build();

            list.add(orderDetail);
        }
        return list;
    }

}

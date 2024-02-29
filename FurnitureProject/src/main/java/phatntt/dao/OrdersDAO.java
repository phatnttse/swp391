/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package phatntt.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.naming.NamingException;
import phatntt.dto.OrderDTO;
import phatntt.util.DBConnect;

/**
 *
 * @author Admin
 */
public class OrdersDAO {

    private Connection con = null;
    private PreparedStatement stm = null;
    private ResultSet rs = null;

    public int createOrder(String user_id, String email, String name, String phone, String shipping_address, String note, int status, String payment_method) throws SQLException, NamingException {
        int orderId = -1; // Initialize with an invalid ID

        try {
            // Create connection
            con = DBConnect.createConnection();
            if (con != null) {
                // Prepare SQL statement
                String sql = "INSERT INTO `order` (user_id, email, name, phone, shipping_address, note, status, payment_method) "
                        + "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
                stm = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

                // Set values for parameters
                stm.setString(1, user_id);
                stm.setString(2, email);
                stm.setString(3, name);
                stm.setString(4, phone);
                stm.setString(5, shipping_address);
                stm.setString(6, note);
                stm.setInt(7, status);
                stm.setString(8, payment_method);

                // Execute the query
                int affectedRows = stm.executeUpdate();

                // Check if the query was successful
                if (affectedRows > 0) {
                    // Retrieve the generated keys (order ID)
                    ResultSet generatedKeys = stm.getGeneratedKeys();
                    if (generatedKeys.next()) {
                        orderId = generatedKeys.getInt(1); // Retrieve the generated order ID
                    }
                }
            }
        } finally {
            // Close resources
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }

        return orderId; // Return the ID of the inserted order
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

}

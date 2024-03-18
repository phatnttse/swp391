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
import phatntt.dto.CartDTO;
import phatntt.util.DBConnect;

/**
 *
 * @author Admin
 */
public class CartDAO {

    public boolean addProductToCart(String userId, int productId, String title, String thumbnail, int quantity, int price) throws SQLException, NamingException {
        boolean result = false;

        @Cleanup
        Connection con = DBConnect.createConnection();

        if (con != null) {
            String checkIfExistsSQL = "SELECT * FROM carts WHERE user_id = ? AND product_id = ?";
            @Cleanup
            PreparedStatement stm = con.prepareStatement(checkIfExistsSQL);
            stm.setString(1, userId);
            stm.setInt(2, productId);
            @Cleanup
            ResultSet rs = stm.executeQuery();

            if (rs.next()) {
                int currentQuantity = rs.getInt("quantity");
                int newQuantity = currentQuantity + quantity;

                String updateQuantitySQL = "UPDATE carts SET quantity = ? WHERE user_id = ? AND product_id = ?";
                stm = con.prepareStatement(updateQuantitySQL);
                stm.setInt(1, newQuantity);
                stm.setString(2, userId);
                stm.setInt(3, productId);
                int rowsUpdated = stm.executeUpdate();

                if (rowsUpdated > 0) {
                    result = true;
                }
            } else {
                String insertSQL = "INSERT INTO carts (user_id, product_id, title, thumbnail, quantity, price) VALUES (?, ?, ?, ?, ?, ?)";
                stm = con.prepareStatement(insertSQL);
                stm.setString(1, userId);
                stm.setInt(2, productId);
                stm.setString(3, title);
                stm.setString(4, thumbnail);
                stm.setInt(5, quantity);
                stm.setInt(6, price);
                int affectedRows = stm.executeUpdate();

                if (affectedRows > 0) {
                    result = true;
                }
            }
        }

        return result;
    }

    public boolean reduceProductToCart(String userId, int productId) throws SQLException, NamingException {
        boolean result = false;

        @Cleanup
        Connection con = DBConnect.createConnection();

        if (con != null) {
            String checkIfExistsSQL = "SELECT * FROM carts WHERE user_id = ? AND product_id = ?";
            @Cleanup
            PreparedStatement stm = con.prepareStatement(checkIfExistsSQL);
            stm.setString(1, userId);
            stm.setInt(2, productId);
            @Cleanup
            ResultSet rs = stm.executeQuery();

            if (rs.next()) {
                int currentQuantity = rs.getInt("quantity");
                int newQuantity = currentQuantity - 1;
                if (newQuantity == 0) {
                    String sql = "DELETE FROM carts WHERE user_id = ? AND product_id = ?";
                    stm = con.prepareStatement(sql);
                    stm.setString(1, userId);
                    stm.setInt(2, productId);
                    int rowsUpdated = stm.executeUpdate();

                    if (rowsUpdated > 0) {
                        result = true;
                    }
                }

                String updateQuantitySQL = "UPDATE carts SET quantity = ? WHERE user_id = ? AND product_id = ?";
                stm = con.prepareStatement(updateQuantitySQL);
                stm.setInt(1, newQuantity);
                stm.setString(2, userId);
                stm.setInt(3, productId);
                int rowsUpdated = stm.executeUpdate();

                if (rowsUpdated > 0) {
                    result = true;
                }
            }
        }

        return result;
    }

    public List<CartDTO> getProductFromCartByProductId(int productId) throws SQLException, NamingException {
        List<CartDTO> result = new ArrayList<>();

        @Cleanup
        Connection con = DBConnect.createConnection();
        if (con != null) {
            String sql = "SELECT * FROM carts WHERE product_id = ?";
            @Cleanup
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, productId);
            @Cleanup
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                CartDTO cart = CartDTO.builder()
                        .cartId(rs.getInt("cart_id"))
                        .userId(rs.getString("user_id"))
                        .productId(rs.getInt("product_id"))
                        .title(rs.getString("title"))
                        .thumbnail(rs.getString("thumbnail"))
                        .quantity(rs.getInt("quantity"))
                        .price(rs.getInt("price"))
                        .build();

                result.add(cart);
            }
        }

        return result;
    }

    public List<CartDTO> getCartByUserId(String userId) throws SQLException, NamingException {
        List<CartDTO> cartList = new ArrayList<>();

        @Cleanup
        Connection con = DBConnect.createConnection();
        if (con != null) {
            String sql = "SELECT * FROM carts WHERE user_id = ?";
            @Cleanup
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, userId);
            @Cleanup
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                CartDTO cart = CartDTO.builder()
                        .cartId(rs.getInt("cart_id"))
                        .userId(userId)
                        .productId(rs.getInt("product_id"))
                        .title(rs.getString("title"))
                        .thumbnail(rs.getString("thumbnail"))
                        .quantity(rs.getInt("quantity"))
                        .price(rs.getInt("price"))
                        .build();

                cartList.add(cart);
            }
        }

        return cartList;
    }

    public CartDTO getProductFromCart(int productId) throws SQLException, NamingException {
        CartDTO result = null;

        @Cleanup
        Connection con = DBConnect.createConnection();
        if (con != null) {
            String sql = "SELECT * FROM carts WHERE product_id = ?";
            @Cleanup
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, productId);
            @Cleanup
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                result = CartDTO.builder()
                        .cartId(rs.getInt("cart_id"))
                        .userId(rs.getString("user_id"))
                        .productId(productId)
                        .title(rs.getString("title"))
                        .thumbnail(rs.getString("thumbnail"))
                        .quantity(rs.getInt("quantity"))
                        .price(rs.getInt("price"))
                        .build();
            }
        }

        return result;
    }

    public int getTotalQuantityInCart(String userId) throws SQLException, NamingException {
        int totalQuantity = 0;

        @Cleanup
        Connection con = DBConnect.createConnection();
        if (con != null) {
            String sql = "SELECT SUM(quantity) AS totalQuantity FROM carts WHERE user_id = ?";
            @Cleanup
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, userId);
            @Cleanup
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                totalQuantity = rs.getInt("totalQuantity");
            }
        }

        return totalQuantity;
    }

    public boolean removeProductFromCart(String userId, int productId) throws SQLException, NamingException {
        boolean result = false;

        @Cleanup
        Connection con = DBConnect.createConnection();
        if (con != null) {
            String sql = "DELETE FROM carts WHERE user_id = ? AND product_id = ?";
            @Cleanup
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, userId);
            stm.setInt(2, productId);
            stm.executeUpdate();
            int rowsAffected = stm.executeUpdate();
            if (rowsAffected > 0) {
                result = true;
            }
        }
        return result;
    }

}

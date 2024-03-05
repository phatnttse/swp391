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
import phatntt.dto.CartDTO;
import phatntt.util.DBConnect;

/**
 *
 * @author Admin
 */
public class CartDAO {

    private Connection con = null;
    private PreparedStatement stm = null;
    private ResultSet rs = null;

    public boolean addProductToCart(String userId, int productId, String title, String thumbnail, int quantity, int price) throws SQLException, NamingException {
        boolean result = false;

        try {
            con = DBConnect.createConnection();

            if (con != null) {
                // Kiểm tra xem sản phẩm đã có trong giỏ hàng hay chưa
                String checkIfExistsSQL = "SELECT * FROM cart WHERE user_id = ? AND product_id = ?";
                stm = con.prepareStatement(checkIfExistsSQL);
                stm.setString(1, userId);
                stm.setInt(2, productId);
                rs = stm.executeQuery();

                if (rs.next()) {
                    // Sản phẩm đã tồn tại trong giỏ hàng, cập nhật số lượng
                    int currentQuantity = rs.getInt("quantity");
                    int newQuantity = currentQuantity + 1;

                    // Cập nhật số lượng sản phẩm trong giỏ hàng
                    String updateQuantitySQL = "UPDATE cart SET quantity = ? WHERE user_id = ? AND product_id = ?";
                    stm = con.prepareStatement(updateQuantitySQL);
                    stm.setInt(1, newQuantity);
                    stm.setString(2, userId);
                    stm.setInt(3, productId);
                    int rowsUpdated = stm.executeUpdate();

                    if (rowsUpdated > 0) {
                        result = true;
                    }
                } else {
                    // Sản phẩm chưa tồn tại trong giỏ hàng, thêm mới
                    String insertSQL = "INSERT INTO cart (user_id, product_id, title, thumbnail, quantity, price) VALUES (?, ?, ?, ?, ?, ?)";
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

    public boolean reduceProductToCart(String userId, int productId) throws SQLException, NamingException {
        boolean result = false;

        try {
            con = DBConnect.createConnection();

            if (con != null) {
                // Kiểm tra xem sản phẩm đã có trong giỏ hàng hay chưa
                String checkIfExistsSQL = "SELECT * FROM cart WHERE user_id = ? AND product_id = ?";
                stm = con.prepareStatement(checkIfExistsSQL);
                stm.setString(1, userId);
                stm.setInt(2, productId);
                rs = stm.executeQuery();

                if (rs.next()) {
                    // Sản phẩm đã tồn tại trong giỏ hàng, cập nhật số lượng
                    int currentQuantity = rs.getInt("quantity");
                    int newQuantity = currentQuantity - 1;
                    if (newQuantity == 0) {
                        String sql = "DELETE FROM cart WHERE user_id = ? AND product_id = ?";
                        stm = con.prepareStatement(sql);
                        stm.setString(1, userId);
                        stm.setInt(2, productId);
                        int rowsUpdated = stm.executeUpdate();

                        if (rowsUpdated > 0) {
                            result = true;
                        }
                    }

                    // Cập nhật số lượng sản phẩm trong giỏ hàng
                    String updateQuantitySQL = "UPDATE cart SET quantity = ? WHERE user_id = ? AND product_id = ?";
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

    public List<CartDTO> getProductFromCartByProductId(int productId) throws SQLException, NamingException {

        List<CartDTO> result = new ArrayList<>();

        try {
            con = DBConnect.createConnection();
            if (con != null) {
                String sql = "Select * from cart where product_id = ? ";
                stm = con.prepareStatement(sql);
                stm.setInt(1, productId);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String userId = rs.getString("user_id");
                    productId = rs.getInt("product_id");
                    String title = rs.getString("title");
                    String thumbnail = rs.getString("thumbnail");
                    int quantity = rs.getInt("quantity");
                    int price = rs.getInt("price");

                    CartDTO cart = new CartDTO(quantity, userId, productId, title, thumbnail, quantity, price);
                    result.add(cart);
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

    public List<CartDTO> getCartByUserId(String userId) throws SQLException, NamingException {
        List<CartDTO> cartList = new ArrayList<>();

        try {
            con = DBConnect.createConnection();
            if (con != null) {
                String sql = "SELECT * FROM cart WHERE user_id = ?";
                stm = con.prepareStatement(sql);
                stm.setString(1, userId);
                rs = stm.executeQuery();
                while (rs.next()) {
                    int cartId = rs.getInt("cart_id");
                    int productId = rs.getInt("product_id");
                    String title = rs.getString("title");
                    String thumbnail = rs.getString("thumbnail");
                    int quantity = rs.getInt("quantity");
                    int price = rs.getInt("price");

                    CartDTO cart = new CartDTO(cartId, userId, productId, title, thumbnail, quantity, price);
                    cartList.add(cart);
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

        return cartList;
    }
    
    public CartDTO getProductFromCart(int productId) throws SQLException, NamingException {
        CartDTO result = null;

        try {
            con = DBConnect.createConnection();
            if (con != null) {
                String sql = "SELECT * FROM cart WHERE product_id = ?";
                stm = con.prepareStatement(sql);
                stm.setInt(1, productId);
                rs = stm.executeQuery();
                while (rs.next()) {
                    int cartId = rs.getInt("cart_id");
                    String userId = rs.getString("user_id");
                    productId = rs.getInt("product_id");
                    String title = rs.getString("title");
                    String thumbnail = rs.getString("thumbnail");
                    int quantity = rs.getInt("quantity");
                    int price = rs.getInt("price");

                   result = new CartDTO(cartId, userId, productId, title, thumbnail, quantity, price);
                    
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

    public int getTotalQuantityInCart(String userId) throws SQLException, NamingException {
        int totalQuantity = 0;
        try {
            con = DBConnect.createConnection();
            if (con != null) {
                String sql = "SELECT SUM(quantity) AS totalQuantity FROM cart WHERE user_id = ?";
                stm = con.prepareStatement(sql);
                stm.setString(1, userId);
                rs = stm.executeQuery();
                if (rs.next()) {
                    totalQuantity = rs.getInt("totalQuantity");
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
        return totalQuantity;
    }

    public void removeProductFromCart(String userId, int productId) throws SQLException, NamingException {
//        boolean result = false;
        try {
            con = DBConnect.createConnection();
            if (con != null) {
                String sql = "DELETE FROM cart WHERE user_id = ? AND product_id = ?";
                stm = con.prepareStatement(sql);
                stm.setString(1, userId);
                stm.setInt(2, productId);
                stm.executeUpdate();
//                int rowsAffected = stm.executeUpdate();
//                if (rowsAffected > 0) {
//                    // Nếu có ít nhất một hàng bị ảnh hưởng bởi truy vấn xóa, trả về true
//                    result = true;
//                }
            }
        } finally {
            // Đóng kết nối và các tài nguyên
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
//        return result;
    }

}

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
import phatntt.dto.WishlistDTO;
import phatntt.util.DBConnect;
import phatntt.util.Key_Utils;

/**
 *
 * @author Admin
 */
public class WishlistDAO {
    
    public boolean addProductToWishlist(int productId, String userId) throws SQLException, NamingException {
    boolean result = false;

    @Cleanup
    Connection con = DBConnect.createConnection();
    if (con != null) {
        String sql = "INSERT INTO wishlist (product_id, user_id) VALUES (?, ?)";
        @Cleanup
        PreparedStatement stm = con.prepareStatement(sql);
        stm.setInt(1, productId);
        stm.setString(2, userId);

        int rowsAffected = stm.executeUpdate();
        if (rowsAffected > 0) {
            result = true;
        }
    }

    return result;
}
    public List<WishlistDTO> getWishlist(String userId) throws SQLException, NamingException {
    List<WishlistDTO> wishlist = new ArrayList<>();

    @Cleanup
    Connection con = DBConnect.createConnection();
    if (con != null) {
        String sql = "SELECT w.id AS id, w.product_id AS product_id, "
                   + "p.title AS title, p.price AS price, p.thumbnail AS thumbnail, p.discount AS discount "
                   + "FROM wishlist w "
                   + "JOIN products p ON w.product_id = p.product_id "
                   + "WHERE w.user_id = ? LIMIT 8";
        @Cleanup
        PreparedStatement stm = con.prepareStatement(sql);
        stm.setString(1, userId);
        @Cleanup
        ResultSet rs = stm.executeQuery();
        while (rs.next()) {
            WishlistDTO item = WishlistDTO.builder()
                    .id(rs.getInt("id"))
                    .productId(rs.getInt("product_id"))
                    .userId(userId)
                    .title(rs.getString("title"))
                    .price(rs.getInt("price"))
                    .discount(rs.getInt("discount"))
                    .formattedPrice(Key_Utils.getInstance().formattedPrice(rs.getInt("price")))
                    .thumbnail(rs.getString("thumbnail"))
                    .build();
            wishlist.add(item);
        }
    }

    return wishlist;
}
    
    public boolean removeProductFromWishlist(int productId, String userId) throws SQLException, NamingException {
    boolean result = false;

    @Cleanup
    Connection con = DBConnect.createConnection();
    if (con != null) {
        String sql = "DELETE FROM wishlist WHERE product_id = ? AND user_id = ?";
        @Cleanup
        PreparedStatement stm = con.prepareStatement(sql);
        stm.setInt(1, productId);
        stm.setString(2, userId);

        int rowsAffected = stm.executeUpdate();
        if (rowsAffected > 0) {
            result = true;
        }
    }

    return result;
}



    
}

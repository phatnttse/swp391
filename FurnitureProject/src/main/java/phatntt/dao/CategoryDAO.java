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
import phatntt.dto.CategoryDTO;
import phatntt.util.DBConnect;

/**
 *
 * @author Dell
 */
public class CategoryDAO {

    public List<CategoryDTO> getCategoryCount() throws SQLException, NamingException {
        List<CategoryDTO> result = new ArrayList<>();

        
            @Cleanup
            Connection con = DBConnect.createConnection();
            if (con != null) {
                String sql = "SELECT * FROM category LIMIT 6";
                @Cleanup
                PreparedStatement stm = con.prepareCall(sql);
                @Cleanup
                ResultSet rs = stm.executeQuery();

                while (rs.next()) {
                    result.add(CategoryDTO.builder()
                            .categoryId(rs.getInt("category_id"))
                            .name(rs.getString("name"))
                            .thumbnail(rs.getString("thumbnail"))
                            .build());
                }
            }
        
        return result;
    }

    public List<CategoryDTO> getAllCategoryDTOs() throws SQLException, NamingException {
        List<CategoryDTO> result = new ArrayList<>();

  
            @Cleanup
            Connection con = DBConnect.createConnection();
            if (con != null) {
                String sql = "SELECT * FROM category";
                @Cleanup
                PreparedStatement stm = con.prepareCall(sql);
                @Cleanup
                ResultSet rs = stm.executeQuery();

                while (rs.next()) {
                    result.add(CategoryDTO.builder()
                            .categoryId(rs.getInt("category_id"))
                            .name(rs.getString("name"))
                            .thumbnail(rs.getString("thumbnail"))
                            .build());
                }
            }    

        return result;
    }

    public List<CategoryDTO> countProduct() throws SQLException, NamingException {
        List<CategoryDTO> result = new ArrayList<>();

            @Cleanup
            Connection con = DBConnect.createConnection();
            if (con != null) {
                String sql = "SELECT c.category_id, c.name, c.thumbnail, COUNT(p.product_id) AS product_count\n"
                        + "FROM category c\n"
                        + "LEFT JOIN product p ON c.category_id = p.category_id\n"
                        + "GROUP BY c.category_id, c.name, c.thumbnail";
                @Cleanup
                PreparedStatement stm = con.prepareCall(sql);
                @Cleanup
                ResultSet rs = stm.executeQuery();

                while (rs.next()) {
                    result.add(CategoryDTO.builder()
                            .categoryId(rs.getInt("category_id"))
                            .name(rs.getString("name"))
                            .thumbnail(rs.getString("thumbnail"))
                            .countProduct(rs.getInt("product_count"))
                            .build());
                }
            }

        return result;
    }
}

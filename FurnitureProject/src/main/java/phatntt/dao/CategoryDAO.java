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
import phatntt.dto.CategoryDTO;
import phatntt.dto.ProductsDTO;
import phatntt.util.DBConnect;
import phatntt.util.Key_Utils;

/**
 *
 * @author Dell
 */
public class CategoryDAO {

    private Connection con = null;
    private PreparedStatement stm = null;
    private ResultSet rs = null;

    public List<CategoryDTO> getCategoryCount() throws SQLException, NamingException {

        List<CategoryDTO> result = new ArrayList<>();

        try {
            con = DBConnect.createConnection();

            if (con != null) {
                String sql = "SELECT * FROM category LIMIT 6";
                stm = con.prepareCall(sql);
                rs = stm.executeQuery();

                while (rs.next()) {
                    //
                    // mapping
                    //5.1 get data from tu resultset
                    int categoryId = rs.getInt("category_id");
                    String name = rs.getString("name");
                    String thumbnail = rs.getString("thumbnail");

                    CategoryDTO dto = new CategoryDTO(categoryId, name, thumbnail);
                    result.add(dto);

                    //5.2 set data to DTO
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
    
    public List<CategoryDTO> getAllCategoryDTOs() throws SQLException, NamingException {

        List<CategoryDTO> result = new ArrayList<>();

        try {
            con = DBConnect.createConnection();

            if (con != null) {
                String sql = "SELECT * FROM category";
                stm = con.prepareCall(sql);
                rs = stm.executeQuery();

                while (rs.next()) {
                    //
                    // mapping
                    //5.1 get data from tu resultset
                    int categoryId = rs.getInt("category_id");
                    String name = rs.getString("name");
                    String thumbnail = rs.getString("thumbnail");

                    CategoryDTO dto = new CategoryDTO(categoryId, name, thumbnail);
                    result.add(dto);

                    //5.2 set data to DTO
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

    public List<CategoryDTO> countProduct() throws SQLException, NamingException {

        List<CategoryDTO> result = new ArrayList<>();

        try {
            con = DBConnect.createConnection();

            if (con != null) {
                String sql = "SELECT c.category_id, c.name, c.thumbnail ,COUNT(p.product_id) AS product_count\n"
                        + "FROM category c\n"
                        + "LEFT JOIN product p ON c.category_id = p.category_id\n"
                        + "GROUP BY c.category_id, c.name, c.thumbnail;";
                stm = con.prepareCall(sql);
                rs = stm.executeQuery();

                while (rs.next()) {
                    //
                    // mapping
                    //5.1 get data from tu resultset
                    int categoryId = rs.getInt("category_id");
                    String name = rs.getString("name");
                    String thumbnail = rs.getString("thumbnail");
                    int countProduct = rs.getInt(4);

                    CategoryDTO dto = new CategoryDTO(categoryId, name, thumbnail, countProduct);
                    result.add(dto);

                    //5.2 set data to DTO
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
    
    public CategoryDTO getCategoryById(int categoryId) throws SQLException, NamingException {
        CategoryDTO result = null;

        try {
            con = DBConnect.createConnection();

            if (con != null) {
                 String sql = "SELECT category_id, name AS category_name, thumbnail "
                    + "FROM category "
                    + "WHERE category_id = ?";

                stm = con.prepareCall(sql);
                stm.setInt(1, categoryId);
                rs = stm.executeQuery();

                while (rs.next()) {
                    String categoryName = rs.getString("category_name");
                    String title = rs.getString("title");
                    int price = rs.getInt("price");
                    int quantity = rs.getInt("quantity");
                    int discount = rs.getInt("discount");
                    String thumbnail = rs.getString("thumbnail");
                    String description = rs.getString("description");
                    int purchases = rs.getInt("purchases");
                    Timestamp createdAt = rs.getTimestamp("created_at");

                    result = new CategoryDTO(categoryId, title, thumbnail);
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

        return result;
    }
    
    public boolean addCategory(CategoryDTO category) throws SQLException, NamingException {
        boolean result = false;

        try {
            con = DBConnect.createConnection();
            if (con != null) {
                String sql = "INSERT INTO category (category_id, name, thumbnail)"
                        + "VALUES (?, ?, ?)";
                stm = con.prepareStatement(sql);

                stm.setInt(1, category.getCategoryId());
                stm.setString(2, category.getName());
                stm.setString(3, category.getThumbnail());

                int rowsAffected = stm.executeUpdate();
                if (rowsAffected > 0) {
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
    
    public boolean updateCategory(CategoryDTO category) throws SQLException, NamingException {
        boolean check = false;
        try {
            con = DBConnect.createConnection();
            if (con != null) {
                String sql = "UPDATE category "
                        + "SET category_id = ?, thumbnail = ? "
                        + "WHERE category_id = ?";
                stm = con.prepareStatement(sql);

                stm.setInt(1, category.getCategoryId());
                stm.setString(2, category.getThumbnail());
                
                check = stm.executeUpdate() > 0 ? true : false;
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
        return check;
    }
}
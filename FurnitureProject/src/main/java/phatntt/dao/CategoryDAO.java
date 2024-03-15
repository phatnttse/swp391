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

    public CategoryDTO getCategoryById(int categoryId) throws SQLException, NamingException {
        CategoryDTO category = null;

        try {
            @Cleanup
            Connection con = DBConnect.createConnection();

            if (con != null) {
                String sql = "SELECT * FROM category WHERE category_id = ?";

                @Cleanup
                PreparedStatement stm = con.prepareStatement(sql);
                stm.setInt(1, categoryId);

                @Cleanup
                ResultSet rs = stm.executeQuery();

                if (rs.next()) {
                    category = CategoryDTO.builder()
                            .categoryId(rs.getInt("category_id"))
                            .name(rs.getString("name"))
                            .thumbnail(rs.getString("thumbnail"))
                            .build();
                }
            }
        } catch (SQLException | NamingException e) {
            e.printStackTrace(); // Log the exception
        }

        return category;
    }

    public boolean updateCategory(CategoryDTO category) throws SQLException, NamingException {
        boolean check = false;

        @Cleanup
        Connection con = DBConnect.createConnection();
        if (con != null) {
            String sql = "UPDATE category "
                    + "SET name = ?, thumbnail = ? "
                    + "WHERE category_id = ?";
            @Cleanup
            PreparedStatement stm = con.prepareStatement(sql);

            stm.setString(1, category.getName());
            stm.setString(2, category.getThumbnail());
            stm.setInt(3, category.getCategoryId());

            check = stm.executeUpdate() > 0;
        }

        return check;
    }

    public boolean deleteCategory(int categoryId) throws SQLException, NamingException {
        boolean result = false;

        @Cleanup
        Connection con = DBConnect.createConnection();
        if (con != null) {
            String sql = "DELETE FROM category WHERE category_id = ?";
            @Cleanup
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, categoryId);

            int rowsAffected = stm.executeUpdate();
            if (rowsAffected > 0) {
                result = true;
            }
        }

        return result;
    }

    public boolean addNewCategory(CategoryDTO category) throws SQLException, NamingException {
        boolean result = false;

        @Cleanup
        Connection con = DBConnect.createConnection();
        if (con != null) {
            String sql = "INSERT INTO category (name, thumbnail) VALUES (?, ?)";
            @Cleanup
            PreparedStatement stm = con.prepareStatement(sql);

            stm.setString(1, category.getName());
            stm.setString(2, category.getThumbnail());

            int rowsAffected = stm.executeUpdate();
            result = rowsAffected > 0;
        }

        return result;
    }

    public List<CategoryDTO> sortCategoryByNameAscending() throws SQLException, NamingException {
        List<CategoryDTO> result = new ArrayList<>();

        @Cleanup
        Connection con = DBConnect.createConnection();
        if (con != null) {
            String sql = "SELECT * FROM category ORDER BY `name` ASC";
            @Cleanup
            PreparedStatement stm = con.prepareCall(sql);
            @Cleanup
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                int categoryId = rs.getInt("category_id");
                String name = rs.getString("name");
                String thumbnail = rs.getString("thumbnail");

                CategoryDTO category = CategoryDTO.builder()
                        .categoryId(categoryId)
                        .name(name)
                        .thumbnail(thumbnail)
                        .build();
                result.add(category);
            }
        }

        return result;
    }

    public List<CategoryDTO> sortCategoryByNameDescending() throws SQLException, NamingException {
        List<CategoryDTO> result = new ArrayList<>();

        @Cleanup
        Connection con = DBConnect.createConnection();
        if (con != null) {
            String sql = "SELECT * FROM category ORDER BY `name` DESC"; 
            @Cleanup
            PreparedStatement stm = con.prepareCall(sql);
            @Cleanup
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                int categoryId = rs.getInt("category_id");
                String name = rs.getString("name");
                String thumbnail = rs.getString("thumbnail");

                CategoryDTO category = CategoryDTO.builder()
                        .categoryId(categoryId)
                        .name(name)
                        .thumbnail(thumbnail)
                        .build();
                result.add(category);
            }
        }

        return result;
    }

}

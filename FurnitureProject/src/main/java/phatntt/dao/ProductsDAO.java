/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phatntt.dao;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;
import lombok.Cleanup;
import phatntt.dto.ProductsDTO;
import phatntt.util.DBConnect;
import phatntt.util.Key_Utils;

/**
 *
 * @author Admin
 */
public class ProductsDAO implements Serializable {

    public List<ProductsDTO> getProductByCategory(int categoryId) throws SQLException, NamingException {
        List<ProductsDTO> result = new ArrayList<>();

        @Cleanup
        Connection con = DBConnect.createConnection();
        if (con != null) {
            String sql = "SELECT * FROM products WHERE category_id = ?";
            @Cleanup
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, categoryId);
            @Cleanup
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                result.add(ProductsDTO.builder()
                        .productId(rs.getInt("product_id"))
                        .categoryId(categoryId)
                        .title(rs.getString("title"))
                        .description(rs.getString("description"))
                        .quantity(rs.getInt("quantity"))
                        .price(rs.getInt("price"))
                        .thumbnail(rs.getString("thumbnail"))
                        .discount(rs.getInt("discount"))
                        .purchases(rs.getInt("purchases"))
                        .createdAt(rs.getTimestamp("created_at"))
                        .formattedPrice(Key_Utils.getInstance().formattedPrice(rs.getInt("price")))
                        .build()
                );
            }
        }

        return result;
    }

    public List<ProductsDTO> getAllProducts(int page, int limit) throws SQLException, NamingException {
        List<ProductsDTO> result = new ArrayList<>();

        @Cleanup
        Connection con = DBConnect.createConnection();
        if (con != null) {
            String sql = "SELECT products.product_id, products.category_id, products.title, products.price, products.quantity, products.discount, products.thumbnail, products.description, products.purchases, products.created_at, categories.name AS category_name "
                    + "FROM products "
                    + "LEFT JOIN categories ON products.category_id = categories.category_id "
                    + "LIMIT ?, ?";
            @Cleanup
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, page - 1 ); 
            stm.setInt(2, limit); 

            @Cleanup
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                result.add(ProductsDTO.builder()
                        .productId(rs.getInt("product_id"))
                        .categoryId(rs.getInt("category_id"))
                        .categoryName(rs.getString("category_name"))
                        .title(rs.getString("title"))
                        .description(rs.getString("description"))
                        .quantity(rs.getInt("quantity"))
                        .price(rs.getInt("price"))
                        .thumbnail(rs.getString("thumbnail"))
                        .discount(rs.getInt("discount"))
                        .purchases(rs.getInt("purchases"))
                        .createdAt(rs.getTimestamp("created_at"))
                        .formattedPrice(Key_Utils.getInstance().formattedPrice(rs.getInt("price")))
                        .build()
                );
            }
        }

        return result;
    }

    public List<ProductsDTO> searchProductsByName(String searchValue) throws SQLException, NamingException {
        List<ProductsDTO> result = new ArrayList<>();

        @Cleanup
        Connection con = DBConnect.createConnection();
        if (con != null) {
            String sql = "SELECT * FROM products WHERE title LIKE ?";
            @Cleanup
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, "%" + searchValue + "%");
            @Cleanup
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                result.add(ProductsDTO.builder()
                        .productId(rs.getInt("product_id"))
                        .categoryId(rs.getInt("category_id"))
                        .title(rs.getString("title"))
                        .description(rs.getString("description"))
                        .quantity(rs.getInt("quantity"))
                        .price(rs.getInt("price"))
                        .thumbnail(rs.getString("thumbnail"))
                        .discount(rs.getInt("discount"))
                        .purchases(rs.getInt("purchases"))
                        .createdAt(rs.getTimestamp("created_at"))
                        .formattedPrice(Key_Utils.getInstance().formattedPrice(rs.getInt("price")))
                        .build()
                );
            }
        }

        return result;
    }

    public ProductsDTO getProductById(int productId) throws SQLException, NamingException {
        ProductsDTO result = null;

        @Cleanup
        Connection con = DBConnect.createConnection();
        if (con != null) {
            String sql = "SELECT * FROM products WHERE product_id = ?";
            @Cleanup
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, productId);
            @Cleanup
            ResultSet rs = stm.executeQuery();

            if (rs.next()) {
                result = ProductsDTO.builder()
                        .productId(rs.getInt("product_id"))
                        .categoryId(rs.getInt("category_id"))
                        .title(rs.getString("title"))
                        .description(rs.getString("description"))
                        .quantity(rs.getInt("quantity"))
                        .price(rs.getInt("price"))
                        .thumbnail(rs.getString("thumbnail"))
                        .discount(rs.getInt("discount"))
                        .purchases(rs.getInt("purchases"))
                        .createdAt(rs.getTimestamp("created_at"))
                        .formattedPrice(Key_Utils.getInstance().formattedPrice(rs.getInt("price")))
                        .build();
            }
        }

        return result;
    }

    public List<ProductsDTO> getProductByCategory() throws SQLException, NamingException {
        List<ProductsDTO> result = new ArrayList<>();

        @Cleanup
        Connection con = DBConnect.createConnection();
        if (con != null) {
            String sql = "SELECT * FROM products WHERE category_id = 1";
            @Cleanup
            PreparedStatement stm = con.prepareStatement(sql);
            @Cleanup
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                result.add(ProductsDTO.builder()
                        .productId(rs.getInt("product_id"))
                        .categoryId(1)
                        .title(rs.getString("title"))
                        .description(rs.getString("description"))
                        .quantity(rs.getInt("quantity"))
                        .price(rs.getInt("price"))
                        .thumbnail(rs.getString("thumbnail"))
                        .discount(rs.getInt("discount"))
                        .purchases(rs.getInt("purchases"))
                        .createdAt(rs.getTimestamp("created_at"))
                        .formattedPrice(Key_Utils.getInstance().formattedPrice(rs.getInt("price")))
                        .build()
                );
            }
        }

        return result;
    }

    public List<ProductsDTO> getProductByCategoryId(int categoryId) throws SQLException, NamingException {
        List<ProductsDTO> result = new ArrayList<>();

        @Cleanup
        Connection con = DBConnect.createConnection();
        if (con != null) {
            String sql = "SELECT * FROM products WHERE category_id = ?";
            @Cleanup
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, categoryId);
            @Cleanup
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                result.add(ProductsDTO.builder()
                        .productId(rs.getInt("product_id"))
                        .categoryId(categoryId)
                        .title(rs.getString("title"))
                        .description(rs.getString("description"))
                        .quantity(rs.getInt("quantity"))
                        .price(rs.getInt("price"))
                        .thumbnail(rs.getString("thumbnail"))
                        .discount(rs.getInt("discount"))
                        .purchases(rs.getInt("purchases"))
                        .createdAt(rs.getTimestamp("created_at"))
                        .formattedPrice(Key_Utils.getInstance().formattedPrice(rs.getInt("price")))
                        .build()
                );
            }
        }

        return result;
    }

    public List<ProductsDTO> getNewestProducts() throws SQLException, NamingException {
        List<ProductsDTO> result = new ArrayList<>();

        @Cleanup
        Connection con = DBConnect.createConnection();
        if (con != null) {
            String sql = "SELECT * FROM products ORDER BY created_at DESC LIMIT 8";
            @Cleanup
            PreparedStatement stm = con.prepareStatement(sql);
            @Cleanup
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                result.add(ProductsDTO.builder()
                        .productId(rs.getInt("product_id"))
                        .categoryId(rs.getInt("category_id"))
                        .title(rs.getString("title"))
                        .description(rs.getString("description"))
                        .quantity(rs.getInt("quantity"))
                        .price(rs.getInt("price"))
                        .thumbnail(rs.getString("thumbnail"))
                        .discount(rs.getInt("discount"))
                        .purchases(rs.getInt("purchases"))
                        .createdAt(rs.getTimestamp("created_at"))
                        .formattedPrice(Key_Utils.getInstance().formattedPrice(rs.getInt("price")))
                        .build()
                );
            }
        }

        return result;
    }

    public int countProductByCategoryId() throws SQLException, NamingException {
        int count = 0;
        @Cleanup
        Connection con = DBConnect.createConnection();
        if (con != null) {
            String sql = "SELECT COUNT(p.product_id) AS productCount\n"
                    + "FROM categories c\n"
                    + "LEFT JOIN products p ON c.category_id = p.category_id\n"
                    + "GROUP BY c.category_id;";
            @Cleanup
            PreparedStatement stm = con.prepareStatement(sql);
            @Cleanup
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                count = rs.getInt("productCount");
            }
        }

        return count;
    }

    public List<ProductsDTO> getProductByPrice(int from, int to) throws SQLException, NamingException {
        List<ProductsDTO> list = new ArrayList<>();

        @Cleanup
        Connection con = DBConnect.createConnection();
        if (con != null) {
            String sql = "SELECT * FROM products WHERE price BETWEEN ? AND ?";
            @Cleanup
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, from);
            stm.setInt(2, to);
            @Cleanup
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                list.add(ProductsDTO.builder()
                        .productId(rs.getInt("product_id"))
                        .categoryId(rs.getInt("category_id"))
                        .title(rs.getString("title"))
                        .description(rs.getString("description"))
                        .quantity(rs.getInt("quantity"))
                        .price(rs.getInt("price"))
                        .thumbnail(rs.getString("thumbnail"))
                        .discount(rs.getInt("discount"))
                        .purchases(rs.getInt("purchases"))
                        .createdAt(rs.getTimestamp("created_at"))
                        .formattedPrice(Key_Utils.getInstance().formattedPrice(rs.getInt("price")))
                        .build()
                );
            }
        }

        return list;
    }

    public List<ProductsDTO> sortProductByNameAscending(int page, int limit) throws SQLException, NamingException {
        List<ProductsDTO> result = new ArrayList<>();

        @Cleanup
        Connection con = DBConnect.createConnection();
        if (con != null) {
            String sql = "SELECT * FROM products ORDER BY `title` ASC LIMIT ?, ?";
            @Cleanup
            PreparedStatement stm = con.prepareCall(sql);
            stm.setInt(1, page - 1);
            stm.setInt(2, limit);
            @Cleanup
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                result.add(ProductsDTO.builder()
                        .productId(rs.getInt("product_id"))
                        .categoryId(rs.getInt("category_id"))
                        .title(rs.getString("title"))
                        .description(rs.getString("description"))
                        .quantity(rs.getInt("quantity"))
                        .price(rs.getInt("price"))
                        .thumbnail(rs.getString("thumbnail"))
                        .discount(rs.getInt("discount"))
                        .purchases(rs.getInt("purchases"))
                        .createdAt(rs.getTimestamp("created_at"))
                        .formattedPrice(Key_Utils.getInstance().formattedPrice(rs.getInt("price")))
                        .build()
                );
            }
        }

        return result;
    }

    public List<ProductsDTO> sortProductByNameDescending(int page, int limit) throws SQLException, NamingException {
        List<ProductsDTO> result = new ArrayList<>();

        @Cleanup
        Connection con = DBConnect.createConnection();
        if (con != null) {
            String sql = "SELECT * FROM products ORDER BY `title` DESC LIMIT ?, ?";
            @Cleanup
            PreparedStatement stm = con.prepareCall(sql);
            stm.setInt(1, page - 1);
            stm.setInt(2, limit);
            @Cleanup
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                result.add(ProductsDTO.builder()
                        .productId(rs.getInt("product_id"))
                        .categoryId(rs.getInt("category_id"))
                        .title(rs.getString("title"))
                        .description(rs.getString("description"))
                        .quantity(rs.getInt("quantity"))
                        .price(rs.getInt("price"))
                        .thumbnail(rs.getString("thumbnail"))
                        .discount(rs.getInt("discount"))
                        .purchases(rs.getInt("purchases"))
                        .createdAt(rs.getTimestamp("created_at"))
                        .formattedPrice(Key_Utils.getInstance().formattedPrice(rs.getInt("price")))
                        .build()
                );
            }
        }

        return result;
    }

    public List<ProductsDTO> sortProductByPriceAscending(int page, int limit) throws SQLException, NamingException {
        List<ProductsDTO> result = new ArrayList<>();

        @Cleanup
        Connection con = DBConnect.createConnection();
        if (con != null) {
            String sql = "SELECT * FROM products ORDER BY `price` ASC LIMIT ?, ?";
            @Cleanup
            PreparedStatement stm = con.prepareCall(sql);
            stm.setInt(1, page - 1);
            stm.setInt(2, limit);
            @Cleanup
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                result.add(ProductsDTO.builder()
                        .productId(rs.getInt("product_id"))
                        .categoryId(rs.getInt("category_id"))
                        .title(rs.getString("title"))
                        .description(rs.getString("description"))
                        .quantity(rs.getInt("quantity"))
                        .price(rs.getInt("price"))
                        .thumbnail(rs.getString("thumbnail"))
                        .discount(rs.getInt("discount"))
                        .purchases(rs.getInt("purchases"))
                        .createdAt(rs.getTimestamp("created_at"))
                        .formattedPrice(Key_Utils.getInstance().formattedPrice(rs.getInt("price")))
                        .build()
                );
            }
        }

        return result;
    }

    public List<ProductsDTO> sortProductByPriceDescending(int page, int limit) throws SQLException, NamingException {
        List<ProductsDTO> result = new ArrayList<>();

        @Cleanup
        Connection con = DBConnect.createConnection();
        if (con != null) {
            String sql = "SELECT * FROM products ORDER BY `price` DESC LIMIT ?, ?";
            @Cleanup
            PreparedStatement stm = con.prepareCall(sql);
            stm.setInt(1, page - 1);
            stm.setInt(2, limit);
            @Cleanup
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                result.add(ProductsDTO.builder()
                        .productId(rs.getInt("product_id"))
                        .categoryId(rs.getInt("category_id"))
                        .title(rs.getString("title"))
                        .description(rs.getString("description"))
                        .quantity(rs.getInt("quantity"))
                        .price(rs.getInt("price"))
                        .thumbnail(rs.getString("thumbnail"))
                        .discount(rs.getInt("discount"))
                        .purchases(rs.getInt("purchases"))
                        .createdAt(rs.getTimestamp("created_at"))
                        .formattedPrice(Key_Utils.getInstance().formattedPrice(rs.getInt("price")))
                        .build()
                );
            }
        }

        return result;
    }

    public List<ProductsDTO> sortProductByNewCreateAt(int page, int limit) throws SQLException, NamingException {
        List<ProductsDTO> result = new ArrayList<>();

        @Cleanup
        Connection con = DBConnect.createConnection();
        if (con != null) {
            String sql = "SELECT * FROM products ORDER BY `created_at` DESC LIMIT ?, ?";
            @Cleanup
            PreparedStatement stm = con.prepareCall(sql);
            stm.setInt(1, page - 1);
            stm.setInt(2, limit);
            @Cleanup
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                result.add(ProductsDTO.builder()
                        .productId(rs.getInt("product_id"))
                        .categoryId(rs.getInt("category_id"))
                        .title(rs.getString("title"))
                        .description(rs.getString("description"))
                        .quantity(rs.getInt("quantity"))
                        .price(rs.getInt("price"))
                        .thumbnail(rs.getString("thumbnail"))
                        .discount(rs.getInt("discount"))
                        .purchases(rs.getInt("purchases"))
                        .createdAt(rs.getTimestamp("created_at"))
                        .formattedPrice(Key_Utils.getInstance().formattedPrice(rs.getInt("price")))
                        .build()
                );
            }
        }

        return result;
    }

    public List<ProductsDTO> sortProductByOldCreateAt(int page, int limit) throws SQLException, NamingException {
        List<ProductsDTO> result = new ArrayList<>();

        @Cleanup
        Connection con = DBConnect.createConnection();
        if (con != null) {
            String sql = "SELECT * FROM products ORDER BY `created_at` ASC LIMIT ?, ?";
            @Cleanup
            PreparedStatement stm = con.prepareCall(sql);
            stm.setInt(1, page - 1);
            stm.setInt(2, limit);
            @Cleanup
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                result.add(ProductsDTO.builder()
                        .productId(rs.getInt("product_id"))
                        .categoryId(rs.getInt("category_id"))
                        .title(rs.getString("title"))
                        .description(rs.getString("description"))
                        .quantity(rs.getInt("quantity"))
                        .price(rs.getInt("price"))
                        .thumbnail(rs.getString("thumbnail"))
                        .discount(rs.getInt("discount"))
                        .purchases(rs.getInt("purchases"))
                        .createdAt(rs.getTimestamp("created_at"))
                        .formattedPrice(Key_Utils.getInstance().formattedPrice(rs.getInt("price")))
                        .build()
                );
            }
        }

        return result;
    }

    public List<ProductsDTO> getProductSameCategory(int productId) throws SQLException, NamingException {
        List<ProductsDTO> result = new ArrayList<>();
        try {
            @Cleanup
            Connection con = DBConnect.createConnection();
            if (con != null) {
                String sql = "SELECT p.* FROM products p\n"
                        + "INNER JOIN categories c ON p.category_id = c.category_id\n"
                        + "WHERE p.product_id <> ? AND c.category_id = (SELECT category_id FROM products WHERE product_id = ?)\n"
                        + "ORDER BY RAND()\n"
                        + "LIMIT 3;";
                @Cleanup
                PreparedStatement stm = con.prepareStatement(sql);
                stm.setInt(1, productId);
                stm.setInt(2, productId);
                @Cleanup
                ResultSet rs = stm.executeQuery();
                while (rs.next()) {
                    result.add(ProductsDTO.builder()
                            .productId(rs.getInt("product_id"))
                            .categoryId(rs.getInt("category_id"))
                            .title(rs.getString("title"))
                            .description(rs.getString("description"))
                            .quantity(rs.getInt("quantity"))
                            .price(rs.getInt("price"))
                            .thumbnail(rs.getString("thumbnail"))
                            .discount(rs.getInt("discount"))
                            .purchases(rs.getInt("purchases"))
                            .createdAt(rs.getTimestamp("created_at"))
                            .formattedPrice(Key_Utils.getInstance().formattedPrice(rs.getInt("price")))
                            .build());
                }
            }
        } catch (SQLException | NamingException e) {
            // Xử lý ngoại lệ tại đây nếu cần
            e.printStackTrace();
        }
        return result;
    }
    public int getTotalProducts() throws SQLException, NamingException {
    int totalProducts = 0;

    @Cleanup
    Connection con = DBConnect.createConnection();
    if (con != null) {
        String sql = "SELECT COUNT(*) AS total FROM products";
        @Cleanup
        PreparedStatement stm = con.prepareCall(sql);
        @Cleanup
        ResultSet rs = stm.executeQuery();

        if (rs.next()) {
            totalProducts = rs.getInt("total");
        }
    }

    return totalProducts;
}

}

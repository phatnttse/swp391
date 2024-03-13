/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phatntt.dao;

import java.io.File;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import javax.naming.NamingException;
import phatntt.dto.ProductsDTO;
import phatntt.util.DBConnect;
import phatntt.util.Key_Utils;

/**
 *
 * @author Admin
 */
public class ProductsDAO implements Serializable {

    private Connection con = null;
    private PreparedStatement stm = null;
    private ResultSet rs = null;

    public List<ProductsDTO> getProductByCategory(int categoryId) throws SQLException, NamingException {

        List<ProductsDTO> result = new ArrayList<>();

        try {
            con = DBConnect.createConnection();

            if (con != null) {
                String sql = "SELECT * FROM product WHERE category_id= ?";
                stm = con.prepareCall(sql);
                stm.setInt(1, categoryId);
                rs = stm.executeQuery();

                while (rs.next()) {

                    int productId = rs.getInt("product_id");
                    String title = rs.getString("title");
                    int price = rs.getInt("price");
                    int quantity = rs.getInt("quantity");
                    int discount = rs.getInt("discount");
                    String thumbnail = rs.getString("thumbnail");
                    String description = rs.getString("description");
                    int purchases = rs.getInt("purchases");
                    Timestamp createdAt = rs.getTimestamp("created_at");
                   
                    ProductsDTO p = new ProductsDTO(productId, categoryId, title, description, quantity, price, thumbnail, discount, purchases, createdAt);
                    p.setFormattedPrice(Key_Utils.getInstance().formattedPrice(price));
                    result.add(p);
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

    public List<ProductsDTO> getAllProducts() throws SQLException, NamingException {
        List<ProductsDTO> result = new ArrayList<>();

        try {
            con = DBConnect.createConnection();

            if (con != null) {
                String sql = "SELECT product.product_id, product.category_id, product.title, product.price, product.quantity, product.discount, product.thumbnail, product.description, product.purchases, product.created_at, category.name AS category_name "
                        + "FROM product "
                        + "LEFT JOIN category ON product.category_id = category.category_id";

                stm = con.prepareCall(sql);
                rs = stm.executeQuery();

                while (rs.next()) {
                    int productId = rs.getInt("product_id");
                    String categoryName = rs.getString("category_name");
                    int categoryId = rs.getInt("category_id");
                    String title = rs.getString("title");
                    int price = rs.getInt("price");
                    int quantity = rs.getInt("quantity");
                    int discount = rs.getInt("discount");
                    String thumbnail = rs.getString("thumbnail");
                    String description = rs.getString("description");
                    int purchases = rs.getInt("purchases");
                    Timestamp createdAt = rs.getTimestamp("created_at");
               
                    ProductsDTO p = new ProductsDTO(productId, categoryId, categoryName, title, description, quantity, price, thumbnail, discount, purchases, createdAt);
                    p.setFormattedPrice(Key_Utils.getInstance().formattedPrice(price));
                    result.add(p);

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
    
    


    public List<ProductsDTO> searchProductsByName(String searchValue) throws SQLException, NamingException {
        List<ProductsDTO> result = new ArrayList<>();

        try {
            con = DBConnect.createConnection();

            if (con != null) {
                String sql = "Select * from product "
                        + "Where title like ? ";
                stm = con.prepareStatement(sql);
                stm.setString(1, "%" + searchValue + "%");
                rs = stm.executeQuery();

                while (rs.next()) {
                    int productId = rs.getInt("product_id");
                    int categoryId = rs.getInt("category_id");
                    String title = rs.getString("title");
                    int price = rs.getInt("price");
                    int quantity = rs.getInt("quantity");
                    int discount = rs.getInt("discount");
                    String thumbnail = rs.getString("thumbnail");
                    String description = rs.getString("description");
                    int purchases = rs.getInt("purchases");
                    Timestamp createdAt = rs.getTimestamp("created_at");

                    ProductsDTO p = new ProductsDTO(productId, categoryId, title, description, quantity, price, thumbnail, discount, purchases, createdAt);                 
                    p.setFormattedPrice(Key_Utils.getInstance().formattedPrice(price));
                    result.add(p);
                    
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
   
    public ProductsDTO getProductById(int productId) throws SQLException, NamingException {
        ProductsDTO result = null;

        try {
            con = DBConnect.createConnection();

            if (con != null) {
                String sql = "SELECT product.product_id, product.category_id, product.title, product.price, "
                        + "product.quantity, product.discount, product.thumbnail, product.description, "
                        + "product.purchases, product.created_at, category.name AS category_name "
                        + "FROM product "
                        + "LEFT JOIN category ON product.category_id = category.category_id "
                        + "WHERE product.product_id = ?";

                stm = con.prepareCall(sql);
                stm.setInt(1, productId);
                rs = stm.executeQuery();

                while (rs.next()) {
                    int categoryId = rs.getInt("category_id");
                    String categoryName = rs.getString("category_name");
                    String title = rs.getString("title");
                    int price = rs.getInt("price");
                    int quantity = rs.getInt("quantity");
                    int discount = rs.getInt("discount");
                    String thumbnail = rs.getString("thumbnail");
                    String description = rs.getString("description");
                    int purchases = rs.getInt("purchases");
                    Timestamp createdAt = rs.getTimestamp("created_at");
                    
                    result = new ProductsDTO(productId, categoryId, categoryName, title, description, quantity, price, thumbnail, discount, purchases, createdAt);
                    result.setFormattedPrice(Key_Utils.getInstance().formattedPrice(price));
                 

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

    public List<ProductsDTO> getProductByCategory() throws SQLException, NamingException {

        List<ProductsDTO> result = new ArrayList<>();

        try {
            con = DBConnect.createConnection();

            if (con != null) {
                String sql = "SELECT * FROM product WHERE category_id= 1";
                stm = con.prepareCall(sql);
                rs = stm.executeQuery();

                while (rs.next()) {

                    int productId = rs.getInt("product_id");
                    String title = rs.getString("title");
                    int price = rs.getInt("price");
                    int quantity = rs.getInt("quantity");
                    int discount = rs.getInt("discount");
                    String thumbnail = rs.getString("thumbnail");
                    String description = rs.getString("description");
                    int purchases = rs.getInt("purchases");
                    Timestamp createdAt = rs.getTimestamp("created_at");
                    
                    ProductsDTO p = new ProductsDTO(productId, 1, title, description, quantity, price, thumbnail, discount, purchases, createdAt);
                    p.setFormattedPrice(Key_Utils.getInstance().formattedPrice(price));
                    result.add(p);
                    
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

    public List<ProductsDTO> getProductByCategoryId(int categoryId) throws SQLException, NamingException {

        List<ProductsDTO> result = new ArrayList<>();

        try {
            con = DBConnect.createConnection();

            if (con != null) {
                String sql = "SELECT * FROM product WHERE category_id= ?";
                stm = con.prepareCall(sql);
                stm.setInt(1, categoryId);
                rs = stm.executeQuery();

                while (rs.next()) {
                    int productId = rs.getInt("product_id");
                    String title = rs.getString("title");
                    int price = rs.getInt("price");
                    int quantity = rs.getInt("quantity");
                    int discount = rs.getInt("discount");
                    String thumbnail = rs.getString("thumbnail");
                    String description = rs.getString("description");
                    int purchases = rs.getInt("purchases");
                    Timestamp createdAt = rs.getTimestamp("created_at");
                    
                    ProductsDTO p = new ProductsDTO(productId, categoryId, title, description, quantity, price, thumbnail, discount, purchases, createdAt);
                    p.setFormattedPrice(Key_Utils.getInstance().formattedPrice(price));
                    result.add(p);
                   
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

    public List<ProductsDTO> getNewestProducts() throws SQLException, NamingException {

        List<ProductsDTO> result = new ArrayList<>();

        try {
            con = DBConnect.createConnection();

            if (con != null) {
                String sql = "SELECT * FROM product ORDER BY created_at DESC LIMIT 8";
                stm = con.prepareCall(sql);
                rs = stm.executeQuery();

                while (rs.next()) {
                    //
                    // mapping
                    //5.1 get data from tu resultset
                    int productId = rs.getInt("product_id");
                    int categoryId = rs.getInt("category_id");
                    String title = rs.getString("title");
                    int price = rs.getInt("price");
                    int quantity = rs.getInt("quantity");
                    int discount = rs.getInt("discount");
                    String thumbnail = rs.getString("thumbnail");
                    String description = rs.getString("description");
                    int purchases = rs.getInt("purchases");
                    Timestamp createdAt = rs.getTimestamp("created_at");
               
                    ProductsDTO p = new ProductsDTO(productId, categoryId, title, description, quantity, price, thumbnail, discount, purchases, createdAt);
                    p.setFormattedPrice(Key_Utils.getInstance().formattedPrice(price));
                    result.add(p);
                    
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

    public int countProductByCategoryId() throws SQLException, NamingException {
        int count = 0;
        try {
            con = DBConnect.createConnection();

            if (con != null) {
                String sql = "SELECT c.category_id, c.name, COUNT(p.product_id) AS productCount\n"
                        + "FROM category c\n"
                        + "LEFT JOIN product p ON c.category_id = p.category_id\n"
                        + "GROUP BY c.category_id, c.name;";
                stm = con.prepareCall(sql);
                rs = stm.executeQuery();
                while (rs.next()) {

                    count = rs.getInt("productCount");
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

        return count;
    }


    public List<ProductsDTO> getProductByPrice(int from, int to) {

        List<ProductsDTO> list = new ArrayList<>();

        try {
            con = DBConnect.createConnection();
            if (con != null) {
                String sql = "SELECT * FROM product \n"
                + "WHERE price between ? and ?";


                stm = con.prepareCall(sql);
                stm.setDouble(1, from);
                stm.setDouble(2, to);
                rs = stm.executeQuery();


                while (rs.next()) {                    

                    int productId = rs.getInt("product_id");
                    String title = rs.getString("title");
                    int categoryId = rs.getInt("category_id");
                    int price = rs.getInt("price");
                    int quantity = rs.getInt("quantity");
                    int discount = rs.getInt("discount");
                    String thumbnail = rs.getString("thumbnail");
                    String description = rs.getString("description");
                    int purchases = rs.getInt("purchases");
                    Timestamp createdAt = rs.getTimestamp("created_at");


                    ProductsDTO p = new ProductsDTO(productId, categoryId, title, description, quantity, price, thumbnail, discount, purchases, createdAt);
                    p.setFormattedPrice(Key_Utils.getInstance().formattedPrice(price));
                    list.add(p);
                    //5.2 set data to DTO
                }

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }


    public boolean updateProductWithoutPrice(ProductsDTO product) throws SQLException, NamingException {
         boolean check = false;
        try {
            con = DBConnect.createConnection();
            if (con != null) {
                String sql = "UPDATE product "
                        + "SET category_id = ?, title = ?,  description = ?, quantity = ?, "
                        + " thumbnail = ?, discount = ?, purchases = ? "
                        + "WHERE product_id = ?";
                stm = con.prepareStatement(sql);

                stm.setInt(1, product.getCategoryId());
                stm.setString(2, product.getTitle());
                stm.setString(3, product.getDescription());
                stm.setInt(4, product.getQuantity());
                stm.setString(5, product.getThumbnail());
                stm.setInt(6, product.getDiscount());
                stm.setInt(7, product.getPurchases());
                stm.setInt(8, product.getProductId());

                 check = stm.executeUpdate()>0?true:false;
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



    public boolean addProduct(ProductsDTO product) throws SQLException, NamingException {
        boolean result = false;

        try {
            con = DBConnect.createConnection();
            if (con != null) {
                String sql = "INSERT INTO product (category_id, title, description, quantity, price, thumbnail, discount) "
                        + "VALUES (?, ?, ?, ?, ?, ?, ?)";
                stm = con.prepareStatement(sql);

                stm.setInt(1, product.getCategoryId());
                stm.setString(2, product.getTitle());
                stm.setString(3, product.getDescription());
                stm.setInt(4, product.getQuantity());
                stm.setFloat(5, product.getPrice());

                // Update thumbnail path to be relative to the web application
                String relativeFilePath = "uploads" + File.separator + getSubmittedFileName(product.getThumbnail());
                stm.setString(6, relativeFilePath);

                stm.setInt(7, product.getDiscount());

                int rowsAffected = stm.executeUpdate();
                if (rowsAffected > 0) {
                    result = true;
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
        return result;
    }

    public boolean deleteProduct(int productId) throws SQLException, NamingException {

        boolean result = false;

        try {
            con = DBConnect.createConnection();
            if (con != null) {
                String sql = "DELETE FROM product WHERE product_id = ?";
                stm = con.prepareStatement(sql);
                stm.setInt(1, productId);

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

// Helper method to extract filename from the full path
    private String getSubmittedFileName(String fullPath) {
        return fullPath.substring(fullPath.lastIndexOf('/') + 1).substring(fullPath.lastIndexOf('\\') + 1);
    }

    public List<ProductsDTO> sortProductByNameDescending() throws SQLException, NamingException {
        List<ProductsDTO> result = new ArrayList<>();

        try {
            con = DBConnect.createConnection();

            if (con != null) {

                String sql = "SELECT * FROM product ORDER BY `title` DESC";
                stm = con.prepareCall(sql);
                rs = stm.executeQuery();

                while (rs.next()) {
                    //
                    // mapping
                    //5.1 get data from tu resultset
                    int productId = rs.getInt("product_id");
                    int categoryId = rs.getInt("category_id");
                    String title = rs.getString("title");
                    int price = rs.getInt("price");
                    int quantity = rs.getInt("quantity");
                    int discount = rs.getInt("discount");
                    String thumbnail = rs.getString("thumbnail");
                    String description = rs.getString("description");
                    int purchases = rs.getInt("purchases");
                    Timestamp createdAt = rs.getTimestamp("created_at");

                    DecimalFormatSymbols symbols = new DecimalFormatSymbols(Locale.US); // Sử dụng Locale.US để đảm bảo sử dụng dấu chấm thập phân
                    symbols.setGroupingSeparator('.'); // Sét dấu chấm thập phân
                    DecimalFormat decimalFormat = new DecimalFormat("#,###", symbols); // Định dạng với 2 số sau dấu thập phân và dấu chấm thập phân
                    String formattedPrice = decimalFormat.format(price);

                    ProductsDTO p = new ProductsDTO(productId, categoryId, title, description, quantity, price, thumbnail, discount, purchases, createdAt);
                    p.setFormattedPrice(formattedPrice);
                    result.add(p);

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
    
    public List<ProductsDTO> sortProductByPriceAscending() throws SQLException, NamingException {
        List<ProductsDTO> result = new ArrayList<>();

        try {
            con = DBConnect.createConnection();

            if (con != null) {

                String sql = "SELECT * FROM product ORDER BY `price` ASC";
                stm = con.prepareCall(sql);
                rs = stm.executeQuery();

                while (rs.next()) {
                    //
                    // mapping
                    //5.1 get data from tu resultset
                    int productId = rs.getInt("product_id");
                    int categoryId = rs.getInt("category_id");
                    String title = rs.getString("title");
                    int price = rs.getInt("price");
                    int quantity = rs.getInt("quantity");
                    int discount = rs.getInt("discount");
                    String thumbnail = rs.getString("thumbnail");
                    String description = rs.getString("description");
                    int purchases = rs.getInt("purchases");
                    Timestamp createdAt = rs.getTimestamp("created_at");

                    DecimalFormatSymbols symbols = new DecimalFormatSymbols(Locale.US); // Sử dụng Locale.US để đảm bảo sử dụng dấu chấm thập phân
                    symbols.setGroupingSeparator('.'); // Sét dấu chấm thập phân
                    DecimalFormat decimalFormat = new DecimalFormat("#,###", symbols); // Định dạng với 2 số sau dấu thập phân và dấu chấm thập phân
                    String formattedPrice = decimalFormat.format(price);

                    ProductsDTO p = new ProductsDTO(productId, categoryId, title, description, quantity, price, thumbnail, discount, purchases, createdAt);
                    p.setFormattedPrice(formattedPrice);
                    result.add(p);

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

    public List<ProductsDTO> sortProductByPriceDescending() throws SQLException, NamingException {
        List<ProductsDTO> result = new ArrayList<>();

        try {
            con = DBConnect.createConnection();

            if (con != null) {

                String sql = "SELECT * FROM product ORDER BY `price` DESC";
                stm = con.prepareCall(sql);
                rs = stm.executeQuery();

                while (rs.next()) {
                    //
                    // mapping
                    //5.1 get data from tu resultset
                    int productId = rs.getInt("product_id");
                    int categoryId = rs.getInt("category_id");
                    String title = rs.getString("title");
                    int price = rs.getInt("price");
                    int quantity = rs.getInt("quantity");
                    int discount = rs.getInt("discount");
                    String thumbnail = rs.getString("thumbnail");
                    String description = rs.getString("description");
                    int purchases = rs.getInt("purchases");
                    Timestamp createdAt = rs.getTimestamp("created_at");

                    DecimalFormatSymbols symbols = new DecimalFormatSymbols(Locale.US); // Sử dụng Locale.US để đảm bảo sử dụng dấu chấm thập phân
                    symbols.setGroupingSeparator('.'); // Sét dấu chấm thập phân
                    DecimalFormat decimalFormat = new DecimalFormat("#,###", symbols); // Định dạng với 2 số sau dấu thập phân và dấu chấm thập phân
                    String formattedPrice = decimalFormat.format(price);

                    ProductsDTO p = new ProductsDTO(productId, categoryId, title, description, quantity, price, thumbnail, discount, purchases, createdAt);
                    p.setFormattedPrice(formattedPrice);
                    result.add(p);

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

    public List<ProductsDTO> sortProductByNewCreateAt() throws SQLException, NamingException {
        List<ProductsDTO> result = new ArrayList<>();

        try {
            con = DBConnect.createConnection();

            if (con != null) {

                String sql = "SELECT * FROM product ORDER BY `created_at` DESC";
                stm = con.prepareCall(sql);
                rs = stm.executeQuery();

                while (rs.next()) {
                    //
                    // mapping
                    //5.1 get data from tu resultset
                    int productId = rs.getInt("product_id");
                    int categoryId = rs.getInt("category_id");
                    String title = rs.getString("title");
                    int price = rs.getInt("price");
                    int quantity = rs.getInt("quantity");
                    int discount = rs.getInt("discount");
                    String thumbnail = rs.getString("thumbnail");
                    String description = rs.getString("description");
                    int purchases = rs.getInt("purchases");
                    Timestamp createdAt = rs.getTimestamp("created_at");

                    DecimalFormatSymbols symbols = new DecimalFormatSymbols(Locale.US); // Sử dụng Locale.US để đảm bảo sử dụng dấu chấm thập phân
                    symbols.setGroupingSeparator('.'); // Sét dấu chấm thập phân
                    DecimalFormat decimalFormat = new DecimalFormat("#,###", symbols); // Định dạng với 2 số sau dấu thập phân và dấu chấm thập phân
                    String formattedPrice = decimalFormat.format(price);

                    ProductsDTO p = new ProductsDTO(productId, categoryId, title, description, quantity, price, thumbnail, discount, purchases, createdAt);
                    p.setFormattedPrice(formattedPrice);
                    result.add(p);

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

    public List<ProductsDTO> sortProductByOldCreateAt() throws SQLException, NamingException {
        List<ProductsDTO> result = new ArrayList<>();

        try {
            con = DBConnect.createConnection();

            if (con != null) {

                String sql = "SELECT * FROM product ORDER BY `created_at` ASC";
                stm = con.prepareCall(sql);
                rs = stm.executeQuery();

                while (rs.next()) {
                    //
                    // mapping
                    //5.1 get data from tu resultset
                    int productId = rs.getInt("product_id");
                    int categoryId = rs.getInt("category_id");
                    String title = rs.getString("title");
                    int price = rs.getInt("price");
                    int quantity = rs.getInt("quantity");
                    int discount = rs.getInt("discount");
                    String thumbnail = rs.getString("thumbnail");
                    String description = rs.getString("description");
                    int purchases = rs.getInt("purchases");
                    Timestamp createdAt = rs.getTimestamp("created_at");

                    DecimalFormatSymbols symbols = new DecimalFormatSymbols(Locale.US); // Sử dụng Locale.US để đảm bảo sử dụng dấu chấm thập phân
                    symbols.setGroupingSeparator('.'); // Sét dấu chấm thập phân
                    DecimalFormat decimalFormat = new DecimalFormat("#,###", symbols); // Định dạng với 2 số sau dấu thập phân và dấu chấm thập phân
                    String formattedPrice = decimalFormat.format(price);

                    ProductsDTO p = new ProductsDTO(productId, categoryId, title, description, quantity, price, thumbnail, discount, purchases, createdAt);
                    p.setFormattedPrice(formattedPrice);
                    result.add(p);

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
    
    public List<ProductsDTO> sortProductByNameAscending() throws SQLException, NamingException {
        List<ProductsDTO> result = new ArrayList<>();

        try {
            con = DBConnect.createConnection();

            if (con != null) {

                String sql = "SELECT * FROM product ORDER BY `title` ASC";
                stm = con.prepareCall(sql);
                rs = stm.executeQuery();

                while (rs.next()) {
                    //
                    // mapping
                    //5.1 get data from tu resultset
                    int productId = rs.getInt("product_id");
                    int categoryId = rs.getInt("category_id");
                    String title = rs.getString("title");
                    int price = rs.getInt("price");
                    int quantity = rs.getInt("quantity");
                    int discount = rs.getInt("discount");
                    String thumbnail = rs.getString("thumbnail");
                    String description = rs.getString("description");
                    int purchases = rs.getInt("purchases");
                    Timestamp createdAt = rs.getTimestamp("created_at");

                    DecimalFormatSymbols symbols = new DecimalFormatSymbols(Locale.US); // Sử dụng Locale.US để đảm bảo sử dụng dấu chấm thập phân
                    symbols.setGroupingSeparator('.'); // Sét dấu chấm thập phân
                    DecimalFormat decimalFormat = new DecimalFormat("#,###", symbols); // Định dạng với 2 số sau dấu thập phân và dấu chấm thập phân
                    String formattedPrice = decimalFormat.format(price);

                    ProductsDTO p = new ProductsDTO(productId, categoryId, title, description, quantity, price, thumbnail, discount, purchases, createdAt);
                    p.setFormattedPrice(formattedPrice);
                    result.add(p);

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
    
}

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
import java.sql.Timestamp;
import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import javax.naming.NamingException;
import phatntt.dto.ProductsDTO;
import phatntt.util.DBConnect;

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
                    //
                    // mapping
                    //5.1 get data from tu resultset
                    int productId = rs.getInt("product_id");
                    String title = rs.getString("title");
                    float price = rs.getInt("price");
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
                    // Mapping data from result set
                    int productId = rs.getInt("product_id");
                    int categoryId = rs.getInt("category_id");
                    String title = rs.getString("title");
                    float price = rs.getInt("price");
                    int quantity = rs.getInt("quantity");
                    int discount = rs.getInt("discount");
                    String thumbnail = rs.getString("thumbnail");
                    String description = rs.getString("description");
                    int purchases = rs.getInt("purchases");
                    Timestamp createdAt = rs.getTimestamp("created_at");
                    String categoryName = rs.getString("category_name");

                    // Format price
                    DecimalFormatSymbols symbols = new DecimalFormatSymbols(Locale.US);
                    symbols.setGroupingSeparator('.');
                    DecimalFormat decimalFormat = new DecimalFormat("#,###", symbols);
                    String formattedPrice = decimalFormat.format(price);

                    // Create ProductsDTO and set data
                    ProductsDTO p = new ProductsDTO(productId, categoryId, title, description, quantity, price, thumbnail, discount, purchases, createdAt);
                    p.setFormattedPrice(formattedPrice);
                    p.setCategoryName(categoryName);
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

    private List<ProductsDTO> products;

    public List<ProductsDTO> getProducts() {
        return products;
    }

    public void searchProductsByName(String searchValue) throws SQLException, NamingException {

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
                    float price = rs.getInt("price");
                    int quantity = rs.getInt("quantity");
                    int discount = rs.getInt("discount");
                    String thumbnail = rs.getString("thumbnail");
                    String description = rs.getString("description");
                    int purchases = rs.getInt("purchases");
                    Timestamp createdAt = rs.getTimestamp("created_at");

                    ProductsDTO dto = new ProductsDTO(productId, categoryId, title, description, quantity, price, thumbnail, discount, purchases, createdAt);
                    if (this.products == null) {
                        this.products = new ArrayList<>();
                    }
                    this.products.add(dto);
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
    }

    public List<ProductsDTO> searchProductsByPrice(float minPrice, float maxPrice) throws SQLException, NamingException {
        List<ProductsDTO> result = new ArrayList<>();

        try {
            con = DBConnect.createConnection();

            if (con != null) {
                String sql = "SELECT * FROM product WHERE price >= ? AND price <=?";
                stm = con.prepareCall(sql);
                stm.setFloat(1, minPrice);
                stm.setFloat(2, maxPrice);
                rs = stm.executeQuery();

                while (rs.next()) {
                    int productId = rs.getInt("product_id");
                    int categoryId = rs.getInt("category_id");
                    String title = rs.getString("title");
                    float price = rs.getInt("price");
                    int quantity = rs.getInt("quantity");
                    int discount = rs.getInt("discount");
                    String thumbnail = rs.getString("thumbnail");
                    String description = rs.getString("description");
                    int purchases = rs.getInt("purchases");
                    Timestamp createdAt = rs.getTimestamp("created_at");

                    ProductsDTO dto = new ProductsDTO(productId, categoryId, title, description, quantity, price, thumbnail, discount, purchases, createdAt);
                    if (this.products == null) {
                        this.products = new ArrayList<>();
                    }
                    this.products.add(dto);
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

    public List<ProductsDTO> searchProductsByQuantity(int minQuantity, int maxQuantity) throws SQLException, NamingException {
        List<ProductsDTO> result = new ArrayList<>();

        try {
            con = DBConnect.createConnection();

            if (con != null) {
                String sql = "SELECT * FROM product WHERE quantity >= ? AND quantity <= ?";
                stm = con.prepareCall(sql);
                stm.setInt(1, minQuantity);
                stm.setInt(2, maxQuantity);
                rs = stm.executeQuery();

                while (rs.next()) {
                    int productId = rs.getInt("product_id");
                    int categoryId = rs.getInt("category_id");
                    String title = rs.getString("title");
                    float price = rs.getInt("price");
                    int quantity = rs.getInt("quantity");
                    int discount = rs.getInt("discount");
                    String thumbnail = rs.getString("thumbnail");
                    String description = rs.getString("description");
                    int purchases = rs.getInt("purchases");
                    Timestamp createdAt = rs.getTimestamp("created_at");

                    ProductsDTO dto = new ProductsDTO(productId, categoryId, title, description, quantity, price, thumbnail, discount, purchases, createdAt);
                    if (this.products == null) {
                        this.products = new ArrayList<>();
                    }
                    this.products.add(dto);
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

    public List<ProductsDTO> searchProductsByPurchases(int minPurchases, int maxPurchases) throws SQLException, NamingException {
        List<ProductsDTO> result = new ArrayList<>();

        try {
            con = DBConnect.createConnection();

            if (con != null) {
                String sql = "SELECT * FROM product WHERE purchases >= ? AND purchases <= ?";
                stm = con.prepareCall(sql);
                stm.setInt(1, minPurchases);
                stm.setInt(2, maxPurchases);
                rs = stm.executeQuery();

                while (rs.next()) {
                    int productId = rs.getInt("product_id");
                    int categoryId = rs.getInt("category_id");
                    String title = rs.getString("title");
                    float price = rs.getInt("price");
                    int quantity = rs.getInt("quantity");
                    int discount = rs.getInt("discount");
                    String thumbnail = rs.getString("thumbnail");
                    String description = rs.getString("description");
                    int purchases = rs.getInt("purchases");
                    Timestamp createdAt = rs.getTimestamp("created_at");

                    ProductsDTO dto = new ProductsDTO(productId, categoryId, title, description, quantity, price, thumbnail, discount, purchases, createdAt);
                    if (this.products == null) {
                        this.products = new ArrayList<>();
                    }
                    this.products.add(dto);
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

    public List<ProductsDTO> searchOutOfStockProducts() throws SQLException, NamingException {
        List<ProductsDTO> result = new ArrayList<>();

        try {
            con = DBConnect.createConnection();

            if (con != null) {
                String sql = "SELECT * FROM product WHERE quantity = 0";
                stm = con.prepareStatement(sql);
                rs = stm.executeQuery();

                while (rs.next()) {
                    int productId = rs.getInt("product_id");
                    int categoryId = rs.getInt("category_id");
                    String title = rs.getString("title");
                    float price = rs.getInt("price");
                    int quantity = rs.getInt("quantity");
                    int discount = rs.getInt("discount");
                    String thumbnail = rs.getString("thumbnail");
                    String description = rs.getString("description");
                    int purchases = rs.getInt("purchases");
                    Timestamp createdAt = rs.getTimestamp("created_at");

                    ProductsDTO dto = new ProductsDTO(productId, categoryId, title, description, quantity, price, thumbnail, discount, purchases, createdAt);
                    if (this.products == null) {
                        this.products = new ArrayList<>();
                    }
                    this.products.add(dto);
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
                    String title = rs.getString("title");
                    float price = rs.getFloat("price");
                    int quantity = rs.getInt("quantity");
                    int discount = rs.getInt("discount");
                    String thumbnail = rs.getString("thumbnail");
                    String description = rs.getString("description");
                    int purchases = rs.getInt("purchases");
                    Timestamp createdAt = rs.getTimestamp("created_at");
                    String categoryName = rs.getString("category_name");

                    // Format price
                    DecimalFormatSymbols symbols = new DecimalFormatSymbols(Locale.US);
                    symbols.setGroupingSeparator('.');
                    DecimalFormat decimalFormat = new DecimalFormat("#,###", symbols);
                    String formattedPrice = decimalFormat.format(price);

                    result = new ProductsDTO(productId, categoryId, title, description, quantity, price, thumbnail, discount, purchases, createdAt);
                    result.setFormattedPrice(formattedPrice);
                    result.setCategoryName(categoryName);
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
                String sql = "SELECT * FROM product WHERE category_id= 1  LIMIT 8";
                stm = con.prepareCall(sql);
                rs = stm.executeQuery();

                while (rs.next()) {
                    //
                    // mapping
                    //5.1 get data from tu resultset
                    int productId = rs.getInt("product_id");
                    String title = rs.getString("title");
                    float price = rs.getInt("price");
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

                    ProductsDTO p = new ProductsDTO(productId, 1, title, description, quantity, price, thumbnail, discount, purchases, createdAt);
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

    public List<ProductsDTO> getProductByCategoryId(int categoryId) throws SQLException, NamingException {

        List<ProductsDTO> result = new ArrayList<>();

        try {
            con = DBConnect.createConnection();

            if (con != null) {
                String sql = "SELECT * FROM product WHERE category_id= ?  LIMIT 8";
                stm = con.prepareCall(sql);
                stm.setInt(1, categoryId);
                rs = stm.executeQuery();

                while (rs.next()) {
                    //
                    // mapping
                    //5.1 get data from tu resultset
                    int productId = rs.getInt("product_id");
                    String title = rs.getString("title");
                    float price = rs.getInt("price");
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
                    float price = rs.getInt("price");
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

    public List<ProductsDTO> getProductByPrice(double from, double to) {
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
                    //
                    // mapping
                    //5.1 get data from tu resultset
                    int productId = rs.getInt("product_id");
                    String title = rs.getString("title");
                    int categoryId = rs.getInt("category_id");
                    float price = rs.getInt("price");
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
                    list.add(p);
                    //5.2 set data to DTO
                }

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
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
                stm.setString(6, product.getThumbnail());
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

}

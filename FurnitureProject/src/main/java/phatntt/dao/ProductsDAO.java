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

    public List<ProductsDTO> getAllProducts() throws SQLException, NamingException {
        
        List<ProductsDTO> result = new ArrayList<>();

        try {
            con = DBConnect.createConnection();

            if (con != null) {
                String sql = "Select * from product";
                stm = con.prepareStatement(sql);
                rs = stm.executeQuery();

                while (rs.next()) {
                    // mapping
                    //5.1 get data from tu resultset
                    int productId = rs.getInt("productId");
                    String name = rs.getString("name");
                    String description = rs.getString("description");
                    int quantity = rs.getInt("quantity");
                    float price = rs.getFloat("price");
                    String image = rs.getString("image");
                    String discount = rs.getString("discount");
                    String status = rs.getString("status");
                    
                    ProductsDTO p = new ProductsDTO(productId, name, description, quantity, price, image, discount, status);
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
    
    private List<ProductsDTO> products;
    
    public List<ProductsDTO> getProducts(){
        return products;
    }
    
    public void searchProductsByName(String searchValue) throws SQLException, NamingException{
             
        try {
            con = DBConnect.createConnection();
            
            if (con != null){
                String sql = "Select * from Products "
                        + "Where name like ? ";
                stm = con.prepareStatement(sql);
                stm.setString(1, "%" + searchValue + "%");
                rs = stm.executeQuery();
                
                while (rs.next()){
                    int productId = rs.getInt("productId");
                    String name = rs.getString("name");
                    String description = rs.getString("description");
                    int quantity = rs.getInt("quantity");
                    float price = rs.getFloat("price");
                    String image = rs.getString("image");
                    String discount = rs.getString("discount");
                    String status = rs.getString("status");
                    
                    
                    ProductsDTO dto = new ProductsDTO(productId, name, description, quantity, price, image, discount, status);
                    
                    if (this.products == null){
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
    public ProductsDTO getProductById(int productId) throws SQLException, NamingException{
        
        ProductsDTO result = null;

        try {
            con = DBConnect.createConnection();

            if (con != null) {
                String sql = "Select * from Products "
                        + "Where productId = ?";
                stm = con.prepareStatement(sql);
                stm.setInt(1, productId);
                rs = stm.executeQuery();
                
                while (rs.next()) {
                    // mapping
                    //5.1 get data from tu resultset                  
                    String name = rs.getString("name");
                    String description = rs.getString("description");
                    int quantity = rs.getInt("quantity");
                    float price = rs.getFloat("price");
                    String image = rs.getString("image");
                    String discount = rs.getString("discount");
                    String status = rs.getString("status");
                    
                    result = new ProductsDTO(productId, name, description, quantity, price, image, discount, status);
                                    
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

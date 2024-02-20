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
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;
import java.util.UUID;
import javax.naming.NamingException;
import phatntt.dto.UsersDTO;
import phatntt.util.DBConnect;

/**
 *
 * @author Admin
 */
public class UsersDAO implements Serializable {

    private Connection con = null;
    private PreparedStatement stm = null;
    private ResultSet rs = null;

    public UsersDTO checkLogin(String username) throws SQLException, NamingException {

        UsersDTO result = null;

        try {
            con = DBConnect.createConnection();
            if (con != null) {
                String sql = "Select * from user where username = ? ";
                stm = con.prepareStatement(sql);
                stm.setString(1, username);
                
                rs = stm.executeQuery();

                if (rs.next()) {
                    // mapping
                    //5.1 get data from tu resultset
                    String id = rs.getString("user_id");   
                    String email = rs.getString("email");
                    String password = rs.getString("password");
                    String name = rs.getString("name");
                    String given_name = rs.getString("given_name");
                    String family_name = rs.getString("family_name");
                    String phone = rs.getString("phone");
                    String picture = rs.getString("picture");
                    String address = rs.getString("address");                                  
                    int role = rs.getInt("role_id");
                    Timestamp createdAt = rs.getTimestamp("created_at");
                    result = new UsersDTO(id, email, username, password, name, given_name, family_name, picture, phone, address, role, createdAt);
                    //5.2 set data to DTO

                }
            }

        } 
        finally {
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

    public List<UsersDTO> getAllUsers() throws SQLException, NamingException {

        List<UsersDTO> result = new ArrayList<>();

        try {

            con = DBConnect.createConnection();
            if (con != null) {
                String sql = "Select * from user";
                stm = con.prepareStatement(sql);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String id = rs.getString("user_id");   
                    String email = rs.getString("email");
                    String username = rs.getString("username");
                    String password = rs.getString("password");
                    String name = rs.getString("name");
                    String given_name = rs.getString("given_name");
                    String family_name = rs.getString("family_name");
                    String phone = rs.getString("phone");
                    String picture = rs.getString("picture");
                    String address = rs.getString("address");                                  
                    int role = rs.getInt("role_id");
                    Timestamp createdAt = rs.getTimestamp("created_at");
                    UsersDTO u = new UsersDTO(id, email, username, password, name, given_name, family_name, picture, phone, address, role, createdAt);
                    result.add(u);
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
    public List<UsersDTO> getAllCustomers() throws SQLException, NamingException {

        List<UsersDTO> result = new ArrayList<>();

        try {

            con = DBConnect.createConnection();
            if (con != null) {
                String sql = "Select * from user "
                        + "Where role_id = '0'";
                stm = con.prepareStatement(sql);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String id = rs.getString("user_id");   
                    String email = rs.getString("email");
                    String username = rs.getString("username");
                    String password = rs.getString("password");
                    String name = rs.getString("name");
                    String given_name = rs.getString("given_name");
                    String family_name = rs.getString("family_name");
                    String phone = rs.getString("phone");
                    String picture = rs.getString("picture");
                    String address = rs.getString("address");                                    
                    int role = rs.getInt("role_id");
                    Timestamp createdAt = rs.getTimestamp("created_at");
                    UsersDTO u = new UsersDTO(id, email, username, password, name, given_name, family_name, picture, phone, address, role, createdAt);
                    result.add(u);
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
    public List<UsersDTO> getAllAdmin() throws SQLException, NamingException {

        List<UsersDTO> result = new ArrayList<>();

        try {

            con = DBConnect.createConnection();
            if (con != null) {
                String sql = "Select * from user "
                        + "Where role_id = '3'";
                stm = con.prepareStatement(sql);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String id = rs.getString("user_id");   
                    String email = rs.getString("email");
                    String username = rs.getString("username");
                    String password = rs.getString("password");
                    String name = rs.getString("name");
                    String given_name = rs.getString("given_name");
                    String family_name = rs.getString("family_name");
                    String phone = rs.getString("phone");
                    String picture = rs.getString("picture");
                    String address = rs.getString("address");                 
                    int role = rs.getInt("role_id");
                    Timestamp createdAt = rs.getTimestamp("created_at");
                    UsersDTO u = new UsersDTO(id, email, name, password, name, given_name, family_name, picture, phone, address, role, createdAt);
                    result.add(u);
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
    
    public UsersDTO getUserById(String userId) throws SQLException, NamingException {

        UsersDTO result = null;

        try {

            con = DBConnect.createConnection();
            if (con != null) {
                String sql = "Select * from user where user_id = ? ";
                stm = con.prepareStatement(sql);
                stm.setString(1, userId);
                rs = stm.executeQuery();
                if (rs.next()) {
                    userId = rs.getString("user_id");
                    String email = rs.getString("email");
                    String username = rs.getString("username");
                    String password = rs.getString("password");
                    String name = rs.getString("name");
                    String given_name = rs.getString("given_name");
                    String family_name = rs.getString("family_name");
                    String phone = rs.getString("phone");
                    String picture = rs.getString("picture");
                    String address = rs.getString("address");
                    int role = rs.getInt("role_id");
                    Timestamp createdAt = rs.getTimestamp("created_at");
                    result = new UsersDTO(userId, email, username, password, name, given_name, family_name, picture, phone, address, role, createdAt);

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

    public boolean registerAccount( String username, String password, String email, String givenName, String familyName, int roleId, Timestamp createdAt ) throws SQLException, NamingException {

        boolean result = false;
        try {
            //1. Create connection
            con = DBConnect.createConnection();
            if (con != null) {
                //2. create sql string
                String sql = "Insert Into user(user_id, username, password , email, name, given_name, family_name, role_id, created_at) "
                        + "Values(?, ?, ?, ?, ?, ?, ?, ?, ?)";
                stm = con.prepareStatement(sql);
                stm.setString(1,UUID.randomUUID().toString());
                stm.setString(2, username);
                stm.setString(3, password);
                stm.setString(4, email);
                stm.setString(5, givenName +" "+ familyName);
                stm.setString(6, givenName);
                stm.setString(7, familyName);      
                stm.setInt(8, roleId);
                stm.setTimestamp(9, createdAt);
                int affectedRows = stm.executeUpdate();
                //4.Excute Query
                if (affectedRows > 0) {
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
    public boolean loginWithGoogle(UsersDTO dto) throws SQLException, NamingException {

        boolean result = false;
        try {
            //1. Create connection
            con = DBConnect.createConnection();
            if (con != null) {
                //2. create sql string
                String sql = "Insert Into user(user_id, email, password, name, given_name, family_name, phone, picture, role_id) "
                        + "Values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
                stm = con.prepareStatement(sql);
                stm.setString(1, dto.getId());
                stm.setString(2, dto.getEmail());              
                stm.setString(4, dto.getPassword());
                stm.setString(5, dto.getName());
                stm.setString(6, dto.getGiven_name());
                stm.setString(7, dto.getFamily_name());
                stm.setString(8, dto.getPhone());
                stm.setString(9, dto.getPicture());
                stm.setInt(10, dto.getRole());
                int affectedRows = stm.executeUpdate();
                //4.Excute Query
                if (affectedRows > 0) {
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

    public boolean deleteAccount(String username) throws SQLException, NamingException {

        boolean result = false;
        try {
            con = DBConnect.createConnection();

            if (con != null) {
                String sql = "Delete From user"
                        + "Where username = ?";

                stm = con.prepareStatement(sql);
                stm.setString(1, username);

                int affectedRows = stm.executeUpdate();

                if (affectedRows > 0) {
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

    public boolean updateUsers(String id, String name, String phone) throws SQLException, NamingException {

        boolean result = false;

        try {
            con = DBConnect.createConnection();
            if (con != null) {
                String sql = "UPDATE user "
                        + "SET name = ?, phone = ? "
                        + "WHERE user_id = ?";
                stm = con.prepareStatement(sql);
                stm.setString(1, name);
                stm.setString(2, phone);
                stm.setString(3, id);

                int affectedRows = stm.executeUpdate();
                if (affectedRows > 0) {
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

    public boolean changePassword(String userId, String password) throws SQLException, NamingException {

        boolean result = false;

        try {
            con = DBConnect.createConnection();
            if (con != null) {
                String sql = "UPDATE user "
                        + "SET password = ? "
                        + "WHERE user_id = ?";
                stm = con.prepareStatement(sql);
                stm.setString(1, password);
                stm.setString(2, userId);

                int affectedRows = stm.executeUpdate();
                if (affectedRows > 0) {
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
      public boolean createNewPassword(String username, String password) throws SQLException, NamingException {

        boolean result = false;

        try {
            con = DBConnect.createConnection();
            if (con != null) {
                String sql = "UPDATE user "
                        + "SET password = ? "
                        + "WHERE username = ?";
                stm = con.prepareStatement(sql);
                stm.setString(1, password);
                stm.setString(2, username);

                int affectedRows = stm.executeUpdate();
                if (affectedRows > 0) {
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

    public boolean updateAccountInfo(String userId, String fullname, String phone, String address, String avatar) throws SQLException, NamingException {

        boolean result = false;

        try {
            con = DBConnect.createConnection();
            if (con != null) {
                String sql = "UPDATE user "
                        + "SET name = ?, phone = ?, address = ?, picture = ? "
                        + "WHERE user_id = ?";
                stm = con.prepareStatement(sql);
                stm.setString(1, fullname);
                stm.setString(2, phone);
                stm.setString(3, address);
                stm.setString(4, avatar);
                stm.setString(5, userId);

                int affectedRows = stm.executeUpdate();
                if (affectedRows > 0) {
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

}

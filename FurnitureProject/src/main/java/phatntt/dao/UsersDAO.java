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
import java.util.List;
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

    public List<UsersDTO> checkLogin(String email) throws SQLException, NamingException {

        List<UsersDTO> result = new ArrayList<>();

        try {
            con = DBConnect.createConnection();
            if (con != null) {
                String sql = "Select * from user where email = ?";
                stm = con.prepareStatement(sql);
                stm.setString(1, email);

                rs = stm.executeQuery();

                if (rs.next()) {
                    // mapping
                    //5.1 get data from tu resultset
                    String id = rs.getString("user_id");
                    email = rs.getString("email");
                    String password = rs.getString("password");
                    String name = rs.getString("name");
                    String given_name = rs.getString("given_name");
                    String family_name = rs.getString("family_name");
                    String phone = rs.getString("phone");
                    String picture = rs.getString("picture");
                    String address = rs.getString("address");
                    String google_id = rs.getString("google_id");
                    int role = rs.getInt("role_id");
                    Timestamp createdAt = rs.getTimestamp("created_at");
                    UsersDTO user = new UsersDTO(id, email, password, name, given_name, family_name, picture, phone, address, google_id, role, createdAt);
                    result.add(user);

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

    public UsersDTO checkLoginByGoogle(String email, String googleId) throws SQLException, NamingException {

        UsersDTO result = null;

        try {
            con = DBConnect.createConnection();
            if (con != null) {
                String sql = "Select * from user where email = ? and google_id = ? ";
                stm = con.prepareStatement(sql);
                stm.setString(1, email);
                 stm.setString(2, googleId);

                rs = stm.executeQuery();

                if (rs.next()) {
                    // mapping
                    //5.1 get data from tu resultset
                    String id = rs.getString("user_id");
                    email = rs.getString("email");
                    String password = rs.getString("password");
                    String name = rs.getString("name");
                    String given_name = rs.getString("given_name");
                    String family_name = rs.getString("family_name");
                    String phone = rs.getString("phone");
                    String picture = rs.getString("picture");
                    String address = rs.getString("address");
                    googleId = rs.getString("google_id");
                    int role = rs.getInt("role_id");
                    Timestamp createdAt = rs.getTimestamp("created_at");
                    result = new UsersDTO(id, email, password, name, given_name, family_name, picture, phone, address, googleId, role, createdAt);
                    
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

    public boolean registerAccount(String email, String password, String givenName, String familyName, int roleId, Timestamp createdAt) throws SQLException, NamingException {

        boolean result = false;
        try {
            //1. Create connection
            con = DBConnect.createConnection();
            if (con != null) {
                //2. create sql string
                String sql = "Insert Into user(user_id, email, password , name, given_name, family_name, role_id, created_at) "
                        + "Values(?, ?, ?, ?, ?, ?, ?, ?)";
                stm = con.prepareStatement(sql);
                stm.setString(1, UUID.randomUUID().toString());
                stm.setString(2, email);
                stm.setString(3, password);
                stm.setString(4, givenName + " " + familyName);
                stm.setString(5, givenName);
                stm.setString(6, familyName);
                stm.setInt(7, roleId);
                stm.setTimestamp(8, createdAt);
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

    public boolean loginWithGoogle(UsersDTO user) throws SQLException, NamingException {

        boolean result = false;
        try {
            //1. Create connection
            con = DBConnect.createConnection();
            if (con != null) {

                String sql = "Insert Into user(user_id , email, name, given_name, family_name, picture, google_id, role_id, created_at) "
                        + "Values(?, ?, ?, ?, ?, ?, ?, ?, ?)";
                stm = con.prepareStatement(sql);
                stm.setString(1, UUID.randomUUID().toString());
                stm.setString(2, user.getEmail());
                stm.setString(3, user.getName());
                stm.setString(4, user.getGiven_name());
                stm.setString(5, user.getFamily_name());
                stm.setString(6, user.getPicture());
                stm.setString(7, user.getId());
                stm.setInt(8, user.getRole());
                stm.setTimestamp(9, user.getCreatedAt());
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

    public void linkSystemAccount(String email, String googleId) throws SQLException, NamingException {

        try {
            con = DBConnect.createConnection();
            if (con != null) {
                String sql = "UPDATE user "
                        + "SET google_id = ? "
                        + "WHERE email = ?";
                stm = con.prepareStatement(sql);
                stm.setString(1, googleId);
                stm.setString(2, email);
                stm.executeUpdate();

            }

        } finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }

    }

    public void linkGoogleAccount(String email, String password) throws SQLException, NamingException {

        try {
            con = DBConnect.createConnection();
            if (con != null) {
                String sql = "UPDATE user "
                        + "SET password = ? "
                        + "WHERE email = ?";
                stm = con.prepareStatement(sql);
                stm.setString(1, password);
                stm.setString(2, email);
                stm.executeUpdate();

            }

        } finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }

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
                    String password = rs.getString("password");
                    String name = rs.getString("name");
                    String given_name = rs.getString("given_name");
                    String family_name = rs.getString("family_name");
                    String phone = rs.getString("phone");
                    String picture = rs.getString("picture");
                    String address = rs.getString("address");
                    String google_id = rs.getString("google_id");
                    int role = rs.getInt("role_id");
                    Timestamp createdAt = rs.getTimestamp("created_at");
                    UsersDTO u = new UsersDTO(id, email, password, name, given_name, family_name, picture, phone, address, google_id, role, createdAt);
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
                    String password = rs.getString("password");
                    String name = rs.getString("name");
                    String given_name = rs.getString("given_name");
                    String family_name = rs.getString("family_name");
                    String phone = rs.getString("phone");
                    String picture = rs.getString("picture");
                    String address = rs.getString("address");
                    String google_id = rs.getString("google_id");
                    int role = rs.getInt("role_id");
                    Timestamp createdAt = rs.getTimestamp("created_at");
                    UsersDTO u = new UsersDTO(id, email, password, name, given_name, family_name, picture, phone, address, google_id, role, createdAt);
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
                        + "Where role_id = '2'";
                stm = con.prepareStatement(sql);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String id = rs.getString("user_id");
                    String email = rs.getString("email");
                    String password = rs.getString("password");
                    String name = rs.getString("name");
                    String given_name = rs.getString("given_name");
                    String family_name = rs.getString("family_name");
                    String phone = rs.getString("phone");
                    String picture = rs.getString("picture");
                    String address = rs.getString("address");
                    String google_id = rs.getString("google_id");
                    int role = rs.getInt("role_id");
                    Timestamp createdAt = rs.getTimestamp("created_at");
                    UsersDTO u = new UsersDTO(id, email, password, name, given_name, family_name, picture, phone, address, google_id, role, createdAt);
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

    public UsersDTO getUserById(String id) throws SQLException, NamingException {

        UsersDTO result = null;

        try {

            con = DBConnect.createConnection();
            if (con != null) {
                String sql = "Select * from user where user_id = ? ";
                stm = con.prepareStatement(sql);
                stm.setString(1, id);
                rs = stm.executeQuery();
                if (rs.next()) {
                    id = rs.getString("user_id");
                    String email = rs.getString("email");
                    String password = rs.getString("password");
                    String name = rs.getString("name");
                    String given_name = rs.getString("given_name");
                    String family_name = rs.getString("family_name");
                    String phone = rs.getString("phone");
                    String picture = rs.getString("picture");
                    String address = rs.getString("address");
                    String google_id = rs.getString("google_id");
                    int role = rs.getInt("role_id");
                    Timestamp createdAt = rs.getTimestamp("created_at");
                    result = new UsersDTO(id, email, password, name, given_name, family_name, picture, phone, address, google_id, role, createdAt);

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

    public UsersDTO getUserByEmail(String email) throws SQLException, NamingException {

        UsersDTO result = null;

        try {

            con = DBConnect.createConnection();
            if (con != null) {
                String sql = "Select * from user where email = ? ";
                stm = con.prepareStatement(sql);
                stm.setString(1, email);
                rs = stm.executeQuery();
                if (rs.next()) {
                    String id = rs.getString("user_id");
                    email = rs.getString("email");
                    String password = rs.getString("password");
                    String name = rs.getString("name");
                    String given_name = rs.getString("given_name");
                    String family_name = rs.getString("family_name");
                    String phone = rs.getString("phone");
                    String picture = rs.getString("picture");
                    String address = rs.getString("address");
                    String google_id = rs.getString("google_id");
                    int role = rs.getInt("role_id");
                    Timestamp createdAt = rs.getTimestamp("created_at");
                    result = new UsersDTO(id, email, password, name, given_name, family_name, picture, phone, address, google_id, role, createdAt);

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
    public UsersDTO getUserByGoogleId(String googleId) throws SQLException, NamingException {

        UsersDTO result = null;

        try {

            con = DBConnect.createConnection();
            if (con != null) {
                String sql = "Select * from user where google_id = ? ";
                stm = con.prepareStatement(sql);
                stm.setString(1, googleId);
                rs = stm.executeQuery();
                if (rs.next()) {
                    String id = rs.getString("user_id");
                    String email = rs.getString("email");
                    String password = rs.getString("password");
                    String name = rs.getString("name");
                    String given_name = rs.getString("given_name");
                    String family_name = rs.getString("family_name");
                    String phone = rs.getString("phone");
                    String picture = rs.getString("picture");
                    String address = rs.getString("address");
                    googleId = rs.getString("google_id");
                    int role = rs.getInt("role_id");
                    Timestamp createdAt = rs.getTimestamp("created_at");
                    result = new UsersDTO(id, email, password, name, given_name, family_name, picture, phone, address, googleId, role, createdAt);

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

    public boolean deleteAccount(String userId) throws SQLException, NamingException {

        boolean result = false;
        try {
            con = DBConnect.createConnection();

            if (con != null) {
                String sql = "Delete From user"
                        + "Where user_id = ?";

                stm = con.prepareStatement(sql);
                stm.setString(1, userId);

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

    public boolean createNewPassword(String email, String password) throws SQLException, NamingException {

        boolean result = false;

        try {
            con = DBConnect.createConnection();
            if (con != null) {
                String sql = "UPDATE user "
                        + "SET password = ? "
                        + "WHERE email = ?";
                stm = con.prepareStatement(sql);
                stm.setString(1, password);
                stm.setString(2, email);

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

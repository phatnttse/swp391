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
import lombok.Cleanup;
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

    public UsersDTO checkLogin(String email) throws SQLException, NamingException {
        UsersDTO result = null;

        try {
            @Cleanup Connection con = DBConnect.createConnection();
            if (con != null) {
                String sql = "SELECT * FROM user WHERE email = ? AND google_id IS NULL";
                @Cleanup PreparedStatement stm = con.prepareStatement(sql);
                stm.setString(1, email);

                @Cleanup ResultSet rs = stm.executeQuery();

                if (rs.next()) {
                    result = UsersDTO.builder()
                            .id(rs.getString("user_id"))
                            .email(rs.getString("email"))
                            .password(rs.getString("password"))
                            .name(rs.getString("name"))
                            .givenName(rs.getString("given_name"))
                            .familyName(rs.getString("family_name"))
                            .picture(rs.getString("picture"))
                            .phone(rs.getString("phone"))
                            .address(rs.getString("address"))
                            .googleId(rs.getString("google_id"))
                            .role(rs.getInt("role_id"))
                            .createdAt(rs.getTimestamp("created_at"))
                            .build();
                }
            }
        } catch (SQLException e) {
            // Handle exceptions if needed
            e.printStackTrace();
        }

        return result;
    }

    public UsersDTO checkLoginByGoogle(String email, String googleId) throws SQLException, NamingException {
        UsersDTO result = null;

        try {
            @Cleanup Connection con = DBConnect.createConnection();
            if (con != null) {
                String sql = "SELECT * FROM user WHERE email = ? AND google_id = ?";
                @Cleanup PreparedStatement stm = con.prepareStatement(sql);
                stm.setString(1, email);
                stm.setString(2, googleId);

                @Cleanup ResultSet rs = stm.executeQuery();

                if (rs.next()) {
                    result = UsersDTO.builder()
                            .id(rs.getString("user_id"))
                            .email(rs.getString("email"))
                            .password(rs.getString("password"))
                            .name(rs.getString("name"))
                            .givenName(rs.getString("given_name"))
                            .familyName(rs.getString("family_name"))
                            .picture(rs.getString("picture"))
                            .phone(rs.getString("phone"))
                            .address(rs.getString("address"))
                            .googleId(rs.getString("google_id"))
                            .role(rs.getInt("role_id"))
                            .createdAt(rs.getTimestamp("created_at"))
                            .build();
                }
            }
        } catch (SQLException e) {
            // Handle exceptions if needed
            e.printStackTrace();
        }

        return result;
    }

    public boolean registerAccount(String email, String password, String givenName, String familyName, int roleId) throws SQLException, NamingException {

        boolean result = false;
        try {
            con = DBConnect.createConnection();
            if (con != null) {
                String sql = "Insert Into user(user_id, email, password , name, given_name, family_name, role_id) "
                        + "Values(?, ?, ?, ?, ?, ?, ?)";
                stm = con.prepareStatement(sql);
                stm.setString(1, UUID.randomUUID().toString());
                stm.setString(2, email);
                stm.setString(3, password);
                stm.setString(4, givenName + " " + familyName);
                stm.setString(5, givenName);
                stm.setString(6, familyName);
                stm.setInt(7, roleId);
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
            @Cleanup
            Connection con = DBConnect.createConnection();
            if (con != null) {
                String sql = "INSERT INTO user(user_id, email, name, given_name, family_name, picture, google_id, role_id) "
                        + "VALUES(?, ?, ?, ?, ?, ?, ?, ?)";
                @Cleanup
                PreparedStatement stm = con.prepareStatement(sql);
                stm.setString(1, UUID.randomUUID().toString());
                stm.setString(2, user.getEmail());
                stm.setString(3, user.getName());
                stm.setString(4, user.getGivenName());
                stm.setString(5, user.getFamilyName());
                stm.setString(6, user.getPicture());
                stm.setString(7, user.getGoogleId());
                stm.setInt(8, user.getRole());

                int affectedRows = stm.executeUpdate();

                if (affectedRows > 0) {
                    result = true;
                }
            }
        } catch (SQLException e) {
            // Handle exceptions if needed
            e.printStackTrace();
        }

        return result;
    }

    public List<UsersDTO> getAllUsers() throws SQLException, NamingException {
        List<UsersDTO> result = new ArrayList<>();

        try {
            @Cleanup
            Connection con = DBConnect.createConnection();
            if (con != null) {
                String sql = "SELECT * FROM user";
                @Cleanup
                PreparedStatement stm = con.prepareStatement(sql);

                @Cleanup
                ResultSet rs = stm.executeQuery();
                while (rs.next()) {
                    UsersDTO userDTO = UsersDTO.builder()
                            .id(rs.getString("user_id"))
                            .email(rs.getString("email"))
                            .password(rs.getString("password"))
                            .name(rs.getString("name"))
                            .givenName(rs.getString("given_name"))
                            .familyName(rs.getString("family_name"))
                            .picture(rs.getString("picture"))
                            .phone(rs.getString("phone"))
                            .address(rs.getString("address"))
                            .googleId(rs.getString("google_id"))
                            .role(rs.getInt("role_id"))
                            .createdAt(rs.getTimestamp("created_at"))
                            .build();

                    result.add(userDTO);
                }
            }
        } catch (SQLException e) {
            // Handle exceptions if needed
            e.printStackTrace();
        }

        return result;
    }

    public List<UsersDTO> getAllCustomers() throws SQLException, NamingException {
        List<UsersDTO> result = new ArrayList<>();

        try {
            @Cleanup
            Connection con = DBConnect.createConnection();
            if (con != null) {
                String sql = "SELECT * FROM user WHERE role_id = '0'";
                @Cleanup
                PreparedStatement stm = con.prepareStatement(sql);

                @Cleanup
                ResultSet rs = stm.executeQuery();
                while (rs.next()) {
                    UsersDTO userDTO = UsersDTO.builder()
                            .id(rs.getString("user_id"))
                            .email(rs.getString("email"))
                            .password(rs.getString("password"))
                            .name(rs.getString("name"))
                            .givenName(rs.getString("given_name"))
                            .familyName(rs.getString("family_name"))
                            .picture(rs.getString("picture"))
                            .phone(rs.getString("phone"))
                            .address(rs.getString("address"))
                            .googleId(rs.getString("google_id"))
                            .role(rs.getInt("role_id"))
                            .createdAt(rs.getTimestamp("created_at"))
                            .build();

                    result.add(userDTO);
                }
            }
        } catch (SQLException e) {
            // Handle exceptions if needed
            e.printStackTrace();
        }

        return result;
    }

    public List<UsersDTO> getAllAdmin() throws SQLException, NamingException {
        List<UsersDTO> result = new ArrayList<>();

        try {
            @Cleanup
            Connection con = DBConnect.createConnection();
            if (con != null) {
                String sql = "SELECT * FROM user WHERE role_id = '2'";
                @Cleanup
                PreparedStatement stm = con.prepareStatement(sql);

                @Cleanup
                ResultSet rs = stm.executeQuery();
                while (rs.next()) {
                    UsersDTO userDTO = UsersDTO.builder()
                            .id(rs.getString("user_id"))
                            .email(rs.getString("email"))
                            .password(rs.getString("password"))
                            .name(rs.getString("name"))
                            .givenName(rs.getString("given_name"))
                            .familyName(rs.getString("family_name"))
                            .picture(rs.getString("picture"))
                            .phone(rs.getString("phone"))
                            .address(rs.getString("address"))
                            .googleId(rs.getString("google_id"))
                            .role(rs.getInt("role_id"))
                            .createdAt(rs.getTimestamp("created_at"))
                            .build();

                    result.add(userDTO);
                }
            }
        } catch (SQLException e) {
            // Handle exceptions if needed
            e.printStackTrace();
        }

        return result;
    }

    public List<UsersDTO> getAllUsersWithNameOfRole() throws SQLException, NamingException {
        List<UsersDTO> result = new ArrayList<>();

        try {
            @Cleanup
            Connection con = DBConnect.createConnection();
            if (con != null) {
                String sql = "SELECT u.*, r.name AS role_name\n"
                        + "FROM user u\n"
                        + "INNER JOIN role r ON u.role_id = r.role_id"
                        + "";
                @Cleanup
                PreparedStatement stm = con.prepareStatement(sql);

                @Cleanup
                ResultSet rs = stm.executeQuery();
                while (rs.next()) {
                    UsersDTO userDTO = UsersDTO.builder()
                            .id(rs.getString("user_id"))
                            .email(rs.getString("email"))
                            .password(rs.getString("password"))
                            .name(rs.getString("name"))
                            .givenName(rs.getString("given_name"))
                            .familyName(rs.getString("family_name"))
                            .picture(rs.getString("picture"))
                            .phone(rs.getString("phone"))
                            .address(rs.getString("address"))
                            .googleId(rs.getString("google_id"))
                            .role(rs.getInt("role_id"))
                            .createdAt(rs.getTimestamp("created_at"))
                            .roleName(rs.getString("role_name"))
                            .delete(rs.getBoolean("is_deleted"))
                            .build();

                    result.add(userDTO);
                }
            }
        } catch (SQLException e) {
            // Handle exceptions if needed
            e.printStackTrace();
        }

        return result;
    }

    public UsersDTO getUserById(String id) throws SQLException, NamingException {
        UsersDTO result = null;

        try {
            @Cleanup
            Connection con = DBConnect.createConnection();
            if (con != null) {
                String sql = "SELECT * FROM user WHERE user_id = ?";
                @Cleanup
                PreparedStatement stm = con.prepareStatement(sql);
                stm.setString(1, id);

                @Cleanup
                ResultSet rs = stm.executeQuery();
                if (rs.next()) {
                    result = UsersDTO.builder()
                            .id(rs.getString("user_id"))
                            .email(rs.getString("email"))
                            .password(rs.getString("password"))
                            .name(rs.getString("name"))
                            .givenName(rs.getString("given_name"))
                            .familyName(rs.getString("family_name"))
                            .picture(rs.getString("picture"))
                            .phone(rs.getString("phone"))
                            .address(rs.getString("address"))
                            .googleId(rs.getString("google_id"))
                            .role(rs.getInt("role_id"))
                            .createdAt(rs.getTimestamp("created_at"))
                            .build();
                }
            }
        } catch (SQLException e) {
            // Handle exceptions if needed
            e.printStackTrace();
        }

        return result;
    }

    public UsersDTO getUserByEmail(String email) throws SQLException, NamingException {
        UsersDTO result = null;

        try {
            @Cleanup
            Connection con = DBConnect.createConnection();
            if (con != null) {
                String sql = "SELECT * FROM user WHERE email = ?";
                @Cleanup
                PreparedStatement stm = con.prepareStatement(sql);
                stm.setString(1, email);

                @Cleanup
                ResultSet rs = stm.executeQuery();
                if (rs.next()) {
                    result = UsersDTO.builder()
                            .id(rs.getString("user_id"))
                            .email(rs.getString("email"))
                            .password(rs.getString("password"))
                            .name(rs.getString("name"))
                            .givenName(rs.getString("given_name"))
                            .familyName(rs.getString("family_name"))
                            .picture(rs.getString("picture"))
                            .phone(rs.getString("phone"))
                            .address(rs.getString("address"))
                            .googleId(rs.getString("google_id"))
                            .role(rs.getInt("role_id"))
                            .createdAt(rs.getTimestamp("created_at"))
                            .build();
                }
            }
        } catch (SQLException e) {
            // Handle exceptions if needed
            e.printStackTrace();
        }

        return result;
    }

    public UsersDTO getUserByGoogleId(String googleId) throws SQLException, NamingException {
        UsersDTO result = null;

        try {
            @Cleanup
            Connection con = DBConnect.createConnection();
            if (con != null) {
                String sql = "SELECT * FROM user WHERE google_id = ?";
                @Cleanup
                PreparedStatement stm = con.prepareStatement(sql);
                stm.setString(1, googleId);

                @Cleanup
                ResultSet rs = stm.executeQuery();
                if (rs.next()) {
                    result = UsersDTO.builder()
                            .id(rs.getString("user_id"))
                            .email(rs.getString("email"))
                            .password(rs.getString("password"))
                            .name(rs.getString("name"))
                            .givenName(rs.getString("given_name"))
                            .familyName(rs.getString("family_name"))
                            .picture(rs.getString("picture"))
                            .phone(rs.getString("phone"))
                            .address(rs.getString("address"))
                            .googleId(rs.getString("google_id"))
                            .role(rs.getInt("role_id"))
                            .createdAt(rs.getTimestamp("created_at"))
                            .build();
                }
            }
        } catch (SQLException e) {
            // Handle exceptions if needed
            e.printStackTrace();
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
                        + "WHERE user_id = ? AND google_id IS NULL";
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

    public boolean createNewPassword(String user_id, String password) throws SQLException, NamingException {

        boolean result = false;

        try {
            con = DBConnect.createConnection();
            if (con != null) {
                String sql = "UPDATE user "
                        + "SET password = ? "
                        + "WHERE user_id = ?";
                stm = con.prepareStatement(sql);
                stm.setString(1, password);
                stm.setString(2, user_id);

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

    public boolean editProfile(String userId, String name, String phone, String address) throws SQLException, NamingException {

        boolean result = false;

        try {
            con = DBConnect.createConnection();
            if (con != null) {
                String sql = "UPDATE user "
                        + "SET name = ?, phone = ?, address = ?"
                        + "WHERE user_id = ?";
                stm = con.prepareStatement(sql);
                stm.setString(1, name);
                stm.setString(2, phone);
                stm.setString(3, address);
                stm.setString(4, userId);

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

    public boolean updateUserManagement(UsersDTO dto) throws SQLException, NamingException {

        boolean result = false;

        try {
            @Cleanup
            Connection con = DBConnect.createConnection();
            if (con != null) {
                String sql = "UPDATE user\n"
                        + "SET \n"
                        + "    email = ?,\n"
                        + "    name = ?,\n"
                        + "    phone = ?,\n"
                        + "    address = ?,\n"
                        + "    role_id = ?\n"
                        + "WHERE user_id = ?;";

                @Cleanup
                PreparedStatement stm = con.prepareCall(sql);
                stm.setString(1, dto.getEmail());
                stm.setString(2, dto.getName());
                stm.setString(3, dto.getPhone());
                stm.setString(4, dto.getAddress());
                stm.setInt(5, dto.getRole());
                stm.setString(6, dto.getId());

                int effectRows = stm.executeUpdate();
                if (effectRows > 0) {
                    result = true;
                }
            }
        } catch (SQLException | NamingException e) {
            // Handle exceptions if needed
            e.printStackTrace();
        }

        return result;
    }

    public boolean deleteUserManagementpublic(String userId)
            throws NamingException, SQLException {

        boolean result = false;
        try {
            @Cleanup
            Connection con = DBConnect.createConnection();
            if (con != null) {
                //2. Create SQL string
                String sql = "UPDATE user "
                        + "SET is_deleted = true"
                        + "WHERE user_id = ?;";
                //3. Create Statement Object
                @Cleanup
                PreparedStatement stm = con.prepareStatement(sql);
                stm.setString(1, userId);
                //4. Execute querry
                int effectRows = stm.executeUpdate();
                if (effectRows > 0) {
                    result = true;
                }//end username and password are existed
            }// end connection available

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
    
//    public boolean createStaffAccount(UsersDTO dto) throws SQLException, NamingException{
//        boolean result = false;
//        try {
//            //1. Create connection
//            con = DBConnect.createConnection();
//            if (con != null) {
//                //2. Create SQL string
//                String sql = "Insert Into Registration(username, password, lastname, isAdmin)"
//                        + " Values(?, ?, ?, ?)";
//
//                        
//                //3. Create Statement Object
//                stm = con.prepareStatement(sql);
//                stm.setString(1, account.getUsername());
//                 stm.setString(2, account.getPassword());
//                 stm.setString(3, account.getFullName());
//                stm.setBoolean(4, account.isRole());
//              
//                //4. Execute querry
//                int effectRows = stm.executeUpdate();
//
//                //5. Process
//                if (effectRows > 0) {
//                    result = true;
//                }//end username and password are existed
//            }// end connection available
//
//        } finally {
//            if (rs != null) {
//                rs.close();
//            }
//            if (stm != null) {
//                stm.close();
//            }
//            if (con != null) {
//                con.close();
//            }
//        }
//        return result;
//    }
}

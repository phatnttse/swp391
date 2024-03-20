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

    public UsersDTO checkLogin(String email) throws SQLException, NamingException {
        UsersDTO result = null;

        try {
            @Cleanup
            Connection con = DBConnect.createConnection();
            if (con != null) {
                String sql = "SELECT * FROM users WHERE email = ? AND google_id IS NULL";
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
                            .given_name(rs.getString("given_name"))
                            .family_name(rs.getString("family_name"))
                            .picture(rs.getString("picture"))
                            .phone(rs.getString("phone"))
                            .address(rs.getString("address"))
                            .google_id(rs.getString("google_id"))
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
            @Cleanup
            Connection con = DBConnect.createConnection();
            if (con != null) {
                String sql = "SELECT * FROM users WHERE email = ? AND google_id = ?";
                @Cleanup
                PreparedStatement stm = con.prepareStatement(sql);
                stm.setString(1, email);
                stm.setString(2, googleId);

                @Cleanup
                ResultSet rs = stm.executeQuery();

                if (rs.next()) {
                    result = UsersDTO.builder()
                            .id(rs.getString("user_id"))
                            .email(rs.getString("email"))
                            .password(rs.getString("password"))
                            .name(rs.getString("name"))
                            .given_name(rs.getString("given_name"))
                            .family_name(rs.getString("family_name"))
                            .picture(rs.getString("picture"))
                            .phone(rs.getString("phone"))
                            .address(rs.getString("address"))
                            .google_id(rs.getString("google_id"))
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

        @Cleanup
        Connection con = DBConnect.createConnection();
        if (con != null) {
            String sql = "Insert Into users(user_id, email, password , name, given_name, family_name, role_id) "
                    + "Values(?, ?, ?, ?, ?, ?, ?)";
            @Cleanup
            PreparedStatement stm = con.prepareStatement(sql);
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

        return result;
    }

    public boolean createNewStaffAccount(UsersDTO user) throws SQLException, NamingException {
        boolean result = false;

        try {
            @Cleanup
            Connection con = DBConnect.createConnection();
            if (con != null) {
                String sql = "INSERT INTO users (user_id, email, password,name, given_name, family_name, phone, role_id)"
                        + " VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
                @Cleanup
                PreparedStatement stm = con.prepareStatement(sql);
                stm.setString(1, UUID.randomUUID().toString());
                stm.setString(2, user.getEmail());
                stm.setString(3, user.getPassword());
                stm.setString(4, user.getGiven_name() + " " + user.getFamily_name());
                stm.setString(5, user.getGiven_name());
                stm.setString(6, user.getFamily_name());
                stm.setString(7, user.getPhone());
                stm.setInt(8, 1);
                int rowsAffected = stm.executeUpdate();
                if (rowsAffected > 0) {
                    result = true;
                }

            }

        } catch (NamingException e) {
            e.printStackTrace();
        }

        return result;
    }

    public boolean loginWithGoogle(UsersDTO user) throws SQLException, NamingException {
        boolean result = false;

        try {
            @Cleanup
            Connection con = DBConnect.createConnection();
            if (con != null) {
                String sql = "INSERT INTO users(user_id, email, name, given_name, family_name, picture, google_id, role_id) "
                        + "VALUES(?, ?, ?, ?, ?, ?, ?, ?)";
                @Cleanup
                PreparedStatement stm = con.prepareStatement(sql);
                stm.setString(1, UUID.randomUUID().toString());
                stm.setString(2, user.getEmail());
                stm.setString(3, user.getName());
                stm.setString(4, user.getGiven_name());
                stm.setString(5, user.getFamily_name());
                stm.setString(6, user.getPicture());
                stm.setString(7, user.getId());
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
                String sql = "SELECT * FROM users";
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
                            .given_name(rs.getString("given_name"))
                            .family_name(rs.getString("family_name"))
                            .picture(rs.getString("picture"))
                            .phone(rs.getString("phone"))
                            .address(rs.getString("address"))
                            .google_id(rs.getString("google_id"))
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
                String sql = "SELECT * FROM users WHERE role_id = '0'";
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
                            .given_name(rs.getString("given_name"))
                            .family_name(rs.getString("family_name"))
                            .picture(rs.getString("picture"))
                            .phone(rs.getString("phone"))
                            .address(rs.getString("address"))
                            .google_id(rs.getString("google_id"))
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
                String sql = "SELECT * FROM users WHERE role_id = '2'";
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
                            .given_name(rs.getString("given_name"))
                            .family_name(rs.getString("family_name"))
                            .picture(rs.getString("picture"))
                            .phone(rs.getString("phone"))
                            .address(rs.getString("address"))
                            .google_id(rs.getString("google_id"))
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
                        + "FROM users u\n"
                        + "INNER JOIN roles r ON u.role_id = r.role_id"
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
                            .given_name(rs.getString("given_name"))
                            .family_name(rs.getString("family_name"))
                            .picture(rs.getString("picture"))
                            .phone(rs.getString("phone"))
                            .address(rs.getString("address"))
                            .google_id(rs.getString("google_id"))
                            .role(rs.getInt("role_id"))
                            .createdAt(rs.getTimestamp("created_at"))
                            .roleName(rs.getString("role_name"))
                            .deleted(rs.getBoolean("deleted"))
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
                String sql = "SELECT users.*, roles.name AS role_name\n"
                        + "FROM users\n"
                        + "INNER JOIN roles\n"
                        + "ON users.role_id = roles.role_id\n"
                        + "WHERE user_id = ?;";
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
                            .given_name(rs.getString("given_name"))
                            .family_name(rs.getString("family_name"))
                            .picture(rs.getString("picture"))
                            .phone(rs.getString("phone"))
                            .address(rs.getString("address"))
                            .google_id(rs.getString("google_id"))
                            .role(rs.getInt("role_id"))
                            .roleName(rs.getString("role_name"))
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
                String sql = "SELECT * FROM users WHERE email = ?";
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
                            .given_name(rs.getString("given_name"))
                            .family_name(rs.getString("family_name"))
                            .picture(rs.getString("picture"))
                            .phone(rs.getString("phone"))
                            .address(rs.getString("address"))
                            .google_id(rs.getString("google_id"))
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
                String sql = "SELECT * FROM users WHERE google_id = ?";
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
                            .given_name(rs.getString("given_name"))
                            .family_name(rs.getString("family_name"))
                            .picture(rs.getString("picture"))
                            .phone(rs.getString("phone"))
                            .address(rs.getString("address"))
                            .google_id(rs.getString("google_id"))
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

        @Cleanup
        Connection con = DBConnect.createConnection();

        if (con != null) {
            String sql = "Delete From users"
                    + "Where user_id = ?";

            @Cleanup
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, userId);

            int affectedRows = stm.executeUpdate();

            if (affectedRows > 0) {
                result = true;
            }
        }

        return result;
    }

    public boolean updateUsers(String id, String name, String phone) throws SQLException, NamingException {

        boolean result = false;

        @Cleanup
        Connection con = DBConnect.createConnection();
        if (con != null) {
            String sql = "UPDATE users "
                    + "SET name = ?, phone = ? "
                    + "WHERE user_id = ?";
            @Cleanup
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, name);
            stm.setString(2, phone);
            stm.setString(3, id);

            int affectedRows = stm.executeUpdate();
            if (affectedRows > 0) {
                result = true;
            }
        }

        return result;
    }

    public boolean changePassword(String userId, String password) throws SQLException, NamingException {

        boolean result = false;

        @Cleanup
        Connection con = DBConnect.createConnection();
        if (con != null) {
            String sql = "UPDATE users "
                    + "SET password = ? "
                    + "WHERE user_id = ? AND google_id IS NULL";
            @Cleanup
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, password);
            stm.setString(2, userId);

            int affectedRows = stm.executeUpdate();
            if (affectedRows > 0) {
                result = true;
            }
        }

        return result;
    }

    public boolean createNewPassword(String user_id, String password) throws SQLException, NamingException {

        boolean result = false;

        @Cleanup
        Connection con = DBConnect.createConnection();
        if (con != null) {
            String sql = "UPDATE users "
                    + "SET password = ? "
                    + "WHERE user_id = ?";
            @Cleanup
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, password);
            stm.setString(2, user_id);

            int affectedRows = stm.executeUpdate();
            if (affectedRows > 0) {
                result = true;
            }
        }

        return result;
    }

    public boolean editProfile(String userId, String name, String phone, String address) throws SQLException, NamingException {

        boolean result = false;

        @Cleanup
        Connection con = DBConnect.createConnection();
        if (con != null) {
            String sql = "UPDATE users "
                    + "SET name = ?, phone = ?, address = ?"
                    + "WHERE user_id = ?";
            @Cleanup
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, name);
            stm.setString(2, phone);
            stm.setString(3, address);
            stm.setString(4, userId);

            int affectedRows = stm.executeUpdate();
            if (affectedRows > 0) {
                result = true;
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
                String sql = "UPDATE users\n"
                        + "SET \n"
                        + "    email = ?,\n"
                        + "    name = ?,\n"
                        + "    phone = ?,\n"
                        + "    address = ?,\n"
                        + "    role_id = ?\n"
                        + "WHERE user_id = ?;";

                @Cleanup
                PreparedStatement stm = con.prepareStatement(sql);
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

    public boolean deleteUserManagementpublic(String userId) throws NamingException, SQLException {

        boolean result = false;

        @Cleanup
        Connection con = DBConnect.createConnection();
        if (con != null) {
            // Tạo chuỗi SQL DELETE
            String sql = "UPDATE `users`\n"
                    + "SET `deleted` = TRUE\n"
                    + "WHERE `user_id` = ?;";
            // Tạo PreparedStatement
            @Cleanup
            PreparedStatement stm = con.prepareStatement(sql);
            // Thiết lập giá trị cho tham số user_id
            stm.setString(1, userId);
            // Thực thi câu lệnh DELETE
            int effectRows = stm.executeUpdate();
            // Kiểm tra xem có bản ghi nào bị ảnh hưởng không
            if (effectRows > 0) {
                result = true;
            }
        }

        return result;
    }

    public List<UsersDTO> searchUserByName(String name) throws SQLException, NamingException {
        List<UsersDTO> userList = new ArrayList<>();
        String query = "SELECT users.*, roles.name as role_name\n"
                + "FROM users\n"
                + "JOIN roles ON users.role_id = roles.role_id\n"
                + "WHERE users.name LIKE ?";
        @Cleanup
        Connection con = DBConnect.createConnection();

        @Cleanup
        PreparedStatement preparedStatement = con.prepareStatement(query);

        preparedStatement.setString(1, "%" + name + "%");

        try (ResultSet rs = preparedStatement.executeQuery()) {
            while (rs.next()) {

                UsersDTO user = UsersDTO.builder()
                        .id(rs.getString("user_id"))
                        .email(rs.getString("email"))
                        .password(rs.getString("password"))
                        .name(rs.getString("name"))
                        .given_name(rs.getString("given_name"))
                        .family_name(rs.getString("family_name"))
                        .picture(rs.getString("picture"))
                        .phone(rs.getString("phone"))
                        .address(rs.getString("address"))
                        .google_id(rs.getString("google_id"))
                        .role(rs.getInt("role_id"))
                        .roleName(rs.getString("role_name"))
                        .createdAt(rs.getTimestamp("created_at"))
                        .build();
                userList.add(user);
            }
        }

        return userList;
    }

    public List<UsersDTO> filterAccount(String roleName, String sort) throws SQLException, NamingException {
        List<UsersDTO> result = new ArrayList<>();
        @Cleanup
        Connection con = DBConnect.createConnection();
        @Cleanup
        PreparedStatement stmt = con.prepareStatement("SELECT users.* \n"
                + "FROM users\n"
                + "JOIN roles ON users.role_id = roles.role_id\n"
                + "WHERE roles.name = ?\n"
                + "ORDER BY users.name " + sort);

        stmt.setString(1, roleName);
        @Cleanup
        ResultSet rs = stmt.executeQuery();
        while (rs.next()) {
            UsersDTO user = UsersDTO.builder()
                    .id(rs.getString("user_id"))
                    .email(rs.getString("email"))
                    .password(rs.getString("password"))
                    .name(rs.getString("name"))
                    .given_name(rs.getString("given_name"))
                    .family_name(rs.getString("family_name"))
                    .phone(rs.getString("phone"))
                    .picture(rs.getString("picture"))
                    .address(rs.getString("address"))
                    .google_id(rs.getString("google_id"))
                    .role(rs.getInt("role_id"))
                    .roleName(roleName)
                    .createdAt(rs.getTimestamp("created_at"))
                    .build();
            result.add(user);
        }

        return result;
    }

}

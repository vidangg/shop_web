/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.sql.Connection;
import model.user;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Quan
 */
public class UserDAOlmpl implements UserDAO {

    private Connection connection;

    public UserDAOlmpl(Connection connection) {
        super();
        this.connection = connection;
    }

    public boolean userRegister(user us) {
        boolean f = false;

        try {
            String sql = "insert into user(name,email,phone,password,role) values(?,?,?,?,?)";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, us.getName());
            ps.setString(2, us.getEmail());
            ps.setString(3, us.getPhone());
            ps.setString(4, us.getPassword());
            ps.setInt(5, us.getRole());
            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    public user login(String email, String password) {
        user us = null;

        try {
            String sql = "select * from user where email=? and password=?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                us = new user();
                us.setId(rs.getInt(1));
                us.setName(rs.getString(2));
                us.setEmail(rs.getString(3));
                us.setPhone(rs.getString(4));
                us.setPassword(rs.getString(5));
                us.setRole(rs.getInt(6));
                us.setMoney(rs.getString(7));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return us;
    }

    public boolean checkUser(String em) {
        boolean f = true;

        try {
            String sql = "SELECT * FROM user WHERE email=?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, em);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                f = false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    public List<user> getAllUser() {
        List<user> list = new ArrayList<user>();
        user u = null;
        try {
            String sql = "SELECT * FROM user";
            PreparedStatement ps = connection.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                u = new user();
                u.setId(rs.getInt(1));
                u.setName(rs.getString(2));
                u.setEmail(rs.getString(3));
                u.setPhone(rs.getString(4));
                u.setPassword(rs.getString(5));
                u.setRole(rs.getInt(6));
                u.setMoney(rs.getString(7));
                list.add(u);

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public boolean deleteUser(int id) {
        boolean f = false;

        try {
            String sql = "DELETE FROM user WHERE id=?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    public boolean checkPassword(int id) {
        boolean f = false;
        try {
            String sql = "SELECT * FORM user WHERE id=?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                f = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    public boolean updateProfile(user us) {
        boolean f = false;

        try {
            String sql = "UPDATE user SET name=?,email=?,phone=?,password=? WHERE id=?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, us.getName());
            ps.setString(2, us.getEmail());
            ps.setString(3, us.getPhone());
            ps.setString(4, us.getPassword());
            ps.setInt(5, us.getId());

            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    public user getUserById(int id) {
        user u = null;
        try {
            String sql = "SELECT * FROM user Where id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                u = new user();
                u.setId(rs.getInt(1));
                u.setName(rs.getString(2));
                u.setEmail(rs.getString(3));
                u.setPhone(rs.getString(4));
                u.setPassword(rs.getString(5));
                u.setRole(rs.getInt(6));
                u.setMoney(rs.getString(7));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return u;
    }

    public boolean editUser(user us) {
        boolean f = false;

        try {
            String sql = "UPDATE user SET name=?,email=?,phone=?,password=?,role=?,money=? WHERE id=?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, us.getName());
            ps.setString(2, us.getEmail());
            ps.setString(3, us.getPhone());
            ps.setString(4, us.getPassword());
            ps.setInt(5, us.getRole());
            ps.setString(6, us.getMoney());
            ps.setInt(7, us.getId());

            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    public boolean updateUserMoney(user us) {
        boolean f = false;
        try {
            String sql = "UPDATE user SET money=? WHERE id=?";
            PreparedStatement ps = this.connection.prepareStatement(sql);
            ps.setString(1, us.getMoney());
            ps.setInt(2, us.getId());
            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }
    
    public String getMoneyUser(int id) {
        String money = null;
        try {
            String sql = "SELECT money FROM user WHERE id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                money = rs.getString("money");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return money;
    }

}

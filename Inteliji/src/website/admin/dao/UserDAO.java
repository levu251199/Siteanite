package website.admin.dao;

import Libs.ConnectionDB;
import website.admin.model.User;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserDAO {
    public static List<User> loadND() throws SQLException {
        List<User> dsu;
        User u;
        PreparedStatement pst = null;
        ResultSet rs = null;
        String sql;
        try {
            dsu = new ArrayList<>();
            sql = "select * from account";
            pst = ConnectionDB.getConnection().prepareStatement(sql);
            rs = pst.executeQuery();
            while (rs.next()) {
                u = new User();
                dsu.add(getUser(rs, u));
            }
            return dsu;
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            return null;
        } finally {
            if (pst != null) pst.close();
            if (rs != null) rs.close();
        }
    }

    public static User selectByID(String id) throws SQLException {
        User user = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        String sql;
        try {
            sql = "select * from account where email=?";
            pst = ConnectionDB.getConnection().prepareStatement(sql);
            pst.setString(1, id);
            rs = pst.executeQuery();
            while (rs.next()) {
                user = new User();
                getUser(rs, user);
            }
            return user;
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            return null;
        } finally {
            if (pst != null) pst.close();
            if (rs != null) rs.close();
        }
    }

    public static User getUser(ResultSet rs, User user) throws SQLException {
        user.setEmail(rs.getString("email"));
        user.setPass(rs.getString("pass"));
        user.setLastName(rs.getString("last_name"));
        user.setFirstName(rs.getString("first_name"));
        user.setBirth(rs.getString("date_of_birth"));
        user.setGender(rs.getString("gender"));
        user.setPhone(rs.getString("phone"));
        user.setAddress(rs.getString("address"));
        user.setRole(rs.getString("role"));
        return user;
    }
}

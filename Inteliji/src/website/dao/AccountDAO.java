package website.dao;

import Libs.ConnectionDB;
import website.model.Account;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AccountDAO {
    public static Account selectByID(String id) throws SQLException {
        Account user = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        String sql;
        try {
            sql = "select * from account where email=?";
            pst = ConnectionDB.getConnection().prepareStatement(sql);
            pst.setString(1, id);
            rs = pst.executeQuery();
            while (rs.next()) {
                user = new Account();
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

    public static Account getUser(ResultSet rs, Account user) throws SQLException {
        user.setEmail(rs.getString("email"));
        user.setPass(rs.getString("pass"));
        user.setLast_name(rs.getString("last_name"));
        user.setFirst_name(rs.getString("first_name"));
        user.setDateOfBirth(rs.getString("date_of_birth"));
        user.setGender(rs.getString("gender"));
        user.setNumberPhone(rs.getString("phone"));
        user.setAddress(rs.getString("address"));
        user.setRole(rs.getString("role"));
        return user;
    }
}

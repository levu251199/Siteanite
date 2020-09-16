package website.dao;

import Libs.ConnectionDB;
import website.model.Account;

import java.lang.reflect.AccessibleObject;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LoginDAO {

    public static Account checkLogin(String email, String password){
        Account account;
        PreparedStatement pst = null;
        ResultSet rs =null;
        String sql;
        try{
            sql = "select * from account where email=? and pass=?";
            pst = ConnectionDB.getConnection().prepareStatement(sql);
            pst.setString(1,email);
            pst.setString(2,password);
            rs = pst.executeQuery();
            while(rs.next()){
                account = new Account();
                account.setEmail(rs.getString("email"));
                account.setPass(rs.getString("pass"));
                account.setLast_name(rs.getString("last_name"));
                account.setFirst_name(rs.getString("first_name"));
                account.setDateOfBirth(rs.getString("date_of_birth"));
                account.setGender(rs.getString("gender"));
                account.setNumberPhone(rs.getString("phone"));
                account.setAddress(rs.getString("address"));
                account.setRole(rs.getString("role"));
                return account;
            }
            return null;
        }catch (SQLException | ClassNotFoundException e){
           e.printStackTrace();
           return  null;
        }

    }

}

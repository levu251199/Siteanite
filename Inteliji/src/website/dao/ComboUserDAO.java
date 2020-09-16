package website.dao;

import Libs.ConnectionDB;
import website.model.ComboUser;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ComboUserDAO {
    public static List<ComboUser> loadCB() throws SQLException {
        List<ComboUser> dscb;
        ComboUser cb;
        PreparedStatement pst = null;
        ResultSet rs = null;
        String sql;
        try {
            dscb = new ArrayList<>();
            sql = "select * from combo";
            pst = ConnectionDB.getConnection().prepareStatement(sql);
            rs = pst.executeQuery();
            while (rs.next()) {
                cb = new ComboUser();
                dscb.add(getCB(rs, cb));
            }
            return dscb;
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            return null;
        } finally {
            if (pst != null) pst.close();
            if (rs != null) rs.close();
        }
    }

    public static ComboUser selectByID(String id) throws SQLException {
        ComboUser combo = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        String sql;
        try {
            sql = "select * from combo where masanpham=?";
            pst = ConnectionDB.getConnection().prepareStatement(sql);
            pst.setString(1, id);
            rs = pst.executeQuery();
            while (rs.next()) {
                combo = new ComboUser();
                getCB(rs, combo);
            }
            return combo;
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            return null;
        } finally {
            if (pst != null) pst.close();
            if (rs != null) rs.close();
        }
    }

    public static ComboUser getCB(ResultSet rs, ComboUser combo) throws SQLException {
        combo.setMaCombo(rs.getString("masanpham"));
        combo.setTenCombo(rs.getString("tensanpham"));
        combo.setMotaCombo(rs.getString("motasanpham"));
        combo.setGiaCombo(rs.getDouble("giasanpham"));
        combo.setImg((rs.getString("img")));
        return combo;
    }
}

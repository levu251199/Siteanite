package website.admin.dao;

import Libs.ConnectionDB;
import website.admin.model.Combo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ComboDAO {
    public static List<Combo> loadCB() throws SQLException {
        List<Combo> dscb;
        Combo cb;
        PreparedStatement pst = null;
        ResultSet rs = null;
        String sql;
        try {
            dscb = new ArrayList<>();
            sql = "select * from combo";
            pst = ConnectionDB.getConnection().prepareStatement(sql);
            rs = pst.executeQuery();
            while (rs.next()) {
                cb = new Combo();
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

    public static Combo selectByID(String id) throws SQLException {
        Combo combo = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        String sql;
        try {
            sql = "select * from combo where masanpham=?";
            pst = ConnectionDB.getConnection().prepareStatement(sql);
            pst.setString(1, id);
            rs = pst.executeQuery();
            while (rs.next()) {
                combo = new Combo();
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

    public static Combo getCB(ResultSet rs, Combo combo) throws SQLException {
        combo.setMaCombo(rs.getString("masanpham"));
        combo.setTenCombo(rs.getString("tensanpham"));
        combo.setMotaCombo(rs.getString("motasanpham"));
        combo.setGiaCombo(rs.getDouble("giasanpham"));
        combo.setImg(rs.getString("img"));
        return combo;
    }
}

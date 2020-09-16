package website.dao;

import Libs.ConnectionDB;
import website.model.SmallProductUser;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class SmallProductUserDAO {
    public static List<SmallProductUser> loadKhaiVi() throws SQLException {
        List<SmallProductUser> dskv;
        SmallProductUser kv;
        PreparedStatement pst = null;
        ResultSet rs = null;
        String sql;
        try {
            dskv = new ArrayList<>();
            sql = "select * from sanphamphu where loai=\"Khai vị\"";

            pst = ConnectionDB.getConnection().prepareStatement(sql);
            rs = pst.executeQuery();
            while (rs.next()) {
                kv = new SmallProductUser();
                dskv.add(getSP(rs, kv));
            }
            return dskv;
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            return null;
        } finally {
            if (pst != null) pst.close();
            if (rs != null) rs.close();
        }
    }


    public static List<SmallProductUser> loadMiCom() throws SQLException {
        List<SmallProductUser> dsmc;
        SmallProductUser mc;
        PreparedStatement pst = null;
        ResultSet rs = null;
        String sql;
        try {
            dsmc = new ArrayList<>();
            sql = "select * from sanphamphu where loai=\"Mì\" or loai=\"Cơm\" or loai=\"Nui\"";
            pst = ConnectionDB.getConnection().prepareStatement(sql);
            rs = pst.executeQuery();
            while (rs.next()) {
                mc = new SmallProductUser();
                dsmc.add(getSP(rs, mc));
            }
            return dsmc;
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            return null;
        } finally {
            if (pst != null) pst.close();
            if (rs != null) rs.close();
        }
    }

    public static List<SmallProductUser> loadNuoc() throws SQLException {
        List<SmallProductUser> dsn;
        SmallProductUser n;
        PreparedStatement pst = null;
        ResultSet rs = null;
        String sql;
        try {
            dsn = new ArrayList<>();
            sql = "select * from sanphamphu where loai=\"Nước\"";
            pst = ConnectionDB.getConnection().prepareStatement(sql);
            rs = pst.executeQuery();
            while (rs.next()) {
                n = new SmallProductUser();
                dsn.add(getSP(rs, n));
            }
            return dsn;
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            return null;
        } finally {
            if (pst != null) pst.close();
            if (rs != null) rs.close();
        }
    }

    public static SmallProductUser selectByIDKhaiVi(String id) throws SQLException {
        SmallProductUser khaivi = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        String sql;
        try {
            sql = "select * from sanphamphu where masanpham=?";
            pst = ConnectionDB.getConnection().prepareStatement(sql);
            pst.setString(1, id);
            rs = pst.executeQuery();
            while (rs.next()) {
                khaivi = new SmallProductUser();
                getSP(rs, khaivi);
            }
            return khaivi;
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            return null;
        } finally {
            if (pst != null) pst.close();
            if (rs != null) rs.close();
        }
    }

    public static SmallProductUser getSP(ResultSet rs, SmallProductUser sanpham) throws SQLException {
        sanpham.setId(rs.getString("masanpham"));
        sanpham.setName(rs.getString("tensanpham"));
        sanpham.setDes(rs.getString("motasanpham"));
        sanpham.setPrice(rs.getDouble("giasanpham"));
        sanpham.setKind(rs.getString("loai"));
        sanpham.setImg((rs.getString("img")));
        return sanpham;
    }
}

package website.admin.dao;

import Libs.ConnectionDB;
import website.admin.model.SmallProducts;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class SmallProductsDAO {
    public static List<SmallProducts> loadSP() throws SQLException {
        List<SmallProducts> dssp;
        SmallProducts sp;
        PreparedStatement pst = null;
        ResultSet rs = null;
        String sql;
        try {
            dssp = new ArrayList<>();
            sql = "select * from sanphamphu";
            pst = ConnectionDB.getConnection().prepareStatement(sql);
            rs = pst.executeQuery();
            while (rs.next()) {
                sp = new SmallProducts();
                dssp.add(getPr(rs, sp));
            }
            return dssp;
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            return null;
        } finally {
            if (pst != null) pst.close();
            if (rs != null) rs.close();
        }
    }

    public static SmallProducts selectByID(String id) throws SQLException {
        SmallProducts sanPham = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        String sql;
        try {
            sql = "select * from sanphamphu where masanpham=?";
            pst = ConnectionDB.getConnection().prepareStatement(sql);
            pst.setString(1, id);
            rs = pst.executeQuery();
            while (rs.next()) {
                sanPham = new SmallProducts();
                getPr(rs, sanPham);
            }
            return sanPham;
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            return null;
        } finally {
            if (pst != null) pst.close();
            if (rs != null) rs.close();
        }
    }

    public static SmallProducts getPr(ResultSet rs, SmallProducts sanPham) throws SQLException {
        sanPham.setMasanpham(rs.getString("masanpham"));
        sanPham.setTensanpham(rs.getString("tensanpham"));
        sanPham.setMotasanpham(rs.getString("motasanpham"));
        sanPham.setGiasanpham(rs.getDouble("giasanpham"));
        sanPham.setLoaisanpham(rs.getString("loai"));
        sanPham.setImg(rs.getString("img"));
        return sanPham;
    }
}

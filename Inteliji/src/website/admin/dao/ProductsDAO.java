package website.admin.dao;

import Libs.ConnectionDB;
import website.admin.model.ProductMain;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductsDAO {
    public static List<ProductMain> loadSP() throws SQLException {
        List<ProductMain> dssp;
        ProductMain sp;
        PreparedStatement pst = null;
        ResultSet rs = null;
        String sql;
        try {
            dssp = new ArrayList<>();
            sql = "select * from sanphamchinh";
            pst = ConnectionDB.getConnection().prepareStatement(sql);
            rs = pst.executeQuery();
            while (rs.next()) {
                sp = new ProductMain();
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

    public static ProductMain selectByID(String id) throws SQLException {
        ProductMain sanPham = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        String sql;
        try {
            sql = "select * from sanphamchinh where masanpham=?";
            pst = ConnectionDB.getConnection().prepareStatement(sql);
            pst.setString(1, id);
            rs = pst.executeQuery();
            while (rs.next()) {
                sanPham = new ProductMain();
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

    public static ProductMain getPr(ResultSet rs, ProductMain sanPham) throws SQLException {
        sanPham.setMaSanPham(rs.getString("masanpham"));
        sanPham.setTenSanPham(rs.getString("tensanpham"));
        sanPham.setMoTaSanPham(rs.getString("motasanpham"));
        sanPham.setGiaLon(rs.getDouble("gialon"));
        sanPham.setGiaVua(rs.getDouble("giavua"));
        sanPham.setGiaNho(rs.getDouble("gianho"));
        sanPham.setLoaiSanPham(rs.getString("loaisanpham"));
        sanPham.setImg(rs.getString("img"));
        return sanPham;
    }
}

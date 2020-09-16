package website.dao;

import Libs.ConnectionDB;
import website.model.ProductUser;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductUserDAO {
    public static List<ProductUser> loadSP() throws SQLException {
        List<ProductUser> dssp;
        ProductUser sp;
        PreparedStatement pst = null;
        ResultSet rs = null;
        String sql;
        try {
            dssp = new ArrayList<>();
            sql = "select * from sanphamchinh";
            pst = ConnectionDB.getConnection().prepareStatement(sql);
            rs = pst.executeQuery();
            while (rs.next()) {
                sp = new ProductUser();
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

    public static int totalProduct(String table, String primary_k, String loai) {
        PreparedStatement pst = null;
        ResultSet rs = null;
        String sql;
        try {
            if (loai == null) {
                sql = "select count(?) as count from " + table;
            } else {
                sql = "select count(?) as count from " + table + " where loai=?";
            }
            pst = ConnectionDB.getConnection().prepareStatement(sql);
            if (loai == null) {
                pst.setString(1, primary_k);
            } else {
                pst.setString(1, primary_k);
                pst.setString(2, loai);
            }
            rs = pst.executeQuery();
            if (rs != null) {
                rs.first();
                return rs.getInt(1);
            } else {
                return 0;
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            return 0;
        }
    }

//    public static void main(String[] args) {
//        int total = totalProduct("sanphamphu", "masanpham","Khai vị");
//        System.out.println(total);
//    }

    public static ProductUser selectByID(String id) throws SQLException {
        ProductUser sanPham = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        String sql;
        try {
            sql = "select * from sanphamchinh where masanpham=?";
            pst = ConnectionDB.getConnection().prepareStatement(sql);
            pst.setString(1, id);
            rs = pst.executeQuery();
            while (rs.next()) {
                sanPham = new ProductUser();
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

    public static ProductUser getPr(ResultSet rs, ProductUser sanPham) throws SQLException {
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

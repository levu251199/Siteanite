package website.dao;

import Libs.ConnectionDB;
import website.model.Address;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AddressDAO {
    public static List<Address> mienNam() throws SQLException {
        List<Address> dsdc;
        Address dc;
        PreparedStatement pst = null;
        ResultSet rs = null;
        String sql;
        try {
            dsdc = new ArrayList<>();
            sql = "select * from miennam";
            pst = ConnectionDB.getConnection().prepareStatement(sql);
            rs = pst.executeQuery();
            while (rs.next()) {
                dc = new Address();
                dsdc.add(getDC(rs, dc));
            }
            return dsdc;
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            return null;
        } finally {
            if (pst != null) pst.close();
            if (rs != null) rs.close();
        }
    }

    public static List<Address> mienNamHCM() throws SQLException {
        List<Address> dsdc;
        Address dc;
        PreparedStatement pst = null;
        ResultSet rs = null;
        String sql;
        try {
            dsdc = new ArrayList<>();
            sql = "select * from miennam where city=1";
            pst = ConnectionDB.getConnection().prepareStatement(sql);
            rs = pst.executeQuery();
            while (rs.next()) {
                dc = new Address();
                dsdc.add(getDC(rs, dc));
            }
            return dsdc;
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            return null;
        } finally {
            if (pst != null) pst.close();
            if (rs != null) rs.close();
        }
    }

    public static List<Address> mienNamBienHoa() throws SQLException {
        List<Address> dsdc;
        Address dc;
        PreparedStatement pst = null;
        ResultSet rs = null;
        String sql;
        try {
            dsdc = new ArrayList<>();
            sql = "select * from miennam where city=2";
            pst = ConnectionDB.getConnection().prepareStatement(sql);
            rs = pst.executeQuery();
            while (rs.next()) {
                dc = new Address();
                dsdc.add(getDC(rs, dc));
            }
            return dsdc;
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            return null;
        } finally {
            if (pst != null) pst.close();
            if (rs != null) rs.close();
        }
    }

    public static List<Address> mienNamCaMau() throws SQLException {
        List<Address> dsdc;
        Address dc;
        PreparedStatement pst = null;
        ResultSet rs = null;
        String sql;
        try {
            dsdc = new ArrayList<>();
            sql = "select * from miennam where city=3";
            pst = ConnectionDB.getConnection().prepareStatement(sql);
            rs = pst.executeQuery();
            while (rs.next()) {
                dc = new Address();
                dsdc.add(getDC(rs, dc));
            }
            return dsdc;
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            return null;
        } finally {
            if (pst != null) pst.close();
            if (rs != null) rs.close();
        }
    }

    public static List<Address> mienNamCanTho() throws SQLException {
        List<Address> dsdc;
        Address dc;
        PreparedStatement pst = null;
        ResultSet rs = null;
        String sql;
        try {
            dsdc = new ArrayList<>();
            sql = "select * from miennam where city=4";
            pst = ConnectionDB.getConnection().prepareStatement(sql);
            rs = pst.executeQuery();
            while (rs.next()) {
                dc = new Address();
                dsdc.add(getDC(rs, dc));
            }
            return dsdc;
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            return null;
        } finally {
            if (pst != null) pst.close();
            if (rs != null) rs.close();
        }
    }

    public static List<Address> mienTrung() throws SQLException {
        List<Address> dsdc;
        Address dc;
        PreparedStatement pst = null;
        ResultSet rs = null;
        String sql;
        try {
            dsdc = new ArrayList<>();
            sql = "select * from mientrung";
            pst = ConnectionDB.getConnection().prepareStatement(sql);
            rs = pst.executeQuery();
            while (rs.next()) {
                dc = new Address();
                dsdc.add(getDC(rs, dc));
            }
            return dsdc;
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            return null;
        } finally {
            if (pst != null) pst.close();
            if (rs != null) rs.close();
        }
    }

    public static List<Address> mienTrungNhaTrang() throws SQLException {
        List<Address> dsdc;
        Address dc;
        PreparedStatement pst = null;
        ResultSet rs = null;
        String sql;
        try {
            dsdc = new ArrayList<>();
            sql = "select * from mientrung where city=1";
            pst = ConnectionDB.getConnection().prepareStatement(sql);
            rs = pst.executeQuery();
            while (rs.next()) {
                dc = new Address();
                dsdc.add(getDC(rs, dc));
            }
            return dsdc;
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            return null;
        } finally {
            if (pst != null) pst.close();
            if (rs != null) rs.close();
        }
    }

    public static List<Address> mienBac() throws SQLException {
        List<Address> dsdc;
        Address dc;
        PreparedStatement pst = null;
        ResultSet rs = null;
        String sql;
        try {
            dsdc = new ArrayList<>();
            sql = "select * from mienbac";
            pst = ConnectionDB.getConnection().prepareStatement(sql);
            rs = pst.executeQuery();
            while (rs.next()) {
                dc = new Address();
                dsdc.add(getDC(rs, dc));
            }
            return dsdc;
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            return null;
        } finally {
            if (pst != null) pst.close();
            if (rs != null) rs.close();
        }
    }

    public static List<Address> mienBacHaNoi() throws SQLException {
        List<Address> dsdc;
        Address dc;
        PreparedStatement pst = null;
        ResultSet rs = null;
        String sql;
        try {
            dsdc = new ArrayList<>();
            sql = "select * from mienbac where city=1";
            pst = ConnectionDB.getConnection().prepareStatement(sql);
            rs = pst.executeQuery();
            while (rs.next()) {
                dc = new Address();
                dsdc.add(getDC(rs, dc));
            }
            return dsdc;
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            return null;
        } finally {
            if (pst != null) pst.close();
            if (rs != null) rs.close();
        }
    }

    public static List<Address> mienBacHaiPhong() throws SQLException {
        List<Address> dsdc;
        Address dc;
        PreparedStatement pst = null;
        ResultSet rs = null;
        String sql;
        try {
            dsdc = new ArrayList<>();
            sql = "select * from mienbac where city=2";
            pst = ConnectionDB.getConnection().prepareStatement(sql);
            rs = pst.executeQuery();
            while (rs.next()) {
                dc = new Address();
                dsdc.add(getDC(rs, dc));
            }
            return dsdc;
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            return null;
        } finally {
            if (pst != null) pst.close();
            if (rs != null) rs.close();
        }
    }

    public static Address selectByIDN(String id) throws SQLException {
        Address diachi = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        String sql;
        try {
            sql = "select * from miennam where id=?";
            pst = ConnectionDB.getConnection().prepareStatement(sql);
            pst.setString(1, id);
            rs = pst.executeQuery();
            while (rs.next()) {
                diachi = new Address();
                getDC(rs, diachi);
            }
            return diachi;
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            return null;
        } finally {
            if (pst != null) pst.close();
            if (rs != null) rs.close();
        }
    }

    public static Address selectByIDT(String id) throws SQLException {
        Address diachi = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        String sql;
        try {
            sql = "select * from mientrung where id=?";
            pst = ConnectionDB.getConnection().prepareStatement(sql);
            pst.setString(1, id);
            rs = pst.executeQuery();
            while (rs.next()) {
                diachi = new Address();
                getDC(rs, diachi);
            }
            return diachi;
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            return null;
        } finally {
            if (pst != null) pst.close();
            if (rs != null) rs.close();
        }
    }

    public static Address selectByIDB(String id) throws SQLException {
        Address diachi = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        String sql;
        try {
            sql = "select * from mienbac where id=?";
            pst = ConnectionDB.getConnection().prepareStatement(sql);
            pst.setString(1, id);
            rs = pst.executeQuery();
            while (rs.next()) {
                diachi = new Address();
                getDC(rs, diachi);
            }
            return diachi;
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            return null;
        } finally {
            if (pst != null) pst.close();
            if (rs != null) rs.close();
        }
    }

    public static Address getDC(ResultSet rs, Address diachi) throws SQLException {
        diachi.setId(rs.getInt("id"));
        diachi.setShopName(rs.getString("shopname"));
        diachi.setAddress(rs.getString("address"));
        diachi.setPhone(rs.getString("numberphone"));
        diachi.setCity((rs.getInt("city")));
        return diachi;
    }
}

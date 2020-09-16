package website.admin.dao;
import Libs.ConnectionDB;
import website.admin.model.Employee;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EmployeeDAO {
    public static List<Employee> loadNV() throws SQLException {
        List<Employee> dssp;
        Employee nv;
        PreparedStatement pst = null;
        ResultSet rs = null;
        String sql;
        try {
            dssp = new ArrayList<>();
            sql = "select * from nhanvien";
            pst = ConnectionDB.getConnection().prepareStatement(sql);
            rs = pst.executeQuery();
            while (rs.next()) {
                nv = new Employee();
                dssp.add(getEm(rs, nv));
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

    public static Employee selectByID(String id) throws SQLException {
        Employee nhanVien = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        String sql;
        try {
            sql = "select * from nhanvien where email=?";
            pst = ConnectionDB.getConnection().prepareStatement(sql);
            pst.setString(1, id);
            rs = pst.executeQuery();
            while (rs.next()) {
                nhanVien = new Employee();
                getEm(rs, nhanVien);
            }
            return nhanVien;
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            return null;
        } finally {
            if (pst != null) pst.close();
            if (rs != null) rs.close();
        }
    }

    public static Employee getEm(ResultSet rs, Employee nhanVien) throws SQLException {
        nhanVien.setEmail(rs.getString("email"));
        nhanVien.setFullName(rs.getString("fullname"));
        nhanVien.setPhone(rs.getString("phone"));
        nhanVien.setBirth(rs.getString("date_of_birth"));
        nhanVien.setGender(rs.getString("gender"));
        nhanVien.setSalary(rs.getDouble("salary"));
        return nhanVien;
    }
}

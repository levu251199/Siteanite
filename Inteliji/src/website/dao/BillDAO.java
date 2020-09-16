package website.dao;

import Libs.ConnectionDB;
import website.model.Bill;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BillDAO {
    public static List<Bill> loadBill() throws SQLException {
        List<Bill> dssp;
        Bill sp;
        PreparedStatement pst = null;
        ResultSet rs = null;
        String sql;
        try {
            dssp = new ArrayList<>();
            sql = "select id, nameUser, phone, address, nameProduct, amount, price, total from bill";
            pst = ConnectionDB.getConnection().prepareStatement(sql);
            rs = pst.executeQuery();
            while (rs.next()) {
                sp = new Bill();
                dssp.add(getInfo(rs, sp));
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

    public static double totalPrice(){
        double total = 0;
        List<Bill> bill = null;
        try {
            bill = loadBill();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        assert bill != null;
        for (Bill value : bill) {
            total += value.getTotal();
        }
        return total;
    }

    public static Bill getInfo(ResultSet rs, Bill bill) throws SQLException {
        bill.setId(rs.getString("id"));
        bill.setNameUser(rs.getString("nameUser"));
        bill.setPhone(rs.getString("phone"));
        bill.setAddress(rs.getString("address"));
        bill.setNameProduct(rs.getString("nameProduct"));
        bill.setAmount(rs.getString("amount"));
        bill.setPrice(rs.getString("price"));
        bill.setTotal(rs.getDouble("total"));
        return bill;
    }
}

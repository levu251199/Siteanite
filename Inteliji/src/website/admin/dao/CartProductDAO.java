package website.admin.dao;

import Libs.ConnectionDB;
import website.admin.model.CartProduct;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CartProductDAO {
    public static List<CartProduct> loadCart() throws SQLException {
        List<CartProduct> dscp;
        CartProduct cp;
        PreparedStatement pst = null;
        ResultSet rs = null;
        String sql;
        try {
            dscp = new ArrayList<>();
            sql = "select * from donhangsanpham";
            pst = ConnectionDB.getConnection().prepareStatement(sql);
            rs = pst.executeQuery();
            while (rs.next()) {
                cp = new CartProduct();
                dscp.add(getCP(rs, cp));
            }
            return dscp;
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            return null;
        } finally {
            if (pst != null) pst.close();
            if (rs != null) rs.close();
        }
    }

    public static CartProduct getCP(ResultSet rs, CartProduct cart) throws SQLException {
        cart.setId(rs.getInt("madonhang"));
        cart.setName(rs.getString("tensanpham"));
        cart.setPrice(rs.getDouble("giasanpham"));
        cart.setAmount(rs.getInt("soluong"));
        cart.setTotal(rs.getDouble("thanhtien"));
        return cart;
    }
}

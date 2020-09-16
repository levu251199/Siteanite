package website.model;

import Libs.ConnectionDB;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Product {
    private String id;
    private String name;
    private String des;
    private int amount;
    private double price;

    public Product() {
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDes() {
        return des;
    }

    public void setDes(String des) {
        this.des = des;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    @Override
    public String toString() {
        return "Product{" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
                ", des='" + des + '\'' +
                ", amount=" + amount +
                ", price=" + price +
                '}';
    }

    public static Product findProduct(String table, String id, String size) {
        Product product = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        String sql;
        try {
            if(size==null){
                sql = "select * from " + table + " where masanpham=?";
            }else {
                sql =  "select masanpham,tensanpham,motasanpham,"+size+" from " + table + " where masanpham=?";
            }
            pst = ConnectionDB.getConnection().prepareStatement(sql);
            pst.setString(1, id);

            rs = pst.executeQuery();
            while (rs.next()) {
                product = new Product();
                product.setId(rs.getString("masanpham"));
                product.setDes(rs.getString("motasanpham"));
                product.setName(rs.getString("tensanpham"));
                product.setPrice(rs.getDouble(4));
                return product;
            }
            return null;
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            return null;
        }
    }
}

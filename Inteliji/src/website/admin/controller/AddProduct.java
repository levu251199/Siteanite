package website.admin.controller;

import Libs.ConnectionDB;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/AddProduct")
public class AddProduct extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String maSP = request.getParameter("id-pro");
        String tenSP = request.getParameter("name-pro");
        String motaSP = request.getParameter("desc-pro");
        String priceSmall = request.getParameter("price-small");
        String priceMedium = request.getParameter("price-medium");
        String priceLarge = request.getParameter("price-large");
        String loaiSP = request.getParameter("type");
        String img = request.getParameter("img");

        try {
            String sql = "INSERT INTO sanphamchinh (masanpham,tensanpham,motasanpham,gianho,giavua,gialon,loaisanpham,img) VALUES (?,?,?,?,?,?,?,?)";
            PreparedStatement pst = ConnectionDB.getConnection().prepareStatement(sql);
            pst.setString(1, maSP);
            pst.setString(2, tenSP);
            pst.setString(3, motaSP);
            pst.setDouble(4, Double.parseDouble(priceSmall));
            pst.setDouble(5, Double.parseDouble(priceMedium));
            pst.setDouble(6, Double.parseDouble(priceLarge));
            pst.setString(7, loaiSP);
            pst.setString(8, img);
            pst.executeUpdate();
            response.sendRedirect("Project%20Final/sys/admin-pizza.jsp");
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}

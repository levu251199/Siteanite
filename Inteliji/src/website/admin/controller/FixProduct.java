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

@WebServlet("/FixProduct")
public class FixProduct extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String maSP = request.getParameter("id");
        String tenSP = request.getParameter("name");
        String motaSP = request.getParameter("desc");
        String priceS = request.getParameter("priceS");
        String priceM = request.getParameter("priceM");
        String priceL = request.getParameter("priceL");
        String loaiSP = request.getParameter("kind");
        String img = request.getParameter("image");

        try {
            String sql = "UPDATE sanphamchinh SET tensanpham=?, motasanpham=?, gianho=?, giavua=?, gialon=?, loaisanpham=?, img=? WHERE masanpham=?";
            PreparedStatement pst = ConnectionDB.getConnection().prepareStatement(sql);
            pst.setString(1, tenSP);
            pst.setString(2, motaSP);
            pst.setDouble(3, Double.parseDouble(priceS));
            pst.setDouble(4, Double.parseDouble(priceM));
            pst.setDouble(5, Double.parseDouble(priceL));
            pst.setString(6, loaiSP);
            pst.setString(7, img);
            pst.setString(8, maSP);
            pst.executeUpdate();
            response.sendRedirect("Project%20Final/sys/admin-pizza.jsp");
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}

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

@WebServlet("/AddSmallProduct")
public class AddSmallProduct extends HttpServlet {
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
        String price = request.getParameter("price-pro");
        String loaiSP = request.getParameter("kind-pro");
        String img = request.getParameter("img-pro");

        try {
            String sql = "INSERT INTO sanphamphu (masanpham,tensanpham,motasanpham,giasanpham,loai,img) VALUES (?,?,?,?,?,?)";
            PreparedStatement pst = ConnectionDB.getConnection().prepareStatement(sql);
            pst.setString(1, maSP);
            pst.setString(2, tenSP);
            pst.setString(3, motaSP);
            pst.setDouble(4, Double.parseDouble(price));
            pst.setString(5, loaiSP);
            pst.setString(6, img);
            pst.executeUpdate();
            response.sendRedirect("Project%20Final/sys/admin-small-product.jsp");
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}

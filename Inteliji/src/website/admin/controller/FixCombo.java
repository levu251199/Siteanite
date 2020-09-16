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

@WebServlet("/FixCombo")
public class FixCombo extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String id = request.getParameter("id-combo");
        String name = request.getParameter("name-combo");
        String des = request.getParameter("desc-combo");
        String price = request.getParameter("price-combo");
        String img = request.getParameter("img-combo");

        try {
            String sql = "UPDATE combo SET tensanpham=?, motasanpham=?, giasanpham=?, img=? WHERE masanpham=?";
            PreparedStatement pst = ConnectionDB.getConnection().prepareStatement(sql);
            pst.setString(1, name);
            pst.setString(2, des);
            pst.setString(3, price);
            pst.setString(4, img);
            pst.setString(5, id);
            pst.executeUpdate();
            response.sendRedirect("Project%20Final/sys/admin-combo.jsp");
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}

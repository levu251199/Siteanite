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

@WebServlet("/AddCombo")
public class AddCombo extends HttpServlet {
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
            String sql = "INSERT INTO combo (masanpham,tensanpham,motasanpham,giasanpham,img) VALUES (?,?,?,?,?)";
            PreparedStatement pst = ConnectionDB.getConnection().prepareStatement(sql);
            pst.setString(1, id);
            pst.setString(2, name);
            pst.setString(3, des);
            pst.setDouble(4, Double.parseDouble(price));
            pst.setString(5, img);
            pst.executeUpdate();
            response.sendRedirect("Project%20Final/sys/admin-combo.jsp");
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}

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

@WebServlet("/FixUser")
public class FixUser extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String email = request.getParameter("email");
        String role = request.getParameter("role");
        String lastName = request.getParameter("last-name");
        String firstName = request.getParameter("first-name");
        String birth = request.getParameter("birth");
        String gender = request.getParameter("gender");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");

        try {
            String sql = "UPDATE account SET role=?, last_name=?, first_name=?, date_of_birth=?, gender=?, phone=?, address=? WHERE email=?";
            PreparedStatement pst = ConnectionDB.getConnection().prepareStatement(sql);
            pst.setString(1, role);
            pst.setString(2, lastName);
            pst.setString(3, firstName);
            pst.setString(4, birth);
            pst.setString(5, gender);
            pst.setString(6, phone);
            pst.setString(7, address);
            pst.setString(8, email);
            pst.executeUpdate();
            response.sendRedirect("Project%20Final/sys/admin-user.jsp");
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}

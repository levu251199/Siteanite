package website.controller;

import Libs.ConnectionDB;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/FixAccount")
public class FixAccount extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String email = request.getParameter("email");
        String pass = request.getParameter("pass");
        String lastName = request.getParameter("last-name");
        String firstName = request.getParameter("first-name");
        String birth = request.getParameter("birth");
        String gender = request.getParameter("gender");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");

        try {
            String sql = "UPDATE account SET last_name=?, first_name=?, date_of_birth=?, gender=?, phone=?, address=?, pass=? WHERE email=?";
            PreparedStatement pst = ConnectionDB.getConnection().prepareStatement(sql);
            pst.setString(1, lastName);
            pst.setString(2, firstName);
            pst.setString(3, birth);
            pst.setString(4, gender);
            pst.setString(5, phone);
            pst.setString(6, address);
            pst.setString(7, pass);
            pst.setString(8, email);
            pst.executeUpdate();
            response.sendRedirect("Project%20Final/sys/index.jsp");
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}

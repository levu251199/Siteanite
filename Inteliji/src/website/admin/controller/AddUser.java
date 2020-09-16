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

@WebServlet("/AddUser")
public class AddUser extends HttpServlet {
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
        String role = request.getParameter("role");

        try {
            String sql = "INSERT INTO account (email,pass,last_name,first_name,date_of_birth,gender,phone,address,role) VALUES (?,?,?,?,?,?,?,?,?)";
            PreparedStatement pst = ConnectionDB.getConnection().prepareStatement(sql);
            pst.setString(1, email);
            pst.setString(2, pass);
            pst.setString(3, lastName);
            pst.setString(4, firstName);
            pst.setString(5, birth);
            pst.setString(6, gender);
            pst.setString(7, phone);
            pst.setString(8, address);
            pst.setString(9, role);
            pst.executeUpdate();
            response.sendRedirect("Project%20Final/sys/admin-user.jsp");
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}

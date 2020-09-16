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

@WebServlet("/FixEmployee")
public class FixEmployee extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String fullName = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String birth = request.getParameter("birth");
        String gender = request.getParameter("gender");
        String salary = request.getParameter("salary");

        try {
            String sql = "UPDATE nhanvien SET fullname=?, phone=?, date_of_birth=?, gender=?, salary=? WHERE email=?";
            PreparedStatement pst = ConnectionDB.getConnection().prepareStatement(sql);
            pst.setString(1, fullName);
            pst.setString(2, phone);
            pst.setString(3, birth);
            pst.setString(4, gender);
            pst.setDouble(5, Double.parseDouble(salary));
            pst.setString(6, email);
            pst.executeUpdate();
            response.sendRedirect("Project%20Final/sys/admin-employee.jsp");
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}

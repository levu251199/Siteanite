package website.admin.controller;

import Libs.ConnectionDB;
import website.admin.dao.EmployeeDAO;
import website.admin.model.Employee;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/Project%20Final/sys/EmployeeController")
public class EmployeeController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");
        String emp = request.getParameter("employee");
        String id = request.getParameter("id");
//        String fullName = request.getParameter("name");
//        String email = request.getParameter("email");
//        String phone = request.getParameter("phone");
//        String birth = request.getParameter("birth");
//        String gender = request.getParameter("gender");
//        String salary = request.getParameter("salary");

        if(action.equals("fix")){
            try{
                Employee employee = EmployeeDAO.selectByID(emp);
                request.setAttribute("employee",employee);
                request.getRequestDispatcher("/Project%20Final/sys/admin-employee-fix.jsp").forward(request,response);
            }catch (SQLException e){
                e.printStackTrace();
            }
//        } else if(action.equals("add")){
//            try {
//                String sql = "INSERT INTO nhanvien (email,fullname,phone,date_of_birth,gender,salary) VALUES (?,?,?,?,?,?)";
//                PreparedStatement pst = ConnectionDB.getConnection().prepareStatement(sql);
//                pst.setString(1, email);
//                pst.setString(2, fullName);
//                pst.setString(3, phone);
//                pst.setString(4, birth);
//                pst.setString(5, gender);
//                pst.setDouble(6, Double.parseDouble(salary));
//                pst.executeUpdate();
//                request.getRequestDispatcher("/Project%20Final/sys/admin-employee.jsp").forward(request,response);
//            } catch (SQLException | ClassNotFoundException e) {
//                e.printStackTrace();
//            }
        }else if(action.equals("delete")){
            try{
                String sql = "DELETE FROM nhanvien WHERE email=?";
                PreparedStatement pst = ConnectionDB.getConnection().prepareStatement(sql);
                pst.setString(1, id);
                pst.executeUpdate();
                request.getRequestDispatcher("/Project%20Final/sys/admin-employee.jsp").forward(request,response);
            } catch (SQLException | ClassNotFoundException e){
                e.printStackTrace();
            }
        }

    }
}

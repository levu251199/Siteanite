package website.admin.controller;

import Libs.ConnectionDB;
import website.admin.dao.ComboDAO;
import website.admin.model.Combo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/Project%20Final/sys/ComboController")
public class ComboController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String mcb = request.getParameter("mcb");
        String action = request.getParameter("action");
        String id = request.getParameter("id");

        if(action.equals("fix")){
            try{
                Combo cb = ComboDAO.selectByID(mcb);
                request.setAttribute("combo",cb);
                request.getRequestDispatcher("/Project%20Final/sys/admin-combo-fix.jsp").forward(request,response);
            }catch (SQLException e){
                e.printStackTrace();
            }
        } else if(action.equals("delete")){
            try{
                String sql = "DELETE FROM combo WHERE masanpham=?";
                PreparedStatement pst = ConnectionDB.getConnection().prepareStatement(sql);
                pst.setString(1, id);
                pst.executeUpdate();
                request.getRequestDispatcher("/Project%20Final/sys/admin-combo.jsp").forward(request,response);
            } catch (SQLException | ClassNotFoundException e){
                e.printStackTrace();
            }
        }

    }
}

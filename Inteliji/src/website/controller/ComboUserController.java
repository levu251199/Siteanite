package website.controller;

import website.dao.ComboUserDAO;
import website.model.ComboUser;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/ComboUserController")
public class ComboUserController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String mcb = request.getParameter("mcb");
        try{
            ComboUser cb = ComboUserDAO.selectByID(mcb);
            request.setAttribute("combo",cb);
            request.getRequestDispatcher("/Project%20Final/sys/combo.jsp").forward(request,response);
        }catch (SQLException e){
            e.printStackTrace();
        }
    }
}

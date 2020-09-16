package website.controller;

import website.dao.AccountDAO;
import website.model.Account;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/Project%20Final/sys/ManageAccount")
public class ManageAccount extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String user = request.getParameter("account");

        try{
            Account u = AccountDAO.selectByID(user);
            request.setAttribute("account",u);
            request.getRequestDispatcher("/Project%20Final/sys/manage-account.jsp").forward(request,response);
        }catch (SQLException e){
            e.printStackTrace();
        }
    }
}

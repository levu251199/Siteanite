package website.controller;

import Libs.Utils;
import website.dao.LoginDAO;
import website.model.Account;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/Project%20Final/sys/CartLogin")
public class CartLogin extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String email = request.getParameter("email");
        String pass = request.getParameter("pass");
        String action = request.getParameter("action");
        Account account;
        if (action.equals("login")) {
            if ((account = LoginDAO.checkLogin(email, pass)) != null) {
                System.out.println(account.getEmail());
                HttpSession ss = request.getSession();
                ss.setAttribute("account", account);
                response.sendRedirect(Utils.fullPath("Project%20Final/sys/cart.jsp"));
                System.out.println("ok");
            } else {
                String err = "Sai thông tin đăng nhập";
                request.setAttribute("err", err);
                request.getRequestDispatcher("cart.jsp").forward(request,response);
            }
        } else if (action.equals("logout")) {
            HttpSession ss = request.getSession();
            ss.removeAttribute("account");
            response.sendRedirect(Utils.fullPath("Project%20Final/sys/index.jsp"));
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        doPost(request, response);
    }
}

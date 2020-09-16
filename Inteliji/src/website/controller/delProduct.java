package website.controller;

import Libs.Utils;
import website.model.Cart;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/del")
public class delProduct extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

            HttpSession session = request.getSession();
            String id = request.getParameter("id");
            Cart c = (Cart) session.getAttribute("cart");
            if (c != null){
                for (int i = 0; i < c.getListPro().size(); i++) {
                    if (c.getListPro().get(i).getId().equals(id)) {
                        c.getListPro().remove(i);
                        System.out.println("ok");
                        break;
                    }
                }
                session.setAttribute("Cart", c);
                response.sendRedirect(Utils.fullPath("Project%20Final/sys/cart.jsp"));
            }

    }

}

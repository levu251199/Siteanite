package website.controller;

import Libs.Utils;
import website.model.Cart;
import website.model.Product;
import website.model.ProductUser;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

import java.util.*;

@WebServlet("/AddToCart")
public class AddToCart extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String table = request.getParameter("table");
        String id = request.getParameter("id");
        String size = request.getParameter("size");
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        int soluong = 1;
        Product pr = Product.findProduct(table, id, size);
        if (pr != null) {
            if (request.getParameter("soluong") != null) {
                soluong = Integer.parseInt(request.getParameter("soluong"));
            }
            if (cart == null) {
                cart = new Cart();
                cart.setId(pr.getId());
                List<Product> productList = new ArrayList<>();
                pr.setAmount(soluong);
                productList.add(pr);
                cart.setListPro(productList);
                session.setAttribute("cart", cart);
            } else {
                boolean exits = false;
                List<Product> productList = cart.getListPro();
                for (int i = 0; i < productList.size(); i++) {
                    if (productList.get(i).getId().equals(pr.getId())) {
                        int amount = productList.get(i).getAmount();
                        if (soluong == 1) {
                            productList.get(i).setAmount(amount + 1);
                        } else {
                            productList.get(i).setAmount(soluong);
                        }
                        cart.setListPro(productList);
                        exits = true;
                    }
                }
                if (exits == false) {
                    pr.setAmount(soluong);
                    cart.setId(pr.getId());
                    productList.add(pr);
                    cart.setListPro(productList);
                }
                session.setAttribute("cart", cart);
            }
        } else {
            response.getWriter().println("SP khong ton tai");
        }
        response.sendRedirect(Utils.fullPath("Project%20Final/sys/cart.jsp"));


    }
}

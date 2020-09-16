package website.controller;

import Libs.ConnectionDB;
import Libs.Utils;
import website.model.Cart;
import website.model.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet("/createCart")
public class createCart extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String madonhang = request.getParameter("madonhang");
        HttpSession session = request.getSession();
        Cart c = (Cart) session.getAttribute("cart");
        PreparedStatement pst = null;
        String sql;
        try {
            if (c != null) {
                System.out.println(c.getListPro().size());
                for (Product i : c.getListPro()) {
                    String tensanpham = i.getName();
                    double giasanpham = i.getPrice();
                    int soluong = i.getAmount();
                    double thanhtien = soluong * giasanpham;

                    sql = "Insert into donhangsanpham(madonhang,tensanpham,giasanpham,soluong,thanhtien) values(?,?,?,?,?)";
                    pst = ConnectionDB.getConnection().prepareStatement(sql);
                    pst.setString(1, madonhang);
                    pst.setString(2, tensanpham);
                    pst.setDouble(3, giasanpham);
                    pst.setInt(4, soluong);
                    pst.setDouble(5, thanhtien);
                    pst.executeUpdate();
                }
                c.setListPro(new ArrayList<>());
                session.setAttribute("cart", c);
                response.sendRedirect(Utils.fullPath("Project%20Final/sys/index.jsp"));
            } else {
                c = new Cart();
                session.setAttribute("cart", c);
                response.sendRedirect(Utils.fullPath("Project%20Final/sys/cart.jsp"));

            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}


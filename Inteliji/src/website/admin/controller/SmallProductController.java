package website.admin.controller;

import Libs.ConnectionDB;
import website.admin.dao.SmallProductsDAO;
import website.admin.model.SmallProducts;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/Project%20Final/sys/SmallProductsController")
public class SmallProductController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String msp = request.getParameter("msp");
        String id = request.getParameter("id");
//        String maSP = request.getParameter("id-pro");
//        String tenSP = request.getParameter("name-pro");
//        String motaSP = request.getParameter("desc-pro");
//        String price = request.getParameter("price-pro");
//        String loaiSP = request.getParameter("kind-pro");
//        String img = request.getParameter("img-pro");
        String action = request.getParameter("action");

        if (action.equals("fix")) {
            try {
                SmallProducts sp = SmallProductsDAO.selectByID(msp);
                request.setAttribute("sanpham", sp);
                request.getRequestDispatcher("/Project%20Final/sys/admin-small-product-fix.jsp").forward(request, response);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } else if (action.equals("delete")) {
            try {
                String sql = "DELETE FROM sanphamphu WHERE masanpham=?";
                PreparedStatement pst = ConnectionDB.getConnection().prepareStatement(sql);
                pst.setString(1, id);
                pst.executeUpdate();
                request.getRequestDispatcher("/Project%20Final/sys/admin-small-product.jsp").forward(request, response);
            } catch (SQLException | ClassNotFoundException e) {
                e.printStackTrace();
            }
//        } else {
//            try {
//                String sql = "INSERT INTO sanphamphu (masanpham,tensanpham,motasanpham,giasanpham,loai,img) VALUES (?,?,?,?,?,?)";
//                PreparedStatement pst = ConnectionDB.getConnection().prepareStatement(sql);
//                pst.setString(1, maSP);
//                pst.setString(2, tenSP);
//                pst.setString(3, motaSP);
//                pst.setDouble(4, Double.parseDouble(price));
//                pst.setString(5, loaiSP);
//                pst.setString(6, img);
//                pst.executeUpdate();
//                request.getRequestDispatcher("/Project%20Final/sys/admin-pizza.jsp").forward(request, response);
//            } catch (SQLException | ClassNotFoundException e) {
//                e.printStackTrace();
//            }
        }

    }
}

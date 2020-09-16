package website.admin.controller;

import Libs.ConnectionDB;
import website.admin.dao.ProductsDAO;
import website.admin.model.ProductMain;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/Project%20Final/sys/ProductsController")
public class ProductsController extends HttpServlet {
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
//        String priceSmall = request.getParameter("price-small");
//        String priceMedium = request.getParameter("price-medium");
//        String priceLarge = request.getParameter("price-large");
//        String loaiSP = request.getParameter("type");
//        String img = request.getParameter("img");
        String action = request.getParameter("action");

        if(action.equals("fix")){
            try{
                ProductMain sp = ProductsDAO.selectByID(msp);
                request.setAttribute("sanpham",sp);
                request.getRequestDispatcher("/Project%20Final/sys/admin-pizza-fix.jsp").forward(request,response);
            }catch (SQLException e){
                e.printStackTrace();
            }
//        } else if(action.equals("add")){
//            try {
//                String sql = "INSERT INTO sanphamchinh (masanpham,tensanpham,motasanpham,gianho,giavua,gialon,loaisanpham,img) VALUES (?,?,?,?,?,?,?,?)";
//                PreparedStatement pst = ConnectionDB.getConnection().prepareStatement(sql);
//                pst.setString(1, maSP);
//                pst.setString(2, tenSP);
//                pst.setString(3, motaSP);
//                pst.setDouble(4, Double.parseDouble(priceSmall));
//                pst.setDouble(5, Double.parseDouble(priceMedium));
//                pst.setDouble(6, Double.parseDouble(priceLarge));
//                pst.setString(7, loaiSP);
//                pst.setString(8, img);
//                pst.executeUpdate();
//                request.getRequestDispatcher("/Project%20Final/sys/admin-pizza.jsp").forward(request,response);
//            } catch (SQLException | ClassNotFoundException e) {
//                e.printStackTrace();
//            }
        } else if(action.equals("delete")){
            try{
                String sql = "DELETE FROM sanphamchinh WHERE masanpham=?";
                PreparedStatement pst = ConnectionDB.getConnection().prepareStatement(sql);
                pst.setString(1, id);
                pst.executeUpdate();
                request.getRequestDispatcher("/Project%20Final/sys/admin-pizza.jsp").forward(request,response);
            } catch (SQLException | ClassNotFoundException e){
                e.printStackTrace();
            }
        }

    }
}

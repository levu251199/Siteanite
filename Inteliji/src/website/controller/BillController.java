package website.controller;

import Libs.ConnectionDB;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/Project%20Final/sys/BillController")
public class BillController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");
        String id = request.getParameter("id");

        if(action.equals("delete")){
            try{
                String sql = "DELETE FROM bill WHERE id=?";
                PreparedStatement pst = ConnectionDB.getConnection().prepareStatement(sql);
                pst.setString(1, id);
                pst.executeUpdate();
                request.getRequestDispatcher("/Project%20Final/sys/bill.jsp").forward(request,response);
            } catch (SQLException | ClassNotFoundException e){
                e.printStackTrace();
            }
        } else if(action.equals("bill")) {
            try {
                String sql =    "INSERT INTO bill (id, nameUser, phone, address, nameProduct, amount, price, total)\n" +
                        "SELECT cartuser.madonhang, cartuser.tenkhachhang, cartuser.phone, cartuser.address, donhangsanpham.tensanpham, donhangsanpham.soluong, donhangsanpham.giasanpham, donhangsanpham.thanhtien\n" +
                        "FROM cartuser\n" +
                        "LEFT JOIN donhangsanpham ON cartuser.madonhang = donhangsanpham.madonhang;";
                PreparedStatement pst = ConnectionDB.getConnection().prepareStatement(sql);
                pst.executeUpdate();
                response.sendRedirect("bill.jsp");
            } catch (SQLException | ClassNotFoundException e) {
                e.printStackTrace();
            }
        }
    }
}

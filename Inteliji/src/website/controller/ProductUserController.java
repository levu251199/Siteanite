package website.controller;

import Libs.ConnectionDB;
import Libs.Utils;
import website.dao.ProductUserDAO;
import website.model.ComboUser;
import website.model.ProductUser;
import website.model.SmallProductUser;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/ProductUserController")
public class ProductUserController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String table = request.getParameter("table");
        String type = request.getParameter("type");
        if (type != null) {
            if (type.equals("kv")) {
                type = "Khai vị";
            } else if (type.equals("nc")) {
                type = "Nước";
            } else if (type.equals("mi")){
                type = "Mì và Cơm";
            }
        }
        int page;
        if (request.getParameter("page") == null) {
            page = 1;
        } else {
            try {
                page = Integer.parseInt(request.getParameter("page"));
                if (page < 0) {
                    page = 1;
                }
            } catch (NumberFormatException e) {
                page = 1;
            }
        }
        PreparedStatement pst;
        ResultSet rs;
        String sql;
        int totalProduct = ProductUserDAO.totalProduct(table, "masanpham", type);
        int pageC = (int) totalProduct / 6;
        int modu = totalProduct % 6;
        if (modu > 1) {
            pageC++;
        }
        try {
            if (type != null) {
                sql = "select * from " + table + " where loai=? limit ?,6";
            } else {
                sql = "select * from " + table + " limit ?,6";
            }
            pst = ConnectionDB.getConnection().prepareStatement(sql);
            if (type != null) {
                pst.setString(1, type);
                pst.setInt(2, (page - 1) * 6);
            } else {
                pst.setInt(1, (page - 1) * 6);
            }
            rs = pst.executeQuery();
            if (type != null) {
                List<SmallProductUser> listPr = new ArrayList<>();
                SmallProductUser pr;
                while (rs.next()) {
                    pr = new SmallProductUser();
                    pr.setId(rs.getString("masanpham"));
                    pr.setName(rs.getString("tensanpham"));
                    pr.setDes(rs.getString("motasanpham"));
                    pr.setPrice(rs.getDouble("giasanpham"));
                    pr.setKind(rs.getString("loai"));
                    pr.setImg(rs.getString("img"));
                    listPr.add(pr);
                }
                request.setAttribute("totalPage", pageC);
                request.setAttribute("listPr", listPr);
                if(type.equals("Nước")){
                    request.getRequestDispatcher("Project%20Final/sys/drink.jsp").forward(request, response);
                }else if(type.equals("Khai vị")){
                    request.getRequestDispatcher("Project%20Final/sys/appetizer.jsp").forward(request, response);
                }else if(type.equals("Mì và Cơm")){
                    request.getRequestDispatcher("Project%20Final/sys/spaghetti-rice.jsp").forward(request, response);
                }
            } else if(table.equals("sanphamchinh")){
                List<ProductUser> listPr = new ArrayList<>();
                ProductUser pr;
                while (rs.next()) {
                    pr = new ProductUser();
                    pr.setMaSanPham(rs.getString("masanpham"));
                    pr.setTenSanPham(rs.getString("tensanpham"));
                    pr.setMoTaSanPham(rs.getString("motasanpham"));
                    pr.setGiaLon(rs.getDouble("gialon"));
                    pr.setGiaVua(rs.getDouble("giavua"));
                    pr.setGiaNho(rs.getDouble("gianho"));
                    pr.setLoaiSanPham(rs.getString("loaisanpham"));
                    pr.setImg(rs.getString("img"));
                    listPr.add(pr);
                }
                request.setAttribute("totalPage", pageC);
                request.setAttribute("listPr", listPr);
                request.getRequestDispatcher("Project%20Final/sys/pizza.jsp").forward(request, response);
            } else if(table.equals("combo")){
                List<ComboUser> listCB = new ArrayList<>();
                ComboUser cb;
                while (rs.next()) {
                    cb = new ComboUser();
                    cb.setMaCombo(rs.getString("masanpham"));
                    cb.setTenCombo(rs.getString("tensanpham"));
                    cb.setMotaCombo(rs.getString("motasanpham"));
                    cb.setGiaCombo(rs.getDouble("giasanpham"));
                    cb.setImg(rs.getString("img"));
                    listCB.add(cb);
                }
                request.setAttribute("totalPage", pageC);
                request.setAttribute("listPr", listCB);
                request.getRequestDispatcher("Project%20Final/sys/combo.jsp").forward(request, response);
            }

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}



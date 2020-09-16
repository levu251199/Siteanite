<%@ page import="Libs.Utils" %>
<%@ page import="website.model.Account" %>
<%@ page import="website.model.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="website.model.Bill" %>
<%@ page import="website.dao.BillDAO" %>
<%@ page import="java.sql.SQLException" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <meta charset="UTF-8">
    <title>Đơn hàng của bạn</title>
    <link rel="stylesheet" href="<%=Utils.fullPathLibs("css/main-style.css")%>">
    <link rel="stylesheet" href="<%=Utils.fullPathLibs("css/order.css")%>">
    <link rel="stylesheet" href="<%=Utils.fullPathLibs("css/cart.css")%>">
    <script src="<%=Utils.fullPathLibs("js/order.js")%>"></script>
    <%--    --%>
    <link rel="stylesheet" href="<%=Utils.fullPathLibs("lib/fontawesome/css/all.min.css")%>">
    <link rel="stylesheet" href="<%=Utils.fullPathLibs("lib/aos-master/dist/aos.css")%>">
    <link rel="stylesheet" href="<%=Utils.fullPathLibs("lib/bootstrap-4.3.1-dist/css/bootstrap.min.css")%>">
    <script src="<%=Utils.fullPathLibs("lib/aos-master/dist/aos.js")%>"></script>
    <script src="<%=Utils.fullPathLibs("lib/bootstrap-4.3.1-dist/js/bootstrap.min.js")%>"></script>
    <%--    <script src="../lib/jquery/jquery.min.js"></script>--%>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<%-- HEADER --%>
<jsp:include page="../include-files/header-user.jsp"></jsp:include>

<%----%>
<%Account acc = (Account) request.getSession().getAttribute("account");%>
<%
    List<Bill> bill = null;
    try {
        bill = BillDAO.loadBill();
    } catch (SQLException e) {
        e.printStackTrace();
    }
    assert bill != null;
%>
<div class="container" style="width: 90%">
    <div class="row">
        <div class="col">
            <div style="color: #16d373; font-weight: bold;" class="title-bill">SẢN PHẨM CỦA BẠN</div>
            <%for (int i = 0; i < bill.size(); i++) {%>
            <div style="color: antiquewhite; margin: 10px; font-weight: bold;">
                Tên sản phẩm: <%=bill.get(i).getNameProduct()%><br>
                Số lượng: <%=bill.get(i).getAmount()%><br>
                Giá: <%=bill.get(i).getPrice() + " vnđ"%><br>
                <div style="color: brown">---------------------------------------------------</div>
            </div>
            <%}%>
        </div>

        <div class="col">
            <div class="info row">
                <div style="color: #16d373; font-weight: bold;" class="title-bill">THÔNG TIN CỦA BẠN</div>
                <div style="color: antiquewhite; margin: 10px; font-weight: bold;">
                    Tên:<%=" " + acc.getFirst_name() + " " + acc.getLast_name()%><br><br>
                    Số điện thoại:<%=" " + acc.getNumberPhone()%><br><br>
                    Địa chỉ:<%=" " + acc.getAddress()%>
                </div>
            </div>

            <div class="info row">
                <div style="color: #16d373; font-weight: bold;" class="title-bill">TRẠNG THÁI ĐƠN HÀNG</div>
                <div style="color: antiquewhite; margin: 10px; font-weight: bold;">
                    Phí vận chuyển: Miễn phí.<br><br>
                    Cam kết giao hàng trong vòng 2 tiếng!<br><br>
                    Đường dây nóng liên hệ: 1900 1822
                    <div style="font-size: 17px; color: brown; margin-top: 10px">Tổng thanh toán: <%=BillDAO.totalPrice() + "đ"%>
                    </div>
                    <a href="<%=Utils.fullPath("Project%20Final/sys/BillController")%>?action=delete&id=<%=acc.getNumberPhone()%>">
                        <button onclick="confirm()" class="del-btn"> Huỷ đơn hàng</button>
                    </a>
                    <script>
                        function confirm() {
                            alert("Huỷ đơn hàng thành công!");
                        }
                    </script>
                </div>
            </div>
        </div>
    </div>
</div>

<%-- FOOTER --%>
<jsp:include page="../include-files/footer-user.jsp"></jsp:include>
<script>AOS.init();</script>
</body>
</html>
<%@ page import="java.util.List" %>
<%@ page import="website.model.Address" %>
<%@ page import="website.dao.AddressDAO" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="Libs.Utils" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <meta charset="UTF-8">
    <title>MienTrung</title>
    <link rel="stylesheet" href="<%=Utils.fullPathLibs("css/location.css")%>">
    <link rel="stylesheet" href="<%=Utils.fullPathLibs("css/order.css")%>">
    <script src="<%=Utils.fullPathLibs("js/order.js")%>"></script>
    <%--    --%>
    <link rel="stylesheet" href="<%=Utils.fullPathLibs("lib/fontawesome-free-5.11.1-web/css/all.min.css")%>">
    <link rel="stylesheet" href="<%=Utils.fullPathLibs("lib/bootstrap-4.3.1-dist/css/bootstrap.min.css")%>">
    <link rel="stylesheet" href="<%=Utils.fullPathLibs("lib/fontawesome/css/all.min.css")%>">
    <link rel="stylesheet" href="<%=Utils.fullPathLibs("lib/aos-master/dist/aos.css")%>">
    <script src="<%=Utils.fullPathLibs("lib/bootstrap-4.3.1-dist/js/bootstrap.min.js")%>"></script>
    <script src="<%=Utils.fullPathLibs("lib/aos-master/dist/aos.js")%>"></script>
</head>
<body>
<%-- HEADER --%>
<jsp:include page="../include-files/header-user.jsp"></jsp:include>

<!--list store localtor-->
<div class="container" id="address">
    <p>
        <span style="font-size: large; color: #fdd75f;">Địa Chỉ Nhà Hàng</span>
    </p>
    <div class="store_district"
         style="font-size: 17px; color: #d5a372; padding-bottom: 10px; font-weight: bold; border-bottom: 2px solid rebeccapurple">
        Miền Trung - Nha Trang
    </div>
    <%
        List<Address> listNhaTrang = null;
        try {
            listNhaTrang = AddressDAO.mienTrungNhaTrang();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        assert listNhaTrang != null;
    %>
    <%for (Address address : listNhaTrang) {%>
    <div class="store" data-aos="fade-right">
        <div class="store_address"><%=address.getShopName()%>
            <div>&nbsp;
            </div>
            <div><%=address.getAddress()%>
            </div>
        </div>
        <div class="store_to">
            <div class="store_to">Số Điện Thoại: <%=address.getPhone()%>
            </div>
            <div class="store_to">&nbsp;</div>
            <div class="store_item">
                <table>
                    <tbody>
                    <tr>
                        <td><img src="../img/manghangve.PNG" alt="" align="absMiddle" border="0" width="25px"
                                 height="25px">&nbsp;Dịch vụ Mua mang về
                        </td>
                        <td>&nbsp;&nbsp;<img src="../img/giaohathang.PNG" alt="" align="absMiddle" border="0"
                                             width="30px" height="30px">&nbsp;&nbsp;Dịch vụ Giao hàng tận nơi
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <%}%>
</div>

<%-- FOOTER --%>
<jsp:include page="../include-files/footer-user.jsp"></jsp:include>
<script>AOS.init();</script>
</body>
</html>
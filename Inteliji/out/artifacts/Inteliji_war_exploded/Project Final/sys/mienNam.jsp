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
    <title>MienNam</title>
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

<div class="container" id="address">
    <p>
        <span style="font-size: large; color: #fdd75f;">Địa Chỉ Nhà Hàng</span>
    </p>
    <div class="store_district"
         style="font-size: 17px; color: #d5a372; padding-bottom: 10px; font-weight: bold; border-bottom: 2px solid rebeccapurple">
        Miền Nam - Hồ Chí Minh
    </div>

    <%
        List<Address> listHCM = null;
        try {
            listHCM = AddressDAO.mienNamHCM();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        assert listHCM != null;
    %>
    <%for (Address addressHCM : listHCM) {%>
    <div class="store" data-aos="fade-right">
        <div class="store_address"><%=addressHCM.getShopName()%>
            <div>&nbsp;
            </div>
            <div><%=addressHCM.getAddress()%>
            </div>
        </div>
        <div class="store_to">
            <div class="store_to">Số Điện Thoại: <%=addressHCM.getPhone()%></div>
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

    <!-- 2-->
    <div class="store_district"
         style="font-size: 17px; color: #d5a372; padding-bottom: 10px; font-weight: bold; border-bottom: 2px solid rebeccapurple">
        Miền Nam - Thành Phố Biên Hòa
    </div>
    <%List<Address> listBienHoa = AddressDAO.mienNamBienHoa(); assert listBienHoa != null;%>
    <%for(Address address:listBienHoa){%>
    <div class="store" data-aos="fade-right">
        <div class="store_address"><%=address.getShopName()%>
            <div>&nbsp;
            </div>
            <div><%=address.getAddress()%>
            </div>
        </div>
        <div class="store_to">
            <div class="store_to">Số Điện Thoại: <%=address.getPhone()%></div>
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

    <div class="store_district"
         style="font-size: 17px; color: #d5a372; padding-bottom: 10px; font-weight: bold; border-bottom: 2px solid rebeccapurple">
        Miền Nam - Thành Phố Cà Mau
    </div>
    <%List<Address> listCaMau = AddressDAO.mienNamCaMau(); assert listCaMau != null;%>
    <%for(Address address:listCaMau){%>
    <div class="store" data-aos="fade-right">
        <div class="store_address"><%=address.getShopName()%>
            <div>&nbsp;
            </div>
            <div><%=address.getAddress()%>
            </div>
        </div>
        <div class="store_to">
            <div class="store_to">Số Điện Thoại: <%=address.getPhone()%></div>
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

    <div class="store_district"
         style="font-size: 17px; color: #d5a372; padding-bottom: 10px; font-weight: bold; border-bottom: 2px solid rebeccapurple">
        Miền Nam - Thành Phố Cần Thơ
    </div>
    <%List<Address> listCanTho = AddressDAO.mienNamCanTho(); assert listCanTho != null;%>
    <%for(Address address:listCanTho){%>
    <div class="store" data-aos="fade-right">
        <div class="store_address"><%=address.getShopName()%>
            <div>&nbsp;
            </div>
            <div><%=address.getAddress()%>
            </div>
        </div>
        <div class="store_to">
            <div class="store_to">Số Điện Thoại: <%=address.getPhone()%></div>
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


<script>AOS.init();</script>
<%-- FOOTER --%>
<jsp:include page="../include-files/footer-user.jsp"></jsp:include>
</body>
</html>
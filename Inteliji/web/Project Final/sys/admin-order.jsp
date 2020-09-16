<%@ page import="Libs.Utils" %>
<%@ page import="website.admin.model.CartProduct" %>
<%@ page import="java.util.List" %>
<%@ page import="website.admin.dao.CartProductDAO" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="website.model.Bill" %>
<%@ page import="website.dao.BillDAO" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <meta charset="UTF-8">
    <title>Đơn hàng</title>
    <link rel="stylesheet" href="<%=Utils.fullPathLibs("css/admin.css")%>">
    <link rel="stylesheet" href="<%=Utils.fullPathLibs("css/admin-form.css")%>">
    <script src="<%=Utils.fullPathLibs("js/side-nav.js")%>"></script>
    <%--    --%>
    <link rel="stylesheet" href="<%=Utils.fullPathLibs("lib/bootstrap-4.3.1-dist/css/bootstrap.min.css")%>">
    <link rel="stylesheet" href="<%=Utils.fullPathLibs("lib/fontawesome/css/all.min.css")%>">
    <script src="<%=Utils.fullPathLibs("lib/bootstrap-4.3.1-dist/js/bootstrap.min.js")%>"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/bs4/dt-1.10.20/datatables.min.css"/>
    <script type="text/javascript" src="https://cdn.datatables.net/v/bs4/dt-1.10.20/datatables.min.js"></script>
</head>
<body onload="drop()">
<!--HEADER-->
<jsp:include page="../include-files/header-admin.jsp"></jsp:include>

<%--CONTENT--%>
<div id="content">
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="<%=Utils.fullPathLibs("sys/admin-home.jsp")%>">Trang chủ</a></li>
            <li class="breadcrumb-item active" aria-current="page">Đơn hàng</li>
        </ol>
    </nav>

    <table class="table table-bordered table-hover" id="myTable" width="100%" cellspacing="0">
        <thead class="thead-dark">
        <tr>
            <th>Mã đơn hàng</th>
            <th>Tên người đặt</th>
            <th>Số điện thoại</th>
            <th>Địa chỉ</th>
            <th>Tên sản phẩm</th>
            <th>Giá tiền của sản phẩm (vnđ)</th>
            <th>Số lượng</th>
            <th>Tổng cộng (vnđ)</th>
            <th style="width: 4%">-</th>
        </tr>
        </thead>
        <tbody>
        <%try {%>
        <%
            List<Bill> dscb = BillDAO.loadBill();
            assert dscb != null;
        %>
        <%for (Bill cp : dscb) {%>
        <tr>
            <td><%=cp.getId()%>
            </td>
            <td><%=cp.getNameUser()%>
            </td>
            <td><%=cp.getPhone()%>
            </td>
            <td><%=cp.getAddress()%>
            </td>
            <td><%=cp.getNameProduct()%>
            </td>
            <td><%=cp.getPrice()%>
            </td>
            <td><%=cp.getAmount()%>
            </td>
            <td><%=String.format("%,.0f", cp.getTotal())%>
            </td>
            <td>
                <a href="<%=Utils.fullPath("Project%20Final/sys/CartController")%>?id=<%=cp.getId()%>"><i
                        style="color: crimson" class="fas fa-times"></i></a></td>
        </tr>
        <%}%>
        <%} catch (SQLException e) {%>
        <%}%>
        </tbody>
    </table>
</div>

<script>
    $(document).ready(function(){
        $('#myTable').dataTable();
    });
</script>

</body>
</html>
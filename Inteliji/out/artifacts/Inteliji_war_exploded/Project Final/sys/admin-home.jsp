<%@ page import="Libs.Utils" %>
<%@ page import="java.util.List" %>
<%@ page import="website.admin.model.ProductMain" %>
<%@ page import="website.admin.dao.ProductsDAO" %>
<%@ page import="website.admin.model.SmallProducts" %>
<%@ page import="website.admin.dao.SmallProductsDAO" %>
<%@ page import="website.admin.model.Employee" %>
<%@ page import="website.admin.dao.EmployeeDAO" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <meta charset="UTF-8">
    <title>Home</title>
    <link rel="stylesheet" href="<%=Utils.fullPathLibs("css/admin.css")%>">
    <script src="<%=Utils.fullPathLibs("js/bar-chart.js")%>"></script>
    <script src="<%=Utils.fullPathLibs("js/side-nav.js")%>"></script>
    <!---->
    <link rel="stylesheet" href="<%=Utils.fullPathLibs("lib/fontawesome/css/all.min.css")%>">
    <script src="<%=Utils.fullPathLibs("js/canvasjs.min.js")%>"></script>
    <link rel="stylesheet" href="<%=Utils.fullPathLibs("lib/bootstrap-4.3.1-dist/css/bootstrap.min.css")%>">
    <script src="<%=Utils.fullPathLibs("lib/bootstrap-4.3.1-dist/js/bootstrap.min.js")%>"></script>
    <link rel="stylesheet" href="<%=Utils.fullPathLibs("lib/aos-master/dist/aos.css")%>">
    <script src="<%=Utils.fullPathLibs("lib/aos-master/dist/aos.js")%>"></script>
</head>
<body onload="barchart(); drop()">
<!--HEADER-->
<jsp:include page="../include-files/header-admin.jsp"></jsp:include>

<div id="content">
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item active" aria-current="page">Trang chủ</li>
        </ol>
    </nav>

    <div id="contain" class="row">
        <div class="item col">
            <%List<ProductMain> proOne = ProductsDAO.loadSP(); assert proOne != null;%>
            <%List<SmallProducts> proTwo = SmallProductsDAO.loadSP(); assert  proTwo != null;%>
            <%int size = proOne.size() + proTwo.size();%>
            <i class="fas fa-boxes"></i><br>
            Có <%=size%> loại sản phẩm
        </div>
        <div class="item col">
            <%List<Employee> emp = EmployeeDAO.loadNV(); assert emp != null;%>
            <i class="fas fa-user"></i><br>
            Có tổng cộng <%=emp.size()%> nhân viên
        </div>
        <div class="item col">
            <i class="fas fa-dolly"></i><br>
            Đã bán 201,189 sản phẩm
        </div>
        <div class="item col">
            <i class="fas fa-hand-holding-usd"></i><br>
            Thu về 197 triệu đồng
        </div>
    </div>
    <!-- Bar Chart -->
    <div id="chartContainer" style="height: 300px; width: 100%;"></div>

    <div id="footer">Copyright © Siteanite 2019</div>
</div>
<script>AOS.init();</script>
</body>
</html>
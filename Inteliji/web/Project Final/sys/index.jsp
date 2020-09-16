<%@ page import="Libs.Utils" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <meta charset="UTF-8">
    <title>Siteanite</title>
    <link rel="stylesheet" href="<%=Utils.fullPathLibs("css/main-style.css")%>">
    <link rel="stylesheet" href="<%=Utils.fullPathLibs("css/order.css")%>">
    <script src="<%=Utils.fullPathLibs("js/order.js")%>"></script>
<%----%>
    <link rel="stylesheet" href="<%=Utils.fullPathLibs("lib/fontawesome/css/all.min.css")%>">
    <link rel="stylesheet" href="<%=Utils.fullPathLibs("lib/index-bootstrap-css.css")%>">
    <link rel="stylesheet" href="<%=Utils.fullPathLibs("lib/aos-master/dist/aos.css")%>">
    <script src="<%=Utils.fullPathLibs("lib/index-jquery.js")%>"></script>
    <script src="<%=Utils.fullPathLibs("lib/index-bootstrap.js")%>"></script>
    <script src="<%=Utils.fullPathLibs("lib/aos-master/dist/aos.js")%>"></script>
</head>
<body>
<%-- HEADER --%>
<jsp:include page="../include-files/header-user.jsp"></jsp:include>

<!-- SLIDE -->
<div id="carouselExampleIndicators" class="carousel slide container" data-ride="carousel" style="z-index: -1">
    <ol class="carousel-indicators">
        <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
    </ol>
    <div class="carousel-inner">
        <div class="carousel-item active">
            <img class="d-block w-100" src="<%=Utils.fullPathImg("img/Slider1.jpg")%>" alt="First slide">
        </div>
        <div class="carousel-item">
            <img class="d-block w-100" src="<%=Utils.fullPathImg("img/Slider2.jpg")%>" alt="Second slide">
        </div>
        <div class="carousel-item">
            <img class="d-block w-100" src="<%=Utils.fullPathImg("img/Slider3.jpg")%>" alt="Third slide">
        </div>
        <div class="carousel-item">
            <img class="d-block w-100" src="<%=Utils.fullPathImg("img/Slider4.jpg")%>" alt="Fourth slide">
        </div>
    </div>
    <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
    </a>
</div>
<!-- END SLIDE-->

<!-- CONTENT -->
<div id="banner-wrapper" class="container">
    <div id="banner-nav" class="row align-items-center justify-content-md-center">
        <div id="left-content" class="col" data-aos="fade-left">
            <a href="<%=Utils.fullPath("ProductUserController?table=sanphamchinh")%>"><img src="../img/content1.jpg" alt="" width="100%"></a>
        </div>
        <div id="right-content" class="col" data-aos="fade-right">
            <a href="<%=Utils.fullPath("ProductUserController?table=combo")%>"><img src="../img/content2.jpg" alt="" width="100%"></a>
        </div>
    </div>
    <div class="break">-------------------------------------------------------------------</div>
    <div class="break">***</div>
</div>
<!-- END CONTENT-->

<%-- FOOTER --%>
<jsp:include page="../include-files/footer-user.jsp"></jsp:include>
<script>AOS.init();</script>
</body>
</html>
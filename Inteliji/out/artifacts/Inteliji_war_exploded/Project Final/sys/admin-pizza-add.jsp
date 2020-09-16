<%@ page import="Libs.Utils" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <meta charset="UTF-8">
    <title>Thêm sản phẩm chính</title>
    <link rel="stylesheet" href="<%=Utils.fullPathLibs("css/admin-form.css")%>">
    <link rel="stylesheet" href="<%=Utils.fullPathLibs("lib/bootstrap-4.3.1-dist/css/bootstrap.min.css")%>">
    <link rel="stylesheet" href="<%=Utils.fullPathLibs("lib/fontawesome/css/all.min.css")%>">
    <link rel="stylesheet" href="<%=Utils.fullPathLibs("css/admin.css")%>">
    <link rel="stylesheet" href="<%=Utils.fullPathLibs("lib/aos-master/dist/aos.css")%>">
    <script src="<%=Utils.fullPathLibs("js/side-nav.js")%>"></script>
    <script src="<%=Utils.fullPathLibs("lib/aos-master/dist/aos.js")%>"></script>
</head>
<body onload="drop()">
<!--HEADER-->
<jsp:include page="../include-files/header-admin.jsp"></jsp:include>

<!-- FORM -->
<div id="content" style="margin-top: 20px">
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="<%=Utils.fullPathLibs("sys/admin-home.jsp")%>">Trang chủ</a></li>
            <li class="breadcrumb-item"><a href="<%=Utils.fullPathLibs("sys/admin-pizza.jsp")%>">Sản phẩm chính</a></li>
            <li class="breadcrumb-item active" aria-current="page">Thêm sản phẩm chính</li>
        </ol>
    </nav>

    <form style="float: left; width: 65%" action="<%=Utils.fullPath("AddProduct")%>">
        <div class="section">
            <h4>Thông tin sản phẩm</h4>
            <div class="input-info input-group-icon">
                <input name="id-pro" id="id-pro" type="text" placeholder="Mã số sản phẩm">
                <div class="input-icon"><i class="fa fa-info-circle"></i></div>
            </div>
            <div class="input-info input-group-icon">
                <input name="name-pro" id="name-pro" type="text" placeholder="Tên sản phẩm">
                <div class="input-icon"><i class="fas fa-file-signature"></i></div>
            </div>
            <div class="input-info input-group-icon">
                <input name="desc-pro" id="desc-pro" type="text" placeholder="Mô tả sản phẩm">
                <div class="input-icon"><i class="fa fa-align-center"></i></div>
            </div>
            <div class="input-info input-group-icon">
                <input name="price-small" id="price-small" type="text" placeholder="Giá bánh nhỏ">
                <div class="input-icon"><i class="fas fa-donate"></i></div>
            </div>
            <div class="input-info input-group-icon">
                <input name="price-medium" id="price-medium" type="text" placeholder="Giá bảnh vừa">
                <div class="input-icon"><i class="fas fa-donate"></i></div>
            </div>
            <div class="input-info input-group-icon">
                <input name="price-large" id="price-large" type="text" placeholder="Giá bánh lớn">
                <div class="input-icon"><i class="fas fa-donate"></i></div>
            </div>
            <div class="input-info input-group-icon">
                <input name="type" id="type" type="text" placeholder="Loại đế bánh">
                <div class="input-icon"><i class="fas fa-stroopwafel"></i></div>
            </div>
            <div class="input-info input-group-icon">
                <input name="img" id="img" type="text" placeholder="img/diachianh">
                <div class="input-icon"><i class="fas fa-stroopwafel"></i></div>
            </div>
        </div>
        <div id="add-btn">
            <a href="#">
                <button class="button-form" id="sign-up-button add">Thêm sản phẩm</button>
            </a>
        </div>
    </form>
    <div class="rules" data-aos="fade-left" data-aos-duration="3000">
        <h3>Cách thức nhập liệu:</h3>
        <ul>
            <li>Mã số sản phẩm phải bắt đầu bằng pz</li>
            <li>Tên sản phẩm viết IN HOA</li>
            <li>Mô tả sản phẩm gồm các nguyên liệu của sản phẩm đó</li>
            <li>Giá bánh lớn, vừa và nhỏ đều có mệnh giá là vnđ (Việt Nam Đồng)</li>
            <li>Loại bánh là loại đế bánh của sản phẩm</li>
            <li>Đường dẫn hình ảnh phải luôn có img/ phía trước sau đó là địa chỉ ảnh và phải có đuôi mở rộng (ex: img/pizza/ABC.png)</li>
            <li>Mọi thắc mắc xin liên hệ với đường dây nóng 19006969 hoặc gửi email về địa chỉ levu251199@gmail.com</li>
        </ul>
    </div>
</div>

<script>AOS.init();</script>
</body>
</html>
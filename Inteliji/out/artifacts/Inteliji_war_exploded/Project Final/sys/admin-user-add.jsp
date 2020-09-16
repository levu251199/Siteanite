<%@ page import="Libs.Utils" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Thêm người dùng</title>
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
<div id="content">
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="<%=Utils.fullPathLibs("sys/admin-home.jsp")%>">Trang chủ</a></li>
            <li class="breadcrumb-item"><a href="<%=Utils.fullPathLibs("sys/admin-user.jsp")%>">Người dùng</a></li>
            <li class="breadcrumb-item active" aria-current="page">Thêm người dùng</li>
        </ol>
    </nav>

    <form style="float: left; width: 65%" action="<%=Utils.fullPath("AddUser")%>">
        <div class="section">
            <h4>Quản lý người dùng</h4>
            <div class="input-info input-group-icon">
                <input name="email" id="email" type="email" placeholder="Email">
                <div class="input-icon"><i class="fa fa-envelope"></i></div>
            </div>
            <div class="input-info input-group-icon">
                <input name="pass" id="pass" type="text" placeholder="Pass">
                <div class="input-icon"><i class="fa fa-key"></i></div>
            </div>
            <div class="input-info input-group-icon">
                <input name="last-name" id="last-name" type="text" placeholder="Họ">
                <div class="input-icon"><i class="fa fa-user"></i></div>
            </div>
            <div class="input-info input-group-icon">
                <input name="first-name" id="first-name" type="text" placeholder="Tên">
                <div class="input-icon"><i class="fa fa-user"></i></div>
            </div>
            <div class="input-info input-group-icon">
                <input name="birth" id="birth" type="date" placeholder="Ngày tháng năm sinh">
                <div class="input-icon"><i class="fa fa-calendar"></i></div>
            </div>
            <div class="input-info input-group-icon">
                <input name="gender" id="gender" type="text" placeholder="Giới tính">
                <div class="input-icon"><i class="fa fa-genderless"></i></div>
            </div>
            <div class="input-info input-group-icon">
                <input name="phone" id="phone" type="text" placeholder="Số điện thoại">
                <div class="input-icon"><i class="fas fa-phone"></i></div>
            </div>
            <div class="input-info input-group-icon">
                <input name="address" id="address" type="text" placeholder="Địa chỉ">
                <div class="input-icon"><i class="fas fa-address-card"></i></div>
            </div>
            <div class="input-info input-group-icon">
                <input name="role" id="role" type="text" placeholder="Quyền">
                <div class="input-icon"><i class="fas fa-key"></i></div>
            </div>
        </div>
        <div id="add-btn">
            <a href="#">
                <button class="button-form" id="sign-up-button add">Thêm thông tin người dùng</button>
            </a>
        </div>
    </form>
    <div class="rules" data-aos="fade-left" data-aos-duration="3000">
        <h3>Cách thức nhập liệu:</h3>
        <ul>
            <li>Tên phải viết hoa chữ đầu và phải có dấu</li>
            <li>Email phải đúng format (ex: abc123@gmail.com)</li>
            <li>Số điện thoại gồm 10 chữ số, nếu số nước ngoài liên hệ với phòng nhân sự</li>
            <li>Kiểm tra ngày tháng năm sinh kỹ càng</li>
            <li>Giới tính không phải nam hoặc nữ vui lòng để "Khác"</li>
            <li>Mọi thắc mắc xin liên hệ với đường dây nóng 19006969 hoặc gửi email về địa chỉ levu251199@gmail.com</li>
        </ul>
    </div>
</div>

<script>AOS.init();</script>
</body>
</html>

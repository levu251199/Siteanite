<%@ page import="Libs.Utils" %>
<%@ page import="website.admin.model.Employee" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <meta charset="UTF-8">
    <title>Sửa thông tin nhân viên</title>
    <link rel="stylesheet" href="<%=Utils.fullPathLibs("css/admin-form.css")%>">
    <link rel="stylesheet" href="<%=Utils.fullPathLibs("lib/bootstrap-4.3.1-dist/css/bootstrap.min.css")%>">
    <link rel="stylesheet" href="<%=Utils.fullPathLibs("lib/fontawesome/css/all.min.css")%>">
    <link rel="stylesheet" href="<%=Utils.fullPathLibs("css/admin.css")%>">
    <link rel="stylesheet" href="<%=Utils.fullPathLibs("lib/aos-master/dist/aos.css")%>">
    <script src="<%=Utils.fullPathLibs("js/side-nav.js")%>"></script>
    <script src="<%=Utils.fullPathLibs("lib/aos-master/dist/aos.js")%>"></script>
</head>
<body onload="drop();">
<!--HEADER-->
<jsp:include page="../include-files/header-admin.jsp"></jsp:include>

<!-- FORM -->
<%Employee emp = (Employee) request.getAttribute("employee");%>
<div id="content" style="margin-top: 20px">
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="<%=Utils.fullPathLibs("sys/admin-home.jsp")%>">Trang chủ</a></li>
            <li class="breadcrumb-item"><a href="<%=Utils.fullPathLibs("sys/admin-employee.jsp")%>">Nhân viên</a></li>
            <li class="breadcrumb-item active" aria-current="page">Sửa nhân viên</li>
        </ol>
    </nav>

    <form style="float: left; width: 65%" action="<%=Utils.fullPath("FixEmployee")%>">
    <div class="section">
        <h2>Thông tin nhân viên</h2>
        <div class="input-info input-group-icon">
            <input name="name" id="name" type="text" placeholder="Họ và Tên" value="<%=emp!=null?emp.getFullName():""%>"/>
            <div class="input-icon"><i class="fa fa-user"></i></div>
        </div>
        <div class="input-info input-group-icon">
            <input name="email" id="email" type="email" placeholder="Email" value="<%=emp!=null?emp.getEmail():""%>"/>
            <div class="input-icon"><i class="fa fa-envelope"></i></div>
        </div>
        <div class="input-info input-group-icon">
            <input name="phone" id="phone" type="text" placeholder="Số điện thoại" value="<%=emp!=null?emp.getPhone():""%>"/>
            <div class="input-icon"><i class="fa fa-phone"></i></div>
        </div>
    </div>
    <div class="input-info input-group-icon">
        <input name="birth" id="birth" type="date" placeholder="Ngày sinh" value="<%=emp!=null?emp.getBirth():""%>"/>
        <div class="input-icon"><i class="fa fa-calendar"></i></div>
    </div>
    <div class="input-info input-group-icon">
        <input name="gender" id="gender" type="text" placeholder="Giới tính" value="<%=emp!=null?emp.getGender():""%>"/>
        <div class="input-icon"><i class="fa fa-genderless"></i></div>
    </div>
    <div class="section">
        <div class="input-info input-group-icon">
            <input name="salary" id="salary" type="text" placeholder="Lương" value="<%=emp!=null?emp.getSalary():""%>"/>
            <div class="input-icon"><i class="fa fa-credit-card"></i></div>
        </div>
    </div>
    <div id="add-btn">
        <a href="#">
            <button class="button-form" id="sign-up-button add">Sửa thông tin nhân viên</button>
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
            <li>Lương tính theo đơn vị đô la mỹ ($)</li>
            <li>Mọi thắc mắc xin liên hệ với đường dây nóng 19006969 hoặc gửi email về địa chỉ levu251199@gmail.com</li>
        </ul>
    </div>
</div>

<script>AOS.init();</script>
</body>
</html>
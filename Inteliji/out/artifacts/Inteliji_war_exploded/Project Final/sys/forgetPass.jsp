<%@ page import="Libs.Utils" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <meta charset="UTF-8">
    <title>Quên mật khẩu</title>
    <link rel="stylesheet" href="<%=Utils.fullPathLibs("css/main-style.css")%>">
    <link rel="stylesheet" href="<%=Utils.fullPathLibs("css/order.css")%>">
    <script src="<%=Utils.fullPathLibs("js/order.js")%>"></script>
    <script src="<%=Utils.fullPathLibs("js/input-validate.js")%>"></script>
    <!---->
    <link rel="stylesheet" href="<%=Utils.fullPathLibs("lib/bootstrap-4.3.1-dist/css/bootstrap.min.css")%>">
    <link rel="stylesheet" href="<%=Utils.fullPathLibs("lib/aos-master/dist/aos.css")%>">
    <link rel="stylesheet" href="<%=Utils.fullPathLibs("lib/fontawesome/css/all.min.css")%>">
    <script src="<%=Utils.fullPathLibs("lib/aos-master/dist/aos.js")%>"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body onload="checkEmail()">
<%-- HEADER --%>
<jsp:include page="../include-files/header-user.jsp"></jsp:include>

<!--FORGET PASSWORD-->
<div class="container">
    <div class="text-forget row">
        <span>QUÊN MẬT KHẨU</span>
    </div>
    <div class="row">
        <div class="border-forget col" data-aos="fade-right">
            <div class="text-border-forget">
                <span class="text-border-forget1">VUI LÒNG NHẬP ĐỊA CHỈ EMAIL CỦA BẠN ĐÃ ĐĂNG KÝ VÀ MẬT KHẨU SẼ ĐƯỢC GỬI NGAY TỚI BẠN.</span>
            </div>
            <div class="login-email">
                <span class="text-login-email">Email đã đăng ký:</span>
                <input class="input-login-email" name="email" id="email" type="email" placeholder="Email đã đăng ký">
                <div id="email-validate">
                    <p id="blank-email" class="invalid">Email <b>không được bỏ trống</b></p>
                    <p id="check-email" class="invalid">Email phải theo dạng <b>abc_123@xyz.com</b></p>
                </div>
            </div>
            <div class="button-login-email">
                <button class="button-login-emails">GỬI</button>
            </div>
        </div>

        <div class="col" data-aos="fade-left" data-aos-duration="2000">
            <img class="icon-forget1" src="../img/social/icon.png" height="200" width="250">
        </div>
    </div>
</div>
<!--END FORGET PASSWORD-->

<%-- FOOTER --%>
<jsp:include page="../include-files/footer-user.jsp"></jsp:include>
<script>AOS.init();</script>
</body>
</html>
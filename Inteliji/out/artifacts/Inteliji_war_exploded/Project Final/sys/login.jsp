<%@ page import="Libs.Utils" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <meta charset="UTF-8">
    <title>Đăng nhập</title>
    <link rel="stylesheet" href="<%=Utils.fullPathLibs("css/main-style.css")%>">
    <link rel="stylesheet" href="<%=Utils.fullPathLibs("css/order.css")%>">
    <script src="<%=Utils.fullPathLibs("js/order.js")%>"></script>
    <script src="<%=Utils.fullPathLibs("js/input-validate.js")%>"></script>
    <!---->
    <link rel="stylesheet" href="<%=Utils.fullPathLibs("lib/bootstrap-4.3.1-dist/css/bootstrap.min.css")%>">
    <link rel="stylesheet" href="<%=Utils.fullPathLibs("lib/fontawesome/css/all.min.css")%>">
    <link rel="stylesheet" href="<%=Utils.fullPathLibs("lib/aos-master/dist/aos.css")%>">
    <script src="<%=Utils.fullPathLibs("lib/aos-master/dist/aos.js")%>"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body onload="checkEmail(); checkPass()">
<%-- HEADER --%>
<jsp:include page="../include-files/header-user.jsp"></jsp:include>

<!-- CONTENT -->
<div id="login" class="container">
    <div class="title-login row">
        <span>ĐĂNG NHẬP</span>
    </div>

    <div class="row">
        <div class="login-account col-7" data-aos="fade-right">
            <div class="title">
                <span>ĐĂNG NHẬP VÀO TÀI KHOẢN CỦA BẠN<br></span>
                <%String err = (String) request.getAttribute("err");%>
                <%if (err != null) {%>
                <span style="color: red;"><%=err%></span>
                <%}%>

            </div>
            <form action="<%=Utils.fullPath("Project%20Final/sys/Login")%>?action=login" method="post">
                <div class="email">
                    <div class="your-email">
                        <span>Địa chỉ emali: </span>
                    </div>
                    <div class="input-email">
                        <input style="color: black" class="input-your-email" name="email" id="email" type="text" placeholder="Email của bạn">
                        <div id="email-validate">
                            <p id="blank-email" class="invalid">Email <b>không được bỏ trống</b></p>
                            <p id="check-email" class="invalid">Email phải theo dạng <b>abc_123@xyz.com</b></p>
                        </div>
                    </div>
                </div>
                <div class="pass">
                    <div class="your-pass">
                        <span>Mật khẩu: </span>
                    </div>
                    <div class="input-pass">
                        <input style="color: black" class="input-your-pass" name="pass" id="pass" type="password"
                               placeholder="Mật khẩu của bạn">
                        <div id="pass-validate">
                            <h5>Mật khẩu phải bao gồm những điều kiện sau:</h5>
                            <p id="length" class="invalid">Mật khẩu <b>không được bỏ trống</b></p>
                            <p id="letter" class="invalid">Phải có ít nhất một <b>chữ thường</b></p>
                            <p id="capital" class="invalid">Phải có ít nhất một <b>chữ in hoa</b></p>
                            <p id="number" class="invalid">Phải có ít nhất một <b>chữ số</b></p>
                        </div>
                    </div>
                </div>
                <div class="check">
                    <input class="check-login" type="checkbox">
                    <span class="text-check">Giữ trạng thái đăng nhập</span>
                    <a href="<%=Utils.fullPathLibs("sys/forgetPass.jsp")%>"><span class="text-checks">Quên mật khẩu ?</span></a>
                </div>
                <div class="button-login">
                    <a href="#">
                        <button type="submit" class="button">Đăng nhập</button>
                    </a>
                </div>
            </form>
        </div>



        <div class="note col" data-aos="fade-left" data-aos-duration="3000">
            <div class="text-note">
                <span class="account"><br>VỚI TÀI KHOẢN SITEANITE BẠN CÓ THỂ...</span>
                <div class="list-text">
                    <ul>
                        <li><span>Lưu lại đơn hàng yêu thích để đặt hàng nhanh hơn vào lần sau.</span></li>
                        <li><span>Thanh toán nhanh hơn với địa chỉ giao hàng và thông tin thanh toán đã lưu. </span>
                        </li>
                        <li><span>Tận hưởng ưu đãi đặc biệt vào sinh nhật của bạn.</span></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- END CONTENT-->

<%-- FOOTER --%>
<jsp:include page="../include-files/footer-user.jsp"></jsp:include>
<script>AOS.init();</script>
</body>
</html>
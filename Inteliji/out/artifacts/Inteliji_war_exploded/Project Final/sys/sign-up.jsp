<%@ page import="Libs.Utils" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <meta charset="UTF-8">
    <title>Đăng ký tài khoản</title>
    <link rel="stylesheet" href="<%=Utils.fullPathLibs("css/main-style.css")%>">
    <link rel="stylesheet" href="<%=Utils.fullPathLibs("css/order.css")%>">
    <link rel="stylesheet" href="<%=Utils.fullPathLibs("css/cart.css")%>">
    <script src="<%=Utils.fullPathLibs("js/order.js")%>"></script>
    <script src="<%=Utils.fullPathLibs("js/input-validate.js")%>"></script>
    <!---->
    <link rel="stylesheet" href="<%=Utils.fullPathLibs("lib/bootstrap-4.3.1-dist/css/bootstrap.min.css")%>">
    <link rel="stylesheet" href="<%=Utils.fullPathLibs("lib/fontawesome/css/all.min.css")%>">
    <link rel="stylesheet" href="<%=Utils.fullPathLibs("lib/aos-master/dist/aos.css")%>">
    <script src="<%=Utils.fullPathLibs("lib/aos-master/dist/aos.js")%>"></script>
    <script src="<%=Utils.fullPathLibs("lib/bootstrap-4.3.1-dist/js/bootstrap.min.js")%>"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body onload="checkEmail(); checkEmailRetype(); checkPass(); checkPassRetype(); checkFirstName(); checkLastName()">
<%-- HEADER --%>
<jsp:include page="../include-files/header-user.jsp"></jsp:include>

<!--CONTENT-->
<div id="sign-up" class="container">
    <form action="<%=Utils.fullPath("RegisterController")%>">
        <h2 style="color: #00ad5f">ĐĂNG KÝ TÀI KHOẢN SITEANITE</h2>
        <div class="row">
            <div class="col margin" id="last-name-wrapper">
                <span>Họ*:<br></span>
                <input type="text" name="last-name" id="last-name" required>
                <div id="last-name-validate">
                    <p id="blank-last-name" class="invalid">Không được bỏ trống</p>
                </div>
            </div>
            <div class="col" id="first-name-wrapper">
                <span>Tên*:<br></span>
                <input type="text" name="first-name" id="first-name" required>
                <div id="first-name-validate">
                    <p id="blank-first-name" class="invalid">Không được bỏ trống</p>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col margin" id="email-input-wrapper">
                <span>Email*:<br></span>
                <input type="text" name="email" id="email">
                <div id="email-validate">
                    <p id="blank-email" class="invalid">Email <b>không được bỏ trống</b></p>
                    <p id="check-email" class="invalid">Email phải theo dạng <b>abc_123@xyz.com</b></p>
                </div>
            </div>
            <div class="col" id="email-retype-wrapper">
                <span>Nhập lại email*:<br></span>
                <input type="text" name="email-retype" id="email-retype" required>
                <div id="email-retype-validate">
                    <p id="blank-email-retype" class="invalid">Không được bỏ trống</p>
                    <p id="check-email-retype" class="invalid">Phải giống email vừa nhập</p>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col margin" id="date-wrapper">
                <span>Ngày sinh*:<br></span>
                <input type="date" name="date" id="date" required>
            </div>
            <div class="col" id="gender-wrapper">
                <span>Giới tính*:<br></span>
                <select id="gender-select" name="gender">
                    <option name="gender" value="male">Nam</option>
                    <option name="gender" value="female">Nữ</option>
                    <option name="gender" value="other">Khác</option>
                </select>
            </div>
        </div>
        <div class="row">
            <div class="col margin" id="pass-input-wrapper">
                <span>Mật khẩu*:<br></span>
                <input type="password" name="pass" id="pass">
                <div id="pass-validate">
                    <h5>Mật khẩu phải bao gồm những điều kiện sau:</h5>
                    <p id="length" class="invalid">Mật khẩu <b>không được bỏ trống</b></p>
                    <p id="letter" class="invalid">Phải có ít nhất một <b>chữ thường</b></p>
                    <p id="capital" class="invalid">Phải có ít nhất một <b>chữ in hoa</b></p>
                    <p id="number" class="invalid">Phải có ít nhất một <b>chữ số</b></p>
                </div>
            </div>
            <div class="col" id="pass-retype-wrapper">
                <span>Nhập lại mật khẩu*:<br></span>
                <input type="password" name="pass-retype" id="pass-retype">
                <div id="pass-retype-validate">
                    <p id="blank-pass-retype" class="invalid">Không được bỏ trống</p>
                    <p id="check-pass-retype" class="invalid">Phải giống mật khẩu vừa nhập</p>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col margin" id="phone-wrapper">
                <span>Số điện thoại liên lạc:<br></span>
                <input type="text" name="phone" id="phone">
            </div>
            <div class="col" id="address-wrapper">
                <span>Địa chỉ:<br></span>
                <input type="text" name="address" id="address">
            </div>
        </div>
        <div class="col margin">
            <div class="check-box-text" data-aos="fade-left">
                <input class="check-text" id="check" type="checkbox" name="check">
                <label style="cursor:pointer" for="check">Vui lòng ✓ nếu bạn <b>không</b> muốn nhận thêm tin tức
                    từ
                    chúng tôi.</label>
            </div>
            <div class="check-box-text" data-aos="fade-left">
                <input class="check-text" id="dont-check" type="checkbox" name="check">
                <label style="cursor:pointer;" for="dont-check">Vui lòng ✓ nếu bạn <b>không</b>
                    muốn nhận thêm tin tức về hàng hóa, dịch vụ của đối tác của chúng tôi.</label>
            </div>
            <div class="check-box-text" data-aos="fade-left">
                <input class="check-text" id="agree" type="checkbox" name="check" required>
                <label style="cursor:pointer" for="agree">Tôi đã đọc và chấp thuận chính sách quyền riêng tư
                    của trang web này.</label>
            </div>
        </div>
        <div class="row" id="btn-grp">
            <div class="col-3"></div>
            <div class="col">
                <a href="#">
                    <button id="sign-up-button">Đăng ký</button>
                </a>
            </div>
            <div class="col"><a href="index.jsp">
                <button id="home-button">Quay lại trang chủ</button>
            </a></div>
        </div>
    </form>
</div>
<!--END-->

<%-- FOOTER --%>
<jsp:include page="../include-files/footer-user.jsp"></jsp:include>
<script>AOS.init();</script>
</body>
</html>
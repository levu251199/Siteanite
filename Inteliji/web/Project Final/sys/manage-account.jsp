<%@ page import="Libs.Utils" %>
<%@ page import="website.model.Account" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <meta charset="UTF-8">
    <title>Quản lý tài khoản</title>
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
<body onload="checkEmail(); checkPass(); checkFirstName(); checkLastName()">
<%-- HEADER --%>
<jsp:include page="../include-files/header-user.jsp"></jsp:include>

<!--CONTENT-->
<%Account u = (Account) request.getAttribute("account");%>
<div id="sign-up" class="container">
    <form action="<%=Utils.fullPath("FixAccount")%>">
        <h2 style="color: #00ad5f">QUẢN LÝ TÀI KHOẢN SITEANITE</h2>
        <div class="row" data-aos="zoom-out-up">
            <div class="col margin" id="last-name-wrapper">
                <span>Họ*:<br></span>
                <input style="background: #dbdbdb" type="text" name="last-name" id="last-name" required value="<%=u!=null?u.getLast_name():""%>"/>
                <div id="last-name-validate">
                    <p id="blank-last-name" class="invalid">Không được bỏ trống</p>
                </div>
            </div>
            <div class="col" id="first-name-wrapper">
                <span>Tên*:<br></span>
                <input style="background: #dbdbdb" type="text" name="first-name" id="first-name" required value="<%=u!=null?u.getFirst_name():""%>"/>
                <div id="first-name-validate">
                    <p id="blank-first-name" class="invalid">Không được bỏ trống</p>
                </div>
            </div>
        </div>
        <div class="row" data-aos="zoom-out-up">
            <div class="col margin" id="email-input-wrapper">
                <span>Email*:<br></span>
                <input style="background: #dbdbdb" type="text" name="email" id="email" value="<%=u!=null?u.getEmail():""%>"/>
                <div id="email-validate">
                    <p id="blank-email" class="invalid">Email <b>không được bỏ trống</b></p>
                    <p id="check-email" class="invalid">Email phải theo dạng <b>abc_123@xyz.com</b></p>
                </div>
            </div>
            <div style="margin: 0" class="col margin" id="pass-input-wrapper">
                <span>Mật khẩu*:<br></span>
                <input style="background: #dbdbdb" type="password" name="pass" id="pass" value="<%=u!=null?u.getPass():""%>"/>
                <div id="pass-validate">
                    <h5>Mật khẩu phải bao gồm những điều kiện sau:</h5>
                    <p id="length" class="invalid">Mật khẩu <b>không được bỏ trống</b></p>
                    <p id="letter" class="invalid">Phải có ít nhất một <b>chữ thường</b></p>
                    <p id="capital" class="invalid">Phải có ít nhất một <b>chữ in hoa</b></p>
                    <p id="number" class="invalid">Phải có ít nhất một <b>chữ số</b></p>
                </div>
            </div>
        </div>
        <div class="row" data-aos="zoom-out-up">
            <div class="col margin" id="date-wrapper">
                <span>Ngày sinh*:<br></span>
                <input style="background: #dbdbdb" type="date" name="birth" id="birth" required value="<%=u!=null?u.getDateOfBirth():""%>"/>
            </div>
            <div class="col" id="gender-wrapper">
                <span>Giới tính*:<br></span>
                <select style="background: #dbdbdb" id="gender-select" name="gender">
                    <option name="gender" value="Nam">Nam</option>
                    <option name="gender" value="Nữ">Nữ</option>
                    <option name="gender" value="Khác">Khác</option>
                </select>
            </div>
        </div>
        <div class="row" data-aos="zoom-out-up">
            <div class="col margin" id="phone-wrapper">
                <span>Số điện thoại liên lạc:<br></span>
                <input style="background: #dbdbdb" type="text" name="phone" id="phone" value="<%=u!=null?u.getNumberPhone():""%>"/>
            </div>
            <div class="col" id="address-wrapper">
                <span>Địa chỉ:<br></span>
                <input style="background: #dbdbdb" type="text" name="address" id="address" value="<%=u!=null?u.getAddress():""%>"/>
            </div>
        </div>
        <div class="row" id="btn-grp" data-aos="zoom-out-up">
            <div class="col-3"></div>
            <div class="col">
                <a href="#">
                    <button onclick="confirm()" id="sign-up-button">Cập nhật</button>
                </a>
                <script>
                    function confirm() {
                        alert("Cập nhật thành công!");
                    }
                </script>
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
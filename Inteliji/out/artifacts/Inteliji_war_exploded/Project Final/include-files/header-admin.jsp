<%@ page import="Libs.Utils" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!--NAV-->
<div id="top-nav">
    <span id="side-nav-button" onclick="openNav()">&#9776;</span>
    <div id="logo"> SITEANITE</div>
    <div id="logout">
        <a href="<%=Utils.fullPathLibs("sys/index.jsp")%>"><i class="fas fa-sign-out-alt"></i></a>
    </div>
    <div id="notification">
        <a href="#"><i class="fas fa-bell"></i></a>
    </div>
    <div id="message">
        <a href="#"><i class="far fa-envelope"></i></a>
        <div id="message-content-wrap" class="hide">
            <div id="message-title">Message from staff/manager</div>
            <div class="mes-content">
                <i class="far fa-id-card"></i>
                <div class="mes-text">Bla bla bla bla bla bla</div>
            </div>
            <div class="mes-content">
                <i class="far fa-id-card"></i>
                <div class="mes-text">Bla bla bla bla bla bla</div>
            </div>
            <div class="mes-content">
                <i class="far fa-id-card"></i>
                <div class="mes-text">Bla bla bla bla bla bla</div>
            </div>
            <div class="mes-content">
                <i class="far fa-id-card"></i>
                <div class="mes-text">Bla bla bla bla bla bla</div>
            </div>
        </div>
    </div>
</div>

<div id="side-nav">
    <div id="mySidenav" class="sidenav">
        <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
        <a class="side-nav-element text-decoration-none" href="<%=Utils.fullPathLibs("sys/admin-home.jsp")%>">
            <i class="fab fa-audible"></i>
            Trang chủ
        </a>
        <a class="side-nav-element text-decoration-none" href="<%=Utils.fullPathLibs("sys/admin-employee.jsp")%>">
            <i class="fas fa-user"></i>
            Nhân viên
        </a>
        <a class="side-nav-element text-decoration-none" href="<%=Utils.fullPathLibs("sys/admin-user.jsp")%>">
            <i class="fas fa-user"></i>
            Người dùng
        </a>
        <a class="side-nav-element text-decoration-none" href="<%=Utils.fullPathLibs("sys/admin-order.jsp")%>">
            <i class="fas fa-cart-plus"></i>
            Đơn hàng
        </a>
        <a class="dropdown-btn side-nav-element text-decoration-none" style="color: #818181;">
            <i class="fas fa-stroopwafel"></i>
            Sản phẩm
            <i class="fa fa-caret-down"></i>
        </a>
        <div class="dropdown-container">
            <a class="side-nav-element text-decoration-none" href="<%=Utils.fullPathLibs("sys/admin-combo.jsp")%>">&emsp;
                Combo</a>
            <a class="side-nav-element text-decoration-none" href="<%=Utils.fullPathLibs("sys/admin-pizza.jsp")%>">&emsp;
                Sản phẩm chính</a>
            <a class="side-nav-element text-decoration-none"
               href="<%=Utils.fullPathLibs("sys/admin-small-product.jsp")%>">&emsp; Sản phẩm
                phụ</a>
        </div>

    </div>
</div>

<%@ page import="website.model.Account" %>
<%@ page import="website.model.Cart" %>
<%@ page import="Libs.Utils" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="../js/order.js"></script>
<!-- HEADER -->
<div class="container-fluid" style="background: #1e1e1e">
    <div class="row align-items-center">
        <!--    Left of the header -->
        <div id="left-head" class="col" data-aos="zoom-in">
            <nav id="">
                <%Account acc = (Account) request.getSession().getAttribute("account");%>
                <%if (acc == null) {%>
                <div id="login-section">
                    <i class="fas fa-user"></i>
                    <a href="<%=Utils.fullPathLibs("sys/login.jsp")%>" class="login text-decoration-none">Đăng nhập</a>
                    <i class="fas fa-user"></i>
                    <a href="<%=Utils.fullPathLibs("sys/sign-up.jsp")%>" class="login text-decoration-none">Tạo tài
                        khoản</a>
                </div>
                <%} else if (acc.getRole().equals("admin")) {%>
                <i class="fas fa-user"></i>
                <span style="color: #e1c055; font-size: 18px;">Xin chào, <%=" " + acc.getFirst_name() + " " + acc.getLast_name()%></span>
                <a href="<%=Utils.fullPath("Project%20Final/sys/Login")%>?action=logout"><i
                        class="fas fa-sign-out-alt"></i></a>
                <a href="<%=Utils.fullPath("Project%20Final/sys/ManageAccount")%>?account=<%=acc.getEmail()%>">
                    <i class="fas fa-user-cog"></i></a>
                <a href="<%=Utils.fullPath("Project%20Final/sys/BillController")%>?action=bill">
                    <i class="fas fa-receipt"></i></a>
                <a href="<%=Utils.fullPathLibs("sys/admin-home.jsp")%>"><i
                        class="fas fa-key"></i></a>
                <%} else {%>
                <i class="fas fa-user"></i>
                <span style="color: #e1c055; font-size: 18px;">Xin chào, <%=" " + acc.getFirst_name() + " " + acc.getLast_name()%></span>
                <a href="<%=Utils.fullPath("Project%20Final/sys/Login")%>?action=logout"><i
                        class="fas fa-sign-out-alt"></i></a>
                <a href="<%=Utils.fullPath("Project%20Final/sys/ManageAccount")%>?account=<%=acc.getEmail()%>">
                    <i class="fas fa-user-cog"></i></a>
                <a href="<%=Utils.fullPath("Project%20Final/sys/BillController")%>?action=bill">
                    <i class="fas fa-receipt"></i></a>
                <%}%>

                <div id="language-section">
                    <a href="#" class="lang">Tiếng Việt</a>
                    <a href="#" class="lang">English</a>
                </div>
            </nav>
        </div>
        <!--    Middle of the header - Logo -->
        <div class="col">
            <a href="<%=Utils.fullPathLibs("sys/index.jsp")%>"><img id="main-logo"
                                                                    src="<%=Utils.fullPathImg("img/Logo.png")%>" alt=""
                                                                    width="100%"></a>
        </div>
        <!--    Right of the header - Order -->
        <div class="col" data-aos="zoom-in">
            <%Cart cart = (Cart) session.getAttribute("cart");%>
            <div id="order"><a id="order-btn" href="<%=Utils.fullPathLibs("sys/cart.jsp")%>"
                               class="text-decoration-none"><%=cart != null ? cart.getListPro().size() : 0%><i
                    style="color: #1b1e21; font-size: 15px;"
                    class="fas fa-shopping-cart"></i>Giỏ hàng</a></div>
        </div>
        <!-- END HEADER -->
    </div>
</div>


<!-- MENU BAR -->
<div id="menu-wrapper" class="container-fluid">
    <div class="row align-items-center justify-content-md-center">
        <nav id="menu-nav">
            <div id="menu-element">
                <a href="<%=Utils.fullPath("ProductUserController?table=combo")%>" class="text-decoration-none col">Thực
                    đơn đặc biệt</a>
                <a href="<%=Utils.fullPath("ProductUserController?table=sanphamchinh")%>"
                   class="text-decoration-none col">Pizza</a>
                <a href="<%=Utils.fullPath("ProductUserController?table=sanphamphu&type=mi")%>"
                   class="text-decoration-none col">Mì Ý & Cơm</a>
                <a href="<%=Utils.fullPath("ProductUserController?table=sanphamphu&type=kv")%>"
                   class="text-decoration-none col">Khai vị</a>
                <a href="<%=Utils.fullPath("ProductUserController?table=sanphamphu&type=nc")%>"
                   class="text-decoration-none col">Thức uống</a>
                <a href="<%=Utils.fullPathLibs("sys/index.jsp")%>" class="text-decoration-none col">Trở về trang chủ</a>
            </div>
        </nav>
    </div>
</div>
<!-- END MENU BAR -->

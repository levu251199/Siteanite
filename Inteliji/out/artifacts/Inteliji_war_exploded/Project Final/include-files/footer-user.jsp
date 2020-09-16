<%@ page import="Libs.Utils" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!--INFORMATION-->
<div id="info-wrapper" class="container-fluid">
    <div class="row justify-content-md-center" >
        <div id="menu-shortcut" class="info-col col">
            <h3 style="color: #b4b4b4">Thực đơn</h3>
            <nav id="menu-shortcut-element">
                <a href="<%=Utils.fullPath("ProductUserController?table=combo")%>">Thực đơn đặc biệt<br></a>
                <a href="<%=Utils.fullPath("ProductUserController?table=sanphamchinh")%>">Pizza<br></a>
                <a href="<%=Utils.fullPath("ProductUserController?table=sanphamphu&type=mi")%>">Mì và cơm<br></a>
                <a href="<%=Utils.fullPath("ProductUserController?table=sanphamphu&type=kv")%>">Khai vị<br></a>
                <a href="<%=Utils.fullPath("ProductUserController?table=sanphamphu&type=nc")%>">Thức uống</a>
            </nav>
        </div>
        <div id="address-shortcut" class="info-col col">
            <h3 style="color: #b4b4b4">Địa chỉ</h3>
            <nav id="address-shortcut-element">
                <a href="<%=Utils.fullPathLibs("sys/mienBac.jsp")%>">Miền Bắc<br></a>
                <a href="<%=Utils.fullPathLibs("sys/mienTrung.jsp")%>">Miền Trung<br></a>
                <a href="<%=Utils.fullPathLibs("sys/mienNam.jsp")%>">Miền Nam</a>
            </nav>
        </div>
        <div id="feedback-shortcut" class="info-col col">
            <h3 style="color: #b4b4b4">Liên lạc</h3>
            <nav id="feedback-shortcut-element">
                <a href="#"><i class="fab fa-facebook-f"></i></a>
                <a href="#"><i class="fab fa-twitter"></i></a>
                <a href="#"><i class="fab fa-instagram"></i></a>
                <a href="#" class="text-decoration-none">
                    <div id="feedback" style="color: crimson;">Liên lạc - Phản hồi</div>
                </a>
            </nav>
        </div>
    </div>
</div>
<!-- END INFORMATION-->
<!-- FOOTER -->
<div id="footer-wrapper" class="container-fluid">
    <div id="hotline">
        <img src="../img/hotline.png" alt="" width="350" height="80">
    </div>
    <div id="company-info" style="color: grey;">Công ty TNHH Siteanit | Số ĐKKD: 696969696969<br>
        Địa chỉ trụ sở chính: Tầng 69, Tòa nhà Ricardo Milos, Số 96 Rốt Mơn, Phường 6, Quận 9, Tp.Hồ Chí Minh
    </div>
    <div id="confirm">
        <img src="../img/confirm.png" alt="" width="150" height="50">
    </div>
</div>
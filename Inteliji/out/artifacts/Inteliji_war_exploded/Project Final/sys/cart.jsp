<%@ page import="Libs.Utils" %>
<%@ page import="java.util.List" %>
<%@ page import="website.dao.AddressDAO" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="website.model.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <meta charset="UTF-8">
    <title>Giỏ hàng</title>
    <link rel="stylesheet" href="<%=Utils.fullPathLibs("css/main-style.css")%>">
    <link rel="stylesheet" href="<%=Utils.fullPathLibs("css/order.css")%>">
    <link rel="stylesheet" href="<%=Utils.fullPathLibs("css/cart.css")%>">
    <script src="<%=Utils.fullPathLibs("js/order.js")%>"></script>
    <%--    --%>
    <link rel="stylesheet" href="<%=Utils.fullPathLibs("lib/fontawesome/css/all.min.css")%>">
    <link rel="stylesheet" href="<%=Utils.fullPathLibs("lib/aos-master/dist/aos.css")%>">
    <link rel="stylesheet" href="<%=Utils.fullPathLibs("lib/bootstrap-4.3.1-dist/css/bootstrap.min.css")%>">
    <script src="<%=Utils.fullPathLibs("lib/aos-master/dist/aos.js")%>"></script>
    <script src="<%=Utils.fullPathLibs("lib/bootstrap-4.3.1-dist/js/bootstrap.min.js")%>"></script>
    <%--    <script src="../lib/jquery/jquery.min.js"></script>--%>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<%-- HEADER --%>
<jsp:include page="../include-files/header-user.jsp"></jsp:include>

<div class="container" style="color: whitesmoke;">
    <!-- Cart -->
    <%Cart cart = (Cart) session.getAttribute("cart");%>
    <div id="cart-title">Giỏ hàng của bạn</div>
    <%String err = (String) request.getAttribute("err");%>
    <%if (err != null) {%>
    <span style="color: red;"><%=err%></span>
    <%}%>
    <br>
    <span>(quý khách vui lòng nhấn nút cập nhật kế bên ô số lượng để cập nhật giá tổng)</span>
    <table class="table" id="dataTable" width="100%" cellspacing="0" style="color: white">
        <thead class="thead-dark">
        <tr>
            <th>Mã số</th>
            <th style="width: 30%;">Tên sản phẩm</th>
            <th style="width: 30%;">Mô tả</th>
            <th style="width: 5%;">Số lượng</th>
            <th>Giá thành</th>
            <th>Tổng cộng</th>
            <th></th>
        </tr>
        </thead>
        <tbody>
        <%if (cart != null) {%>
        <%int count = 0;%>
        <%for (Product product : cart.getListPro()) {%>
        <tr>
            <td><%=++count%>
            </td>
            <td><%=product.getName()%>
            </td>
            <td><%=product.getDes()%>
            </td>
            <td style="display: flex">
                <input style="padding: 2px 10px; color: black;" type="number" class="amount"
                       value="<%=product.getAmount()%>" min="0"
                       required>
                <input type="hidden" class="msp" value="<%=product.getId()%>">
                <a class="update-amount-btn"><i class="fa fa-sync"></i></a>
            </td>
            <td><%=String.format("%,.0f", product.getPrice()) + "đ"%>
            </td>
            <td><%=String.format("%,.0f", cart.getPrice(product.getId())) + "đ"%>
            </td>
            <td><a href="<%=Utils.fullPath("del?id=")%><%=product.getId()%>"><i style="color: crimson"
                                                                                class="fas fa-minus-circle"></i></a>
            </td>
        </tr>
        <%}%>
        <%}%>
        </tbody>
    </table>

    <!--    Total   -->
    <div id="total-section">
        <div id="ship"><i class="fas fa-truck"></i> Miễn phí giao hàng</div>
        <div style="color: orange; font-size: 30px" id="total-money">Tổng số
            tiền: <%=cart != null ? String.format("%,.0f", cart.totalPrice()) + "đ" : "0đ"%>
        </div>
    </div>

    <!--    BUTTON    -->
    <div id="button-group" class="row">
        <%Account acc = (Account) request.getSession().getAttribute("account");%>
        <%if (acc != null) {%>
        <div data-toggle="modal" data-target="#myModal" class="back-wrap col">
            <a href="#" class="back-btn text-decoration-none">Vui lòng xác nhận địa chỉ</a>
        </div>
        <div class="ok-wrap col">
            <a onclick="confirm()" href="<%=Utils.fullPath("createCart?madonhang=")%><%=acc.getNumberPhone()%>"
               class="ok-btn text-decoration-none">Thanh toán</a>
            <script>
                function confirm() {
                    alert("Đặt hàng thành công!");
                }
            </script>
        </div>
        <%} else {%>
        <div data-toggle="modal" data-target="#myModal" class="back-wrap col">
            <a href="#" class="back-btn text-decoration-none">Đăng nhập</a>
        </div>

        <div class="ok-wrap col">
            <div data-toggle="modal" data-target="#myModal" class="col">
                <a href="#" class="ok-btn text-decoration-none">Thanh toán</a>
            </div>
        </div>
        <%}%>


    </div>
    <!---->
</div>

<!-- Modal Order -->
<div id="myModal" class="modal fade" role="dialog">
    <div class="modal-dialog" style="max-width: 695px; width: 695px;">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header" style="background: #363434">
                <h4 style="color: white">SITEANITE</h4>
                <button style="color: red" type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body" id="order-form">
                <!-- Order Form -->
                <%if (acc == null) {%>
                <div id="order-section-1">
                    <div id="title"><br>ĐẶT HÀNG</div>
                    <div class="text-below-title">CHỌN HÌNH THỨC ĐẶT HÀNG CỦA BẠN</div>
                </div>

                <div id="order-section-2">
                    <div id="option-left">
                        <i class="fas fa-taxi"></i>
                        <div id="option-left-text">Giao hàng tận nơi</div>
                        <input type="radio" name="order-option"
                               value="Giao hàng">
                    </div>
                    <div id="option-right">
                        <i class="fas fa-box"></i>
                        <div id="option-right-text">Đặt mua tới mang về</div>
                        <input type="radio" name="order-option"
                               value="Lấy hàng">
                    </div>

                    <%--                    <form action="<%=Utils.fullPath("OrderController")%>">--%>
                    <%--                        <div class="address">--%>
                    <%--                            <div class="address-text">VUI LÒNG NHẬP ĐẦY ĐỦ THÔNG TIN CẦN THIẾT</div>--%>
                    <%--                            <input style="color: black;" name="name-guest" id="name-guest" type="text"--%>
                    <%--                                   class="address-input"--%>
                    <%--                                   placeholder="Họ và tên của bạn"><br>--%>

                    <%--                            <input style="color: black;" name="phone-guest" id="phone-guest" type="text"--%>
                    <%--                                   class="address-input"--%>
                    <%--                                   placeholder="Số điện thoại của bạn"><br>--%>
                    <%--                            <input style="color: black;" name="address-guest" id="address-guest" type="text"--%>
                    <%--                                   class="address-input"--%>
                    <%--                                   placeholder="  Nhập chi tiết địa chỉ tại đây...">--%>
                    <%--                        </div>--%>
                    <%--                        <a href="<%=Utils.fullPath("createCart")%>">--%>
                    <%--                            <button data-href="" class="order-btn text-decoration-none">Xác nhận</button>--%>
                    <%--                        </a>--%>
                    <%--                    </form>--%>
                </div>
                <%--                <div class="break">--------------------------------------------- hoặc--%>
                <%--                    -----------------------------------------------%>
                <%--                </div>--%>

                <div id="order-section-3">

                    <div class="text-below-title">BẠN ĐÃ CÓ TÀI KHOẢN SITEANITE?<br><br>ĐĂNG NHẬP ĐỂ SỬ DỤNG ĐỊA CHỈ ĐÃ
                        LƯU TRONG
                        TÀI KHOẢN CỦA BẠN
                    </div>
                    <form action="<%=Utils.fullPath("Project%20Final/sys/CartLogin")%>?action=login" method="post">
                        <div id="input-info">
                            <input style="color: black" type="text" name="email" id="email-input" class="input-text"
                                   placeholder="Email của bạn">
                            <input style="color: black" type="password" name="pass" id="pass-input" class="input-text"
                                   placeholder="Mật khẩu của bạn">
                        </div>
                        <div id="pass-hold"><input type="checkbox" id="pass-check"> Duy trì đăng nhập</div>
                        <div id="account-action">
                            <a href="#">
                                <button type="submit" id="login-btn" class="text-decoration-none">Đăng nhập</button>
                            </a>
                            <a href="<%=Utils.fullPathLibs("sys/forgetPass.jsp")%>" id="forget-pass"
                               class="text-decoration-none">Quên mật khẩu?</a>
                        </div>
                    </form>
                </div>
                <div class="break">--------------------------------------------- hoặc
                    ---------------------------------------------
                </div>

                <div id="order-section-4">
                    <a href="<%=Utils.fullPathLibs("sys/sign-up.jsp")%>" id="sign-up-btn" class="text-decoration-none">
                        Tạo tài khoản </a>
                </div>
                <%} else {%>
                <div class="text-below-title">
                    BẠN ĐÃ ĐĂNG NHẬP TÀI KHOẢN SITEANITE<br><br>
                    <form action="<%=Utils.fullPath("OrderController")%>">
                        <div style="color: #e1c055; margin-bottom: 20px;">
                            Tên:<%=" " + acc.getFirst_name() + " " + acc.getLast_name()%><br>
                            Số điện thoại:<%=" " + acc.getNumberPhone()%><br>
                            Địa chỉ:<%=" " + acc.getAddress()%>
                        </div>
                        <a href="<%=Utils.fullPath("OrderController?name=")%><%=acc.getFirst_name()%>
                        &phone=<%=acc.getNumberPhone()%>&address=<%=acc.getAddress()%>"
                           class="order-btn text-decoration-none">Xác nhận dùng địa chỉ này</a>
                    </form>
                </div>
                <%}%>
            </div>

        </div>

    </div>
</div>

<script>
    $(document).ready(function () {
        $('.update-amount-btn').on('click', function () {
            let msp = $(this).parent().children('.msp').val();
            let amount = $(this).parent().children('.amount').val();
            let table = 'sanphamphu';
            if (msp.indexOf('pz') !== -1) {
                table = 'sanphamchinh'
            } else if (msp.indexOf('cb') !== -1) {
                table = 'combo';
            }
            let url = "http://localhost:8080/Inteliji/AddToCart?table=" + table + "&id=" + msp + "&soluong=" + amount;
            return location.href = url;
        })
    })
</script>
<%-- FOOTER --%>
<jsp:include page="../include-files/footer-user.jsp"></jsp:include>
<script>AOS.init();</script>
</body>
</html>
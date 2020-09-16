<%@ page import="java.util.List" %>
<%@ page import="website.model.ProductUser" %>
<%@ page import="Libs.Utils" %>
<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/html" xmlns="http://www.w3.org/1999/html"
      xmlns="http://www.w3.org/1999/html" xmlns="http://www.w3.org/1999/html" xmlns="http://www.w3.org/1999/html">
<head>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <meta charset="UTF-8">
    <title>Pizza</title>
    <link rel="stylesheet" href="<%=Utils.fullPathImg("css/products.css")%>">
    <link rel="stylesheet" href="<%=Utils.fullPathImg("css/order.css")%>">
    <link rel="stylesheet" href="<%=Utils.fullPathImg("css/cart.css")%>">
    <script src="<%=Utils.fullPathImg("js/order.js")%>"></script>
    <%----%>
    <link rel="stylesheet" href="<%=Utils.fullPathImg("lib/fontawesome/css/all.min.css")%>">
    <link rel="stylesheet" href="<%=Utils.fullPathImg("lib/bootstrap-4.3.1-dist/css/bootstrap.min.css")%>">
    <link rel="stylesheet" href="<%=Utils.fullPathImg("lib/aos-master/dist/aos.css")%>">
    <script src="<%=Utils.fullPathImg("lib/bootstrap-4.3.1-dist/js/bootstrap.min.js")%>"></script>
    <script src="<%=Utils.fullPathImg("lib/aos-master/dist/aos.js")%>"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<%-- HEADER --%>
<jsp:include page="../include-files/header-user.jsp"></jsp:include>

<!-- CONTENT -->
<div id="panel-wrapper" class="container-fluid">
    <div class="row align-items-center justify-content-md-center" data-aos="flip-left" data-aos-duration="2000">
        <nav id="panel-nav">
            <img src="<%=Utils.fullPathImg("img/pizza/header-pizza.jpg")%>" alt="" width="100%">
        </nav>
    </div>

    <div id="content-wrapper" class="container-fluid">
        <%try {%>
        <%
            List<ProductUser> pizzaList = (List<ProductUser>) request.getAttribute("listPr");
            assert pizzaList != null;
        %>
        <%for (int i = 0; i < pizzaList.size(); i++) {%>
        <div class="row justify-content-center" data-aos="zoom-in">
            <div class="content col">
                <div class="row">
                    <div class="img col" style="height: 200px"><a style="cursor: pointer" data-toggle="modal"
                                                                  data-target="#myModal<%=i%>"><img
                            src="<%=Utils.fullPathImg(pizzaList.get(i).getImg())%>" alt="" width="200" height="200"></a>
                    </div>
                    <div class="content-text product-content col">
                        <h4 STYLE='color: yellow'><%=pizzaList.get(i).getTenSanPham()%>
                        </h4>
                        <div style="color: white"><%=pizzaList.get(i).getMoTaSanPham()%><br>
                            Cỡ Nhỏ: <%=pizzaList.get(i).getGiaNho()%>đ<br>
                            Cỡ Vừa: <%=pizzaList.get(i).getGiaVua()%>đ<br>
                            Cỡ Lớn: <%=pizzaList.get(i).getGiaLon()%>đ<br>
                            <h6>Đế bánh: <%=pizzaList.get(i).getLoaiSanPham()%>
                            </h6>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div id="option-pizza1l" class="option-pizza col">
                        <div class="input-info">
                            <input type="hidden"  class="msp" value="<%=pizzaList.get(i).getMaSanPham()%>">
                            <select class="option-input-pizza size">
                                <option value="gialon">Cỡ Lớn</option>
                                <option value="giavua">Cỡ Vừa</option>
                                <option value="gianho">Cỡ Nhỏ</option>
                            </select>
                        </div>
                    </div>
                    <button class="button col pay-1"> BẮT ĐẦU ĐẶT HÀNG</button>
                </div>
            </div>

            <div class="content col">
                <div class="row">
                    <div class="img col" style="height: 200px"><a style="cursor: pointer" data-toggle="modal"
                                                                  data-target="#myModal<%=++i%>"><img
                            src="<%=Utils.fullPathImg(pizzaList.get(i).getImg())%>" alt="" width="200" height="200"></a>
                    </div>
                    <div class="content-text product-content col">
                        <h4 STYLE='color: yellow'><%=pizzaList.get(i).getTenSanPham()%>
                        </h4>
                        <div style="color: white"><%=pizzaList.get(i).getMoTaSanPham()%><br>
                            Cỡ Nhỏ: <%=pizzaList.get(i).getGiaNho()%>đ<br>
                            Cỡ Vừa: <%=pizzaList.get(i).getGiaVua()%>đ<br>
                            Cỡ Lớn: <%=pizzaList.get(i).getGiaLon()%>đ<br>
                            <h6>Đế bánh: <%=pizzaList.get(i).getLoaiSanPham()%>
                            </h6>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div id="option-pizza1r" class="option-pizza col">
                        <div class="input-info">
                            <input type="hidden"  class="msp" value="<%=pizzaList.get(i).getMaSanPham()%>">
                            <select class="option-input-pizza size">
                                <option value="gialon">Cỡ Lớn</option>
                                <option value="giavua">Cỡ Vừa</option>
                                <option value="gianho">Cỡ Nhỏ</option>
                            </select>
                        </div>
                    </div>
                    <button class="button col pay-1"> BẮT ĐẦU ĐẶT HÀNG</button>
                </div>
            </div>
        </div>
        <%}%>

        <%for (int j = 0; j < pizzaList.size(); j++) {%>
        <!-- Modal 1-->
        <div class="modal fade" id="myModal<%=j%>" role="dialog" aria-labelledby="myLargeModalLabel">
            <div class="modal-dialog" style="max-width: 900px; width: 900px;">
                <!-- Modal content-->
                <div class="modal-content" style="background: black">
                    <div class="modal-header">
                        <button style="color: crimson" type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body row">
                        <div class="img col"><a><img src="<%=Utils.fullPathImg(pizzaList.get(j).getImg())%>" alt=""
                                                     width="100%"></a></div>
                        <div class="content-text product-content col">
                            <h4 STYLE='color: yellow'><%=pizzaList.get(j).getTenSanPham()%>
                            </h4>
                            <div style="color: white"><%=pizzaList.get(j).getMoTaSanPham()%><br>
                                Cỡ Nhỏ: <%=pizzaList.get(j).getGiaNho()%>đ<br>
                                Cỡ Vừa: <%=pizzaList.get(j).getGiaVua()%>đ<br>
                                Cỡ Lớn: <%=pizzaList.get(j).getGiaLon()%>đ<br>
                                <h6>Đế bánh: <%=pizzaList.get(j).getLoaiSanPham()%>
                                </h6>
                            </div>
                            <div class="option-pizza">
                                <div class="input-info">
                                    <select class="option-input-pizza size">
                                        <option value="gialon">Cỡ Lớn</option>
                                        <option value="giavua">Cỡ Vừa</option>
                                        <option value="gianho">Cỡ Nhỏ</option>
                                    </select>
                                </div>
                            </div>
                            <button class="button pay-1"> BẮT ĐẦU ĐẶT HÀNG</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal 2-->
        <div class="modal fade" id="myModal<%=++j%>" role="dialog">
            <div class="modal-dialog" style="max-width: 900px; width: 900px;">
                <!-- Modal content-->
                <div class="modal-content" style="background: rgba(0,0,0,0.9)">
                    <div class="modal-header">
                        <button style="color: crimson" type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body row">
                        <div class="img col"><a><img src="<%=Utils.fullPathImg(pizzaList.get(j).getImg())%>" alt=""
                                                     width="100%"></a></div>
                        <div class="content-text product-content col">
                            <h4 STYLE='color: yellow'><%=pizzaList.get(j).getTenSanPham()%>
                            </h4>
                            <div style="color: white"><%=pizzaList.get(j).getMoTaSanPham()%><br>
                                Cỡ Nhỏ: <%=pizzaList.get(j).getGiaNho()%>đ<br>
                                Cỡ Vừa: <%=pizzaList.get(j).getGiaVua()%>đ<br>
                                Cỡ Lớn: <%=pizzaList.get(j).getGiaLon()%>đ<br>
                                <h6>Đế bánh: <%=pizzaList.get(j).getLoaiSanPham()%>
                                </h6>
                            </div>
                            <div class="option-pizza">
                                <div class="input-info">
                                    <select class="option-input-pizza size">
                                        <option value="gialon">Cỡ Lớn</option>
                                        <option value="giavua">Cỡ Vừa</option>
                                        <option value="gianho">Cỡ Nhỏ</option>
                                    </select>
                                </div>
                            </div>
                            <button class="button pay-1"> BẮT ĐẦU ĐẶT HÀNG</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%}%>
        <%} catch (Exception e) {%>
        <%}%>
        <div id="pagination">
            <%int totalPage = (int) request.getAttribute("totalPage");%>
            <%for (int i = 1; i <= totalPage; i++) {%>
            <a href="<%=Utils.fullPath("ProductUserController?table=sanphamchinh&page=")+i%>" class="btn-pagi"><%=i%>
            </a>
            <%}%>
        </div>
    </div>

</div>
</div>
<!--CONTENT-COMBO-->

<%-- FOOTER --%>
<jsp:include page="../include-files/footer-user.jsp"></jsp:include>
<script>AOS.init();</script>
</body>
<script>
    $(document).ready(function () {
        $('.pay-1').on('click', function () {
            let size = $(this).parent().children('.option-pizza').children('.input-info').children('.size').val();
            let id = $(this).parent().children('.option-pizza').children('.input-info').children('.msp').val();
            let url = 'http://localhost:8080/Inteliji/AddToCart?table=sanphamchinh&id=' + id + '&size=' + size;
            return location.href = url;

        })
    })
</script>
</html>
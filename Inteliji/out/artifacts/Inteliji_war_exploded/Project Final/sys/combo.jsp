<%@ page import="java.sql.SQLException" %>
<%@ page import="website.model.ComboUser" %>
<%@ page import="java.util.List" %>
<%@ page import="website.dao.ComboUserDAO" %>
<%@ page import="Libs.Utils" %>
<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/html" xmlns="http://www.w3.org/1999/html"
      xmlns="http://www.w3.org/1999/html" xmlns="http://www.w3.org/1999/html">
<head>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <meta charset="UTF-8">
    <title>Thực đơn đặc biệt</title>
    <link rel="stylesheet" href="<%=Utils.fullPathLibs("css/products.css")%>">
    <link rel="stylesheet" href="<%=Utils.fullPathLibs("css/order.css")%>">
    <script src="<%=Utils.fullPathLibs("js/order.js")%>"></script>
    <%----%>
    <link rel="stylesheet" href="<%=Utils.fullPathLibs("lib/fontawesome/css/all.min.css")%>">
    <link rel="stylesheet" href="<%=Utils.fullPathLibs("lib/bootstrap-4.3.1-dist/css/bootstrap.min.css")%>">
    <link rel="stylesheet" href="<%=Utils.fullPathLibs("lib/aos-master/dist/aos.css")%>">
    <script src="<%=Utils.fullPathLibs("lib/bootstrap-4.3.1-dist/js/bootstrap.min.js")%>"></script>
    <script src="<%=Utils.fullPathLibs("lib/aos-master/dist/aos.js")%>"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<!-- HEADER -->
<jsp:include page="../include-files/header-user.jsp"></jsp:include>

<!-- CONTENT -->
<div id="panel-wrapper" class="container-fluid">
    <div class="row align-items-center justify-content-md-center" data-aos="flip-left" data-aos-duration="2000">
        <nav id="panel-nav">
            <img src="<%=Utils.fullPathImg("img/combo/header-combo.jpg")%>" alt="" width="100%">
        </nav>
    </div>
    <div id="content-wrapper" class="container-fluid">

        <%try {%>
        <%
            List<ComboUser> dscb = (List<ComboUser>) request.getAttribute("listPr");
            assert dscb != null;
        %>
        <%for (int i = 0; i < dscb.size(); i++) {%>
        <div class="row justify-content-center" data-aos="zoom-in">
            <div class="content col">
                <div class="row">
                <div class="img col"><a style="cursor: pointer" data-toggle="modal" data-target="#myModal<%=i%>"><img
                        src="<%=Utils.fullPathImg(dscb.get(i).getImg())%>" alt="" width="200" height="200"></a></div>
                <div class="content-text product-content col">
                    <h4 STYLE='color: yellow'><%=dscb.get(i).getTenCombo()%>
                    </h4>
                    <div style="color: white"><%=dscb.get(i).getMotaCombo()%>
                        Giá: <%=dscb.get(i).getGiaCombo()%>đ
                    </div>
                </div>
                </div>
                <div class="row">
                    <div class="col"></div>
                    <button onclick="return location.href='<%=Utils.fullPath("AddToCart?table=combo&id=")%><%=dscb.get(i).getMaCombo()%>'" class="button col"> BẮT ĐẦU ĐẶT HÀNG</button>
                </div>
            </div>

            <div class="content col">
                <div class="row">
                    <div class="img col"><a style="cursor: pointer" data-toggle="modal" data-target="#myModal<%=++i%>"><img
                            src="<%=Utils.fullPathImg(dscb.get(i).getImg())%>" alt="" width="200" height="200"></a></div>
                    <div class="content-text product-content col">
                        <h4 STYLE='color: yellow'><%=dscb.get(i).getTenCombo()%>
                        </h4>
                        <div style="color: white"><%=dscb.get(i).getMotaCombo()%>
                            Giá: <%=dscb.get(i).getGiaCombo()%>đ
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col"></div>
                    <button onclick="return location.href='<%=Utils.fullPath("AddToCart?table=combo&id=")%><%=dscb.get(i).getMaCombo()%>'" class="button col"> BẮT ĐẦU ĐẶT HÀNG</button>
                </div>
            </div>
        </div>
        <%}%>

        <%for (int j = 0; j < dscb.size(); j++) {%>
        <!-- Modal 1-->
        <div class="modal fade" id="myModal<%=j%>" role="dialog" aria-labelledby="myLargeModalLabel">
            <div class="modal-dialog" style="max-width: 900px; width: 900px;">

                <!-- Modal content-->
                <div class="modal-content" style="background: black">
                    <div class="modal-header">
                        <button style="color: crimson" type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body row">
                        <div class="img col"><a><img
                                src="<%=Utils.fullPathImg(dscb.get(j).getImg())%>" alt="" width="100%"></a>
                        </div>
                        <div class="content-text product-content col">
                            <h3 STYLE='color: yellow'><%=dscb.get(j).getTenCombo()%>
                            </h3>
                            <div style="color: white; font-size: 17px;"><%=dscb.get(j).getMotaCombo()%>
                                Giá: <%=dscb.get(j).getGiaCombo()%>đ
                            </div>
                            <button onclick="return location.href='<%=Utils.fullPath("AddToCart?table=combo&id=")%><%=dscb.get(j).getMaCombo()%>'" class="button col"> BẮT ĐẦU ĐẶT HÀNG</button>
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
                        <div class="img col"><a><img
                                src="<%=Utils.fullPathImg(dscb.get(j).getImg())%>" alt="" width="100%"></a>
                        </div>
                        <div class="content-text product-content col">
                            <h3 STYLE='color: yellow'><%=dscb.get(j).getTenCombo()%>
                            </h3>
                            <div style="color: white; font-size: 17px;"><%=dscb.get(j).getMotaCombo()%>
                                Giá: <%=dscb.get(j).getGiaCombo()%>đ
                            </div>
                            <button onclick="return location.href='<%=Utils.fullPath("AddToCart?table=combo&id=")%><%=dscb.get(j).getMaCombo()%> '" class="button col"> BẮT ĐẦU ĐẶT HÀNG</button>
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
            <a href="<%=Utils.fullPath("ProductUserController?table=combo&page=")+i%>" class="btn-pagi"><%=i%>
            </a>
            <%}%>
        </div>
    </div>
</div>
<!--CONTENT-COMBO-->

<%-- FOOTER --%>
<jsp:include page="../include-files/footer-user.jsp"></jsp:include>
<script>AOS.init();</script>
</body>

</html>
<%@ page import="Libs.Utils" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Quản lý Slider</title>
    <link rel="stylesheet" href="<%=Utils.fullPathLibs("css/admin.css")%>">
    <script src="<%=Utils.fullPathLibs("js/side-nav.js")%>"></script>
    <%--    --%>
    <link rel="stylesheet" href="<%=Utils.fullPathLibs("lib/fontawesome/css/all.min.css")%>">
    <link rel="stylesheet" href="<%=Utils.fullPathLibs("lib/bootstrap-4.3.1-dist/css/bootstrap.min.css")%>">
    <script src="<%=Utils.fullPathLibs("lib/bootstrap-4.3.1-dist/js/bootstrap.min.js")%>"></script>
    <link rel="stylesheet" href="<%=Utils.fullPathLibs("lib/aos-master/dist/aos.css")%>">
    <script src="<%=Utils.fullPathLibs("lib/aos-master/dist/aos.js")%>"></script>
    <script src="<%=Utils.fullPathLibs("lib/ckeditor/ckeditor.js")%>"></script>
    <script src="<%=Utils.fullPathLibs("lib/ckfinder/ckfinder.js")%>"></script>
</head>
<body>

<div id="ck"></div>
<script>
    var f = CKEDITOR.replace("ck");
</script>
</body>
</html>

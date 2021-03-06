<%@ page import="website.admin.model.Employee" %>
<%@ page import="website.admin.dao.EmployeeDAO" %>
<%@ page import="java.util.*" %>
<%@ page import="Libs.Utils" %>
<%@ page import="java.sql.SQLException" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <meta charset="UTF-8">
    <title>Nhân viên</title>
    <link rel="stylesheet" href="<%=Utils.fullPathLibs("css/admin-form.css")%>">
    <script src="<%=Utils.fullPathLibs("js/side-nav.js")%>"></script>
    <link rel="stylesheet" href="<%=Utils.fullPathLibs("lib/bootstrap-4.3.1-dist/css/bootstrap.min.css")%>">
    <link rel="stylesheet" href="<%=Utils.fullPathLibs("lib/fontawesome/css/all.min.css")%>">
    <link rel="stylesheet" href="<%=Utils.fullPathLibs("css/admin.css")%>">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/bs4/dt-1.10.20/datatables.min.css"/>
    <script type="text/javascript" src="https://cdn.datatables.net/v/bs4/dt-1.10.20/datatables.min.js"></script>
</head>
<body onload="drop()">
<!--HEADER-->
<jsp:include page="../include-files/header-admin.jsp"></jsp:include>

<div id="content">
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="<%=Utils.fullPathLibs("sys/admin-home.jsp")%>">Trang chủ</a></li>
            <li class="breadcrumb-item active" aria-current="page">Nhân viên</li>
        </ol>
    </nav>

    <table class="table table-bordered table-hover" id="myTable" width="100%" cellspacing="0">
        <thead class="thead-dark">
        <tr>
            <th>Họ tên</th>
            <th>Email</th>
            <th>Số điện thoại</th>
            <th>Ngày sinh</th>
            <th>Giới tính</th>
            <th>Lương</th>
            <th style="width: 4%">-</th>
            <th style="width: 4%">-</th>
        </tr>
        </thead>
        <tbody>
        <%try {%>
        <%
            List<Employee> dssp = EmployeeDAO.loadNV();
            assert dssp != null;
        %>
        <%for (Employee pr : dssp) {%>
        <tr>
            <td><%=pr.getFullName()%>
            </td>
            <td><%=pr.getEmail()%>
            </td>
            <td><%=pr.getPhone()%>
            </td>
            <td><%=pr.getBirth()%>
            </td>
            <td><%=pr.getGender()%>
            </td>
            <td><%=pr.getSalary()%>
            </td>
            <td>
                <a href="<%=Utils.fullPath("Project%20Final/sys/EmployeeController")%>?employee=<%=pr.getEmail()%>&action=fix"><i
                        style="color: dodgerblue" class="fas fa-edit"></i></a></td>
            <td>
                <a href="<%=Utils.fullPath("Project%20Final/sys/EmployeeController")%>?id=<%=pr.getEmail()%>&action=delete"><i
                        style="color: crimson" class="fas fa-times"></i></a></td>
        </tr>
        <%}%>
        <%} catch (SQLException e) {%>
        <%}%>
        </tbody>
    </table>

    <div class="row">
        <div id="add-btn" class="col-6">
            <a href="../sys/admin-employee-add.jsp">
                <button class="button-form" id="sign-up-button add">Thêm thông tin nhân viên</button>
            </a>
        </div>
    </div>
</div>

<script>
    $(document).ready(function(){
        $('#myTable').dataTable();
    });
</script>
</body>
</html>
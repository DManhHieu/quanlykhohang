<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 12/11/2020
  Time: 6:07 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html >
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Dashboard</title>
    <link href="${pageContext.request.contextPath}/View/Static/css/styles.css" rel="stylesheet"/>
    <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/js/all.min.js" crossorigin="anonymous"></script>
</head>
<body class="sb-nav-fixed">
<div id="layoutSidenav">
    <div id="layoutSidenav_nav">
        <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
            <div class="sb-sidenav-menu">
                <div class="nav">
            <div class="sb-sidenav-menu-heading"></div>
            <a class="nav-link" href="${pageContext.request.contextPath}/index.jsp">
                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                Trang chủ
            </a>

            <div class="sb-sidenav-menu-heading">Quản lý</div>

            <a class="nav-link" href="">
                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                Nhập hàng
            </a>

            <a class="nav-link" href="">
                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                Xuất hàng
            </a>

            <a class="nav-link" href="">
                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                Mặt hàng
            </a>
            <a class="nav-link" href="${pageContext.request.contextPath}/HangTonKho">
                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                Hàng tồn kho
            </a>
            <a class="nav-link" href="">
                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                Kiểm kê
            </a>
            <a class="nav-link" href="">
                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                Thống kê
            </a>
            <a class="nav-link" href="">
                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                Quản lý nhân viên
            </a>
            <a class="nav-link" href="">
                <div class="sb-nav-link-icon">
                    <i class="fa fa-user" aria-hidden="true"></i></div>
                Thông tin cá nhân
            </a>
            </div>
            </div>
        </nav>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath}/View/Static/js/scripts.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath}/View/Static/assets/demo/chart-area-demo.js"></script>
<script src="${pageContext.request.contextPath}/View/Static/assets/demo/chart-bar-demo.js"></script>
<script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js" crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath}/View/Static/assets/demo/datatables-demo.js"></script>
</body>
</html>


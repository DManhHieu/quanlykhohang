<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html >
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Dashboard</title>
    <link href="${pageContext.request.contextPath}/View/Static/css/styles.css" rel="stylesheet" />
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
                    <a class="nav-link" href="${pageContext.request.contextPath}/View/NhanVien/index.jsp">
                        <div class="sb-nav-link-icon"><i class="fas fa-home"></i>
                        </div> Trang chủ
                    </a>
                    <div class="sb-sidenav-menu-heading">Nhân viên</div>

                    <a class="nav-link" href="${pageContext.request.contextPath}/PhieuNhapHang">
                        <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                        Phiếu nhập hàng
                    </a>
                    <a class="nav-link" href="${pageContext.request.contextPath}/View/NhanVien/PhieuXuatHang">
                        <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                        Phiếu xuất hàng
                    </a>
                    <a class="nav-link" href="${pageContext.request.contextPath}/KiemKeNV">
                        <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                        Kiểm kê hàng hóa
                    </a><a class="nav-link" href="${pageContext.request.contextPath}/nvthongtincanhan">
                    <div class="sb-nav-link-icon">
                        <i class="fa fa-user" aria-hidden="true"></i>
                    </div> Thông tin cá nhân
                </a>
                </div>
            </div>
        </nav>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath}/Static/js/scripts.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath}/Static/assets/demo/chart-area-demo.js"></script>
<script src="${pageContext.request.contextPath}/Static/assets/demo/chart-bar-demo.js"></script>
<script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js" crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath}/Static/assets/demo/datatables-demo.js"></script>
</body>
</html>

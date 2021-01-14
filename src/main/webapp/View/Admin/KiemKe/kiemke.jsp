<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>
    <title>Kiểm kê</title>
    <link href="${pageContext.request.contextPath}/View/Static/css/styles.css" rel="stylesheet"/>
    <style>
        .modal {
            backdrop-filter: brightness(60%);
            position: fixed;
            top: 0;
            right: 0;
            bottom: 0;
            left: 0;
            z-index: 10;
            display: flex;
            align-items: center;
            justify-content: center;
            visibility: hidden;
        }

        .modal:target {
            visibility: visible;
        }

        input {
            border: none;
            border-bottom: 1px solid slategray;
            border-radius: 0px;
        }

        input:focus {
            outline: none;
        }
    </style>
    <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet"
          crossorigin="anonymous"/>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/js/all.min.js"
            crossorigin="anonymous"></script>
</head>
<body class="sb-nav-fixed">
<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
    <a class="navbar-brand" href="${pageContext.request.contextPath}/View/Admin/index.jsp">Quản lý kho hàng</a>
    <button class="btn btn-link btn-sm order-1 order-lg-0" id="sidebarToggle" href="#"><i class="fas fa-bars"></i>
    </button>
    <!-- Navbar Search-->
    <form class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
<%--        <div class="input-group">--%>
<%--            <input class="form-control" type="text" placeholder="Search for..." aria-label="Search"--%>
<%--                   aria-describedby="basic-addon2"/>--%>
<%--            <div class="input-group-append">--%>
<%--                <button class="btn btn-primary" type="button"><i class="fas fa-search"></i></button>--%>
<%--            </div>--%>
<%--        </div>--%>
    </form>
    <!-- Navbar-->
    <ul class="navbar-nav ml-auto ml-md-0">
        <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" id="userDropdown" href="#" role="button" data-toggle="dropdown"
               aria-haspopup="true" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="${pageContext.request.contextPath}/Login?Logout=true">Logout</a>
            </div>
        </li>
    </ul>
</nav>
<div id="layoutSidenav">
    <div id="layoutSidenav_nav">
        <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
            <div class="sb-sidenav-menu">
                <div class="nav">
                    <div class="sb-sidenav-menu-heading"></div>
                    <a class="nav-link" href="${pageContext.request.contextPath}/View/Admin/index.jsp">
                        <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                        Trang chủ
                    </a>

                    <div class="sb-sidenav-menu-heading">Quản lý</div>

                    <a class="nav-link" href="${pageContext.request.contextPath}/APhieuNhapHang">
                        <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                        Nhập hàng
                    </a>

                    <a class="nav-link" href="${pageContext.request.contextPath}/PhieuXuatHang">
                        <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                        Xuất hàng
                    </a>

                    <a class="nav-link" href="${pageContext.request.contextPath}/MatHang">
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
                    <a class="nav-link" href="${pageContext.request.contextPath}/ThongKe">
                        <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                        Thống kê
                    </a>
                    <a class="nav-link" href="${pageContext.request.contextPath}/QuanLyNhanVien">
                        <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                        Quản lý nhân viên
                    </a>
                    <a class="nav-link" href="${pageContext.request.contextPath}/ThongTinCaNhan">
                        <div class="sb-nav-link-icon">
                            <i class="fa fa-user" aria-hidden="true"></i></div>
                        Thông tin cá nhân
                    </a>
                </div>
            </div>
        </nav>
    </div>
    <div id="layoutSidenav_content">
        <main>
            <div class="container-fluid">
                <h1 class="mt-4">Kiểm kê</h1>
                <ol class="breadcrumb mb-4">
                    <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/View/Admin/index.jsp">Trang chủ</a></li>
                    <li class="breadcrumb-item active">Kiểm kê</li>
                </ol>
                <div class="card mb-4">
                    <div class="card-header">
                        <i class="fas fa-table mr-1"></i>
                        Kiểm kê
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-borderless" id="dataTable" width="100%" cellspacing="0">
                                <th><a href="#kiemke-modal2">Kiểm kê toàn bộ</a></th>
                                <th><a href="#kiemke-modal3">Kiểm kê theo mặt hàng</a></th>
                                <th><a href="#kiemke-modal4">Kiểm kê theo đơn nhập</a></th>
                            </table>
                        </div>
                    </div>
                    <div class="modal" id="kiemke-modal2">
                        <a style="position: absolute; width: 100%; height: 100%; cursor: default;" href="#"></a>
                        <div style="width: 30%; height: 30%; position: relative; padding: 16px; background-color: #fff;">
                            <div style="text-align: center; margin-top: 5%">Bạn muốn kiểm kê toàn bộ?</div>
                            <div style="width: 50%;margin-top: 15%; text-align: center; float: left"><input
                                    class="btn" style="margin: auto; border: none; background-color: #007bff; color: white" type="submit" onclick="KiemKeToanBo()" value="Có"></div>
                            <div style="width: 50%;margin-top: 15%; text-align: center; float: right"><input
                                    class="btn" style="margin: auto; border: none; background-color: whitesmoke; color: black" type="submit" onclick="Out()" value="Bỏ qua"></div>
                        </div>
                    </div>
                    <div class="modal" id="kiemke-modal3">
                        <a style="position: absolute; width: 100%; height: 100%; cursor: default;" href="#"></a>
                        <div style="width: 35%; position: relative; padding: 16px; background-color: #fff;">
                            <div style="margin-top: 2%">
                                Mã hàng hóa:<input style="width: 75%" type="text" id="MatHang">
                            </div>
                            <div style="width: 50%;margin-top: 5%; text-align: center; float: left"><input
                                    class="btn" style="margin: auto; border: none; background-color: #007bff; color: white" type="submit" onclick="KiemKeMatHang()" value="Xác nhận"></div>
                            <div style="width: 50%;margin-top: 5%; text-align: center; float: right"><input
                                    class="btn" style="margin: auto; border: none; background-color: whitesmoke; color: black" type="submit" onclick="Out()" value="Bỏ qua"></div>
                        </div>
                    </div>
                    <div class="modal" id="kiemke-modal4">
                        <a style="position: absolute; width: 100%; height: 100%; cursor: default;" href="#"></a>
                        <div style="width: 35%; position: relative; padding: 16px; background-color: #fff;">
                            <div style="margin-top: 2%">
                                Mã đơn nhập:<input style="width: 75%" type="text" id="DonNhap">
                            </div>
                            <div style="width: 50%;margin-top: 5%; text-align: center; float: left"><input
                                    class="btn" style="margin: auto; border: none; background-color: #007bff; color: white" type="submit" onclick="KiemKeDonNhap()" value="Xác nhận"></div>
                            <div style="width: 50%;margin-top: 5%; text-align: center; float: right"><input
                                    class="btn" style="margin: auto; border: none; background-color: whitesmoke; color: black" type="submit" onclick="Out()" value="Bỏ qua"></div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </div>
</div>
<script>
    function KiemKeToanBo(){
        var xml = new XMLHttpRequest();
        xml.onreadystatechange = function () {
            if (this.readyState == 4 && this.status == 200) {
                alert(this.responseText);
            }
        }
        xml.open("GET", "${pageContext.request.contextPath}/KiemKe?KiemKeToanBo=true", true);
        xml.send();
        document.location.href="#";
    }
    function KiemKeMatHang(){
        var MatHang = document.getElementById('MatHang').value;
        var xml = new XMLHttpRequest();
        xml.onreadystatechange = function () {
            if (this.readyState == 4 && this.status == 200) {
                alert(this.responseText);
            }
        }
        xml.open("GET", "${pageContext.request.contextPath}/KiemKe?MatHang="+MatHang, true);
        xml.send();
        document.location.href="#";
    }
    function KiemKeDonNhap(){
        var DonNhap = document.getElementById('DonNhap').value;
        var xml = new XMLHttpRequest();
        xml.onreadystatechange = function () {
            if (this.readyState == 4 && this.status == 200) {
                alert(this.responseText)
            }
        }
        xml.open("GET", "${pageContext.request.contextPath}/KiemKe?DonNhap="+DonNhap, true);
        xml.send();
        document.location.href="#";

    }
    function Out(){
        document.location.href="#";
    }
</script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
        crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath}/View/Static/js/scripts.js"></script>
<script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js" crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath}/View/Static/assets/demo/datatables-demo.js"></script>
</body>
</html>

<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 12/11/2020
  Time: 6:11 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport"
          content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>
    <title>Thông tin cá nhân</title>
    <link href="${pageContext.request.contextPath}/View/Static/css/styles.css" rel="stylesheet"/>
    <link
            href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css"
            rel="stylesheet" crossorigin="anonymous"/>
    <script
            src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/js/all.min.js"
            crossorigin="anonymous"></script>
</head>
<body class="sb-nav-fixed">
<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="slide.jsp"></jsp:include>
<div id="layoutSidenav">
    <div id="layoutSidenav_content">
        <main>
            <div class="container-fluid">
                <h1 class="mt-4">Thông tin cá nhân</h1>
                <ol class="breadcrumb mb-4">
                    <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/View/Admin/index.jsp">Trang
                        chủ</a></li>
                    <li class="breadcrumb-item active">Thông tin cá nhân</li>
                </ol>
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-body">
                                <form method="post" action="${pageContext.request.contextPath}/ThongTinCaNhan">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="row">
                                                        <div class="col-md-12">
                                                            <div class="form-group">
                                                                <label class="bmd-label-floating">Mã nhân viên</label>
                                                                <input
                                                                        type="text" class="form-control"
                                                                        value="${NhanVien.getMaNhanVien()}"
                                                                        name="MaNhanVien" readonly id="MaNhanVien">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-12">
                                                            <div class="form-group">
                                                                <label class="bmd-label-floating">Tên nhân viên</label>
                                                                <input
                                                                        type="text" class="form-control"
                                                                        value="${NhanVien.getTenNhanVien()}"
                                                                        name="TenNhanVien">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-12">
                                                            <div class="form-group">
                                                                <label class="bmd-label-floating">Tên đăng nhập</label>
                                                                <input
                                                                        type="text" class="form-control"
                                                                        value="${NhanVien.getTenDangNhap()}"
                                                                        name="TenDangNhap">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-12">
                                                            <div class="form-group">
                                                                <label class="bmd-label-floating">Quê quán</label>
                                                                <input
                                                                        type="text" class="form-control"
                                                                        value="${NhanVien.getQueQuan()}" name="QueQuan">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-12">
                                                            <div class="form-group">
                                                                <label class="bmd-label-floating">Số CMND</label> <input
                                                                    type="text" class="form-control"
                                                                    value="${NhanVien.getSo_CMND()}" name="SoCMND">
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="row">
                                                        <div class="col-md-12">
                                                            <div class="form-group">
                                                                <label class="bmd-label-floating">Email</label> <input
                                                                    type="text" class="form-control"
                                                                    value="${NhanVien.getEmail()}" name="Email">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-12">
                                                            <div class="form-group">
                                                                <label class="bmd-label-floating">Giới tính</label>
                                                                <select name="Phai">
                                                                    <c:if test="${NhanVien.getPhai().equals('Nam')}">
                                                                        <option value="Nam" selected>Nam</option>
                                                                        <option value="Nữ">Nữ</option>
                                                                    </c:if>
                                                                    <c:if test="${!NhanVien.getPhai().equals('Nam')}">
                                                                        <option value="Nam">Nam</option>
                                                                        <option value="Nữ" selected>Nữ</option>
                                                                    </c:if>
                                                                </select>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-12">
                                                            <div class="form-group">
                                                                <label class="bmd-label-floating">Số điện thoại</label>
                                                                <input
                                                                        type="text" class="form-control"
                                                                        value="${NhanVien.getSDT()}" name="SDT">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-12">
                                                            <div class="form-group">
                                                                <label class="bmd-label-floating">Ngày sinh</label>
                                                                <input
                                                                        type="date" class="form-control"
                                                                        value="${NhanVien.getNgaySinh()}"
                                                                        name="NgaySinh">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-12">
                                                            <div class="form-group">
                                                                <label class="bmd-label-floating">Chức vụ</label>
                                                                <input
                                                                        type="text" class="form-control"
                                                                        value="${NhanVien.getNhomNhanVien().getTenNhom()}"
                                                                        name="NhomNhanVien" readonly>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-12">
                                                            <div class="form-group">
                                                                <label class="bmd-label-floating">Mật khẩu</label>
                                                                <input type="password" class="form-control"
                                                                       name="MatKhauCu" id="matkhaucu"
                                                                       placeholder="Nhập mật khẩu cũ">
                                                                <input type="password" class="form-control"
                                                                       name="MatKhauMoi" id="matkhaumoi"
                                                                       placeholder="Nhập mật khẩu mới">
                                                                <input type="password" class="form-control"
                                                                       name="NhaplaiMatKhauMoi" id="matkhaumoi1"
                                                                       placeholder="Nhập lại mật khẩu mới">
                                                                <button type="button" onclick="DoiMatKhau()">Đổi mật
                                                                    khẩu
                                                                </button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <button type="submit" class="float-right btn-success">Lưu</button>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </div>
</div>
</div>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
    function DoiMatKhau() {
        var matkhaucu = document.getElementById("matkhaucu").value;
        var MatKhauMoi = document.getElementById("matkhaumoi").value;
        var MatKhauMoi1 = document.getElementById("matkhaumoi1").value;
        var xml = new XMLHttpRequest();
        xml.onreadystatechange = function () {
            if (this.readyState == 4 && this.status == 200) {
                alert(this.responseText);
            }
        }
        xml.open("POST", "${pageContext.request.contextPath}/ThongTinCaNhan?matkhaucu=" + matkhaucu + "&MatKhauMoi=" + MatKhauMoi + "&MatKhauMoi1=" + MatKhauMoi1, true);
        xml.send();
        document.getElementById("matkhaucu").value = '';
        document.getElementById("matkhaumoi").value = '';
        document.getElementById("matkhaumoi1").value = '';
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
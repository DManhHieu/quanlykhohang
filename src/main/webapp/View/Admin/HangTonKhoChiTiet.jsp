<%--
  Created by IntelliJ IDEA.
  User: Doan Hieu
  Date: 12/12/2020
  Time: 7:38 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport"
          content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Chi tiết hàng tồn kho</title>
    <link href="${pageContext.request.contextPath}/View/Static/css/styles.css" rel="stylesheet" />
    <link
            href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css"
            rel="stylesheet" crossorigin="anonymous" />
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
                <h1 class="mt-4">Chi tiết hàng tồn kho</h1>
                <ol class="breadcrumb mb-4">
                    <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/View/Admin/index.jsp">Trang chủ</a></li>
                    <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/HangTonKho">Hàng tồn kho</a></li>
                    <li class="breadcrumb-item active">Chi tiết</li>
                </ol>
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-body">
                                <form>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="row">
                                                        <div class="col-3">
                                                            <div class="form-group">
                                                                <label class="bmd-label-floating">Mã hàng hóa</label> <input
                                                                    type="text" class="form-control" value="${hanghoa.getMaHangHoa()}"  readonly >
                                                            </div>
                                                        </div>
                                                        <div class="col-3">
                                                            <div class="form-group">
                                                                <label class="bmd-label-floating">Mã mặt hàng</label> <input
                                                                    type="text" class="form-control" value="${hanghoa.getMatHang().getMaMatHang()}"  readonly >
                                                            </div>
                                                        </div>
                                                        <div class="col-3">
                                                            <div class="form-group">
                                                                <label class="bmd-label-floating">Tên mặt hàng</label> <input
                                                                    type="text" class="form-control" value="${hanghoa.getMatHang().getTenMatHang()}" readonly>
                                                            </div>
                                                        </div>
                                                        <div class="col-3">
                                                            <div class="form-group">
                                                                <label class="bmd-label-floating">Vị trí</label> <input
                                                                    type="text" class="form-control" value="${hanghoa.getViTri()}" readonly>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-3">
                                                            <div class="form-group">
                                                                <label class="bmd-label-floating">Mã phiếu nhập</label> <input
                                                                    type="text" class="form-control"  value="${hanghoa.getPhieuNhap().getMaPhieu()}" readonly>
                                                            </div>
                                                        </div>
                                                        <div class="col-3">
                                                            <div class="form-group">
                                                                <label class="bmd-label-floating">Nhập từ</label> <input
                                                                    type="text" class="form-control"  value="${hanghoa.getPhieuNhap().getNhapTu()}" readonly>
                                                            </div>
                                                        </div>
                                                        <div class="col-3">
                                                            <div class="form-group">
                                                                <label class="bmd-label-floating">Mã nhân viên nhập hàng</label> <input
                                                                    type="text" class="form-control"  value="${hanghoa.getNhanVienNhapKho().getMaNhanVien()}" readonly>
                                                            </div>
                                                        </div>
                                                        <div class="col-3">
                                                            <div class="form-group">
                                                                <label class="bmd-label-floating">Tên nhân viên nhập hàng</label> <input
                                                                    type="text" class="form-control"  value="${hanghoa.getNhanVienNhapKho().getTenNhanVien()}" readonly>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-2">
                                                            <div class="form-group">
                                                                <label class="bmd-label-floating">Tình trạng</label> <input
                                                                    type="text" class="form-control"  value="${hanghoa.getTinhTrang().getTenTinhTrang()}" readonly>
                                                            </div>
                                                        </div>
                                                        <div class="col-2">
                                                            <div class="form-group">
                                                                <label class="bmd-label-floating">Ngày kiểm kê</label> <input
                                                                    type="text" class="form-control"  value="<fmt:formatDate pattern="dd/MM/yyyy"  value = "${hanghoa.getNgay_KiemKe()}"/>" readonly>
                                                            </div>
                                                        </div>
                                                        <div class="col-2">
                                                            <div class="form-group">
                                                                <label class="bmd-label-floating">Ngày nhập kho</label> <input
                                                                    type="text" class="form-control"  value=" <fmt:formatDate pattern="dd/MM/yyyy"  value = "${hanghoa.getNgayNhapKho()}"/>" readonly>
                                                            </div>
                                                        </div>
                                                        <div class="col-2">
                                                            <div class="form-group">
                                                                <label class="bmd-label-floating">Ngày sản xuất</label> <input
                                                                    type="text" class="form-control"  value=" <fmt:formatDate pattern="dd/MM/yyyy"  value = "${hanghoa.getNgaySanXuat()}"/>" readonly>
                                                            </div>
                                                        </div>
                                                        <div class="col-2">
                                                            <div class="form-group" >
                                                                <label class="bmd-label-floating">Hạn sử dụng</label> <input
                                                                    type="text" class="form-control"  value=" <fmt:formatDate pattern="dd/MM/yyyy"  value = "${hanghoa.getHanSuDung()}"/>" readonly>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <br>
            </div>
        </main>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath}/View/Static/js/scripts.js"></script>
<script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js" crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath}/View/Static/assets/demo/datatables-demo.js"></script>
</body>
</html>

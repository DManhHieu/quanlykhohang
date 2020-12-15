<%--
  Created by IntelliJ IDEA.
  User: Doan Hieu
  Date: 12/12/2020
  Time: 1:28 PM
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
    <title>Phiếu xuất hàng mới </title>
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
                <h1 class="mt-4">Tạo mới phiếu xuất hàng</h1>
                <ol class="breadcrumb mb-4">
                    <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/View/Admin/index.jsp">Trang chủ</a></li>
                    <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/PhieuXuatHang">Phiếu xuất hàng</a></li>
                    <li class="breadcrumb-item active">Tạo mới</li>
                </ol>
            </div>
            <div class="row">
                <div class="card-body">
                    <form action="${pageContext.request.contextPath}/PhieuXuatHang/PhieuMoi" method="post">
                        <div class="row">
                            <div class="col-md-12">
                               <div class="row">
                                   <div class="col-6">
                                       <div class="form-group">
                                           <label class="bmd-label-floating">Mã phiếu</label>
                                           <input type="text" class="form-control" name="MaPhieu" placeholder="Nhập mã phiếu" value="${sessionScope.phieuxuathang.getMaPhieu()}" >
                                       </div>
                                   </div>
                                   <div class="col-6">
                                       <div class="form-group">
                                           <label class="bmd-label-floating">Ngày xuất hàng dự kiến : </label>
                                           <input type="date" class="form-control" name="NgayXuat_DuKien"  value="${sessionScope.phieuxuathang.getNgayXuat_DuKien()}">
                                       </div>
                                   </div>
                               </div>
                                <div class="row">
                                    <div class="col-6">
                                        <div class="form-group">
                                            <label class="bmd-label-floating">Bên nhận</label>
                                            <input type="text" class="form-control" name="BenNhan" placeholder="Bên nhận hàng" value="${sessionScope.phieuxuathang.getBenNhan()}" >
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="bmd-label-floating">Mô tả</label>
                                            <textarea rows="3" name="MoTa"  >
                                                ${sessionScope.phieuxuathang.getMoTa()}
                                            </textarea>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label class="bmd-label-floating">Mã hàng hóa</label>
                                    <div class="row">
                                    <input type="text" class="form-control col-6" name="MaHangHoa" placeholder="Nhập mã hàng hóa" >
                                    <button type="submit" class="btn-dark" value="AddHangHoa" name="submit" >Thêm hàng hóa</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                        <thead>
                                        <tr>
                                            <th>Mã hàng hóa</th>
                                            <th>Tên mặt hàng</th>
                                            <th>Vị trí</th>
                                            <th>Ngày kiểm kê</th>
                                            <th>Ngày sản xuất</th>
                                            <th>Hạn sử dụng</th>
                                            <th>Tình trạng</th>
                                            <th></th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${sessionScope.phieuxuathang.getHangHoas()}" var="hanghoa">
                                            <tr>
                                                <td>${hanghoa.getMaHangHoa()}</td>
                                                <td>${hanghoa.getMatHang().getTenMatHang()}</td>
                                                <td>${hanghoa.getViTri()}</td>
                                                <td> <fmt:formatDate pattern="dd/MM/yyyy"  value = "${hanghoa.getNgay_KiemKe()}"/></td>
                                                <td> <fmt:formatDate pattern="dd/MM/yyyy"  value = "${hanghoa.getNgaySanXuat()}"/></td>
                                                <td> <fmt:formatDate pattern="dd/MM/yyyy"  value = "${hanghoa.getHanSuDung()}"/></td>
                                                <td>${hanghoa.getTinhTrang().getTenTinhTrang()}</td>
                                                <td>
                                                    <input type="hidden" name="deleteID" value="${hanghoa.getMaHangHoa()}">
                                                    <button type="submit" value="Delete" name="submit" methods="post"
                                                       class="center btn-link">Xóa</button>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-6">
                                <button type="submit" class="btn-dark" value="AddPhieuXuatHang" name="submit">Tạo phiếu</button>
                            </div>
                        </div>
                    </form>
                </div>
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

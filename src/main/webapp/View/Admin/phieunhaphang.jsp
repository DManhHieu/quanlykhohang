<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 12/11/2020
  Time: 6:11 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Nhập hàng</title>
    <link href="${pageContext.request.contextPath}/View/Static/css/styles.css" rel="stylesheet" />
    <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/js/all.min.js" crossorigin="anonymous"></script>
    <link href="${pageContext.request.contextPath}/View/Static/css/thongtincanhan.css" rel="stylesheet">
</head>
<body class="sb-nav-fixed">
<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="slide.jsp"></jsp:include>
<div id="layoutSidenav">
    <div id="layoutSidenav_content">
        <main>
            <div class="container-fluid">
                <h1 class="mt-4">Phiếu nhập hàng</h1>
                <ol class="breadcrumb mb-4">
                    <li class="breadcrumb-item"><a href="index.jsp">Trang chủ</a></li>
                    <li class="breadcrumb-item active">Phiếu nhập hàng</li>
                </ol>
                <div class="card mb-4">
                </div>
                <div class="card mb-4">
                    <div class="card-header row">
                        <i class="fas fa-table mr-1"></i>
                        Bảng phiếu nhập hàng
                        <div class="row col-md-6">
                            <form action="${pageContext.request.contextPath}/APhieuNhapHang/Moi" method="post">
                                <button type="submit" style="margin-left: 85%" >Tạo đơn mới</button>
                            </form>
                        </div>
                    </div>

                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                <thead>
                                <tr>
                                    <th>Mã đơn hàng</th>
                                    <th>Mô tả</th>
                                    <th>Nhập từ</th>
                                    <th>Người tạo đơn</th>
                                    <th>Ngày tạo đơn</th>
                                    <th>Giá trị đơn hàng</th>
                                    <th></th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${PhieuHangs}" var="phieu">
                                    <tr>
                                        <td>${phieu.getMaPhieu()}</td>
                                        <td>${phieu.getMoTa()}</td>
                                        <td>${phieu.getNhapTu()}</td>
                                        <td>${phieu.getNguoiNhap().getTenNhanVien()}</td>
                                        <td><fmt:formatDate pattern="dd/MM/yyyy"  value = "${phieu.getNgayNhap()}"/></td>
                                        <td>${phieu.getMaPhieu()}</td>
                                        <td>
                                            <a href="<c:url value='/APhieuNhapHang/ChiTiet?MaPhieu=${phieu.getMaPhieu() }'/>"
                                               class="center">Chi tiết</a>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
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

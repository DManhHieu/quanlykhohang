<%--
  Created by IntelliJ IDEA.
  User: Doan Hieu
  Date: 12/12/2020
  Time: 9:25 AM
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
    <title>Xuất hàng</title>
    <link href="${pageContext.request.contextPath}/View/Static/css/styles.css" rel="stylesheet" />
    <link
            href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css"
            rel="stylesheet" crossorigin="anonymous" />
    <script
            src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/js/all.min.js"
            crossorigin="anonymous"></script>
</head>
<body  class="sb-nav-fixed">
    <jsp:include page="../header.jsp"></jsp:include>
    <jsp:include page="../slide.jsp"></jsp:include>
    <div id="layoutSidenav">
        <div id="layoutSidenav_content">
            <main>
                <div class="container-fluid">
                    <div class="card mb-4">
                        <div class="card-header">
                            <i class="fas fa-table mr-1"></i>
                            Danh sách đơn xuất hàng
                            <form method="post" action="${pageContext.request.contextPath}/PhieuXuatHang/PhieuMoi">
                                <button type="submit" class="float-right btn-success" >Tạo mới</button>
                            </form>
                        </div>

                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                    <tr>
                                        <th>Mã phiếu</th>
                                        <th>Bên nhận</th>
                                        <th>Mô tả</th>
                                        <th>Người xuất hàng</th>
                                        <th>Ngày tạo đơn</th>
                                        <th>Ngày xuất hàng dự kiến</th>
                                        <th>Ngày xuất hàng thực tế</th>
                                        <th></th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${PhieuHangs}" var="phieu">
                                        <tr>
                                            <td>${phieu.getMaPhieu()}</td>
                                            <td>${phieu.getBenNhan()}</td>
                                            <td>${phieu.getMoTa()}</td>
                                            <td>${phieu.getNguoiXuat().getTenNhanVien()}</td>
                                            <td><fmt:formatDate pattern="dd/MM/yyyy"  value = "${phieu.getNgayTao()}"/></td>
                                            <td><fmt:formatDate pattern="dd/MM/yyyy"  value = "${phieu.getNgayXuat_DuKien()}"/></td>
                                            <td><fmt:formatDate pattern="dd/MM/yyyy"  value = "${phieu.getNgayXuat_ThucTe()}"/></td>
                                            <td>
                                                <a href="<c:url value='/PhieuXuatHang/ChiTiet?MaPhieu=${phieu.getMaPhieu() }'/>"
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

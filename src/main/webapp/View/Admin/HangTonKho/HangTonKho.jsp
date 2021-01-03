<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: Doan Hieu
  Date: 12/11/2020
  Time: 3:02 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport"
          content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>
    <title>Hàng tồn kho</title>
    <link href="${pageContext.request.contextPath}/View/Static/css/styles.css" rel="stylesheet"/>
    <link
            href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css"
            rel="stylesheet" crossorigin="anonymous"/>
    <script
            src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/js/all.min.js"
            crossorigin="anonymous"></script>
</head>
<body class="sb-nav-fixed">
<jsp:include page="../header.jsp"></jsp:include>
<jsp:include page="../slide.jsp"></jsp:include>
<div id="layoutSidenav">
    <div id="layoutSidenav_content">
        <main>
            <div class="container-fluid pd-4">
                <h1 class="mt-4">Hàng tồn kho</h1>
                <ol class="breadcrumb mb-4">
                    <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/View/Admin/index.jsp">Trang chủ</a></li>
                    <li class="breadcrumb-item active">Hàng tồn kho</li>
                </ol>
                <div class="card mb-4">
                    <div class="card-header">
                        <i class="fas fa-table mr-1"></i>
                        Bảng phiếu nhập hàng
                    </div>
                    <div class="card-body">
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
                                <c:forEach items="${hanghoas}" var="hanghoa">
                                    <tr>
                                        <td>${hanghoa.getMaHangHoa()}</td>
                                        <td>${hanghoa.getMatHang().getTenMatHang()}</td>
                                        <td>${hanghoa.getViTri()}</td>
                                        <td><fmt:formatDate pattern="dd/MM/yyyy"
                                                            value="${hanghoa.getNgay_KiemKe()}"/></td>
                                        <td><fmt:formatDate pattern="dd/MM/yyyy"
                                                            value="${hanghoa.getNgaySanXuat()}"/></td>
                                        <td><fmt:formatDate pattern="dd/MM/yyyy"
                                                            value="${hanghoa.getHanSuDung()}"/></td>
                                        <td>${hanghoa.getTinhTrang().getTenTinhTrang()}</td>
                                        <td>
                                            <a href="<c:url value='/HangTonKho/ChiTiet?MaHangHoa=${hanghoa.getMaHangHoa() }'/>"
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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
        crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath}/View/Static/js/scripts.js"></script>
<script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js" crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath}/View/Static/assets/demo/datatables-demo.js"></script>
</body>
</html>

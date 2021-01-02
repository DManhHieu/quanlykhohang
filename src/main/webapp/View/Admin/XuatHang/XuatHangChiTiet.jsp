<%--
  Created by IntelliJ IDEA.
  User: Doan Hieu
  Date: 12/12/2020
  Time: 1:28 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport"
          content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>
    <title>Chi tiết phiếu xuất hàng</title>
    <link href="${pageContext.request.contextPath}/View/Static/css/styles.css" rel="stylesheet"/>
    <link
            href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css"
            rel="stylesheet" crossorigin="anonymous"/>
    <script
            src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/js/all.min.js"
            crossorigin="anonymous"></script>
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<jsp:include page="../slide.jsp"></jsp:include>
<div id="layoutSidenav">
    <div id="layoutSidenav_content">
        <main>
            <div class="container-fluid">
                <h1 class="mt-4">Chi tiết phiếu xuất hàng</h1>
                <ol class="breadcrumb mb-4">
                    <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/View/Admin/index.jsp">Trang
                        chủ</a></li>
                    <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/PhieuXuatHang">Hàng tồn
                        kho</a></li>
                    <li class="breadcrumb-item active">Chi tiết</li>
                </ol>
            </div>
            <div class="card mb-4">
                <div class="card-header">
                    <i class="fas fa-table mr-1"></i> Thông tin phiếu xuất hàng
                </div>
                <div class="table-responsive">
                    <div id="dataTable_wrapper"
                         class="dataTables_wrapper dt-bootstrap4">
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="container">
                                    <div class="row">
                                        <div class="col-md-3">
                                            <label>Mã phiếu: </label>
                                        </div>
                                        <div class="col-md-9">
                                            <label> ${phieuxuat.getMaPhieu()} </label>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-3">
                                            <label>Người xuất:</label>
                                        </div>
                                        <div class="col-md-9">
                                            <label>${phieuxuat.getNguoiXuat().getTenNhanVien()} </label>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-3">
                                            <label>Bên nhận: </label>
                                        </div>
                                        <div class="col-md-9">
                                            <label>${phieuxuat.getBenNhan()}</label>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-3">
                                            <label>Ngày tạo:</label>
                                        </div>
                                        <div class="col-md-9">
                                            <label><fmt:formatDate pattern="dd/MM/yyyy"
                                                                   value="${phieuxuat.getNgayTao()}"/></label>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-3">
                                            <label>Ngày xuất hàng dự kiến:</label>
                                        </div>
                                        <div class="col-md-9">
                                            <label><fmt:formatDate pattern="dd/MM/yyyy"
                                                                   value="${phieuxuat.getNgayXuat_DuKien()}"/></label>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-3">
                                            <label>Ngày xuất hàng thực:</label>
                                        </div>
                                        <div class="col-md-9">
                                            <c:if test="${phieuxuat.getNgayXuat_ThucTe()!=null}">
                                                <label><fmt:formatDate pattern="dd/MM/yyyy"
                                                                       value="${phieuxuat.getNgayXuat_ThucTe()}"/></label>
                                            </c:if>
                                            <c:if test="${phieuxuat.getNgayXuat_ThucTe()==null}">
                                                <form action="${pageContext.request.contextPath}/PhieuXuatHang/ChiTiet"
                                                      method="post">
                                                    <input type="date" value="${phieuxuat.getNgayXuat_ThucTe()}"
                                                           name="ngayxuat">
                                                    <input type="hidden" value="${phieuxuat.getMaPhieu()}"
                                                           name="MaPhieu">
                                                    <button type="submit" class="btn-dark">Lưu</button>
                                                </form>
                                            </c:if>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="table-responsive">
                                                <table class="table table-bordered" id="dataTable" width="100%"
                                                       cellspacing="0">
                                                    <thead>
                                                    <tr>
                                                        <th>Mã hàng hóa</th>
                                                        <th>Tên mặt hàng</th>
                                                        <th>Ngày sản xuất</th>
                                                        <th>Hạn sử dụng</th>
                                                        <th>Tình trạng</th>
                                                    </tr>
                                                    </thead>
                                                    <tbody>
                                                    <c:forEach items="${phieuxuat.getHangHoas()}" var="hanghoa">
                                                        <tr>
                                                            <td>${hanghoa.getMaHangHoa()}</td>
                                                            <td>${hanghoa.getMatHang().getTenMatHang()}</td>
                                                            <td><fmt:formatDate pattern="dd/MM/yyyy"
                                                                                value="${hanghoa.getNgaySanXuat()}"/></td>
                                                            <td><fmt:formatDate pattern="dd/MM/yyyy"
                                                                                value="${hanghoa.getHanSuDung()}"/></td>
                                                            <td>${hanghoa.getTinhTrang().getTenTinhTrang()}</td>
                                                        </tr>
                                                    </c:forEach>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
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

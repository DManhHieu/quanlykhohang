<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Tables - SB Admin</title>
    <link href="${pageContext.request.contextPath}/View/Static/css/styles.css" rel="stylesheet" />
    <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/js/all.min.js" crossorigin="anonymous"></script>
</head>
<body class="sb-nav-fixed">
<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="slide.jsp"></jsp:include>
<div id="layoutSidenav">
    <div id="layoutSidenav_content">
        <main>
            <div class="container-fluid">
                <h1 class="mt-4">Phiếu kiểm kê hàng hóa</h1>
                <ol class="breadcrumb mb-4">
                    <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/View/NhanVien/index.jsp">Trang chủ</a></li>
                    <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/KiemKeNV">Hàng hóa kiểm kê</a></li>
                    <li class="breadcrumb-item active">Chỉnh sửa hàng kiểm kê</li>
                </ol>
                <div class="card mb-4">
                </div>
                <div class="card mb-4">
                    <div class="card-header">
                        Chỉnh sửa hàng hóa
                    </div>
                    <div class="card-body">
                        <div>
                            <form action="kiemke_capnhat" method="post">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="bmd-label-floating"><strong>Mã hàng hóa</strong></label>
                                            <input type="text" name="mahanghoa" class="form-control" value="${hanghoa.getMaHangHoa()}" readonly>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="bmd-label-floating"><strong>Tên hàng hóa</strong></label>
                                            <input type="text" class="form-control" value="${hanghoa.getMatHang().getTenMatHang()}" readonly>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="bmd-label-floating"><strong>Vị trí</strong></label>
                                            <input type="text" name="vitri" class="form-control" value="${hanghoa.getViTri()}">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="bmd-label-floating" style="display: block"><strong>Tình trạng</strong></label>
                                            <select size="1" name="tinhtrang" class="form-control">
                                                <option value="0" ${hanghoa.getTinhTrang().getMaTinhTrang() == 0 ? "selected" : ""}>Hỏng</option>
                                                <option value="1" ${hanghoa.getTinhTrang().getMaTinhTrang() == 1 ? "selected" : ""}>Tốt</option>
                                                <option value="2" ${hanghoa.getTinhTrang().getMaTinhTrang() == 2 ? "selected" : ""}>Cần kiểm tra</option>
                                                <option value="3" ${hanghoa.getTinhTrang().getMaTinhTrang() == 3 ? "selected" : ""}>Trung bình</option>
                                                <option value="4" ${hanghoa.getTinhTrang().getMaTinhTrang() == 4 ? "selected" : ""}>Hỏng, sau khi kiểm tra</option>
                                                <option value="5" ${hanghoa.getTinhTrang().getMaTinhTrang() == 5 ? "selected" : ""}>Đã lấy</option>
                                                <option value="6" ${hanghoa.getTinhTrang().getMaTinhTrang() == 6 ? "selected" : ""}>Đã xuất hàng</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="w-100">
                                    <button type="submit" class="btn btn-primary float-right" style="margin-right:10px;margin-left: 13px;" value="capnhat" name="submit">Cập nhật</button>
                                    <button type="reset" class="btn btn-primary float-right" style="margin-left:10px" name="submit" value="huy" onclick="thongbaohuybo()">Hủy</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </div>
</div>
<script>
    function thongbaohuybo(){
        alert("Hủy bỏ cập nhật");
    }
</script>
</body>
</html>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="../Static/js/scripts.js"></script>
<script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js" crossorigin="anonymous"></script>
<script src="../Static/assets/demo/datatables-demo.js"></script>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<html>
<head>
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="viewport"
		  content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	<meta name="description" content="" />
	<meta name="author" content="" />
	<title>Chi tiết phiếu nhập hàng</title>
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
				<h1 class="mt-4">Phiếu xuất hàng</h1>
				<ol class="breadcrumb mb-4">
					<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/View/NhanVien/index.jsp">Trang chủ</a></li>
					<li class="breadcrumb-item"> <a href="${pageContext.request.contextPath}/View/NhanVien/PhieuXuatHang">Phiếu xuất hàng</a></li>
					<li class="breadcrumb-item active">Chi tiết phiếu xuất hàng</li>
				</ol>
				<div class="row">
					<div class="col-md-12">
						<div class="card">
							<div class="card-header">
								<i class="fas fa-table mr-1"></i> Bảng phiếu xuất hàng
							</div>
							<div class="card-body">
								<form>
									<div class="row">
										<div class="col-md-12">
											<div class="row">
												<div class="col-md-6">
													<div class="row">
														<div class="col-md-6">
															<div class="form-group">
																<label class="bmd-label-floating">Mã đơn hàng</label> <input
																	type="text" value="<c:out value="${phieuxuathang.getMaPhieu()}" />"class="form-control">
															</div>
														</div>
														<div class="col-md-6">
															<div class="form-group">
																<label class="bmd-label-floating">Ngày xuất hàng</label>
																<input type="text" value="<fmt:formatDate pattern="dd/MM/yyyy" value = "${phieuxuathang.getNgayXuat_DuKien()}" />" class="form-control">
															</div>
														</div>
													</div>
													<div class="row">
														<div class="col-md-6">
															<div class="form-group">
																<label class="bmd-label-floating">Tìm kiếm</label> <input
																	type="text" class="form-control">
															</div>
														</div>
														<div class="col-md-6">
															<div class="form-group">
																<label class="bmd-label-floating">Người tạo</label>
																<input type="text" value="<c:out value="${phieuxuathang.getNguoiXuat().getTenNhanVien()}" />" class="form-control">
															</div>
														</div>
													</div>
												</div>
												<div class="col-md-6">
													<div class="form-group">
														<label class="bmd-label-floating">Mô tả</label>
													</div>
													<textarea rows="6">
														${phieuxuathang.getMoTa()}
													</textarea>
												</div>
											</div>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
				<div class="card mb-4">
					<div class="card-body">
						<div class="table-responsive">
							<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
								<thead>
								<tr>
									<th>Mã hàng hóa</th>
									<th>Tên mặt hàng</th>
									<th>Vị trí</th>
									<th>Tình trạng</th>
									<th></th>
								</tr>
								</thead>
								<tbody>
								<c:forEach items="${phieuxuathang.getHangHoas()}" var="hangxuat">
									<tr>
										<td>${hangxuat.getMaHangHoa()}</td>
										<td>${hangxuat.getMatHang().getMaMatHang()}</td>
										<td>${hangxuat.getViTri()}</td>
										<form action="${pageContext.request.contextPath}/View/NhanVien/PhieuXuatCapNhat" method="post">
											<td>
												<select size="1" name="tinhtrang" id="tinhtrang" style="width: 180px; margin-right: 0px; margin-left: 0px">
													<option value ="0"  ${hangxuat.getTinhTrang().getMaTinhTrang() == 0 ? "selected" : ""}>Hỏng</option>
													<option value ="1"  ${hangxuat.getTinhTrang().getMaTinhTrang() == 1 ? "selected" : ""}>Tốt</option>
													<option value ="2"  ${hangxuat.getTinhTrang().getMaTinhTrang() == 2 ? "selected" : ""}>Cần kiểm tra</option>
													<option value ="3"  ${hangxuat.getTinhTrang().getMaTinhTrang() == 3 ? "selected" : ""}>Trung bình</option>
													<option value ="4"  ${hangxuat.getTinhTrang().getMaTinhTrang() == 4 ? "selected" : ""}>Hỏng, sau khi kiểm tra</option>
													<option value ="5"  ${hangxuat.getTinhTrang().getMaTinhTrang() == 5 ? "selected" : ""}>Đã lấy</option>
													<option value ="6"  ${hangxuat.getTinhTrang().getMaTinhTrang() == 1 ? "selected" : ""}>Đã xuất hàng</option>
												</select>
											</td>
											<td width="200px">
												<input type="hidden" name="mahanghoa" value="${hangxuat.getMaHangHoa()}">
												<input type="hidden" name="maphieuxuat" value="${phieuxuathang.getMaPhieu()}">
												<input type="submit" value="Cập nhật" style="width: 80px">
												<input type="reset" value="Hủy bỏ" style="width: 80px" onclick="thongbaohuybo()">
											</td>
										</form>
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
<script>
	function thongbaohuybo(){
		alert("Hủy bỏ cập nhật");
	}
</script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="../Static/js/scripts.js"></script>
<script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js" crossorigin="anonymous"></script>
</body>
</html>

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
					<h1 class="mt-4">Chi tiết phiếu nhập hàng</h1>
					<ol class="breadcrumb mb-4">
						<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/View/NhanVien/index.jsp">Trang chủ</a></li>
						<li class="breadcrumb-item active">Chi tiết phiếu nhập hàng</li>
					</ol>
					<div class="row">
						<div class="col-md-12">
							<div class="card">
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
																		type="text" value="<c:out value="${phieunhaphang.getMaPhieu()}" />" class="form-control">
																</div>
															</div>
															<div class="col-md-6">
																<div class="form-group">
																	<label class="bmd-label-floating">Người tạo</label> <input
																		type="text" value="<c:out value="${phieunhaphang.getNguoiNhap().getTenNhanVien()}" />" class="form-control">
																</div>
															</div>
														</div>
														<div class="row">
															<div class="col-md-6">
																<div class="form-group">
																	<label class="bmd-label-floating">Nhập từ</label> <input
																		type="text" value="<c:out value="${phieunhaphang.getNhapTu()}" />"  class="form-control">
																</div>
															</div>
															<div class="col-md-6">
																<div class="form-group">
																	<label class="bmd-label-floating">Ngày tạo</label> <input
																		type="text" value="<fmt:formatDate pattern="dd/MM/yyyy" value = "${phieunhaphang.getNgayNhap()}" />" class="form-control">
																</div>
															</div>
														</div>
													</div>
													<div class="col-md-6">
														<div class="form-group">
															<label class="bmd-label-floating">Mô tả </label>
														</div>
														<textarea rows="6">
															${phieunhaphang.getNhapTu()}
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
						<div class="card-header">
							<i class="fas fa-table mr-1"></i> Bảng phiếu nhập hàng
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-bordered" id="dataTable" width="100%"
									cellspacing="0">
									<thead>
										<tr>
											<th>Mã mặt hàng</th>
											<th>Tên mặt hàng</th>
											<th>Số lượng</th>
										</tr>
									</thead>
									<tbody>
									<c:forEach items="${phieunhaphang.getHangNhaps()}" var="hangnhap">

									</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<div class="card">
								<div class="card-body">
									<form>
										<div class="row">
											<div class="col-md-2">
												<div class="form-group">
													<label class="bmd-label-floating">Mã mặt hàng</label> <input
														type="text" class="form-control">
												</div>
											</div>
											<div class="col-md-3">
												<div class="form-group">
													<label class="bmd-label-floating">Ngày sản xuất</label> <input
														type="date" class="form-control">
												</div>
											</div>
											<div class="col-md-3">
												<div class="form-group">
													<label class="bmd-label-floating">Vị trí</label> <input
														type="text" class="form-control">
												</div>
											</div>
											<div class="col-md-3">
												<div class="form-group">
													<label class="bmd-label-floating">Nhân viên nhập
														kho</label> <input type="text" class="form-control">
												</div>
											</div>
										</div>

										<div class="row">
											<div class="col-md-2">
												<div class="form-group">
													<label class="bmd-label-floating">Mã hàng hóa</label> <input
														type="text" class="form-control">
												</div>
											</div>
											<div class="col-md-3">
												<div class="form-group">
													<label class="bmd-label-floating">Hạn sử dụng</label> <input
														type="date" class="form-control">
												</div>
											</div>
											<div class="col-md-3">
												<label class="bmd-label-floating">Tình trạng</label> <select
													class="form-control" id="exampleFormControlSelect1">
													<option>1</option>
													<option>2</option>
													<option>3</option>
													<option>4</option>
													<option>5</option>
												</select>
											</div>
											<div class="col-md-3">
												<div class="form-group">
													<label class="bmd-label-floating">Ngày nhập kho</label> <input
														type="date" class="form-control">
												</div>
											</div>
											<div class="col-md-2">
												<button type="button" class="btn btn-primary pull-right">Lưu</button>
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

	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="../Static/js/scripts.js"></script>
	<script
		src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js"
		crossorigin="anonymous"></script>
</body>
</html>

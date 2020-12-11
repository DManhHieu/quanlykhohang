<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Tables - SB Admin</title>
<link href="../Static/css/styles.css" rel="stylesheet" />
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
						<li class="breadcrumb-item"><a href="index.jsp">Trang chủ</a></li>
						<li class="breadcrumb-item active">Phiếu xuất hàng</li>
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
																		type="text" class="form-control">
																</div>
															</div>
															<div class="col-md-6">
																<div class="form-group">
																	<label class="bmd-label-floating">Ngày xuất
																		hàng</label> <input type="date" class="form-control">
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
																	<label class="bmd-label-floating">Người tạo</label> <input
																		type="text" class="form-control">
																</div>
															</div>
														</div>
													</div>
													<div class="col-md-6">
														<div class="form-group">
															<label class="bmd-label-floating">Mô tả sản phẩm</label>
														</div>
														<textarea rows="6">  
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
							<i class="fas fa-table mr-1"></i> Bảng phiếu xuất hàng
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-bordered" id="dataTable" width="100%"
									cellspacing="0">
									<thead>
										<tr>
											<th>Mã đơn hàng</th>
											<th>Tên mặt hàng</th>
											<th>Vị trí</th>
											<th>Tình trạng</th>
										</tr>
									</thead>
									<tfoot>
										<tr>
											<th>Mã đơn hàng</th>
											<th>Tên mặt hàng</th>
											<th>Vị trí</th>
											<th>Tình trạng</th>
										</tr>
									</tfoot>
									<tr>
										<td>A1</td>
										<td>Hàng china</td>
										<td>Sang</td>
										<td><select class="form-control"
											id="exampleFormControlSelect1">
												<option>1</option>
												<option>2</option>
												<option>3</option>
												<option>4</option>
												<option>5</option>
										</select></td>
									</tr>
									<tr>
										<td>A2</td>
										<td>Hàng china</td>
										<td>HÙng</td>
										<td><select class="form-control"
											id="exampleFormControlSelect1">
												<option>1</option>
												<option>2</option>
												<option>3</option>
												<option>4</option>
												<option>5</option>
										</select></td>
									</tr>
									<td>A3</td>
									<td>Hàng china</td>
									<td>Hiếu</td>
									<td><select class="form-control"
										id="exampleFormControlSelect1">
											<option>1</option>
											<option>2</option>
											<option>3</option>
											<option>4</option>
											<option>5</option>
									</select></td>
									</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
				<button type="button" class="btn btn-primary pull-right"
					style="margin-left: 80%; margin-bottom: 10px;">
					<a href="./phieunhaphang.jsp"></a>Xác nhận
				</button>
				<button type="button" class="btn btn-primary pull-right"
					style="margin-left: 20px; margin-bottom: 10px;">
					<a href="./phieunhaphang.jsp"></a>Hủy bỏ
				</button>
			</main>
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

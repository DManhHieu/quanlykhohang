<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>Quản lí sản phẩm</title>
<meta content='width=device-width, initial-scale=1.0, shrink-to-fit=no'
	name='viewport' />
<!--     Fonts and icons     -->
<link rel="stylesheet" type="text/css"
	href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
<!-- CSS Files -->
<link href="${pageContext.request.contextPath}/View/Static/css/styles.css" rel="stylesheet" />
</head>
<body class="">
	<div class="wrapper ">
		<div class="main-panel">
			<div class="content">
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-6  align-self-sm-end">
							<div class="border__button">
								<button class="border__button--button" type="button"
									data-toggle="modal" data-target=".bs-example-modal-lg">Thêm</button>
								<button class="border__button--button">Xóa</button>
								<button class="border__button--button" type="button"
									data-toggle="modal" data-target=".bs-example-modal-lg">Chỉnh
									sửa</button>
								<button class="border__button--buttonadd" type="button"
									data-toggle="modal" data-target=".bs-example-modal">Thêm
									nhà sản xuất</button>
							</div>
						</div>
						<div class="modal fade bs-example-modal-lg" tabindex="-1"
							role="dialog" aria-labelledby="myLargeModalLabel">
							<div class="ttt">
								<div class="container">
									<div class="row">
										<div class="col-md-12">
											<div class="card">
												<div class="card-header card-header-primary">
													<h4 class="card-title">Thông tin chi tiết sản phẩm</h4>
												</div>
												<div class="card-body">
													<form>
														<div class="row">
															<div class="col-md-6">
																<div class="row">
																	<div class="product-detail">
																		<img src="../Static/img/son.jpg" alt="Product Image"
																			width="300px" height="300px">
																		<button type="button" class="btn btn-primary addimg">Chọn
																			ảnh</button>
																	</div>
																</div>
																<br>
																<div class="row">
																	<div class="product-detail">
																		<img src="../Static/img/son.jpg" alt="Product Image"
																			width="300px" height="300px">
																		<button type="button" class="btn btn-primary addimg">Chọn
																			ảnh</button>
																	</div>
																</div>
															</div>
															<div class="col-md-6">
																<div class="row">
																	<div class="col-md-12">
																		<div class="form-group">
																			<label class="bmd-label-floating">Tên sản
																				phẩm</label> <input type="text" class="form-control">
																		</div>
																	</div>

																</div>
																<div class="row">
																	<div class="col-md-8">
																		<div class="form-group">
																			<label class="bmd-label-floating">Nhà sản
																				xuất</label> <input type="text" class="form-control">
																		</div>
																	</div>
																</div>
																<div class="row">
																	<div class="col-md-6">
																		<div class="form-group">
																			<label class="bmd-label-floating">Giá</label> <input
																				type="text" class="form-control">
																		</div>
																	</div>
																	<div class="col-md-6">
																		<div class="form-group">
																			<label class="bmd-label-floating">Số lượng</label> <input
																				type="text" class="form-control">
																		</div>
																	</div>
																</div>
																<div class="row">
																	<div class="col-md-12">
																		<div class="form-group">
																			<label class="bmd-label-floating">Mô tả sản
																				phẩm</label>
																		</div>
																		<textarea rows="10">  
                                                                  </textarea>
																		<hr>
																		<button type="submit"
																			class="btn btn-primary pull-right">Cập nhật
																			thông tin</button>
																		<button type="submit"
																			class="btn btn-primary pull-right">Hủy</button>
																	</div>
																</div>
															</div>
														</div>
													</form>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="modal fade bs-example-modal" tabindex="-1"
							role="dialog" aria-labelledby="myLargeModalLabel">
							<div class="ttt1">
								<div class="container">
									<div class="row">
										<div class="col-md-12">
											<div class="card">
												<div class="card-header card-header-primary">
													<h4 class="card-title">Thêm nhà sản xuất</h4>
												</div>
												<div class="card-body">
													<form>
														<div class="col-md-12">
															<div class="row">
																<div class="col-md-12">
																	<div class="form-group">
																		<label class="bmd-label-floating">Nhà sản xuất</label>
																		<input type="text" class="form-control">
																	</div>
																</div>
															</div>
															<button type="submit" class="btn btn-primary pull-right">Thêm</button>
															<button type="submit" class="btn btn-primary pull-right">Hủy</button>
														</div>
												</div>
											</div>
										</div>
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
		crossorigin="anonymous"></script>
	<script src="js/bootstrap.js"></script>
</body>

</html>
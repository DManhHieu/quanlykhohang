<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Dashboard - SB Admin</title>
    <link href="../Static/css/styles.css" rel="stylesheet" />
    <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/js/all.min.js" crossorigin="anonymous"></script>
    <link href="../Static/css/thongtincanhan.css" rel="stylesheet">
</head>
<body class="sb-nav-fixed">
    	<jsp:include page="header.jsp"></jsp:include>
	<jsp:include page="slide.jsp"></jsp:include>
<div id="layoutSidenav">
    <div id="layoutSidenav_content">
        <main>
            <div class="container-fluid">
                <h1 class="mt-4">Thông tin cá nhân</h1>
                <ol class="breadcrumb mb-4">
                    <li class="breadcrumb-item"><a href="index.html">Trang chủ</a></li>
                    <li class="breadcrumb-item active">Thông tin cá nhân</li>
                </ol>
                <div class="card mb-4">
                </div>
                <div class="card mb-4">
                    <div class="card-header">
                        <i class="fas fa-table mr-1"></i>
                        Thông tin cá nhân
                    </div>
                    <div class="table-responsive">
                        <div id="dataTable_wrapper" class="dataTables_wrapper dt-bootstrap4">
                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="container">
                                        <form action="/action_page.php">
                                            <div class="row">
                                                <div class="col-25">
                                                    <label for="maNhanVien">Mã nhân viên</label>
                                                </div>
                                                <div class="col-75">
                                                    <input type="text" id="maNhanVien" name="maNhanVien" placeholder="Enter employee code..." value="18110296" readonly="">
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-25">
                                                    <label for="nameEmployee">Họ tên</label>
                                                </div>
                                                <div class="col-75">
                                                    <input type="text" id="nameEmployee" name="nameEmployee" placeholder="Your last name.." value="Hoàng Dương Hùng" readonly="">
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-25">
                                                    <label for="username">Tên đăng nhập</label>
                                                </div>
                                                <div class="col-75">
                                                    <input type="text" id="username" name="username" placeholder="Enter username..." value="hungcr" readonly="">
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-25">
                                                    <label for="password">Mật khẩu</label>
                                                </div>
                                                <div class="col-75">
                                                    <input type="password" id="password" name="password" placeholder="Enter password..." value="minhle" readonly="">
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-25">
                                                    <label for="sđt">Số điện thoại</label>
                                                </div>
                                                <div class="col-75">
                                                    <input type="text" id="sđt" name="sđt" placeholder="Enter numberphone..." value="0962357623" readonly="">
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-25">
                                                    <label for="email">Email</label>
                                                </div>
                                                <div class="col-75">
                                                    <input type="text" id="email" name="email" placeholder="Enter email..." value="hungduong.mess32@gmail.com" readonly="">
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-25">
                                                    <label for="date">Ngày sinh</label>
                                                </div>
                                                <div class="col-75">
                                                    <input type="date" id="date" name="date" placeholder="Enter your date of birth" value="2000-07-10" readonly="">
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-25">
                                                    <label for="cmnd">Số CMND</label>
                                                </div>
                                                <div class="col-75">
                                                    <input type="text" id="cmnd" name="cmnd" placeholder="Enter ID cards ..." value="04148484848484" readonly="">
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-25">
                                                    <label for="nameCountry">Tỉnh/thành phô</label>
                                                </div>
                                                <div class="col-75">
                                                    <input type="text" id="nameCountry" name="nameCountry" placeholder="Your province.." value="Quảng Bình" readonly="">
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-25">
                                                    <label for="quocgia">Quốc gia</label>
                                                </div>
                                                <div class="col-75">
                                                    <select id="quocgia" name="quocgia">
                                                        <option value="usa">VietNam</option>
                                                        <option value="australia">Australia</option>
                                                        <option value="canada">Canada</option>
                                                        <option value="usa">USA</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <a href="editthongtincanhan.jsp"><input type="button" value="Edit"></a>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>

            </div>
        </main>
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="../Static/js/scripts.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
    <script src="../Static/assets/demo/chart-area-demo.js"></script>
    <script src="../Static/assets/demo/chart-bar-demo.js"></script>
    <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>
    <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js" crossorigin="anonymous"></script>
    <script src="../Static/assets/demo/datatables-demo.js"></script>
</div>
</body>
</html>

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
        <title>Tables - SB Admin</title>
        <link href="../Static/css/styles.css" rel="stylesheet" />
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
                        <h1 class="mt-4">Phiếu xuất hàng</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item"><a href="index.jsp">Trang chủ</a></li>
                            <li class="breadcrumb-item active">Phiếu xuất hàng</li>
                        </ol>
                        <div class="card mb-4">
                        <!--     <div class="card-body">
                                DataTables is a third party plugin that is used to generate the demo table below. For more information about DataTables, please visit the
                                <a target="_blank" href="https://datatables.net/">official DataTables documentation</a>
                                .
                            </div> -->
                        </div>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table mr-1"></i>
                                Bảng phiếu xuất hàng
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                        <thead>
                                            <tr>
                                                <th>Mã đơn hàng</th>
                                                <th>Mô tả</th>
                                                <th>Ngày xuất hàng</th>
                                                <th>Người tạo đơn</th>
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tfoot>
                                            <tr>
                                                <th>Mã đơn hàng</th>
                                                <th>Mô tả</th>
                                                <th>Ngày xuất hàng</th>
                                                <th>Người tạo đơn</th>
                                                <th></th>
                                            </tr>
                                        </tfoot>
                                         <tr>
                                            <td>A1</td>
                                            <td>Hàng china</td>
                                            <td>Sang</td>
                                            <td>20/20/2020</td>
                                            <td><a href="chitietxuathang.jsp">Chi tiết</a></td>
                                        </tr>
                                        <tr>
                                            <td>A2</td>
                                            <td>Hàng china</td>
                                            <td>HÙng</td>
                                            <td>20/20/2020</td>
                                            <td><a href="chitietxuathang.jsp">Chi tiết</a></td>
                                        </tr>
                                            <td>A3</td>
                                            <td>Hàng china</td>
                                            <td>Hiếu</td>
                                            <td>20/20/2020</td>
                                            <td><a
										href="chitietxuathang.jsp">Chi tiết</a></td>
                                        </tr>
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
        <script src="../Static/js/scripts.js"></script>
        <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js" crossorigin="anonymous"></script>
        <script src="../Static/assets/demo/datatables-demo.js"></script>
    </body>
</html>

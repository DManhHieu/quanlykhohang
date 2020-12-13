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
                            <li class="breadcrumb-item"><a
							href="${pageContext.request.contextPath}/View/NhanVien/index.jsp">Trang chủ</a></li>
                            <li class="breadcrumb-item active">Kiểm kê hàng hóa</li>
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
                                Bảng kiểm kê hàng hóa
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                        <thead>
                                            <tr>
                                                <th>Mã hàng hóa</th>
                                                <th>Tên hàng hóa</th>
                                                <th>Vị trí</th>
                                                <th>Tình trạng</th>
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tfoot>
                                            <tr>
                                                <th>Mã hàng hóa</th>
                                                <th>Tên hàng hóa</th>
                                                <th>Vị trí</th>
                                                <th>Tình trạng</th>
                                                <th></th>
                                            </tr>
                                           
                                        </tfoot>
                                        <tbody>
                                             <tr>
                                                <td></td>
                                                <td></td>
                                                <td><!-- <input type="text" name="viTri" style="border: none; width: 100%"> --></td>
                                                <td><!-- <input type="text" name="tinhTrang" style="border: none; width: 100%"> --></td>
                                                <td><button data-toggle="modal" data-target=".bs-example-modal-lg">Edit</button></td>
                                            </tr>
                                        </tbody>
                                    </table>

                                </div>
                            </div>
                        </div>
                    </div>
                </main>
                
                <div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" style="margin-top: 20px;">
                    <div class="ttt"  >
                      <div class="container">
                          <div class="row">
                              <div class="col-md-12">
                                  <div class="card">
                                      <div class="card-header card-header-primary">
                                          <h4 class="card-title">Kiểm kê hàng hóa</h4>
                                      </div>
                                      <div class="card-body">
                                          <form>
                                              <div class="row">
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label class="bmd-label-floating">Mã hàng hóa</label>
                                                        <input type="text" class="form-control">
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                  <div class="form-group">
                                                      <label class="bmd-label-floating">Tên hàng hóa</label>
                                                      <input type="text" class="form-control">
                                                  </div>
                                                </div>
                                              </div>
                                                <div class="row">
                                                  <div class="col-md-6">
                                                      <div class="form-group">
                                                          <label class="bmd-label-floating">Vị trí</label>
                                                          <input type="text" class="form-control">
                                                      </div>
                                                  </div>
                                                  <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label class="bmd-label-floating">Tình trạng</label>
                                                        <input type="text" class="form-control">
                                                    </div>
                                                  </div>
                                                </div>
                                                  <div class="row">
                                                    <button type="submit" class="btn btn-primary pull-right">Cập nhật</button>
                                                    <button type="submit" class="btn btn-primary pull-right" style="margin-left: 10px;">Hủy</button>
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
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="../Static/js/scripts.js"></script>
        <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js" crossorigin="anonymous"></script>
        <script src="../Static/assets/demo/datatables-demo.js"></script>
    </body>
</html>

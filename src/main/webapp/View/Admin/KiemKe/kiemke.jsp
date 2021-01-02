<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>
    <title>Kiểm kê</title>
    <link href="${pageContext.request.contextPath}/View/Static/css/styles.css" rel="stylesheet"/>
    <style>
        .modal {
            backdrop-filter: brightness(60%);
            position: fixed;
            top: 0;
            right: 0;
            bottom: 0;
            left: 0;
            z-index: 10;
            display: flex;
            align-items: center;
            justify-content: center;
            visibility: hidden;
        }

        .modal:target {
            visibility: visible;
        }

        input {
            border: none;
            border-bottom: 1px solid slategray;
            border-radius: 0px;
        }

        input:focus {
            outline: none;
        }
    </style>
    <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet"
          crossorigin="anonymous"/>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/js/all.min.js"
            crossorigin="anonymous"></script>
</head>
<body class="sb-nav-fixed">
<jsp:include page="../header.jsp"></jsp:include>
<jsp:include page="../slide.jsp"></jsp:include>
<div id="layoutSidenav">
    <div id="layoutSidenav_content">
        <main>
            <div class="container-fluid">
                <div class="card-header">
                    <i class="fas fa-table mr-1"></i>
                    Kiểm kê
                </div>
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
                        Kiểm kê
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                <tr>
                                    <th><a href="#kiemke-modal2">Kiểm kê toàn bộ</a></th>
                                    <th><a href="#kiemke-modal3">Kiểm kê theo mặt hàng</a></th>
                                </tr>
                                <tr>
                                    <th><a href="#kiemke-modal4">Kiểm kê theo đơn nhập</a></th>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <div class="modal" id="kiemke-modal2">
                        <a style="position: absolute; width: 100%; height: 100%; cursor: default;" href="#"></a>
                        <div style="width: 30%; height: 30%; position: relative; padding: 16px; background-color: #fff;">
                            <div style="text-align: center; margin-top: 5%">Bạn muốn kiểm kê toàn bộ?</div>
                            <div style="width: 50%;margin-top: 15%; text-align: center; float: left"><input
                                    style="margin: auto; border: none" type="submit" value="Có"></div>
                            <div style="width: 50%;margin-top: 15%; text-align: center; float: right"><input
                                    style="margin: auto; border: none" type="submit" value="Bỏ qua"></div>
                        </div>
                    </div>
                    <div class="modal" id="kiemke-modal3">
                        <a style="position: absolute; width: 100%; height: 100%; cursor: default;" href="#"></a>
                        <div style="width: 35%; position: relative; padding: 16px; background-color: #fff;">
                            <div style="margin-top: 2%">
                                Mã hàng hóa:<input style="width: 75%" type="text">
                            </div>
                            <div style="width: 50%;margin-top: 5%; text-align: center; float: left"><input
                                    style="margin: auto; border: none" type="submit" value="Xác nhận"></div>
                            <div style="width: 50%;margin-top: 5%; text-align: center; float: right"><input
                                    style="margin: auto; border: none" type="submit" value="Bỏ qua"></div>
                        </div>
                    </div>
                    <div class="modal" id="kiemke-modal4">
                        <a style="position: absolute; width: 100%; height: 100%; cursor: default;" href="#"></a>
                        <div style="width: 35%; position: relative; padding: 16px; background-color: #fff;">
                            <div style="margin-top: 2%">
                                Mã đơn nhập:<input style="width: 75%" type="text">
                            </div>
                            <div style="width: 50%;margin-top: 5%; text-align: center; float: left"><input
                                    style="margin: auto; border: none" type="submit" value="Xác nhận"></div>
                            <div style="width: 50%;margin-top: 5%; text-align: center; float: right"><input
                                    style="margin: auto; border: none" type="submit" value="Bỏ qua"></div>
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

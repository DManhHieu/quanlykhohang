
<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 12/11/2020
  Time: 6:11 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
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
                <h1 class="mt-4">Tạo đơn nhập hàng</h1>
                <ol class="breadcrumb mb-4">
                    <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/View/Admin/index.jsp">Trang chủ</a></li>
                    <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/APhieuNhapHang">Phiếu nhập hàng</a></li>
                    <li class="breadcrumb-item active">Tạo đơn nhập hàng</li>
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
                                                        <div class="col-md-12">
                                                            <div class="form-group">
                                                                <label class="bmd-label-floating">Mã đơn hàng</label> <input
                                                                    type="text" class="form-control">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-12">
                                                            <div class="form-group">
                                                                <label class="bmd-label-floating">Nhập từ</label> <input
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
                    <!-- <div class="card-header">
                        <i class="fas fa-table mr-1"></i> Bảng phiếu nhập hàng
                    </div> -->
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-bordered" id="dataTable" width="100%"
                                   cellspacing="0">
                                <thead>
                                <tr>
                                    <th>Mã mặt hàng</th>
                                    <th>Tên mặt hàng</th>
                                    <th>Số lượng</th>
                                    <th>Đơn giá</th>
                                    <th></th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td><input type="text" class="form-control" id="mamathang"></td>
                                    <td><input type="text" class="form-control" ></td>
                                    <td><input type="text" class="form-control" id="soluong"></td>
                                    <td><input type="text" class="form-control"></td>
                                    <td><button type="button" onclick="AddRow()">+</button></td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-2">
                        <button type="button" class="btn btn-primary pull-right">Tạo</button>
                    </div>
                </div>
            </div>
        </main>
    </div>
</div>
</div>
<script>
    function AddRow() {
        var mathangs=[
            <c:forEach items="${mathangs}" var="mathang">
            [
                '<c:out value="${mathang.getMaMatHang()}"/>',
                '<c:out value="${mathang.getTenMatHang()}"/>',
                '<c:out value="${mathang.getGiaTri()}"/>',
            ],
            </c:forEach>
        ]
        console.log(mathangs);
        var index=-1;
        mathangs.forEach(
            element=> {
                if(element.indexOf(document.getElementById("mamathang").value)!=-1){
                    index=mathangs.indexOf(element);
                }
            }
        )
        console.log(document.getElementById("mamathang").value);
        console.log(index);
        if(index!=-1) {
            var table = document.getElementById("dataTable");
            var row = table.insertRow(table.rows.length - 1);
            var cell1 = row.insertCell(0);
            var cell2 = row.insertCell(1);
            var cell3 = row.insertCell(2);
            var cell4 = row.insertCell(3);
            var cell5 = row.insertCell(4);
            cell1.innerHTML = mathangs[index][0];
            cell2.innerHTML = mathangs[index][1];
            cell3.innerHTML = document.getElementById("soluong").value;
            cell5.innerHTML = '<button type="button" onclick="DeleteRow()">-</button>';
            table.rows[table.rows.length - 1].cells[0].innerHTML = '<input type="text" class="form-control" id="mamathang">';
            table.rows[table.rows.length - 1].cells[1].innerHTML = '<input type="text" class="form-control" >';
            table.rows[table.rows.length - 1].cells[2].innerHTML = '<input type="text" class="form-control" id="soluong">';
            table.rows[table.rows.length - 1].cells[3].innerHTML = '<input type="text" class="form-control">';
        }
    }
    function DeleteRow(x){
        var td = event.target.parentNode;
        var tr = td.parentNode; // the row to be removed
        tr.parentNode.removeChild(tr);
    }
</script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath}/View/Static/js/scripts.js"></script>
<script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js" crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath}/View/Static/assets/demo/datatables-demo.js"></script>
</body>
</html>

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
<jsp:include page="../header.jsp"></jsp:include>
<jsp:include page="../slide.jsp"></jsp:include>
<div id="layoutSidenav">
    <div id="layoutSidenav_content">
        <main>
            <div class="container-fluid pb-4">
                <h1 class="mt-4">Tạo đơn nhập hàng</h1>
                <ol class="breadcrumb mb-4">
                    <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/View/Admin/index.jsp">Trang chủ</a></li>
                    <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/APhieuNhapHang">Phiếu nhập hàng</a></li>
                    <li class="breadcrumb-item active">Tạo đơn nhập hàng</li>
                </ol>
                <form method="post" action="${pageContext.request.contextPath}/APhieuNhapHang/Moi">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-body">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="row">
                                                        <div class="col-md-12">
                                                            <div class="form-group">
                                                                <label class="bmd-label-floating">Mã đơn hàng</label> <input name="MaPhieu"
                                                                    type="text" class="form-control" value="${sessionScope.phieunhap.getMaPhieu()}">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-12">
                                                            <div class="form-group">
                                                                <label class="bmd-label-floating">Nhập từ</label> <input name="NhapTu"
                                                                    type="text" class="form-control" value="${sessionScope.phieunhap.getNhapTu()}" >
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label class="bmd-label-floating">Mô tả sản phẩm</label>
                                                    </div>
                                                    <textarea rows="6" value="${sessionScope.phieunhap.getMoTa()}" name="MoTa">
                                                          </textarea>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
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
                                <c:forEach items="${sessionScope.hangnhaps}" var="hangnhap">
                                    <tr>
                                        <td>${hangnhap.getMaMatHang()}</td>
                                        <td>${hangnhap.getTenMatHang()}</td>
                                        <td>${hangnhap.getSoluong()}</td>
                                        <td>${hangnhap.getGiaTri()}</td>
                                    </tr>
                                </c:forEach>
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
                <div class="w-100">
                    <button type="submit" style="border-radius: 5px; border: none" class="btn btn-primary float-right" name="Submit" value="Create">Tạo</button>
                </div>
                </form>
            </div>
        </main>
    </div>
</div>
</div>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
    function AddRow() {
        var mamathang=document.getElementById("mamathang").value;
        var soluong=parseInt(document.getElementById("soluong").value);
        var table = document.getElementById("dataTable");
        var index= table.rows.length-1;
        var mode=0;
        for (var r=0, n=table.rows.length;r<n;r++){
            if(table.rows[r].cells[0].innerHTML.toString().trim() === mamathang.toString().trim()){
                index=r;
                mode=1;
                break;
            }
        }
        var xml=new XMLHttpRequest();
        xml.onreadystatechange=function () {
            if (this.readyState == 4 && this.status == 200) {
                var mathang = JSON.parse(this.responseText);
                if (mathang != null) {
                    var row=null;
                    var cell1= null;
                    var cell2=null;
                    var cell3=null;
                    var cell4=null;
                    var cell5=null;
                    if(mode==1){
                        row=table[index];
                        cell1=table.rows[index].cells[0];
                        cell2=table.rows[index].cells[1];
                        cell3=table.rows[index].cells[2];
                        cell4=table.rows[index].cells[3];
                        cell5=table.rows[index].cells[4];
                    }
                    else {
                        row = table.insertRow(index);
                        cell1 = row.insertCell(0);
                        cell2 = row.insertCell(1);
                        cell3 = row.insertCell(2);
                        cell4 = row.insertCell(3);
                        cell5 = row.insertCell(4);
                    }

                    cell1.innerHTML = mathang.MaMatHang;
                    cell2.innerHTML = mathang.TenMatHang;
                    cell3.innerHTML = mathang.Soluong;
                    cell4.innerHTML = mathang.GiaTri;
                    cell5.innerHTML = '<button type="button" onclick="DeleteRow()">-</button>';
                    table.rows[table.rows.length - 1].cells[0].innerHTML = '<input type="text" class="form-control" id="mamathang">';
                    table.rows[table.rows.length - 1].cells[1].innerHTML = '<input type="text" class="form-control" >';
                    table.rows[table.rows.length - 1].cells[2].innerHTML = '<input type="text" class="form-control" id="soluong">';
                    table.rows[table.rows.length - 1].cells[3].innerHTML = '<input type="text" class="form-control">';
                }
            }
        }
        xml.open("GET","${pageContext.request.contextPath}/APhieuNhapHang/Moi?MaMatHang="+mamathang+"&soluong="+soluong+"&mode="+mode,true);
        xml.send();
    }
    function DeleteRow(x){

        var td = event.target.parentNode;
        var tr = td.parentNode; // the row to be removed
        var test=tr.firstChild;
        var mamathang=test.innerHTML;
        tr.parentNode.removeChild(tr);
        var xml=new XMLHttpRequest();
        xml.onreadystatechange=function () {
            console.log(this.responseText);
            }
        xml.open("GET","${pageContext.request.contextPath}/APhieuNhapHang/Moi?MaMatHang="+mamathang+"&soluong="+0+"&mode="+2,true);
        xml.send();
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
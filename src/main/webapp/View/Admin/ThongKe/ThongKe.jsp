<%--
  Created by IntelliJ IDEA.
  User: Doan Hieu
  Date: 12/15/2020
  Time: 9:10 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport"
          content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Thống kê</title>
    <link href="${pageContext.request.contextPath}/View/Static/css/styles.css" rel="stylesheet" />
    <link
            href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css"
            rel="stylesheet" crossorigin="anonymous" />
    <script
            src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/js/all.min.js"
            crossorigin="anonymous"></script>
    <script type="text/javascript">
        window.onload = function() {

            var chart = new CanvasJS.Chart("chartContainer", {
                animationEnabled: true,
                zoomEnabled: true,
                theme: "light2",
                title: {
                    text: "Thống kê hàng hóa tồn kho"
                },
                axisX: {
                    valueFormatString: "Tháng # "
                },
                axisY: {
                    logarithmic: false, //change it to false
                    title: "Số lượng hàng hóa",
                    titleFontColor: "#6D78AD",
                    lineColor: "#6D78AD",
                    valueFormatString: "#"
                },
                toolTip: {
                    shared: true
                },
                legend: {
                    verticalAlign: "top",
                    dockInsidePlotArea: true
                },
                data: [{
                    type: "line",
                    yValueFormatString: "#",
                    xValueFormatString: "Tháng #",
                    showInLegend: true,
                    name: "Hàng tồn kho",
                    legendText: "{name}",
                    dataPoints: ${ThongKeHangTonKho}
                }]
            });
            chart.render();
        }
    </script>

</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<jsp:include page="../slide.jsp"></jsp:include>
<div id="layoutSidenav">
    <div id="layoutSidenav_content">
        <main>
            <div class="container-fluid">
                <div class="card mb-4">
                    <div class="card-header">
                        <i class="fas fa-table mr-1"></i>
                        Thống kê
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="row">
                        <div class="col-md-2">
                            <div class="row">
                                <label class="bmd-label-floating">Tổng số mặt hàng: </label>
                                <input type="text" readonly value="${TongSoMatHang}">
                            </div>
                        </div>
                        <div class="col-md-2">
                            <div class="row">
                                <label class="bmd-label-floating">Số hàng hóa : </label>
                                <input type="text" readonly value="${SoHangHoa}">
                            </div>
                        </div>
                        <div class="col-md-2">
                            <div class="row">
                                <label class="bmd-label-floating">Số hàng hóa tồn kho: </label>
                                <input type="text" readonly value="${SoHangHoaTonKho}">
                            </div>
                        </div>
                        <div class="col-md-2">
                            <div class="row">
                                <label class="bmd-label-floating">Số phiếu nhập hàng: </label>
                                <input type="text" readonly value="${SoPhieuNhapHang}">
                            </div>
                        </div>
                        <div class="col-md-2">
                            <div class="row">
                                <label class="bmd-label-floating">Số phiếu xuất hàng: </label>
                                <input type="text" readonly value="${SoPhieuXuatHang}">
                            </div>
                        </div>
                        <div class="col-md-2">
                            <div class="row">
                                <label class="bmd-label-floating">Tổng số nhân viên: </label>
                                <input type="text" readonly value="${SoNhanVien}">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div id="chartContainer" style="height: 370px; width: 100%;"></div>
                    </div>
                </div>
            </div>
        </main>
    </div>
</div>
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath}/View/Static/js/scripts.js"></script>
<script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js" crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath}/View/Static/assets/demo/datatables-demo.js"></script>
</body>
</html>

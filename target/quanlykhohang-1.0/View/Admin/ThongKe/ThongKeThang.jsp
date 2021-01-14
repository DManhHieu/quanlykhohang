<%--
  Created by IntelliJ IDEA.
  User: Doan Hieu
  Date: 12/15/2020
  Time: 10:29 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script type="text/javascript">
        window.onload = function () {

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
                    lineColor: "#6D78AD"
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
    <title>Title</title>
</head>
<body>
<div id="chartContainer" style="height: 370px; width: 100%;"></div>
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
</body>
</html>

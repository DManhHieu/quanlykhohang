<%--
  Created by IntelliJ IDEA.
  User: Doan Hieu
  Date: 12/15/2020
  Time: 10:29 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<%@ page import="com.google.gson.Gson" %>
<%@ page import="com.google.gson.JsonObject" %>
<%
    Gson gsonObj = new Gson();
    Map<Object, Object> map = null;
    List<Map<Object, Object>> list = new ArrayList<Map<Object, Object>>();

    map = new HashMap<Object, Object>();
    map.put("x", 1);
    map.put("y", 10);
    list.add(map);
    map = new HashMap<Object, Object>();
    map.put("x", 2);
    map.put("y", 8);
    list.add(map);
    map = new HashMap<Object, Object>();
    map.put("x", 3);
    map.put("y", 1);
    list.add(map);
    map = new HashMap<Object, Object>();
    map.put("x", 4);
    map.put("y", 3);
    list.add(map);
    map = new HashMap<Object, Object>();
    map.put("x", 5);
    map.put("y", 8);
    list.add(map);
    map = new HashMap<Object, Object>();
    map.put("x", 6);
    map.put("y", 2);
    list.add(map);
    map = new HashMap<Object, Object>();
    map.put("x", 7);
    map.put("y", 5);
    list.add(map);
    map = new HashMap<Object, Object>();
    map.put("x", 8);
    map.put("y", 1);
    list.add(map);
    map = new HashMap<Object, Object>();
    map.put("x", 9);
    map.put("y", 2);
    list.add(map);
    map = new HashMap<Object, Object>();
    map.put("x", 10);
    map.put("y", 4);
    list.add(map);
    map = new HashMap<Object, Object>();
    map.put("x", 11);
    map.put("y", 6);
    list.add(map);
    map = new HashMap<Object, Object>();
    map.put("x", 12);
    map.put("y", 1);
    list.add(map);

    String dataPoints1 = gsonObj.toJson(list);

    list = new ArrayList<Map<Object, Object>>();
    map = new HashMap<Object, Object>();
    map.put("x", 1);
    map.put("y", 2);
    list.add(map);
    map = new HashMap<Object, Object>();
    map.put("x", 2);
    map.put("y", 2);
    list.add(map);
    map = new HashMap<Object, Object>();
    map.put("x", 3);
    map.put("y", 2);
    list.add(map);
    map = new HashMap<Object, Object>();
    map.put("x", 4);
    map.put("y", 2);
    list.add(map);
    map = new HashMap<Object, Object>();
    map.put("x", 5);
    map.put("y", 8);
    list.add(map);
    map = new HashMap<Object, Object>();
    map.put("x", 6);
    map.put("y", 0);
    list.add(map);
    map = new HashMap<Object, Object>();
    map.put("x", 7);
    map.put("y", 1);
    list.add(map);
    map = new HashMap<Object, Object>();
    map.put("x", 8);
    map.put("y", 2);
    list.add(map);
    map = new HashMap<Object, Object>();
    map.put("x", 9);
    map.put("y", 8);
    list.add(map);
    map = new HashMap<Object, Object>();
    map.put("x", 10);
    map.put("y", 2);
    list.add(map);
    map = new HashMap<Object, Object>();
    map.put("x", 11);
    map.put("y", 5);
    list.add(map);
    map = new HashMap<Object, Object>();
    map.put("x", 12);
    map.put("y", 4);
    list.add(map);

    String dataPoints2 = gsonObj.toJson(list);

    list = new ArrayList<Map<Object, Object>>();
    map = new HashMap<Object, Object>();
    map.put("x", 1);
    map.put("y", 2);
    list.add(map);
    map = new HashMap<Object, Object>();
    map.put("x", 2);
    map.put("y", 2);
    list.add(map);
    map = new HashMap<Object, Object>();
    map.put("x", 3);
    map.put("y", 10);
    list.add(map);
    map = new HashMap<Object, Object>();
    map.put("x", 4);
    map.put("y", 2);
    list.add(map);
    map = new HashMap<Object, Object>();
    map.put("x", 5);
    map.put("y", 3);
    list.add(map);
    map = new HashMap<Object, Object>();
    map.put("x", 6);
    map.put("y", 8);
    list.add(map);
    map = new HashMap<Object, Object>();
    map.put("x", 7);
    map.put("y", 4);
    list.add(map);
    map = new HashMap<Object, Object>();
    map.put("x", 8);
    map.put("y", 5);
    list.add(map);
    map = new HashMap<Object, Object>();
    map.put("x", 9);
    map.put("y", 8);
    list.add(map);
    map = new HashMap<Object, Object>();
    map.put("x", 10);
    map.put("y", 4);
    list.add(map);
    map = new HashMap<Object, Object>();
    map.put("x", 11);
    map.put("y", 5);
    list.add(map);
    map = new HashMap<Object, Object>();
    map.put("x", 12);
    map.put("y", 4);
    list.add(map);

    String dataPoints3 = gsonObj.toJson(list);
%>
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
                    text: "Thống kê hàng hóa tồn kho tháng"
                },
                axisX: {
                    title: "Tháng",
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
                    yValueFormatString: "# hàng nhập",
                    xValueFormatString: "Tháng #",
                    showInLegend: true,
                    name: "Hàng nhập",
                    legendText: "{name}",
                    dataPoints: <%out.print(dataPoints1);%>
                },
                    {
                        type: "line",
                        yValueFormatString: "# hàng xuất",
                        xValueFormatString: "Tháng #",
                        showInLegend: true,
                        name: "Hàng xuất",
                        legendText: "{name}",
                        dataPoints: <%out.print(dataPoints2);%>
                    },
                    {
                        type: "line",
                        yValueFormatString: "# hàng tồn kho",
                        xValueFormatString: "Tháng #",
                        showInLegend: true,
                        name: "Hàng tồn kho",
                        legendText: "{name}",
                        dataPoints: <%out.print(dataPoints3);%>
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

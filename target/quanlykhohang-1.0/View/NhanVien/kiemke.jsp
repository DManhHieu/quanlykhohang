<%@ page import="QLKH.models.HangHoa" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
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
    <link href="${pageContext.request.contextPath}/View/Static/css/kiemke.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body class="sb-nav-fixed">
<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="slide.jsp"></jsp:include>
<div id="layoutSidenav">
    <div id="layoutSidenav_content">
        <main>
            <div class="container-fluid">
                <h1 class="mt-4">Kiểm kê</h1>
                <ol class="breadcrumb mb-4">
                    <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/View/NhanVien/index.jsp">Trang chủ</a></li>
                    <li class="breadcrumb-item active">Hàng hóa kiểm kê</li>
                </ol>
                <div class="card mb-4">
                </div>
                <div class="card mb-4">
                    <div class="card-header">
                        <i class="fas fa-table mr-1"></i>
                        Bảng hàng hóa kiểm kê
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <!-- The form -->
                            <form class="example" action="KiemKeNV" method="get">
                                <div style="margin-bottom: 10px">
                                    <%
                                        String theloai=(String) session.getAttribute("theloaicu");
                                        if(theloai.equals("mahanghoa") || theloai.equals("")){
                                    %>
                                    <input name="loai" type="radio" value="mahanghoa" checked="checked"/> Mã hàng hóa &nbsp; &nbsp;
                                    <%
                                        }
                                        else { %>
                                    <input name="loai" type="radio" value="mahanghoa"/> Mã hàng hóa &nbsp; &nbsp;
                                    <%
                                        }
                                    %>
                                    <%
                                        if(theloai.equals("tenhanghoa")){
                                    %>
                                    <input name="loai" type="radio" value="tenhanghoa" checked="checked"/> Tên hàng hóa &nbsp; &nbsp;
                                    <%
                                    }
                                    else { %>
                                    <input name="loai" type="radio" value="tenhanghoa"/> Tên hàng hóa &nbsp; &nbsp;
                                    <%
                                        }
                                    %>

                                    <%
                                        if(theloai.equals("vitri")){
                                    %>
                                    <input name="loai" type="radio" value="vitri" checked="checked"/> Vị trí &nbsp; &nbsp;
                                    <%
                                    }
                                    else { %>
                                    <input name="loai" type="radio" value="vitri"/> Vị trí &nbsp; &nbsp;
                                    <%
                                        }
                                    %>

                                    <%
                                        if(theloai.equals("tinhtrang")){
                                    %>
                                    <input name="loai" type="radio" value="tinhtrang" checked="checked"/> Tình trạng &nbsp; &nbsp;
                                    <%
                                    }
                                    else { %>
                                    <input name="loai" type="radio" value="tinhtrang"/> Tình trạng &nbsp; &nbsp;
                                    <%
                                        }
                                    %>
                                </div>
                                <input type="hidden" value="Search" name="nameaction">
                                <input type="text" placeholder="Search.." name="search" style="height: 39px;">
                                <button type="submit"><i class="fa fa-search"></i></button>
                            </form>
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
                                <tbody>
                                <c:forEach items="${listhanghoa}" var="hanghoa">
                                    <tr>
                                        <td>${hanghoa.getMaHangHoa()}</td>
                                        <td>${hanghoa.getMatHang().getTenMatHang()}</td>
                                        <td>${hanghoa.getViTri()}</td>
                                        <td>${hanghoa.getTinhTrang().getTenTinhTrang()}</td>
                                        <td width="130px">
                                            <form action="KiemKeNV" method="post">
                                                <input type="hidden" value="${hanghoa.getMaHangHoa()}" name="mahanghoa">
                                                <button type="submit" style="width: 90px; border-radius: 5px; border-color: #007bff; background-color: #007bff; color: white">Kiểm kê</button>
                                            </form>
                                        </td>
                                    </tr>
                                </c:forEach>
                                <%
                                    HangHoa hangHoa=(HangHoa) request.getAttribute("hanghoasearch");
                                    if(hangHoa != null)
                                    {
                                %>
                                <tr>
                                    <td>${hanghoasearch.getMaHangHoa()}</td>
                                    <td>${hanghoasearch.getMatHang().getTenMatHang()}</td>
                                    <td>${hanghoasearch.getViTri()}</td>
                                    <td>${hanghoasearch.getTinhTrang().getTenTinhTrang()}</td>
                                    <td width="130px">
                                        <form action="KiemKeNV" method="post">
                                            <input type="hidden" value="${hanghoasearch.getMaHangHoa()}" name="mahanghoa">
                                            <button type="submit" style="width: 90px; border-radius: 5px; border-color: #007bff; background-color: #007bff; color: white">Kiểm kê</button>
                                        </form>
                                    </td>
                                </tr>
                                <%
                                    }
                                %>

                                <%--Search theo ten hang hoa--%>
                                <%
                                    List<HangHoa> hangHoaList=(List<HangHoa>) request.getAttribute("hanghoasearch_thh");
                                    System.out.print(hangHoaList);
                                    if(hangHoaList != null)
                                    {
                                %>
                                <c:forEach items="${hanghoasearch_thh}" var="hanghoa">
                                    <tr>
                                        <td>${hanghoa.getMaHangHoa()}</td>
                                        <td>${hanghoa.getMatHang().getTenMatHang()}</td>
                                        <td>${hanghoa.getViTri()}</td>
                                        <td>${hanghoa.getTinhTrang().getTenTinhTrang()}</td>
                                        <td width="130px">
                                            <form action="KiemKeNV" method="post">
                                                <input type="hidden" value="${hanghoa.getMaHangHoa()}" name="mahanghoa">
                                                <button type="submit" style="width: 90px; border-radius: 5px; border-color: #007bff; background-color: #007bff; color: white">Kiểm kê</button>
                                            </form>
                                        </td>
                                    </tr>
                                </c:forEach>
                                <%
                                    }
                                %>

                                <%--Search theo vi tri hang hoa--%>

                                <%
                                    List<HangHoa> hangHoaList_vt=(List<HangHoa>) request.getAttribute("hanghoasearch_vt");
                                    if(hangHoaList_vt != null)
                                    {
                                %>
                                <c:forEach items="${hanghoasearch_vt}" var="hanghoa">
                                    <tr>
                                        <td>${hanghoa.getMaHangHoa()}</td>
                                        <td>${hanghoa.getMatHang().getTenMatHang()}</td>
                                        <td>${hanghoa.getViTri()}</td>
                                        <td>${hanghoa.getTinhTrang().getTenTinhTrang()}</td>
                                        <td width="130px">
                                            <form action="KiemKeNV" method="post">
                                                <input type="hidden" value="${hanghoa.getMaHangHoa()}" name="mahanghoa">
                                                <button type="submit" style="width: 90px; border-radius: 5px; border-color: #007bff; background-color: #007bff; color: white">Kiểm kê</button>
                                            </form>
                                        </td>
                                    </tr>
                                </c:forEach>
                                <%
                                    }
                                %>

                                <%--Search theo tinh trang hang hoa--%>
                                <%
                                    List<HangHoa> hangHoaList_tt=(List<HangHoa>) request.getAttribute("hanghoasearch_tt");
                                    if(hangHoaList_tt != null)
                                    {
                                %>
                                <c:forEach items="${hanghoasearch_tt}" var="hanghoa">
                                    <tr>
                                        <td>${hanghoa.getMaHangHoa()}</td>
                                        <td>${hanghoa.getMatHang().getTenMatHang()}</td>
                                        <td>${hanghoa.getViTri()}</td>
                                        <td>${hanghoa.getTinhTrang().getTenTinhTrang()}</td>
                                        <td width="130px">
                                            <form action="KiemKeNV" method="post">
                                                <input type="hidden" value="${hanghoa.getMaHangHoa()}" name="mahanghoa">
                                                <button type="submit" style="width: 90px; border-radius: 5px; border-color: #007bff; background-color: #007bff; color: white">Kiểm kê</button>
                                            </form>
                                        </td>
                                    </tr>
                                </c:forEach>
                                <%
                                    }
                                %>
                                </tbody>
                            </table>
                            <a class="nav-link" href="${pageContext.request.contextPath}/KiemKeNV"><button type="submit" style="border-radius: 5px;  border-color: #9A9A9A; background-color: #9A9A9A; width: 150px" class="float-right btn-success" >Tất cả hàng hóa</button></a>
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
<%--<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="../Static/js/scripts.js"></script>
<script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js" crossorigin="anonymous"></script>
<script src="../Static/assets/demo/datatables-demo.js"></script>--%>

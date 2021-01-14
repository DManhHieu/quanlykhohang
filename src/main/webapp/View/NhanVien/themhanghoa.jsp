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
    <title>Nhập hàng hóa</title>
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
                <h1 class="mt-4">Phiếu nhập hàng hóa</h1>
                <ol class="breadcrumb mb-4">
                    <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/View/NhanVien/index.jsp">Trang chủ</a></li>
                    <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/PhieuNhapHang">Phiếu nhập hàng</a></li>
                    <li class="breadcrumb-item"> <a href="${pageContext.request.contextPath}/View/NhanVien/chitietnhaphang.jsp">Chi tiết phiếu nhập hàng</a></li>
                    <li class="breadcrumb-item active">Nhập hàng hóa</li>
                </ol>
                <div class="card mb-4">
                </div>
                <div class="card mb-4">
                    <div class="card-header">
<%--                        <i class="fas fa-file-import"></i> --%>
                         <i class="fas fa-arrow-alt-circle-down"></i>
                        Nhập hàng hóa
                    </div>
                    <div class="card-body">
                        <c:if test="${not empty messenger}">
                        <div class="alert alert-success" role="alert">${messenger}</div>
                        </c:if>
                        <div>
                            <form action="${pageContext.request.contextPath}/PhieuNhapHang/ChiTiet/NhapHangHoa" method="post">
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label class="bmd-label-floating"><b>Mã mặt hàng</b></label>
                                            <%
                                                String thongbao=(String) session.getAttribute("thongbao");
                                                String mmh=(String) session.getAttribute("MaMatHang");
/*                                                if(thongbao.equals("themthanhcong")){
                                                    mmh="";
                                                }*/
                                                String tbmamathang=(String) request.getAttribute("mmhkhongtontai");
                                                if(tbmamathang == null)
                                                    tbmamathang="";
                                            %>
                                            <input type="text" class="form-control" name="MaMatHang" value="<%=mmh%>" readonly>
                                            <div style="color: red ; font-size: 80%" class="font-weight-light my-lg-2"><%=tbmamathang%></div>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label class="bmd-label-floating"><b>Vị trí</b></label>
                                            <%
                                                String vitricu=request.getParameter("ViTri");
                                                if(thongbao.equals("themthanhcong") || vitricu == null) {
                                                    vitricu="";
                                                }
                                                String tbvitri=(String) request.getAttribute("tbvitri");
                                                if(tbvitri == null)
                                                    tbvitri="";
                                            %>
                                            <input type="text" class="form-control" name="ViTri" value="<%=vitricu%>">
                                            <div style="color: red ; font-size: 80%" class="font-weight-light my-lg-2"><%=tbvitri%></div>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label class="bmd-label-floating"><b>Ngày sản xuất</b></label>
                                            <%
                                                String NgaySanXuatstr = request.getParameter("NgaySanXuat");
                                                if(thongbao.equals("themthanhcong")) {
                                                    NgaySanXuatstr=null;
                                                }
                                                String tbngaysanxuat=(String) request.getAttribute("tbngaysanxuat");
                                                if(tbngaysanxuat == null)
                                                    tbngaysanxuat="";
                                            %>
                                            <input type="date" class="form-control" name="NgaySanXuat" value="<%=NgaySanXuatstr%>">
                                            <div style="color: red ; font-size: 80%" class="font-weight-light my-lg-2"><%=tbngaysanxuat%></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label class="bmd-label-floating"><b>Mã hàng hóa</b></label>
                                            <%
                                                String mhh=request.getParameter("MaHangHoa");
                                                if(thongbao.equals("themthanhcong") || mhh == null) {
                                                    mhh="";
                                                }
                                                String tbmahanghoa=(String) request.getAttribute("hhtontai");
                                                if(tbmahanghoa == null)
                                                    tbmahanghoa="";
                                            %>
                                            <input type="text" class="form-control" name="MaHangHoa" value="<%=mhh%>">
                                            <div style="color: red ; font-size: 80%" class="font-weight-light my-lg-2"><%=tbmahanghoa%></div>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <label class="bmd-label-floating"><b>Tình trạng</b></label>
                                        <select class="form-control" id="exampleFormControlSelect1" name="TinhTrang">
                                            <option value="0" selected >Hỏng</option>
                                            <option value="3">Trung bình</option>
                                            <option value="1">Tốt</option>
<%--                                            <option value="2">Cần kiểm tra</option>--%>
<%--                                            <option value="4">Hỏng, sau khi kiểm tra</option>--%>
<%--                                            <option value="5">Đã lấy</option>--%>
<%--                                            <option value="6">Đã xuất hàng</option>--%>
                                        </select>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label class="bmd-label-floating"><b>Hạn sử dụng</b></label>
                                            <%
                                                String HanSuDungstr = request.getParameter("HanSuDung");
                                                if(thongbao.equals("themthanhcong")) {
                                                    HanSuDungstr=null;
                                                }
                                                String tbhansudung=(String) request.getAttribute("tbhansudung");
                                                if(tbhansudung == null)
                                                    tbhansudung="";
                                            %>
                                            <input type="date" class="form-control" name="HanSuDung" value="<%=HanSuDungstr%>">
                                            <div style="color: red ; font-size: 80%" class="font-weight-light my-lg-2"><%=tbhansudung%></div>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                        </div>
                                    </div>
                                    <input type="hidden" name="MP_NhapHang" value="${phieunhaphang.getMaPhieu()}"/>
                                </div>
                                <div class="w-100">
                                    <button type="submit" class="btn btn-primary float-right" style="margin-right:10px;margin-left: 13px;" value="luu" name="submit">Lưu</button>
                                    <button type="reset" class="btn btn-primary float-right" style="margin-left:10px" name="submit" value="huy" onclick="thongbaohuybo()">Hủy</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </div>
</div>
<script>
    function thongbaohuybo(){
        alert("Hủy bỏ cập nhật !");
    }
</script>
</body>
</html>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="../Static/js/scripts.js"></script>
<script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js" crossorigin="anonymous"></script>
<script src="../Static/assets/demo/datatables-demo.js"></script>

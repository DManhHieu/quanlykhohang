<%--
  Created by IntelliJ IDEA.
  User: Doan Hieu
  Date: 12/1/2020
  Time: 8:09 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Trang chủ</title>
    <link href="${pageContext.request.contextPath}/View/Static/css/styles.css" rel="stylesheet" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/js/all.min.js" crossorigin="anonymous"></script>
</head>
<body class="bg-primary">
<div id="layoutAuthentication">
    <div id="layoutAuthentication_content">
        <main>
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-5">
                        <div class="card shadow-lg border-0 rounded-lg mt-5">
                            <div class="card-header"><h3 class="text-center font-weight-light my-4">Đăng nhập</h3></div>
                            <div class="card-body">
                                <form action="${pageContext.request.contextPath}/Login" method="post">
                                    <div class="form-group">
                                        <label class="small mb-1" id="show_message1" ></label>
                                        <input class="form-control py-4" name="username" type="text" onchange="genderChanged1(this)" placeholder="Tên tài khoản" />
                                        <div style="color: red" class="font-weight-light my-lg-2">${alert1}</div>
                                    </div>
                                    <div class="form-group">
                                        <label class="small mb-1" id="show_message2" ></label>
                                        <input class="form-control py-4" name="password" type="password" onchange="genderChanged2(this)" placeholder="Mật khẩu" />
                                        <div style="color: red" class="font-weight-light my-lg-2">${alert2}</div>
                                    </div>
                                    <div class="form-group">
                                        <div class="custom-control custom-checkbox">
                                            <input class="custom-control-input" name="checkbox" type="checkbox" />
                                            <label class="custom-control-label" >Lưu mật khẩu</label>
                                        </div>
                                    </div>
                                    <div class="form-group d-flex align-items-center justify-content-between mt-4 mb-0">
                                        <button type="submit" class="btn btn-primary w-100">Đăng nhập</button>
                                    </div>
                                </form>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </main>
    </div>

</div>
<script language="javascript">
    function genderChanged1(obj)
    {
        var message = document.getElementById('show_message1');
        var value = obj.value;
        if (value === ""){
            message.innerHTML = "";
        }
        else {
            message.innerHTML = "Tên đăng nhập";
        }
    }
    function genderChanged2(obj)
    {
        var message = document.getElementById('show_message2');
        var value = obj.value;
        if (value === ""){
            message.innerHTML = "";
        }
        else {
            message.innerHTML = "Mật khẩu";
        }
    }
</script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath}/View/Static/js/scripts.js"></script>
</body>
</html>

<%--
  Created by IntelliJ IDEA.
  User: nvant
  Date: 1/10/2021
  Time: 12:35 AM
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
    <title>Login</title>
    <style>
        header.masthead {
            padding-top: 10.5rem;
            padding-bottom: 6rem;
            text-align: center;
            color: black;
            background-image: url("View/Static/assets/img/header-img.jpg");
            background-repeat: no-repeat;
            background-attachment: scroll;
            background-position: center center;
            background-size: cover;
        }
        header.masthead .masthead-subheading {
            font-size: 1.5rem;
            font-style: italic;
            line-height: 1.5rem;
            margin-bottom: 25px;
            font-family: "Droid Serif", -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", "Noto Color Emoji";
        }
        header.masthead .masthead-heading {
            font-size: 3.25rem;
            font-weight: 700;
            line-height: 3.25rem;
            margin-bottom: 2rem;
            font-family: "Montserrat", -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", "Noto Color Emoji";
        }

        @media (min-width: 768px) {
            header.masthead {
                padding-top: 17rem;
                padding-bottom: 12.5rem;
            }

            header.masthead .masthead-subheading {
                font-size: 2.25rem;
                font-style: italic;
                line-height: 2.25rem;
                margin-bottom: 2rem;
            }

            header.masthead .masthead-heading {
                font-size: 4.5rem;
                font-weight: 700;
                line-height: 4.5rem;
                margin-bottom: 4rem;
            }
        }
        .team-member {
            margin-bottom: 3rem;
            text-align: center;
        }
        .team-member img {
            width: 14rem;
            height: 14rem;
            border: 0.5rem solid rgba(0, 0, 0, 0.1);
        }
        .team-member h4 {
            margin-top: 1.5rem;
            margin-bottom: 0;
        }
    </style>
    <link href="${pageContext.request.contextPath}/View/Static/css/styles.css" rel="stylesheet" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/js/all.min.js" crossorigin="anonymous"></script>
</head>
<body class="sb-nav-fixed">
<nav class="sb-topnav navbar navbar-expand pl-5 pr-5 position-fixed shadow">
    <div class="sb-topnav navbar pl-5 pr-5 w-100">
        <a style="color: dimgray" class="navbar-brand font-weight-bold float-left" href="${pageContext.request.contextPath}/index.jsp">Quản lý kho hàng</a>
        <!-- Navbar-->
        <ul class="navbar-nav ml-auto ml-md-0 float-right">
            <li class="nav-item dropdown">
                <a style="color: dimgray" class="nav-link" id="userDropdown" href="${pageContext.request.contextPath}/Login" role="button"
                   aria-haspopup="true" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
            </li>
        </ul>
    </div>
</nav>
<header class="masthead">
    <div class="container">
        <div class="masthead-subheading">Welcome To Our Site!</div>
        <div class="masthead-heading text-uppercase">It's Nice To Meet You</div>
    </div>
</header>
<section class="page-section bg-light">
    <div class="container">
        <div class="text-center mb-5">
            <h2 class="section-heading text-uppercase">Our Team</h2>
        </div>
        <div class="row">
            <div class="col-lg-3">
                <div class="team-member">
                    <img class="mx-auto rounded-circle" src="${pageContext.request.contextPath}/View/Static/assets/img/avatar.jpg" alt="" />
                    <h4>Đoàn Mạnh Hiếu</h4>
                    <p class="text-muted">PM - DEV</p>
                </div>
            </div>
            <div class="col-lg-3">
                <div class="team-member">
                    <img class="mx-auto rounded-circle" src="${pageContext.request.contextPath}/View/Static/assets/img/avatar.jpg" alt="" />
                    <h4>Hoàng Dương Hùng</h4>
                    <p class="text-muted">DEV</p>
                </div>
            </div>
            <div class="col-lg-3">
                <div class="team-member">
                    <img class="mx-auto rounded-circle" src="${pageContext.request.contextPath}/View/Static/assets/img/avatar.jpg" alt="" />
                    <h4>Nguyễn Văn Từ</h4>
                    <p class="text-muted">BA</p>
                </div>
            </div>
            <div class="col-lg-3">
                <div class="team-member">
                    <img class="mx-auto rounded-circle" src="${pageContext.request.contextPath}/View/Static/assets/img/avatar.jpg" alt="" />
                    <h4>Nguyễn Khắc Thành Sang</h4>
                    <p class="text-muted">Tester</p>
                </div>
            </div>
        </div>
    </div>
</section>
</body>
</html>

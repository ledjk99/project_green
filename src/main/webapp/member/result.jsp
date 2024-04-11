<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<!-- head start -->
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Green Health</title>
    <link href="/css/styles.css" rel="stylesheet"/>
    <link href="/css/notice.css" rel="stylesheet"/>
    <link href="/css/qnalist.css" rel="stylesheet"/>
    <link href="/css/reviewlist.css" rel="stylesheet"/>
    <link href="/css/cart.css" rel="stylesheet" />
    <link href="/css/login.css" rel="stylesheet"/>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
    <link type="text/css" rel="stylesheet" href="https://order.pstatic.net/202404/04_163641_1712216201/order_customer/mobile_static/css/service/mobile/detail.css">
    <link href="/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <script src="/js2/validator.js" defer></script>

    <script src="/js2/member.js" defer></script>
</head>
<body>
<!-- nav start -->
<jsp:include page="/module/nav.jsp"/>
<!-- nav end -->
<!-- header start -->
<jsp:include page="/module/header.jsp"/>
<!-- header end -->
<!-- section start -->
<section class="py-5">
    <div class="container px-4 px-lg-5 mt-5">


        <div class="login-wrap">
            <div class="login-html">
                <div>
                    <p>
                    <h2> 가입을 축하드립니다.</h2></p>

                    <p class="mb-2 w-lg-75">
                        가입하신 정보는 아래와 같습니다.
                    </p>
                    <br>
                </div>
                <div class="width-50x pt-1 bg-primary mb-3"></div>

                <div class="position-relative">
                    <div>
                        <div class="input-icon-group mb-3">
                      <span class="input-icon">
                        <i class="bx bx-user-pin"></i>
                      </span>
                            <input type="text" class="form-control" disabled value="${member.id}">
                        </div>

                        <div class="input-icon-group mb-3">
                      <span class="input-icon">
                        <i class="bx bx-user"></i>
                      </span>
                            <input type="text" class="form-control" disabled value="${member.name}">
                        </div>

                        <div class="input-icon-group mb-3">
                      <span class="input-icon">
                        <i class="bx bx-envelope"></i>
                      </span>
                            </span>
                            <input type="text" class="form-control" disabled value="${member.email}">
                        </div>

                        <div class="input-icon-group mb-3">
                      <span class="input-icon">
                        <i class="bx bx-envelope"></i>
                      </span>
                            </span>
                            <input type="text" class="form-control" disabled value="${member.phone}">
                        </div>

                        <div class="input-icon-group mb-3">
                      <span class="input-icon">
                        <i class="bx bx-lock-open"></i>
                      </span>
                            </span>
                            <input type="text" class="form-control" disabled value="${member.regdate}">
                        </div>

                        <div class="d-grid">
                            <a class="btn btn-primary" href="/member/login.jsp">로그인하기</a>
                        </div>
                        <div class="hr"></div>
                        <div class="foot-lnk">
                            <a href="/">홈으로</a>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- section end -->
<!-- footer start -->
<jsp:include page="/module/footer.jsp"/>
<!-- footer end -->
<script src="https://kit.fontawesome.com/3accb69132.js" crossorigin="anonymous"></script>
</body>
</html>
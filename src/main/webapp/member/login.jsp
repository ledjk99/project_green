<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.ezen.mall.web.common.encription.EzenUtil" %>
<%@ page import="com.ezen.mall.web.member.service.MemberService" %>
<%@ page import="com.ezen.mall.web.member.dto.Member" %>
<%@ page import="com.ezen.mall.web.common.encription.EzenUtil" %>
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
    <link href="/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <script src="/js2/validator.js" defer></script>
    <script src="/js2/member.js" defer></script>
    <link href="/css/login.css" rel="stylesheet"/>
</head>
<body>
<jsp:include page="/module/nav.jsp"/>
<jsp:include page="/module/header.jsp"/>
<!-- section start -->
<section class="py-5" style="background-color: white;">
    <div class="container px-4 px-lg-5 mt-5">
        <div class="login-wrap">
            <div class="login-html" style="padding-top: 30px">
                <input id="tab-1" type="radio" name="tab" class="sign-in" checked><label for="tab-1" class="tab">로그인</label>
                <input id="tab-2" type="radio" name="tab" class="sign-up"><label for="tab-2" class="tab">회원가입</label>
                <form class="login-form" name="login-form" action="/member/login-action.jsp" method="post">
                    <input type="hidden" name="referer" value="${referer}">
                    <div class="login-form">
                        <div class="sign-in-htm">
                            <div class="group">
                                <label for="loginid" class="label">아이디</label>
                                <input id="loginid" type="text" class="input" name="loginid"
                                       value="${EzenUtil.decription(cookie.saveId.value)}">
                            </div>
                            <div class="group">
                                <label for="loginpw" class="label">비밀번호</label>
                                <input id="loginpw" type="password" class="input" data-type="password" name="loginpw">
                            </div>
                            <div class="group">
                                <input type="checkbox" class="form-check-input" checked name="saveid" id="saveid"
                                       value="${not empty (cookie.saveId.value) ? "checked" : ""}">
                                <label class="form-check-label" for="saveid"> ID 저장하기</label>
                            </div>
                            <div class="group">
                                <input type="submit" class="button" value="Login">
                            </div>
                            <div class="hr"></div>
                            <div class="foot-lnk">
                                <a href="#forgot">비밀번호를 잊으셨습니까?</a>
                            </div>
                        </div>
                        <%--                                </div>--%>
                </form>
                <form class="register-form" name="registerForm" action="/member/register-action.jsp" method="post">
                    <div class="sign-up-htm">
                        <div class="group">
                            <label for="id" class="label">아이디</label>
                            <input id="id" type="text" class="input" name="id" value="${errors.id}"
                                   style="${not empty errors.id ? 'color:red' : ''}">
                        </div>
                        <div class="group">
                            <label for="passwd" class="label">비밀번호</label>
                            <input id="passwd" type="password" class="input" data-type="password" name="passwd">
                        </div>
                        <div class="group">
                            <label for="re-passwd" class="label">비밀번호 재확인</label>
                            <input id="re-passwd" type="password" class="input" data-type="password" name="re-passwd">
                        </div>
                        <div class="group">
                            <label for="name" class="label">이름</label>
                            <input id="name" type="text" class="input" name="name" value="${errors.name}"
                                   style="${not empty errors.name ? 'color:red' : ''}">
                        </div>
                        <div class="group">
                            <label for="email" class="label" value="${errors.email}"
                                   style="${not empty errors.email ? 'color:red' : ''}">이메일</label>
                            <input id="email" type="text" class="input" name="email">
                        </div>
                        <div class="group">
                            <label for="phone" class="label" value="${errors.phone}"
                                   style="${not empty errors.phone ? 'color:red' : ''}">핸드폰 번호</label>
                            <input id="phone" type="text" class="input" name="phone">
                        </div>
                        <div class="group">
                            <input type="submit" class="button button2" value="회원가입" name=""></div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    </div>
</section>
<!-- section end -->
<jsp:include page="/module/footer.jsp"/>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
<link type="text/css" rel="stylesheet" href="https://order.pstatic.net/202404/04_163641_1712216201/order_customer/mobile_static/css/service/mobile/detail.css">
<script src="https://kit.fontawesome.com/3accb69132.js" crossorigin="anonymous"></script>
</body>
</html>
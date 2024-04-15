<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<!-- head start -->
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <title>Green Health</title>
    <link href="/css/styles.css" rel="stylesheet"/>
    <link href="/css/register.css" rel="stylesheet"/>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
    <link type="text/css" rel="stylesheet"
          href="https://order.pstatic.net/202404/04_163641_1712216201/order_customer/mobile_static/css/service/mobile/detail.css">
    <link href="/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .container-fluid {
            width: 800px;
            margin: 30px auto;
        }
    </style>
</head>

<body>
<!-- nav start -->
<jsp:include page="/module/nav.jsp"/>
<!-- nav end -->
<!-- header start -->
<jsp:include page="/module/header.jsp"/>
<!-- header end -->

<!-- section start -->
<div class="container-fluid">
    <h3 class="mt-4">게시글 쓰기</h3>
    <form name="registerForm" action="register-action.jsp" method="post">
        <input type="hidden" name="boardId" value="${param.boardId}">
        <input type="hidden" name="articleId" value="${param.articleId}">
        <input type="hidden" name="articleId" value="${param.memberId}">
        <div class="form-group">
            <label>제목</label>
            <input type="text" class="form-control" name="title">
        </div>
        <div class="form-group">
            <label>내용</label>
            <textarea class="form-control" rows="5" name="content"></textarea>
        </div>
        <div class="form-group">
            <label>작성자</label>
            <input type="text" class="form-control" name="memberId" value="${loginMember.id}">
        </div>
        <div class="form-group">
            <label>비밀번호</label>
            <input type="password" class="form-control" name="passwd">
        </div>
        <div class="button-container">
            <button type="submit" class="btn btn-outline-dark">등 록</button>
        </div>
    </form>
</div>
<!-- section end -->

<!-- footer start -->
<jsp:include page="/module/footer.jsp"/>
<!-- footer end -->
<script src="https://kit.fontawesome.com/3accb69132.js" crossorigin="anonymous"></script>
</body>
</html>
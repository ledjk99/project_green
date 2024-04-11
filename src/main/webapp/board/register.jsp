<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<!-- head start -->
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <title>Green Health</title>
    <link href="/css/styles.css" rel="stylesheet"/>
    <link href="/css/notice.css" rel="stylesheet"/>
    <link href="/css/qnalist.css" rel="stylesheet"/>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
    <link type="text/css" rel="stylesheet" href="https://order.pstatic.net/202404/04_163641_1712216201/order_customer/mobile_static/css/service/mobile/detail.css">
    <link href="/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .mt-4 {
            font-family: "Gowun Dodum", sans-serif;
            font-style: normal;
            font-weight: bold;
        }

        .container-fluid {
            width: 800px;
            margin: 30px auto;
        }

        .button-container {
            margin-bottom: 50px;
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
    <form name="registerForm" action="reply-action.jsp" method="post">
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
            <input type="text" class="form-control" name="writer" value="${loginMember.id}">
        </div>
        <div class="form-group">
            <label>파일 첨부</label>
            <input type="file" class="form-control" name="picture" value="${loginMember.id}">
        </div>
    </form>
    <div class="card-header bg-light">
        <i class="fa fa-comment fa"></i> REPLY
    </div>
    <div class="card-body">
        <ul class="list-group list-group-flush">
            <li class="list-group-item">
                <div class="form-inline mb-2">
                    <label for="replyId"><i class="fa fa-user-circle-o fa-2x"></i></label>
                    <input type="text" class="form-control ml-2" placeholder="Enter yourId" id="replyId">
                    <label for="replyPassword" class="ml-4"><i class="fa fa-unlock-alt fa-2x"></i></label>
                    <input type="password" class="form-control ml-2" placeholder="Enter password" id="replyPassword">
                </div>
                <textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
            </li>
        </ul>
    </div>

    <div id="comments-list">
        <div class="card m-2">
            <div class="card-header">
                작성자
            </div>
            <div class="card-body">
                댓글 내용
            </div>
        </div>
        <button type="submit" class="btn btn-dark mt-3">삭제</button>
    </div>
</div>
<!-- section end -->
<!-- footer start -->
<jsp:include page="/module/footer.jsp"/>
<!-- footer end -->
<script src="https://kit.fontawesome.com/3accb69132.js" crossorigin="anonymous"></script>
</body>
</html>
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

    <h3 class="mt-4">후기게시판
        <span>
            <a href="register.jsp" class="btn btn-sm btn-secondary">게시글 쓰기</a>
        </span>
    </h3>

    <form action="#" id="searchForm">
        <div class="input-group">
            <input type="hidden" name="page" value="1">
            <div class="input-group-prepend">
                <select class="custom-select" name="type">
                    <option selected>----- 검색유형 -----</option>
                    <option>제목</option>
                    <option>내용</option>
                    <option>작성자</option>
                    <option>제목 + 내용</option>
                    <option>제목 + 내용 + 작성자</option>
                </select>
            </div>
            <input type="search" class="form-control" name="value">
            <div class="input-group-append" id="button-addon4">
                <button class="btn btn-outline-dark btn-search" type="button">검색</button>
            </div>
        </div>
    </form>

    <table class="table table-sm table-hover">
        <thead>
        <tr>
            <th>제목</th>
            <th>번호</th>
            <th>작성자</th>
            <th>조회수</th>
            <th>등록일자</th>
        </tr>
        </thead>

        <tbody>
        <tr>
            <td>255</td>
            <td><a href="read.jsp">제목입니다.</a>
                <span>[1]</span>
            </td>
            <td>홍길동</td>
            <td>5</td>
            <td>2023-05-05</td>
        </tr>
        <tr>
            <td>254</td>
            <td><a href="read.jsp">제목입니다.</a></td>
            <td>홍길동</td>
            <td>5</td>
            <td>2023-05-05</td>
        </tr>
        <tr>
            <td>253</td>
            <td>
                <a href="read.jsp">댓글 제목입니다.</a>
            </td>
            <td>홍길동</td>
            <td>1</td>
            <td>2023-05-05</td>
        </tr>
        <tr>
            <td>252</td>
            <td>
                <a href="read.jsp">대댓글 제목입니다.</a>
            </td>
            <td>홍길동</td>
            <td>1</td>
            <td>2023-05-05</td>
        </tr>
        <tr>
            <td>251</td>
            <td><a href="read.jsp">제목입니다.</a></td>
            <td>홍길동</td>
            <td>5</td>
            <td>2023-05-05</td>
        </tr>
        <tr>
            <td>250</td>
            <td><a href="read.jsp">제목입니다.</a></td>
            <td>홍길동</td>
            <td>5</td>
            <td>2023-05-05</td>
        </tr>
        <tr>
            <td>249</td>
            <td><a href="read.jsp">제목입니다.</a></td>
            <td>홍길동</td>
            <td>5</td>
            <td>2023-05-05</td>
        </tr>
        <tr>
            <td>248</td>
            <td><a href="read.jsp">제목입니다.</a></td>
            <td>홍길동</td>
            <td>5</td>
            <td>2023-05-05</td>
        </tr>
        <tr>
            <td>247</td>
            <td><a href="read.jsp">제목입니다.</a></td>
            <td>홍길동</td>
            <td>5</td>
            <td>2023-05-05</td>
        </tr>
        <tr>
            <td>246</td>
            <td><a href="read.jsp">제목입니다.</a></td>
            <td>홍길동</td>
            <td>5</td>
            <td>2023-05-05</td>
        </tr>
        </tbody>

    </table>

    <ul class="pagination h-100 justify-content-center align-items-center">
        <li class="page-item"><a class="page-link">처음으로</a></li>
        <li class="page-item"><a class="page-link">이전목록</a></li>

        <li class="page-item active"><a class="page-link" href="#">1</a></li>
        <li class="page-item"><a class="page-link" href="#">2</a></li>
        <li class="page-item"><a class="page-link" href="#">3</a></li>
        <li class="page-item"><a class="page-link" href="#">4</a></li>
        <li class="page-item"><a class="page-link" href="#">5</a></li>

        <li class="page-item"><a class="page-link">다음목록</a></li>
        <li class="page-item"><a class="page-link">끝으로</a></li>
    </ul>

</div>
<!-- section end -->
<!-- footer start -->
<jsp:include page="/module/footer.jsp"/>
<!-- footer end -->
<script src="https://kit.fontawesome.com/3accb69132.js" crossorigin="anonymous"></script>
</body>
</html>
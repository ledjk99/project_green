<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.ezen.mall.web.board.service.BoardService" %>
<%@ page import="com.ezen.mall.web.board.service.BoardServiceImpl" %>
<%@ page import="com.ezen.mall.web.board.dto.Article" %>
<%@ page import="java.util.List" %>
<%@ page import="com.ezen.mall.web.common.page.PageParams" %>
<%@ page import="com.ezen.mall.web.common.page.Pagination" %>

<%
    // 사용자 요청 게시판 번호
    int boardId = 2;
    if (request.getParameter("boardId") != null) {
        boardId = Integer.parseInt(request.getParameter("boardId"));
    }

    // 사용자 요청 페이지 번호
    int requestPage = 1;
    if (request.getParameter("page") != null) {
        requestPage = Integer.parseInt(request.getParameter("page"));
    }

    // 테이블 당 보여지는 행의 개수
    int rowCount = 10;
    if (request.getParameter("rowcount") != null) {
        rowCount = Integer.parseInt(request.getParameter("rowcount"));
    }

    // 페이지에 보여지는 페이지 번호 수
    int pageSize = 10;

    // 사용자 검색 유형
    String searchType = request.getParameter("type");

    // 사용자 검색 값
    String searchValue = request.getParameter("value");

    BoardService boardService = new BoardServiceImpl();

    // 페이징 처리를 위한 테이블 행의 개수
    int tableRowCount = boardService.getArticleCount(searchType, searchValue);

    PageParams params = new PageParams(rowCount, pageSize, requestPage, tableRowCount);
    Pagination pagination = new Pagination(params);
    request.setAttribute("pagination", pagination);

    // 게시글 목록 반환
    List<Article> list = boardService.articleList(rowCount, requestPage, searchType, searchValue, boardId);
    request.setAttribute("list", list);
%>

<!DOCTYPE html>
<html lang="ko">
<!-- head start -->
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <title>Green Health</title>
    <link href="/css/styles.css" rel="stylesheet"/>
    <link href="/css/qnalist.css" rel="stylesheet"/>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
    <link type="text/css" rel="stylesheet"
          href="https://order.pstatic.net/202404/04_163641_1712216201/order_customer/mobile_static/css/service/mobile/detail.css">

    <link href="/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .container-fluid {
            width: 70%;
            padding: 10px;
        }

        span {
            font-weight: bold;
            color: mediumblue;
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
<div id="page-content-wrapper">

    <div class="container-fluid">

        <h3 class="mt-4">문의게시판
            <span>
                <a href="register.jsp?boardId=${param.boardId}" class="btn btn-sm btn-secondary">게시글 쓰기</a>
            </span>
        </h3>

        <form id="searchForm">
            <div class="input-group">
                <input type="hidden" name="page" value="1">
                <div class="input-group-prepend">
                    <select class="custom-select" name="type">
                        <option selected value="">----- 검색유형 -----</option>
                        <option value="t">제목</option>
                        <option value="c">내용</option>
                        <option value="w">작성자</option>
                        <option value="tc">제목 + 내용</option>
                        <option value="tcw">제목 + 내용 + 작성자</option>
                    </select>
                </div>
                <input type="search" class="form-control" name="value">
                <div class="input-group-append" id="button-addon4">
                    <button class="btn btn-outline-dark btn-search" type="submit">검색</button>
                </div>
            </div>
        </form>

        <table class="table table-sm table-hover">
            <thead>
            <tr>
                <th>번호</th>
                <th>제목</th>
                <th>작성자</th>
                <th>조회수</th>
                <th>등록일자</th>
            </tr>
            </thead>

            <tbody>
            <c:forEach var="article" items="${list}" varStatus="i">
                <tr>
                    <td>${pagination.params.rowCount - ((pagination.params.requestPage - 1) * pagination.params.elementSize) - i.index}</td>
                    <td>
                        <a href="read.jsp?boardId=${article.boardId}&articleId=${article.articleId}">${article.title}</a>
                        <span>${[article.commentCount]}</span>
                    </td>
                    <td>${article.memberId}</td>
                    <td>${article.hitCount}</td>
                    <td>${article.regdate}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>

        <ul class="pagination h-100 justify-content-center align-items-center">

            <c:if test="${pagination.showFirst}">
                <li class="page-item">
                    <a class="page-link" href="?page=1&type=${param.type}&value=${param.value}">처음으로</a>
                </li>
            </c:if>

            <c:if test="${pagination.showPrevious}">
                <li class="page-item">
                    <a class="page-link"
                       href="?page=${pagination.previousStartPage}&type=${param.type}&value=${param.value}">이전목록</a>
                </li>
            </c:if>

            <c:forEach var="i" begin="${pagination.startPage}" end="${pagination.endPage}">
                <c:url var="list" value="qnalist.jsp" scope="request">
                    <c:param name="page" value="${i}"/>
                    <c:param name="type" value="${param.type}"/>
                    <c:param name="value" value="${param.value}"/>
                </c:url>
                <li class="page-item <c:if test="${i == pagination.params.requestPage}">active</c:if>">
                    <a class="page-link" href="${list}">${i}</a>
                </li>
            </c:forEach>

            <c:if test="${pagination.showNext}">
                <li class="page-item">
                    <a class="page-link"
                       href="?page=${pagination.nextStartPage}&type=${param.type}&value=${param.value}">다음목록</a>
                </li>
            </c:if>

            <c:if test="${pagination.showLast}">
                <li class="page-item">
                    <a class="page-link"
                       href="?page=${pagination.totalPages}&type=${param.type}&value=${param.value}">끝으로</a>
                </li>
            </c:if>
        </ul>
    </div>
</div>
<!-- section end -->

<!-- footer start -->
<jsp:include page="/module/footer.jsp"/>
<!-- footer end -->
<script src="https://kit.fontawesome.com/3accb69132.js" crossorigin="anonymous"></script>
</body>
</html>
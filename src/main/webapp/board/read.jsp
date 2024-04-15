<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.ezen.mall.web.board.service.BoardService" %>
<%@ page import="com.ezen.mall.web.board.service.BoardServiceImpl" %>
<%@ page import="com.ezen.mall.web.board.dto.Article" %>
<%@ page import="com.ezen.mall.web.board.dto.Comment" %>
<%@ page import="java.util.List" %>

<%
    int boardId = 0;
    if (request.getParameter("boardId") != null) {
        boardId = Integer.parseInt(request.getParameter("boardId"));
    }

    int articleId = 0;
    if (request.getParameter("articleId") != null) {
        articleId = Integer.parseInt(request.getParameter("articleId"));
    }

    BoardService boardService = new BoardServiceImpl();

    // 게시글 상세 보기
    Article article = boardService.getArticle(boardId, articleId);
    article.setArticleId(articleId);
    article.setBoardId(boardId);
    request.setAttribute("article", article);

    // 댓글 목록
    List<Comment> commentList = boardService.commentList(boardId, articleId);
    request.setAttribute("comments", commentList);
%>

<!DOCTYPE html>
<html lang="ko">
<!-- head start -->
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>
    <title>Green Health</title>
    <link href="/css/styles.css" rel="stylesheet"/>
    <link href="/css/read.css" rel="stylesheet"/>
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
            padding-bottom: 100px;
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
    <h3 class="mt-4">게시글 상세</h3>
    <hr>
    <div class="form-group">
        <label>제목</label>
        <input type="text" class="form-control" value="${article.title}" readonly>
    </div>
    <div class="form-group">
        <label>내용</label>
        <textarea class="form-control" rows="5" readonly>${article.content}</textarea>
    </div>
    <div class="form-group">
        <label>작성자</label>
        <input type="text" class="form-control" name="writer" value="${article.memberId}" readonly>
    </div>
    <div class="form-group">
        <label>등록일자</label>
        <input type="text" class="form-control" name="regDate" value="${article.regdate}" readonly>
    </div>

    <div class="button-container">
        <c:choose>
            <c:when test="${param.boardId == 2}">
                <a href="qnalist.jsp?boardId=${param.boardId}" class="btn btn-outline-dark">목록</a>
            </c:when>
            <c:when test="${param.boardId == 3}">
                <a href="reviewlist.jsp?boardId=${param.boardId}" class="btn btn-outline-dark">목록</a>
            </c:when>
        </c:choose>

        <form id="deleteForm" action="delete-action.jsp" method="post">
            <input type="hidden" name="boardId" value="${param.boardId}">
            <input type="hidden" name="articleId" value="${param.articleId}">
            <button type="button" class="btn btn-dark" onclick="confirmDelete()">삭제</button>
        </form>

        <script>
            function confirmDelete() {
                if (confirm('정말로 이 게시글을 삭제하시겠습니까?')) {
                    document.getElementById("deleteForm").setAttribute("action", "delete-action.jsp");
                    document.getElementById("deleteForm").submit();
                }
            }
        </script>
    </div>

    <form name="commentForm" action="comment-action.jsp" method="post" style="max-height: 300px; overflow-y: auto;">
        <input type="hidden" name="boardId" value="${param.boardId}">
        <input type="hidden" name="articleId" value="${param.articleId}">
        <input type="hidden" name="memberId" value="${article.memberId}">

        <div class="card-header bg-light">
            <i class="fa fa-comment fa"></i> REPLY
        </div>
        <div class="card-body">
            <ul class="list-group list-group-flush">
                <li class="list-group-item">
                    <div class="form-inline mb-2">
                        <label for="replyId"><i class="fa fa-user-circle-o fa-2x"></i></label>
                        <input type="text" class="form-control ml-2" placeholder="Enter yourId" id="replyId"
                               name="writerId">
                        <label for="replyPassword" class="ml-4"><i class="fa fa-unlock-alt fa-2x"></i></label>
                        <input type="password" class="form-control ml-2" placeholder="Enter password" id="replyPassword"
                               name="passwd">
                    </div>
                    <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" name="content"></textarea>
                    <button type="submit" class="btn btn-dark mt-3">등록</button>
                </li>
            </ul>
        </div>
    </form>

    <c:forEach var="comment" items="${comments}" varStatus="i">
        <div id="comments-list">
            <div class="card m-2">
                <div class="card-header">
                        ${comment.memberId}
                </div>
                <div class="card-body">
                        ${comment.content}
                </div>
            </div>

            <form id="deleteCommentForm" action="comment-delete-action.jsp" method="post">
                <input type="hidden" name="boardId" value="${param.boardId}">
                <input type="hidden" name="articleId" value="${param.articleId}">
                <input type="hidden" name="commentId" value="${comment.commentId}">
                <button type="button" class="btn btn-dark" onclick="confirmDelete()">삭제</button>
            </form>

            <script>
                function confirmDelete() {
                    if (confirm('정말로 이 댓글을 삭제하시겠습니까?')) {
                        document.getElementById("deleteCommentForm").setAttribute("action", "comment-delete-action.jsp");
                        document.getElementById("deleteCommentForm").submit();
                    }
                }
            </script>
        </div>
    </c:forEach>
</div>
<!-- section end -->

<!-- footer start -->
<jsp:include page="/module/footer.jsp"/>
<!-- footer end -->
<script src="https://kit.fontawesome.com/3accb69132.js" crossorigin="anonymous"></script>
</body>
</html>
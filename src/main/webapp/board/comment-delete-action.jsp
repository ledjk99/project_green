<%--
  댓글 삭제 처리
  User: 송승아
  Date: 2024-04-15
  Time: AM 9:35
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.ezen.mall.web.board.service.BoardService" %>
<%@ page import="com.ezen.mall.web.board.service.BoardServiceImpl" %>

<%
    int boardId = 0;
    if (request.getParameter("boardId") != null) {
        boardId = Integer.parseInt(request.getParameter("boardId"));
    }

    int articleId = 0;
    if (request.getParameter("articleId") != null) {
        articleId = Integer.parseInt(request.getParameter("articleId"));
    }

    int commentId = 0;
    if (request.getParameter("commentId") != null) {
        commentId = Integer.parseInt(request.getParameter("commentId"));
    }

    BoardService boardService = new BoardServiceImpl();
    boardService.deleteComment(boardId, articleId, commentId);

    request.setAttribute("boardId", boardId);
    request.setAttribute("articleId", articleId);
%>

<c:redirect url="read.jsp?boardId=${param.boardId}&articleId=${param.articleId}"/>
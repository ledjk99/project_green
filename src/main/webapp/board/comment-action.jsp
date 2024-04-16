<%--
  댓글 등록 처리
  User: Si7D-08
  Date: 2024-04-11
  Time: PM 3:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.ezen.mall.web.board.service.BoardService" %>
<%@ page import="com.ezen.mall.web.board.service.BoardServiceImpl" %>

<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="comment" class="com.ezen.mall.web.board.dto.Comment" scope="request"/>
<jsp:setProperty name="comment" property="*"/>
<%
    int boardId = 0;
    if (request.getParameter("boardId") != null) {
        boardId = Integer.parseInt(request.getParameter("boardId"));
    }

    int articleId = 0;
    if (request.getParameter("articleId") != null) {
        articleId = Integer.parseInt(request.getParameter("articleId"));
    }

    String memberId = request.getParameter("memberId");

    comment.setBoardId(boardId);
    comment.setArticleId(articleId);
    comment.setMemberId(memberId);

    BoardService boardService = new BoardServiceImpl();
    boardService.writeComment(comment);

    response.sendRedirect("read.jsp?boardId=" + boardId + "&articleId=" + articleId);
%>
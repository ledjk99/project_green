<%--
  게시글 삭제 처리
  User: 송승아
  Date: 2024-04-15
  Time: AM 9:35
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.ezen.mall.web.board.service.BoardService" %>
<%@ page import="com.ezen.mall.web.board.service.BoardServiceImpl" %>

<jsp:useBean id="article" class="com.ezen.mall.web.board.dto.Article" scope="session"/>
<jsp:setProperty name="article" property="*"/>

<%
    int boardId = Integer.parseInt(request.getParameter("boardId"));
    int articleId = Integer.parseInt(request.getParameter("articleId"));

    BoardService boardService = new BoardServiceImpl();
    boardService.deleteArticle(boardId, articleId);
%>

<c:choose>
    <c:when test="${param.boardId == 2}">
        <c:redirect url="qnalist.jsp?boardId=${param.boardId}"/>
    </c:when>
    <c:when test="${param.boardId == 3}">
        <c:redirect url="reviewlist.jsp?boardId=${param.boardId}"/>
    </c:when>
</c:choose>

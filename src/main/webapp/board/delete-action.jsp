<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.ezen.mall.web.board.service.BoardService" %>
<%@ page import="com.ezen.mall.web.board.service.BoardServiceImpl" %>
<%@ page import="java.io.IOException" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="com.ezen.mall.web.common.validate.Validator" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

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


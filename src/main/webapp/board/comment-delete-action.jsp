<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Si7D-08
  Date: 2024-04-15
  Time: AM 9:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.ezen.mall.web.board.service.BoardService" %>
<%@ page import="com.ezen.mall.web.board.service.BoardServiceImpl" %>
<%@ page import="java.io.IOException" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="com.ezen.mall.web.common.validate.Validator" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    int boardId = Integer.parseInt(request.getParameter("boardId"));
    int articleId = Integer.parseInt(request.getParameter("articleId"));

    BoardService boardService = new BoardServiceImpl();
    boardService.deleteComment(boardId, articleId);

    request.setAttribute("boardId", boardId);
    request.setAttribute("articleId", articleId);
%>
<c:redirect url="read.jsp?boardId=${param.boardId}&articleId=${param.articleId}"/>
<%@ page import="com.ezen.mall.web.board.service.BoardService" %>
<%@ page import="com.ezen.mall.web.board.service.BoardServiceImpl" %>
게시글 작성 처리
  User: 송승아
  Date: 2024-04-09
  Time: PM 4:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="article" class="com.ezen.mall.web.board.dto.Article" scope="request"/>
<jsp:setProperty name="article" property="*"/>
<%
    int boardId = Integer.parseInt(request.getParameter("boardId"));
    String passwd = "1111";
    article.setPasswd(passwd);
    article.setBoardId(boardId);

    String memberId = request.getParameter("memberId");
    article.setMemberId(memberId);

    BoardService boardService = new BoardServiceImpl();
    boardService.writeArticle(article);

    response.sendRedirect("qnalist.jsp?boardId=" + boardId);
%>
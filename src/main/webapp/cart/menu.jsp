<%--
  Created by IntelliJ IDEA.
  User: 13500H
  Date: 2024-04-10
  Time: 오후 10:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%request.setCharacterEncoding("utf-8");%>
<%
    String username = request.getParameter("id");
    session.setAttribute("session_id", username);
%>
<div>
    <h1><%=session.getAttribute("session_id")%>의 페이지 입니다.</h1>
    <h1>메뉴</h1>
    <hr>
    <form>
        <select name="m_menu">
            <option>오렌지</option>
            <option>포도</option>
            <option>사과</option>
            <option>딸기</option>
            <option>배</option>
        </select>
        <input type="submit" value="추가하기" formaction="add.jsp"><br>
        <input type="submit" value="장바구니" formaction="result.jsp">
        <input type="submit" value="로그아웃" formaction="login.jsp">

    </form>
</div>

<%--
  Created by IntelliJ IDEA.
  User: 13500H
  Date: 2024-04-10
  Time: 오후 10:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%--세션초기화--%>
<%session.invalidate();%>
<div>
    <h1>login page</h1>
    <hr>
    <form action="menu.jsp" method="post">
        <table>
            <tr>
                <td>아이디</td>
                <td><input type="text" name="id"></td>
            </tr>
            <tr>
                <td>비밀번호</td>
                <td><input type="text" name="passwd"></td>
            </tr>
            <tr>
                <td colspan="2" align="center"><input type="submit" value="로그인"></td>
            </tr>
        </table>
    </form>
</div>
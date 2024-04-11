<%--
  Created by IntelliJ IDEA.
  User: 13500H
  Date: 2024-04-10
  Time: 오후 10:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" import="java.util.*" %>
<%
    request.setCharacterEncoding("utf-8");
    ArrayList<String>list = (ArrayList)session.getAttribute("list");
%>
<div>
    <h1><%=session.getAttribute("session_id")%>의 장바구니</h1>
    <hr>
    <% if (list == null)
    %><h1>장바구니가 비어있습니다.</h1><%
    }else
    {
    for(String i : list)
    %>
    <form>
        <table>
            <tr>
                <td>
                <input type="text" value="<%=i%>" size="5" name="del">
                </td>
                <td>
                    <input type="submit"  formaction="delete.jsp" value="삭제하기">
                </td>
            </tr>
        </table>
    </form>
    <%
        }
        }
    %>
    <form action="menu.jsp" method="post">
        <input type="submit" value="이전으로">
    </form>
</div>
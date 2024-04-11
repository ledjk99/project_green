<%--
  Created by IntelliJ IDEA.
  User: 13500H
  Date: 2024-04-10
  Time: 오후 10:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" import="java.util.*" %>
<%request.setCharacterEncoding("utf-8");%>
<%
    String menu = request.getParameter("m_menu");
    ArrayList<String> list = (ArrayList)session.getAttribute("list");
    if (list == null){
        list = new ArrayList<String>();

    }
    list.add(menu);
    session.setAttribute("list", list);
%>
<script type="text/javascript">
    alert("<%=menu%>가 추가되었습니다.")
    history.go(-1);
</script>
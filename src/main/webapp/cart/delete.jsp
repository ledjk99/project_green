<%--
  Created by IntelliJ IDEA.
  User: 13500H
  Date: 2024-04-10
  Time: 오후 10:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" import="java.util.*" %>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<%
    request.setCharacterEncoding("utf-8");
%>
<%
    String delMenu = request.getParameter("del");
    ArrayList<String> list = (ArrayList)session.getAttribute("list");

    //삭제하기
    if (list != null)
    {
        try {
            for (int i = 0; i < list.size(); i++) {
                if (list.get(i).equals(delMenu))
                    list.remove(i);
            }
        }catch(Exception e){
                e.printStackTrace();
            }
            session.setAttribute("list", list);
        }
    %>

<script type="text/javascript">
    history.go(-2);
    alert("<%=delMenu%>가 추가되었습니다.")

</script>

<%@ page import="com.ezen.mall.web.member.service.MemberService" %>
<%@ page import="com.ezen.mall.web.member.dto.Member" %>
<%@ page import="com.ezen.mall.web.common.encription.EzenUtil" %>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    String id = request.getParameter("loginid");
    String passwd = request.getParameter("loginpw");
    String saveId = request.getParameter("saveid");
    String referer = request.getParameter("referer");

    // referer가 null이거나 없다면 -> 인덱스에서 로그인했다면
    // 로그인 성공 후 인덱스로 이동
    if (referer == null || referer.isEmpty()) {
        referer = "/";
    }

    MemberService memberService = new MemberService();
    Member loginMember = memberService.login(id, passwd);
    if (loginMember != null) {
        if (saveId != null) {
            Cookie saveIdCookie = new Cookie("saveId", EzenUtil.encription(id));
            saveIdCookie.setMaxAge(60 * 60 * 24 * 100); // 100일저장
            saveIdCookie.setPath("/");
            response.addCookie(saveIdCookie);
        } else {
            Cookie[] cookies = request.getCookies();
            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    if (cookie.getName().equals("saveId")) {
                        cookie.setPath("/");
                        cookie.setMaxAge(0);
                        response.addCookie(cookie);
                    }
                }
            }
        }
        session.setAttribute("loginMember", loginMember);
        response.sendRedirect(referer);
    } else {
%>
<script>
    alert("아이디와 비밀번호를 확인하세요.");
    location.href = 'login.jsp';
</script>
<%
    }
%>

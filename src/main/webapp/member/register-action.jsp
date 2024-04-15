<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.ezen.mall.web.member.service.MemberService" %>
<%@ page import="com.ezen.mall.web.member.dto.Member" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="com.ezen.mall.web.common.validate.Validator" %>
<%@ page import="com.ezen.mall.web.member.service.MemberService" %>

<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="member" class="com.ezen.mall.web.member.dto.Member" scope="session"/>
<jsp:setProperty name="member" property="*" />


<%
 // 입력데이터 데이터 유효성 검증 추가
    Map<String, String> errors = new HashMap<>();
    if(Validator.isEmpty(member.getId())) {
        errors.put("id", "[서버]아이디는 필수 입력사항입니다.");
    }
    if(Validator.isEmpty(member.getName())) {
        errors.put("name", "[서버]이름은 필수 입력사항입니다.");
    }
    if(Validator.isEmpty(member.getEmail())) {
        errors.put("email", "[서버]이메일은 필수 입력사항입니다.");
    }
    if(Validator.isEmpty(member.getPasswd())) {
        errors.put("passwd", "[서버]비밀번호는 필수 입력사항입니다.");
    }
    if(Validator.isEmpty(member.getPhone())) {
        errors.put("phone", "[서버]전화번호는 필수 입력사항입니다.");
    }


    // 검증 오류 메시지가 한개라도 존재 시 회원가입 화면으로 포워드
    if(!errors.isEmpty()) {
        request.setAttribute("errors", errors);
        request.getRequestDispatcher("/member/login.jsp").forward(request, response);
    }


MemberService memberService = new MemberService();
Member registerMember = memberService.registerMember(member);
session.setAttribute("member", registerMember);
%>
<c:redirect url="/member/result.jsp" />


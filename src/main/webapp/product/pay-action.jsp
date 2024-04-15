
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.ezen.mall.web.product.dto.OrderInfo" %>
<%@ page import="com.ezen.mall.web.product.service.CategoryService" %>
<%@ page import="com.ezen.mall.web.product.service.CategoryServiceImpl" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.Calendar" %>

<% request.setCharacterEncoding("utf-8");%>

<jsp:useBean id="orderInfo" class="com.ezen.mall.web.product.dto.OrderInfo" scope="session"/>
<jsp:useBean id="payment" class="com.ezen.mall.web.product.dto.Payment" scope="session"/>
<jsp:setProperty name="orderInfo" property="*" />
<jsp:setProperty name="payment" property="*"/>



<%
    Calendar cal = Calendar.getInstance();
    orderInfo.setDate(cal.getTime());

    CategoryService categoryService = new CategoryServiceImpl();
    categoryService.createOrderInfo(orderInfo);

    response.sendRedirect("orderlist.jsp?orderId="+orderInfo.getOrderId());

%>

<%
    payment.setMemberId("trent");
    payment.setOrderId(3);

    CategoryService categoryService1 = new CategoryServiceImpl();
    categoryService1.createPayment(payment);
    System.out.println(payment);
%>

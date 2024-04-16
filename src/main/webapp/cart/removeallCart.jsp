<%@ page contentType="text/html;charset=UTF-8" language="java"  pageEncoding="utf-8" %>
<%@ page import="com.ezen.mall.domain.cart.service.CartService" %>
<%@ page import="com.ezen.mall.domain.cart.service.CartServiceImpl" %>
<%@ page import="com.ezen.mall.web.product.dto.Product" %>
<%@ page import="com.ezen.mall.domain.cart.service.ShoppingCart" %>
<%
    String productId = request.getParameter("pid");
    System.out.println(productId);
    ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");
    if (cart != null) {
        cart.removeAll();
    }
    response.sendRedirect("cart.jsp");
%>
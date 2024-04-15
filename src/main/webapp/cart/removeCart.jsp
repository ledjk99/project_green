<%@ page contentType="text/html;charset=UTF-8" language="java"  pageEncoding="utf-8" %>
<%@ page import="com.ezen.mall.domain.cart.service.CartService" %>
<%@ page import="com.ezen.mall.domain.cart.service.CartServiceImpl" %>
<%@ page import="com.ezen.mall.domain.mall.dto.Product" %>
<%@ page import="com.ezen.mall.domain.cart.service.ShoppingCart" %>
Created by IntelliJ IDEA.
  User: 13500H
  Date: 2024-04-15
  Time: 오전 11:28
  To change this template use File | Settings | File Templates.
--%>

<%
    String productId = request.getParameter("pid");
    System.out.println(productId);
    ShoppingCart cart  = (ShoppingCart) session.getAttribute("cart");
    if(cart == null){
        cart = new ShoppingCart();
    }

    Product removeProduct = cart.removeProduct(Integer.parseInt(productId));
    if(removeProduct != null){
        response.sendRedirect("/cart/cart.jsp");
    }else {
 %>
<script>
    alert("삭제하고자 하는 상품이 존재하지 않습니다.");
    history.back();
</script>
<%

    }
%>
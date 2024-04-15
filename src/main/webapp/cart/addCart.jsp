<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    if(productId == null) productId = "24";
    String productPrice = request.getParameter("price");
    if(productPrice == null) productPrice = "10000";
    String count = request.getParameter("count");
    if(count == null) count = "1";

    CartService cartService = new CartServiceImpl();
    Product product  = cartService.getProduct(Integer.parseInt(productId));
    product.setStock(Integer.parseInt(count));

    ShoppingCart cart  = (ShoppingCart) session.getAttribute("cart");
    if(cart == null){
        cart = new ShoppingCart();
    }
    cart.addProduct(product);
    session.setAttribute("cart", cart);
    response.sendRedirect("/cart/cart.jsp");
%>
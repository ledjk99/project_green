<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.ezen.mall.domain.cart.service.CartService" %>
<%@ page import="com.ezen.mall.domain.cart.service.CartServiceImpl" %>
<%@ page import="com.ezen.mall.web.product.dto.Product" %>
<%@ page import="com.ezen.mall.domain.cart.service.ShoppingCart" %>
<%
    String productId = request.getParameter("pid");
    if(productId == null) productId = "24";
    String productPrice = request.getParameter("price");
    if(productPrice == null) productPrice = "10000";
    String count = request.getParameter("count");

    if(count == null || count.trim().isEmpty()) count = null;
    CartService cartService = new CartServiceImpl();
    Product product  = cartService.getProduct(Integer.parseInt(productId));
    if(count != null) {
        product.setStock(Integer.parseInt(count));
    }
    ShoppingCart cart  = (ShoppingCart) session.getAttribute("cart");
    if(cart == null){
        cart = new ShoppingCart();
    }
    cart.addProduct(product);
    session.setAttribute("cart", cart);
    response.sendRedirect("/cart/cart.jsp");
%>
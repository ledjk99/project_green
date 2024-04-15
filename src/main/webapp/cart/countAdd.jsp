<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.ezen.mall.domain.cart.service.CartService" %>
<%@ page import="com.ezen.mall.domain.cart.service.CartServiceImpl" %>
<%@ page import="com.ezen.mall.domain.mall.dto.Product" %>
<%@ page import="com.ezen.mall.domain.cart.service.ShoppingCart" %>
<%@ page import="java.util.List" %>
Created by IntelliJ IDEA.
  User: 13500H
  Date: 2024-04-15
  Time: 오전 11:28
  To change this template use File | Settings | File Templates.
--%>

<%
    String productId = request.getParameter("productId");
    String count = request.getParameter("count");

    Product product = new Product();
    product.setProductId(Integer.parseInt(productId));
    product.setStock(Integer.parseInt(count));
// 이 외에 필요한 상품 정보들을 설정해줍니다.

    ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");
    if (cart == null) {
        cart = new ShoppingCart();
        session.setAttribute("cart", cart);
    }

    boolean isDuplicate = false;
    List<Product> productList = cart.listAll();
    for (Product p : productList) {
        if (p.getProductId() == product.getProductId()) {
            // 상품이 이미 장바구니에 존재한다면 재고(stock)를 증가시킴
            p.setStock(p.getStock() + product.getStock());
            isDuplicate = true;
            break;
        }
    }

    if (!isDuplicate) {
        // 중복된 상품이 없다면 새로운 상품을 장바구니에 추가
        cart.addProduct(product);
    }

%>
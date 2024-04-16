<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.ezen.mall.domain.cart.service.CartService" %>
<%@ page import="com.ezen.mall.domain.cart.service.CartServiceImpl" %>
<%@ page import="com.ezen.mall.web.product.dto.Product" %>
<%@ page import="com.ezen.mall.domain.cart.service.ShoppingCart" %>
<%@ page import="java.util.List" %>
<%
    String productId = request.getParameter("productId");
    String count = request.getParameter("count");
    Product product = new Product();
    product.setProductId(Integer.parseInt(productId));
    product.setStock(Integer.parseInt(count));
    ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");
    if (cart == null) {
        cart = new ShoppingCart();
        session.setAttribute("cart", cart);
    }
    boolean isDuplicate = false;
    List<Product> productList = cart.listAll();
    for (Product p : productList) {
        if (p.getProductId() == product.getProductId()) {
            p.setStock(p.getStock() + product.getStock());
            isDuplicate = true;
            break;
        }
    }
    if (!isDuplicate) {
        cart.addProduct(product);
    }
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.ezen.mall.web.product.service.CategoryService" %>
<%@ page import="com.ezen.mall.web.product.service.CategoryServiceImpl" %>
<%@ page import="com.ezen.mall.web.product.dto.Product" %>
<%@ page import="com.ezen.mall.web.product.dto.Category" %>
<%@ page import="com.ezen.mall.web.product.dto.File" %>
<%
    String categoryId = request.getParameter("categoryId");
    CategoryService categoryService = new CategoryServiceImpl();
    List<Product> products = categoryService.productList(Integer.parseInt(categoryId));
    List<File> file = categoryService.getfile();
    request.setAttribute("file",file);
    request.setAttribute("products", products);
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <title>Green Health</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet"/>
    <link href="/css/styles.css" rel="stylesheet"/>
    <link href="/css/notice.css" rel="stylesheet"/>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
    <link type="text/css" rel="stylesheet" href="https://order.pstatic.net/202404/04_163641_1712216201/order_customer/mobile_static/css/service/mobile/detail.css">
</head>
<body>
<jsp:include page="/module/nav.jsp"/>
<jsp:include page="/module/header.jsp"/>
<!-- section start -->
<section class="py-5">
    <!-- product start -->
    <div class="container px-4 px-lg-5 mt-5">
        <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
            <c:forEach var="product" items="${products}" varStatus="loop">
            <div class="col mb-5">
                <div class="card h-100">
                    <c:forEach var="file" items="${file}" varStatus="loop">
                        <c:if test="${file.productId == product.productId}">
                            <img class="card-img-top" src="/img/${file.name}" alt="..." />
                        </c:if>
                    </c:forEach>
                    <!-- Product details-->
                    <div class="card-body p-4">
                        <div class="text-center">
                            <!-- Product name-->
                            <span class="fw-bolder" name="name" style="text-align: center">${product.name}</span>
                            <br>
                            <!-- Product price-->
                            <span class="text-muted text-decoration">${product.price}</span>
                        </div>
                    </div>
                    <!-- Product actions-->
                    <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                        <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="/product/productPage.jsp?categoryId=${product.categoryId}&productId=${product.productId}">상세 보기</a></div>
                    </div>
                </div>
            </div>
            </c:forEach>
        </div>
        <!-- product end -->
    </div>
</section>
<!-- section end -->
<jsp:include page="/module/footer.jsp"/>
<script src="https://kit.fontawesome.com/3accb69132.js" crossorigin="anonymous"></script>
</body>
</html>
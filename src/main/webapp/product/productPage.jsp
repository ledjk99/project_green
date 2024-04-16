<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.ezen.mall.web.product.dto.Product" %>
<%@ page import="com.ezen.mall.web.product.service.CategoryServiceImpl" %>
<%@ page import="com.ezen.mall.web.product.service.CategoryService" %>
<%@ page import="com.ezen.mall.web.product.dto.File" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    String categoryId = request.getParameter("categoryId");
    String productId = request.getParameter("productId");

    CategoryService categoryService = new CategoryServiceImpl();

    Product product = categoryService.getReadProduct(Integer.parseInt(categoryId), Integer.parseInt(productId));
    List<File> file = categoryService.getfile();
    request.setAttribute("product", product);
    request.setAttribute("file", file);

%>

<c:url var="pay" value="pay.jsp">
    <c:param name="productId" value="${product.productId}"/>
    <c:param name="productName" value="${product.name}"/>
    <c:param name="productPrice" value="${product.price}"/>
</c:url>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>
    <title>Green Health</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet"/>
    <link href="/css/styles.css" rel="stylesheet"/>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&family=Stylish&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/3accb69132.js" crossorigin="anonymous"></script>
</head>
<body>
<!-- nav start -->
<jsp:include page="/module/nav.jsp"/>
<jsp:include page="/module/header.jsp"/>
<!-- Section-->
<section class="py-5">
    <div class="container px-4 px-lg-5 mt-5">
        <div class="container px-4 px-lg-5 my-5">
            <div class="row gx-4 gx-lg-5 align-items-center">
                <c:forEach var="file" items="${file}" varStatus="loop">
                    <c:if test="${file.productId == product.productId}">
                        <img class="card-img" src="/img/${file.name}" style="width: 50%"/>
                    </c:if>
                </c:forEach>
                <div class="col-md-6">
                    <h1 class="display-5 fw-bolder" style=" font-family: Stylish, serif;">${product.name}</h1>
                    <p style=" font-family: Stylish, serif;">${product.information}</p>
                    <div class="fs-5 mb-5">
                        <span class="text-decoration-none" style=" font-family: Stylish, serif;"></span>
                    </div>
                    <hr class="my-4">
                    <div class="input-group fs-5 mb-5">
                    </div>
                    <form name="productForm" method="post" action="/cart/addCart.jsp">
                        <div class="container bg-light">
                            <label>주문수량</label> <input type="number" name="count">
                            <br>
                            <h5>총 상품 금액</h5>
                            <h5 name="totalPrice" id="totalPrice" style="text-align: right">${product.price}원</h5>
                            <input type="hidden" name="pid" value="${product.productId}">
                            <input type="hidden" name="price" value="${product.price}">
                        </div>
                        <br>
                        <strong>※2개이상의 제품 구매를 원하실 경우 장바구니에 넣어주세요.</strong>
                        <div class="d-flex">
                            <button class="btn btn-outline-dark" type="submit">
                                <i class="fa-solid fa-credit-card"></i>
                                <a href="${pay}" style="color: black">바로 구매하기</a>
                            </button>&nbsp
                            <button class="btn btn-outline-dark flex-shrink-0" type="submit" style="color: black">
                                <i class="bi-cart-fill me-1"></i>
                                   장바구니 담기
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <section class="py-5 bg-light">
            <div class="container">
                <p class="lead" id="description" style="text-align: center">제품 상세 페이지 입니다.</p>
            </div>
            <hr class="my-4">
            <div class="container px-4 px-lg-5 mt-5">
                <div class="text-center">
                    <c:forEach var="file" items="${file}" varStatus="loop">
                        <c:if test="${file.productId == product.productId}">
                            <img class="card-img-top mb-5 mb-md-0" src="/img/${file.name}" alt="..."/>
                        </c:if>
                    </c:forEach>
                </div>
            </div>
        </section>
    </div>
</section>
<!-- Footer-->
<footer class="py-5 bg-dark">
    <div class="container"><p class="m-0 text-center text-white">Copyright &copy; Green Health 2024</p></div>
</footer>
<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="js/scripts.js"></script>
<script>

    // alert(document.productForm.count.value);
    document.productForm.addEventListener("submit", event => {
        event.preventDefault();
        let pid = document.productForm.pid.value;
        let price = document.productForm.price.value;
        let count = document.productForm.count.value;
        event.target.submit();

    });
</script>
</body>
</html>


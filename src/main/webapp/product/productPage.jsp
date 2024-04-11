<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.ezen.mall.web.product.dto.Product"%>
<%@ page import="com.ezen.mall.web.product.service.CategoryServiceImpl"%>
<%@ page import="com.ezen.mall.web.product.service.CategoryService"%>
<%@ page import="com.ezen.mall.web.product.dto.File" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    String categoryId = request.getParameter("categoryId");
    String productId = request.getParameter("productId");

    CategoryService categoryService = new CategoryServiceImpl();

    Product product = categoryService.getReadProduct(Integer.parseInt(categoryId), Integer.parseInt(productId));
    List<File> file = categoryService.getfile();
    request.setAttribute("product",product);
    request.setAttribute("file",file);

%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Green Health</title>
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="../assets/favicon.ico" />
    <!-- Bootstrap icons-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="/css/styles.css" rel="stylesheet"/>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&family=Stylish&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/3accb69132.js" crossorigin="anonymous"></script>
</head>
<body>
<!-- Navigation-->
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container px-4 px-lg-5">
        <a class="navbar-brand" href="#!"><i class="fa-solid fa-capsules"></i>Green Health</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                <li class="nav-item"><a class="nav-link active" aria-current="page" href="#!">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="#!">About</a></li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Shop</a>

                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="#!">All Products</a></li>
                        <li><hr class="dropdown-divider" /></li>
                        <li><a class="dropdown-item" href="#!">인기 상품</a></li>
                        <li><a class="dropdown-item" href="#!">비타민</a></li>
                        <li><a class="dropdown-item" href="#!">루테인</a></li>
                        <li><a class="dropdown-item" href="#!">오메가</a></li>
                        <li><a class="dropdown-item" href="#!">아연</a></li>
                        <li><a class="dropdown-item" href="#!">유산균</a></li>
                    </ul>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="boardList" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Board</a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="#!">Board</a></li>
                        <li><hr class="dropdown-divider" /></li>
                        <li><a class="dropdown-item" href="#!">공지사항</a></li>
                        <li><a class="dropdown-item" href="#!">Q&A</a></li>
                        <li><a class="dropdown-item" href="#!">상품 후기</a></li>

                    </ul>
                </li>
            </ul>
            <form class="d-flex">

                <button class="btn btn-outline-dark" type="submit">
                    <i class="fa-solid fa-right-to-bracket"></i>
                    Login
                    <span class="badge bg-dark text-white ms-1 rounded-pill"></span>
                </button>

                <button class="btn btn-outline-dark" type="submit">
                    <i class="bi-cart-fill me-1"></i>
                    Cart
                    <span class="badge bg-dark text-white ms-1 rounded-pill">0</span>
                </button>

                <button class="btn btn-outline-dark" type="submit">
                    <i class="fa-solid fa-user-plus"></i>
                    Sign up
                    <span class="badge bg-dark text-white ms-1 rounded-pill"></span>
                </button>

            </form>
        </div>
    </div>
</nav>
<!-- Header-->
<header class="bg-dark py-5">
    <div class="container px-4 px-lg-5 my-5">
        <div class="text-center text-white">
            <h1 class="display-4 fw-bolder"><i class="fa-solid fa-capsules"></i>Green Health</h1>
            <p class="lead fw-normal text-white-50 mb-0">건강한 하루를 위하여</p>
        </div>
    </div>
</header>


<!-- Section-->
<section class="py-5">
    <div class="container px-4 px-lg-5 mt-5">

        <!-- Product section-->

        <div class="container px-4 px-lg-5 my-5">
            <div class="row gx-4 gx-lg-5 align-items-center" >

                <c:forEach var="file" items="${file}" varStatus="loop">
                    <c:if test="${file.productId == product.productId}">
                        <img class="card-img" src="/img/${file.name}" style="width: 50%"/>
                    </c:if>
                </c:forEach>

                <div class="col-md-6">
                    <h1 class="display-5 fw-bolder"  style=" font-family: Stylish, serif;">${product.name}</h1>
                    <p  style=" font-family: Stylish, serif;">${product.information}</p>
                    <div class="fs-5 mb-5">
                        <span class="text-decoration-none"  style=" font-family: Stylish, serif;"></span>
                    </div>

                    <hr class="my-4">
                    <div class="input-group fs-5 mb-5">
                        <div class="input-group-prepend">
                            <span class="input-group-text">주문 가능 수량</span>
                        </div>
                        <input class="form-control text-center me-3" id="count" name="count" type="text" value="${product.stock}" style=" max-width: 5rem" />
                    </div>


                    <div class="container bg-light">
                        <br>
                        <h5>총 상품 금액</h5>
                        <h5 name="totalPrice" id="totalPrice" style="text-align: right" >${product.price}원</h5>

                    </div>
                    <br>

                    <div class="d-flex">
                        <form action="" class="d-flex" method="post">
                            <button class="btn btn-outline-dark"type="submit">
                                <i class="fa-solid fa-credit-card"></i>
                                바로 구매하기
                            </button>
                        </form>
                        &nbsp
                        <button class="btn btn-outline-dark flex-shrink-0" type="button">
                            <i class="bi-cart-fill me-1"></i>
                            장바구니 담기
                        </button>
                    </div>
                </div>
            </div>

        </div>


        <!-- Related items section-->
        <section class="py-5 bg-light">
            <div class="container">
                <p class="lead" id="description" style="text-align: center">제품 상세 페이지 입니다.</p>
            </div>
            <hr class="my-4">
            <div class="container px-4 px-lg-5 mt-5"  >
                <div class="text-center">
                    <c:forEach var="file" items="${file}" varStatus="loop">
                        <c:if test="${file.productId == product.productId}">
                            <img class="card-img-top mb-5 mb-md-0" src="/img/${file.name}" alt="..." />
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
</body>
</html>

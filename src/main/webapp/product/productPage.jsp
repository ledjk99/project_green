<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html lang="ko">
<!-- head start -->
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <title>Green Health</title>
    <link href="/css/styles.css" rel="stylesheet"/>
    <link href="/css/notice.css" rel="stylesheet"/>
    <link href="/css/qnalist.css" rel="stylesheet"/>
    <link href="/css/reviewlist.css" rel="stylesheet"/>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
    <link type="text/css" rel="stylesheet" href="https://order.pstatic.net/202404/04_163641_1712216201/order_customer/mobile_static/css/service/mobile/detail.css">
    <link href="/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<!-- nav start -->
<jsp:include page="/module/nav.jsp"/>
<!-- nav end -->
<!-- header start -->
<jsp:include page="/module/header.jsp"/>
<!-- header end -->

<section class="py-5">
    <div class="container px-4 px-lg-5 mt-5">

        <!-- Product section-->

        <div class="container px-4 px-lg-5 my-5" th:object="${item}">
            <div class="row gx-4 gx-lg-5 align-items-center" >
                <div class="col-md-6"><img class="card-img-top mb-5 mb-md-0" src="img/zio.jpg" alt="..." /></div>
                <div class="col-md-6">
                    <h1 class="display-5 fw-bolder" text="${item.getName()}" style=" font-family: Stylish, serif;">멀티비타민</h1>
                    <div class="fs-5 mb-5">
                        <input type="hidden" th:value="${item.price}" id="price" name="price">
                        <span class="text-decoration-none" th:text="${item.getPrice()}" style=" font-family: Stylish, serif;"></span>39800원
                    </div>



                    <hr class="my-4">
                    <div class="input-group fs-5 mb-5">
                        <div class="input-group-prepend">
                            <input type="hidden" th:value="${item.stockQuantity}" id="stockQuantity" name="stockQuantity">
                            <span class="input-group-text">주문 수량</span>
                        </div>
                        <input class="form-control text-center me-3" id="count" name="count" type="number" value="1" style=" max-width: 5rem" />
                    </div>


                    <div class="container bg-light">
                        <br>
                        <h5>총 상품 금액</h5>
                        <h5 name="totalPrice" id="totalPrice" style="text-align: right" >39800원</h5>

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
                        <button class="btn btn-outline-dark flex-shrink-0" type="button" >
                            <i class="bi-cart-fill me-1"></i>
                            <a href="/cart/addCart.jsp">장바구니 담기</a>
                        </button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Related items section-->
        <section class="py-5 bg-light">
            <div class="container">
                <p class="lead" id="description" style="text-align: center"  th:text="${item.getDescription()}">제품 상세 페이지 입니다.</p>
            </div>
            <hr class="my-4">
            <div class="container px-4 px-lg-5 mt-5"  >
                <div class="text-center">
                    <p>성능 좋은 멀티 비타민 입니다</p>
                    <img class="card-img-top rounded mb-5 mb-md-0" style="padding-bottom: 50px; width: 100%;" src="img/pp.png" >

                </div>
            </div>
        </section>
    </div>
</section>
<!-- footer start -->
<jsp:include page="/module/footer.jsp"/>
<!-- footer end -->
<script src="https://kit.fontawesome.com/3accb69132.js" crossorigin="anonymous"></script>
</body>
</html>
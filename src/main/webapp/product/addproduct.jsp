<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<!-- head start -->
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Green Health</title>
    <link href="/css/styles.css" rel="stylesheet"/>
    <link href="/css/notice.css" rel="stylesheet"/>
    <link href="/css/qnalist.css" rel="stylesheet"/>
    <link href="/css/reviewlist.css" rel="stylesheet"/>
    <link href="/css/cart.css" rel="stylesheet" />
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
<!-- section start -->
<section class="py-5">
    <div class="container px-4 px-lg-5 mt-5">

        <div class="jumbotron">
            <div class="container">
                <h1 class="display-3">
                    상품 등록
                </h1>
            </div>
        </div>

        <div class="container">


            <form name="newProduct" class="form-horizontal" method="post">


                <div class="form-group row">
                    <label class="col-sm-2">상품 목록</label>
                    <div class="com-sm-5">
                        <input type="radio" name="condition" > 비타민
                        <input type="radio" name="condition"> 루테인
                        <input type="radio" name="condition" > 오메가
                        <input type="radio" name="condition"> 아연
                        <input type="radio" name="condition"> 유산균
                    </div>
                </div>

                <div class="form-group row">
                    <label class="col-sm-2">상품 이름</label>
                    <div class="com-sm-3">
                        <input type="text" id="name" name="name" class="form-control">
                    </div>
                </div>

                <div class="form-group row">
                    <label class="col-sm-2">가격</label>
                    <div class="com-sm-3">
                        <input type="text" id="unitPrice" name="unitPrice" class="form-control">
                    </div>
                </div>

                <div class="form-group row">
                    <label class="col-sm-2">상세 내용</label>
                    <div class="com-sm-5">
                        <textarea name="description" cols="50" rows="2" class="form-control"></textarea>
                    </div>
                </div>


                <div class="form-group row">
                    <label class="col-sm-2">재고 수</label>
                    <div class="com-sm-3">
                        <input type="text" id="unitsInStock" name="unitsInStock" class="form-control">
                    </div>
                </div>



                <div class="form-group row">
                    <label class="col-sm-2">메인 이미지</label>
                    <div>
                        <input type="file" name="productImage" class="form-control">
                    </div>
                </div>

                <div class="form-group row">
                    <label class="col-sm-2">제품상세 이미지</label>
                    <div>
                        <input type="file" name="productImage" class="form-control">
                    </div>
                </div>
                <br>

                <div class="bottom_button_area">
                    <button type="button" class="btn btn-outline-dark" style="width: 1200px;"><span>등록 하기</span></button>
                </div>

            </form>
        </div>






    </div>
</section>
<!-- section end -->
<!-- footer start -->
<jsp:include page="/module/footer.jsp"/>
<!-- footer end -->
<script src="https://kit.fontawesome.com/3accb69132.js" crossorigin="anonymous"></script>
</body>
</html>
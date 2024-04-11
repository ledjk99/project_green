<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
    <!-- head start -->
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Green Health</title>
        <link href="/css/styles.css" rel="stylesheet" />
        <link href="/css/cart.css" rel="stylesheet" />
        <script src="https://kit.fontawesome.com/3accb69132.js" crossorigin="anonymous"></script>
    </head>
    <!-- head end -->


    <!-- body start -->
    <body>
        <jsp:include page="/module/nav.jsp"/>
        <!-- nav end -->
        <!-- header start -->
        <jsp:include page="/module/header.jsp"/>
        <!-- header end -->
        <!-- section start -->
        <section class="py-5">
            <div class="container px-4 px-lg-5 mt-5">



                <section class="cart">
                    <div class="cart__information">
                        <ul>
                            <li>장바구니 상품은 최대 30일간 저장됩니다.</li>
                            <li>가격, 옵션 등 정보가 변경된 경우 주문이 불가할 수 있습니다.</li>
                            <li>오늘출발 상품은 판매자 설정 시점에 따라 오늘출발 여부가 변경될 수 있으니 주문 시 꼭 다시 확인해 주시기 바랍니다.</li>
                        </ul>
                    </div>
                    <table class="cart__list">
                        <form>
                            <thead>
                            <tr>
                                <td><input type="checkbox"></td>
                                <td colspan="2">상품정보</td>
                                <td>수량</td>
                                <td>상품금액</td>
                                <td>배송비</td>
                            </tr>
                            </thead>
                            <tbody>
                            <tr class="cart__list__detail">
                                <td><input type="checkbox"></td>
                                <td><img src="../img/zio.jpg" alt="magic keyboard"></td>
                                <td><a href="#">상품 상세보기</a><span class="cart__list__smartstore"></span>
                                    <p>비타민C</p>
                                    <sapn class="price">116,62원</sapn><span
                                            style="text-decoration: line-through; color: lightgray;">119,000</span>
                                </td>
                                <td class="cart__list__option">
                                    <!-- <button class="cart__list__optionbtn">주문조건 추가/변경</button> -->
                                    <input type="number" style="text-align: right; width: 43px; margin-bottom: 5px;" min="1" max="99" step="1" value="1">
                                    <button class="default" style="border-radius: 3px; size:10px;"> 변경</button>
                                </td>
                                <td><span class="price">116,620원</span><br>
                                    <button class="cart__list__orderbtn">주문하기</button>
                                </td>
                                <td>무료</td>
                            </tr>

                            <tr class="cart__list__detail">
                                <td style="width: 2%;"><input type="checkbox"></td>
                                <td style="width: 13%;">
                                    <img src="../img/zio.jpg" alt="magic mouse">
                                </td>
                                <td style="width: 27%;"><a href="#">상품 상세보기</a><span class="cart__list__smartstore"> </span>
                                    <p>오메가3</p>
                                    <span class=" price">88,900원</span>
                                </td>
                                <td class="cart__list__option" style="width: 27%;">
                                    <input type="number" style="text-align: right; width: 43px; margin-bottom: 5px;" min="1" max="99" step="1" value="1">
                                    <button class="default" style="border-radius: 3px; size:10px;"> 변경</button>
                                </td>
                                <td style="width: 15%;"><span class="price">88,900원</span><br>
                                    <button class="cart__list__orderbtn">주문하기</button>
                                </td>
                                <td style="width: 15%;">무료</td>
                            </tr>

                            </tbody>
                            <tfoot>

                            <!-- 결제예정금액 테이블 -->
                            <table id="calculation2">
                                <tr>
                                    <th>총 상품금액</th>
                                    <th>총 배송비</th>
                                    <th><span>결제예정금액</span></th>
                                </tr>
                                <tr style="background-color: #fff;">
                                    <td >0</span>원</td>
                                    <td>+<span class="price">0</span>원</td>
                                    <td>=<span class="price">0</span>원</td>
                                    <td></td>
                                </tr>
                            </table>
                            <tr>
                                <td><input type="checkbox"> <button class="cart__list__optionbtn">선택상품 삭제</button></td>
                                <td><input type="checkbox"> <button class="cart__list__optionbtn">전체삭제</button></td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                            </tfoot>
                        </form>
                    </table>


                    <div class="cart__mainbtns">
                        <button class="cart__bigorderbtn left">쇼핑 계속하기</button>
                        <button class="cart__bigorderbtn right">주문하기</button>
                    </div>
                </section>


            </div>
        <!-- section end -->
        </section>


        <!-- footer start -->
        <jsp:include page="/module/footer.jsp"/>
        <!-- footer end -->


    </body>
<!-- body end -->


</html>

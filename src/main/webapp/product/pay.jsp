<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.ezen.mall.web.product.dto.OrderInfo" %>
<%@ page import="com.ezen.mall.web.product.service.CategoryService" %>
<%@ page import="com.ezen.mall.web.product.service.CategoryServiceImpl" %>
<%
    String productId = request.getParameter("productId");
    String productPrice = request.getParameter("productPrice");
    String productName = request.getParameter("productName");
%>
<!DOCTYPE html>
<html lang="ko">
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
    <style>
        #memo {
            width: 300px;
            height: 40px;
        }
        #card{
            width: 200px;
        }
    </style>
</head>
<body>
<jsp:include page="/module/nav.jsp"/>
<jsp:include page="/module/header.jsp"/>
<!-- section start -->
<section class="py-5">
    <div class="container px-4 px-lg-5 mt-5">
   <form name="order-form" action="pay-action.jsp" method="post">
        <div class="detail_section">
            <div class="info_area">
                <div class="info_head">
                    <h3 class="h3">배송지정보</h3>
                </div>
                <div class="info_cont">
                    <ul class="info_list person_info delivery">
                        <li><strong>수령인</strong><input type="text" name="receiver">
                        </li>
                        <li><strong>연락처</strong><input type="text" name="phoneNum" >
                        <li><strong>배송지</strong>
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control" id="floatingInput" name="address">
                            <label for="floatingInput">주소 입력</label>
                        </div>
                        <li>
                            <strong>배송 메시지</strong>
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control" id="floatingInpu" name="comment">
                            <label for="floatingInpu">배송메시지 입력</label>
                        </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="detail_section type_payment_info">
            <div class="info_area ">
                <div class="info_head">
                    <h3 class="h3">총 주문금액</h3>
                    <strong class="detail_order_price" name="productPrice"><%=productPrice%>원</strong>
                </div>
                <div class="info_cont">
                    <ul class="info_list">
                        <li>
                            <div class="total">
                                <strong>상품명</strong>
                                <em class="amount"><span name="productName"></span><%=productName%></em>
                            </div>
                        </li>
                        <li>
                            <div class="total">
                                <strong>상품금액</strong>
                                <em class="amount"><span name="productPrice"></span><%=productPrice%>원</em>
                            </div>
                        </li>
                        <li>
                            <div class="total">
                                <strong>배송비</strong>
                                <em class="amount"><span>무료배송</span></em>
                            </div>
                        </li>
                        <li>
                            <div class="total">
                                <strong>쿠폰할인</strong>
                                <em class="amount"><span>0</span>원</em>
                            </div>
                            <ul class="inner_list">

                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </div>

        <!-- 결제상세 -->
        <div class="detail_section type_payment_info">
            <div class="info_area">
                <div class="info_head">
                    <h3 class="h3">결제상세</h3>
                </div>
                <div class="info_cont">
                    <ul class="info_list">

                        <li class="type_main_payment">
                            <strong>카드 결제</strong>
                            <em class="amount"><span><%=productPrice%></span>원</em>
                            <select class="form-select" aria-label="Default select example" id="card">
                                <option selected>카드 선택</option>
                                <option value="1">현대카드</option>
                                <option value="2">하나카드</option>
                                <option value="3">우리카드</option>
                                <option value="4">신한카드</option>
                                <option value="5">국민카드</option>
                                <option value="6">BC카드</option>
                            </select>
                            <ul class="dot_list type_round">
                                <li>환불은 30일 이내에 가능합니다.</li>
                                <li>무이자 적용 여부는 카드사로 문의하시면 정확하게 확인할 수 있습니다.</li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </div>


        <div class="bottom_button_area">
            <button type="submit" class="btn btn-outline-dark" style="width: 100%"<p onclick="alert('<%=productName%>상품을 결제완료 되었습니다!')">구매 하기</p></button>
        </div>

        </form>
    </div>
</section>
<!-- section end -->
<!-- footer start -->
<jsp:include page="/module/footer.jsp"/>
<!-- footer end -->
<script src="https://kit.fontawesome.com/3accb69132.js" crossorigin="anonymous"></script>
</body>
</html>
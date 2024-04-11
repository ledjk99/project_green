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

        <section class="module">


            <table class="table " style="text-align: center;" >
                <tbody>
                <tr style="vertical-align : middle;" >
                    <th  class="font-alt" style="text-align: center; vertical-align : middle; width:13%;" >주문일</th>
                    <th  class="font-alt" style="text-align: center; vertical-align : middle; width:8%;">주문번호</th>
                    <th  class="font-alt" style="text-align: center; vertical-align : middle; width:14%;">수령인</th>
                    <th  class="font-alt" style="text-align: center; vertical-align : middle; width:8%;">연락처</th>
                    <th  class="font-alt" style="text-align: center; vertical-align : middle; width:8%;">결제 금액</th>
                    <th  class="font-alt" style="text-align: center; vertical-align : middle;; width:20%;">구매한 상품</th>
                    <th  class="font-alt" style="text-align: center; vertical-align : middle;; width:14%;">배송 메시지</th>
                </tr>

                <tr style="text-align: center; ">


                    <td style="vertical-align : middle;"></td>
                    <td class="hidden-xs" style="vertical-align : middle;">
                        <a href=></a>
                    </td>
                    <td class="hidden-xs" style="vertical-align : middle;">
                    </td>
                    <td class="hidden-xs" style="vertical-align : middle;">
                    </td>
                    <td class="hidden-xs" style="vertical-align : middle;">
                    </td>
                    <td class="hidden-xs" style="vertical-align : middle; " >
                        <form action="" method="post">
                            <input type="hidden" value="" name="ordered_no" id="ordered_no">
                        </form>
                </tr>
                </tbody>
            </table>
        </section>
    </div>
</section>
<!-- section end -->
<!-- footer start -->
<jsp:include page="/module/footer.jsp"/>
<!-- footer end -->
<script src="https://kit.fontawesome.com/3accb69132.js" crossorigin="anonymous"></script>
</body>
</html>
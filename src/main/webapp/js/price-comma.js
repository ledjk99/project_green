// 숫자를 천 단위 콤마로 변환하는 함수
function addCommasToNumber(number) {
    return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

// // 페이지 로드 후 실행되는 코드
window.onload = function() {
//     // 총 주문 금액을 가져와서 천 단위 콤마를 추가하여 출력
//     var totalOrderPriceElement = document.getElementById("totalOrderPrice");
//     var totalOrderPrice = parseInt(totalOrderPriceElement.innerText);
//     totalOrderPriceElement.innerText = addCommasToNumber(totalOrderPrice);
//
//
    // 상품가를 가져와서 천 단위 콤마를 추가하여 출력
    var productPriceElements = document.querySelectorAll(".product_price");
    productPriceElements.forEach(function(element) {
        var productPrice = parseInt(element.innerText);
        element.innerText = addCommasToNumber(productPrice);
    });


    // 총 주문 금액을 가져와서 천 단위 콤마를 추가하여 출력
    var totalOrderPriceElement = document.getElementById("totalOrderPrice");
    var productPriceElement = document.getElementById("productPrice");
    var totalOrderPrice = parseInt(totalOrderPriceElement.innerText);
    var productPrice = parseInt(productPriceElement.innerText);
    totalOrderPriceElement.innerText = addCommasToNumber(totalOrderPrice);
    productPriceElement.innerText = addCommasToNumber(productPrice);
}
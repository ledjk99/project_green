// 상품 수량이 변경될 때 호출되는 함수
function updatePrice(index) {
    // 상품의 수량과 가격 가져오기
    let quantity = document.getElementById("quantity_" + index).value;
    let price = parseFloat(document.getElementById("price_" + index).innerText.replace("원", "").replace(",", ""));

    // 총 금액 계산하여 표시하기
    let totalPrice = quantity * price;
    document.getElementById("total_" + index).innerText = totalPrice.toLocaleString() + "원";

    // 전체 합계 업데이트
    updateTotalPrice();
}

// 전체 합계 업데이트 함수
function updateTotalPrice() {
    let total = 0;
    let quantities = document.querySelectorAll("[id^='quantity_']");
    let prices = document.querySelectorAll("[id^='price_']");
    for (let i = 0; i < quantities.length; i++) {
        let quantity = parseInt(quantities[i].value);
        let price = parseFloat(prices[i].innerText.replace("원", "").replace(",", ""));
        total += quantity * price;
    }
    document.getElementById("total_price").innerText = total.toLocaleString() + "원";
}


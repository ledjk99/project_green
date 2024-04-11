// 회원가입 버튼 클릭 이벤트 핸들러
document.querySelector("#signup-button").addEventListener("click", function() {
    // 2탭의 input 요소를 감싸고 있는 div의 id를 통해 해당 요소 불러오기
    var signUpTab = document.querySelector("#tab-2");
    // 해당 탭을 활성화
    signUpTab.checked = true;
});

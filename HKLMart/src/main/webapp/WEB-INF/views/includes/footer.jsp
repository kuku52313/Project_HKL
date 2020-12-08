<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>


<footer>
    <!-- Footer top -->
    <br>
  
    <br>
    <br>
    <div class="row footer-top">

        <div class="col-4"></div>

        <div class="col-2 font-set text-center">
            <p>
                <span>고객센터</span><br>
                <span>080-1234-5678 · 1588-1234</span><br>
                <span>주소 : 서울특별시 종로구 청와대로 1</span>
            </p>
            <p>
                <span>월~금 9:00 ~ 12:00 / 13:00 ~ 18:00</span>
            </p>
            <p>
                <span>주말, 공휴일 휴무</span>
            </p>
        </div>

        <div class="col-3 font-set text-left">
            <p>
                <span>(주)에이치케이엘</span><br>
                <span>대표이사 : 한김이</span><br>
                <span>주소 : 서울특별시 종로구 청와대로 1</span>
            </p>
            <p>
                <span>사업자등록번호 : 111-11-11111</span>
                <br>
                <span>통신판매업신고 : 제 2020-서울종로구-1111호</span>
            </p>
            <p>
                <span>개인정보보호 책임자 : 홍길동</span>
                <br>
                <span>이메일 : hklmart@hkl.com</span>
            </p>
        </div>

        <div class="col-3"></div>

    </div>

    <hr>

    <!-- Footer bottom -->
    <div class="row footer-bottom">
        <p class="col-12 text-center">
            <a href="#">
                <img src="/resources/img/bottom_logo.png">
            </a>
            <br><br>
            본 상품의 상품 이미지 저작권은 ㈜에이치케이엘에 있으며 내용의 무단복제를 금합니다.
            <br>
            COPYRIGHT Ⓒ HKL-MART CO,LTD. ALL RIGHTS RESERVED.
        </p>
    </div>




    <script>
        const toggleBtn = document.querySelector('.navbar_toggleBtn');
        const search = document.querySelector('.navbar_search');
        const menu = document.querySelector('.navbar_menu');


        toggleBtn.addEventListener('click', () => {
            search.classList.toggle('active');
            menu.classList.toggle('active');
        });


    </script>
</footer>



</html>
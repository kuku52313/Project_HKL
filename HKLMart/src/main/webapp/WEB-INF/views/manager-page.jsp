<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>

<%@include file="includes/header.jsp" %>

<head>
    <title>HKL Mart :: manager-page</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.1/css/all.css" integrity="sha384-vp86vTRFVJgpjF9jiIGPEEqYqlDwgyBgEF109VFjmqGmIY/Y4HV4d3Gp2irVfcrp" crossorigin="anonymous">
    <link rel="stylesheet" href="/resources/bootstrap/4.5.3/css/bootstrap.min.css">
    <link rel="shortcut icon" href="/resources/img/back_exception.jpg">
    <link rel="stylesheet" href="/resources/css/index.css">
    <link rel="stylesheet" href="/resources/css/login.css">
    <script src="/resources/jquery/3.5.1/jquery.min.js"></script>
    <script src="/resources/bootstrap/4.5.3/js/bootstrap.min.js"></script>
</head>

<!-- Body -->
<div id="body" class="container-fluid">
    <div class="row">
        <!-- 왼쪽 공백 -->
        <div class="col-1"></div>

        <!-- 사이드 메뉴 -->
        <div class="col-2">
            <ul class="sidebar" id="sidebar">
                <hr/>
                <li><a class="sidebarMain" href="#header">관리자 페이지</a></li>
                <li><a href="#prudctListPage">제품 코드 리스트</a></li>
                <li><a href="#orderListPage">주문 전체 내역</a></li>
                <li><a href="#askBoardPage">회원 문의 내역</a></li>
                <li><a href="#boardReviews">리뷰 관리 페이지</a></li>
                <li><a href="#memberList">회원 조회 페이지</a></li>
                <li><a href="/product/product-regist">제품 등록 페이지</a></li>
                <hr/>
            </ul>
        </div>

        <!-- 작업중 -->
        <div class="col-7" style="font-family: Godo; text-align: center; font-weight: bold">
            <br/><br/>
            <div id="prudctListPage">
                <span class="font-set" style="font-size: 25px">제품 관리 페이지</span>
                <a href="#" class="font-set" style="font-size: 15px; color: gray; margin-left: 50px">더보기</a>
                <hr/>
            </div>

            <br/><br/>
            <div id="orderListPage">
                <span class="font-set" style="font-size: 25px">주문 전체 내역 페이지</span>
                <a href="#" class="font-set" style="font-size: 15px; color: gray; margin-left: 50px">더보기</a>
                <hr/>
            </div>

            <br/><br/>
            <div id="askBoardPage">
                <span class="font-set" style="font-size: 25px">회원 문의 관리 페이지</span>
                <a href="#" class="font-set" style="font-size: 15px; color: gray; margin-left: 50px">더보기</a>
                <hr/>
            </div>

            <br/><br/>
            <div id="boardReviews">
                <span class="font-set" style="font-size: 25px">리뷰 관리 페이지</span>
                <a href="#" class="font-set" style="font-size: 15px; color: gray; margin-left: 50px">더보기</a>
                <hr/>
            </div>

            <br/><br/>
            <div id="memberList">
                <span class="font-set" style="font-size: 25px">회원정보 조회 페이지</span>
                <a href="#" class="font-set" style="font-size: 15px; color: gray; margin-left: 50px">더보기</a>
                <hr/>
            </div>

            <br/><br/>

        </div>

        <!-- 오른쪽 공백 -->
        <div class="col-2"></div>
    </div>
</div>

<br/><br/>
<hr/>

<!-- Footer -->
<footer id="footer" class="container-fluid footer-wrap">
    <br/>
    <div class="row">
        <div class="col-3"></div>

        <div class="col-3 text-left"></div>

        <div class="col-3"></div>

        <div class="col-3"></div>
    </div>

    <br/>

    <!-- Footer top -->
    <div class="row footer-top">
        <div class="col-4"></div>

        <div class="col-2 font-set text-left">
            <p>
                <span>고객센터</span><br/>
                <span>080-1234-5678 · 1588-1234</span><br/>
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
                <span>(주)에이치케이엘</span><br/>
                <span>대표이사 : 한김이</span><br/>
                <span>주소 : 서울특별시 종로구 청와대로 1</span>
            </p>
            <p>
                <span>사업자등록번호 : 111-11-11111</span>
                <br/>
                <span>통신판매업신고 : 제 2020-서울종로구-1111호</span>
            </p>
            <p>
                <span>개인정보보호 책임자 : 홍길동</span>
                <br/>
                <span>이메일 : hklmart@hkl.com</span>
            </p>
        </div>

        <div class="col-3"></div>
    </div>

    <hr/>

    <!-- Footer bottom -->
    <div class="row footer-bottom">
        <p class="col-12 text-center">
            <a href="#header">
                <img src="/resources/img/bottom_logo.png"/>
            </a>
            <br/><br/>
            본 상품의 상품 이미지 저작권은 ㈜에이치케이엘에 있으며 내용의 무단복제를 금합니다.
            <br/>
            COPYRIGHT Ⓒ HKL-MART CO,LTD. ALL RIGHTS RESERVED.
        </p>
    </div>
</footer>
</body>

<script>
    const toggleBtn = document.querySelector(".navbar_toggleBtn");
    const search = document.querySelector(".navbar_search");
    const menu = document.querySelector(".navbar_menu");

    toggleBtn.addEventListener("click", () => {
        search.classList.toggle("active");
        menu.classList.toggle("active");
    });


    $(document).ready(function () {
        $('a[href^="#"]').on("click", function (e) {
            e.preventDefault();

            var target = this.hash;
            var $target = $(target);

            $("html, body")
                .stop()
                .animate(
                    {
                        scrollTop: $target.offset().top,
                    },
                    900,
                    "swing",
                    function () {
                        window.location.hash = target;
                    },
                );
        });
    });
</script>
</html>

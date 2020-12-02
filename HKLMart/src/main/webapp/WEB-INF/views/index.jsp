<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<!DOCTYPE html>
<html lang="ko">

<head>
    <title>HKL Mart</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.1/css/all.css"
        integrity="sha384-vp86vTRFVJgpjF9jiIGPEEqYqlDwgyBgEF109VFjmqGmIY/Y4HV4d3Gp2irVfcrp" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

    <style>
        @font-face {
            font-family: "Godo";
            src: url("/resources/font/GodoM.ttf");
        }

        .font-set {
            font-family: "Godo";
        }

        body>header>div.row>div.col-10>ul>li>a {
            font-size: 20px;
            font-family: 'Godo';
        }

        body>header>div.row>div.col-10>ul>li>div>div>ul>li>a {
            margin-top: 10px;
            margin-bottom: 10px;
            font-family: 'Godo';
        }

        body>header>nav>div>ul>li>a {
            color: #02264f;
        }

        .form-control::placeholder {
            font-size: 0.95rem;
            color: #02264f;
            font-style: italic;
        }

        .navbar {
            justify-content: space-between;
            width: 100%;
        }

        .navbar_menu {
            list-style: none;
            color: aliceblue;
            display: flex;
        }

        body>header>nav>div.col-4>ul>li>a:hover {
            color: rgb(255, 48, 79);
            text-decoration: none;
        }

        .navbar_menu li {
            padding: 8px 12px;
        }

        .navbar_toggleBtn {
            display: none;
            position: absolute;
            right: 32px;
            font-size: 24px;
            color: rgb(255, 48, 79);
        }

        .active-pink {
            border: none;
            border-right: 0px;
            border-top: 0px;
            border-left: 0px;
            border-bottom: 1px solid rgb(255, 48, 79);
            box-shadow: 0 1px 0 0 #f48fb1;
        }

        .menu,
        .menu a,
        .menu ul,
        .menu li,
        .menu div,
        .menu form,
        .menu input {
            margin: 0;
            padding: 0;
            border: none;
            outline: none;
        }

        .menu a {
            text-decoration: none;
        }

        .menu li {
            width: 25%;
            list-style: none;
        }

        .menu {
            display: inline-block;
            position: relative;
            cursor: default;
            z-index: 500;
            text-align: center;
        }

        .menu>li {
            display: block;
            float: left;
        }

        .menu>li>a {
            position: relative;
            display: block;
            z-index: 510;
            height: 54px;
            padding: 0 20px;
            line-height: 54px;

            font-family: Helvetica, Arial, sans-serif;
            font-weight: bold;
            font-size: 13px;
            color: #fcfcfc;
            text-shadow: 0 0 1px rgba(0, 0, 0, .35);

            background: rgb(255, 48, 79);

            -webkit-transition: all .3s ease;
            -moz-transition: all .3s ease;
            -o-transition: all .3s ease;
            -ms-transition: all .3s ease;
            transition: all .3s ease;
        }

        .menu>li>div {
            position: absolute;
            display: block;
            text-align: center;
            width: 25%;

            opacity: 0;
            visibility: hidden;
            overflow: hidden;

            background: #ffffff;
            border-radius: 0 0 3px 3px;

            -webkit-transition: all .3s ease .15s;
            -moz-transition: all .3s ease .15s;
            -o-transition: all .3s ease .15s;
            -ms-transition: all .3s ease .15s;
            transition: all .3s ease .15s;
        }

        .menu>li:hover>div {
            opacity: 0.95;
            visibility: visible;
            overflow: visible;
        }

        .menu .menu-column {
            width: 100%;
            margin-top: 2%;
            margin-bottom: 2%;
        }

        .menu .menu-column ul {
            width: 100%;
        }

        .menu .menu-column ul li {
            width: 100%;
        }

        .menu .menu-column li a {
            text-align: center;
            display: block;
            margin-top: 2px;
            margin-bottom: 2px;
            line-height: 26px;
            font-family: Helvetica, Arial, sans-serif;
            font-weight: bold;
            font-size: 15px;
            color: #02264f;
        }

        .menu .menu-column li a:hover {
            color: rgb(255, 48, 79);
        }

        .carousel-inner img {
            width: 100%;
            height: 100%;
        }

        .footer-wrap {
            text-align: center;
            background-color: white;
            color: rgb(99, 99, 99);
        }

        .footer-top {
            font-size: 20px;
        }

        .footer-top span {
            color: #999;
            font-size: 15px;
        }

        .footer-bottom {
            color: #999;
            font-size: 15px;
        }

        /* 반응형 */
        @media screen and (max-width: 768px) {
            .navbar_menu {
                width: 100%;
                display: none;
            }

            .navbar_toggleBtn {
                display: block;
            }

            .navbar_search.active,
            .navbar_menu.active {
                display: flex;
            }

            body>header>nav>div.col-4>ul>li>a:hover {
                color: rgb(255, 48, 79);
                text-decoration: none;
            }
        }
    </style>
</head>

<body>
    <!-- Header -->
    <header class="container-fluid">

        <!-- Navbar-->

        <nav class="navbar row">
            <div class="col-1">
            </div>
            <div class="navbar_logo col-1">
                <a class="logo" style="height: 100px;" href="#">
                    <img class="logo" src="/resources/img/top_logo.png">
                </a>
            </div>

            <!-- Search -->
            <div class="navbar_search col-5">

                <div class="row form-inline">

                    <div class="col-10">
                        <input class="form-control active-pink" type="search" placeholder="Search"
                            style="width: 50%; float: right;">
                    </div>

                    <div class="col-2">
                        <a href="#" id="search">
                            <i style="color: rgb(255, 48, 79);" class="fas fa-search fa-2x"></i>
                        </a>
                    </div>
                </div>
            </div>

            <!-- NavMenu -->
            <div class="col-4">
                <a class="navbar_toggleBtn">
                    <i class="fas fa-bars"></i>
                </a>

                <br>

                <ul class="navbar_menu font-set">
                    <li><a href="#">로그인</a></li>
                    <li><a href="#">회원가입</a></li>
                    <li><a href="#">고객센터</a></li>
                    <li><a href="#">장바구니</a></li>
                </ul>
            </div>

        </nav>
        <div class="col-1">
        </div>

        <!-- Mega Drop Menu -->
        <div class="row">
            <div class="col-1">
            </div>

            <div class="col-10">
                <ul class="menu" style="width: 100%;">
                    <li>
                        <a href="#">운동화</a>
                        <div>
                            <div class="menu-column">
                                <ul>
                                    <li><a href="#">스니커즈</a></li>
                                    <li><a href="#">캔버스화</a></li>
                                    <li><a href="#">슬립온</a></li>
                                </ul>
                            </div>
                        </div>
                    </li>
                    <li>
                        <a href="#">스포츠</a>
                        <div>
                            <div class="menu-column">
                                <ul>
                                    <li><a href="#">런닝화</a></li>
                                    <li><a href="#">축구화</a></li>
                                    <li><a href="#">등산화</a></li>
                                </ul>
                            </div>
                        </div>
                    </li>
                    <li><a href="#">구두</a>
                        <div>
                            <div class="menu-column">
                                <ul>
                                    <li><a href="#">로퍼</a></li>
                                    <li><a href="#">레이스업</a></li>
                                    <li><a href="#">힐/펌프스</a></li>
                                    <li><a href="#">플랫슈즈</a></li>
                                </ul>
                            </div>
                        </div>
                    </li>
                    <li><a href="#">부츠</a>
                        <div>
                            <div class="menu-column">
                                <ul>
                                    <li><a href="#">첼시부츠</a></li>
                                    <li><a href="#">워크부츠</a></li>
                                    <li><a href="#">퍼부츠</a></li>
                                </ul>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
        </div>

        <div class="col-1">
        </div>

        <br>

        <!-- Slide Menu -->
        <div class="container-fluid">

            <div class="row">

                <div class="col-1"></div>

                <div class="col-10">
                    <div id="myCarousel" class="carousel slide" data-ride="carousel">

                        <!-- Indicators -->
                        <ul class="carousel-indicators">
                            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                            <li data-target="#myCarousel" data-slide-to="1"></li>
                            <li data-target="#myCarousel" data-slide-to="2"></li>
                            <li data-target="#myCarousel" data-slide-to="3"></li>
                            <li data-target="#myCarousel" data-slide-to="4"></li>
                            <li data-target="#myCarousel" data-slide-to="5"></li>
                            <li data-target="#myCarousel" data-slide-to="6"></li>
                        </ul>

                        <!-- The slideshow -->
                        <div class="carousel-inner">
                            <div class="carousel-item active">
                                <img src="/resources/img/slide/1.jpg" width="100%">
                            </div>
                            <div class="carousel-item">
                                <img src="/resources/img/slide/2.jpg" width="100%">
                            </div>
                            <div class="carousel-item">
                                <img src="/resources/img/slide/3.jpg" width="100%">
                            </div>
                            <div class="carousel-item">
                                <img src="/resources/img/slide/4.jpg" width="100%">
                            </div>
                            <div class="carousel-item">
                                <img src="/resources/img/slide/5.jpg" width="100%">
                            </div>
                            <div class="carousel-item">
                                <img src="/resources/img/slide/6.jpg" width="100%">
                            </div>
                            <div class="carousel-item">
                                <img src="/resources/img/slide/7.jpg" width="100%">
                            </div>
                        </div>

                        <!-- Left and right controls -->
                        <a class="carousel-control-prev" href="#myCarousel" data-slide="prev">
                            <span class="carousel-control-prev-icon"></span>
                        </a>
                        <a class="carousel-control-next" href="#myCarousel" data-slide="next">
                            <span class="carousel-control-next-icon"></span>
                        </a>
                    </div>
                </div>

                <div class="col-1"></div>

            </div>
        </div>
    </header>

    <br><br>

    <!-- Body -->
    <div class="container-fluid">
        <!-- 여기에 본문 기입 -->
    </div>

    <br><br><hr>

    <!-- Footer -->
    <footer class="container-fluid footer-wrap">

        <br>
        <div class="row">

            <div class="col-3"></div>

            <div class="col-3 text-left">

            </div>

            <div class="col-3"></div>

            <div class="col-3"></div>

        </div>

        <br>

        <!-- Footer top -->
        <div class="row footer-top">

            <div class="col-4"></div>

            <div class="col-2 font-set text-left">
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

    </footer>
</body>

<script>
    const toggleBtn = document.querySelector('.navbar_toggleBtn');
    const search = document.querySelector('.navbar_search');
    const menu = document.querySelector('.navbar_menu');


    toggleBtn.addEventListener('click', () => {
        search.classList.toggle('active');
        menu.classList.toggle('active');
    });


</script>

</html>
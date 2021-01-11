<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" href="/resources/img/back_exception.jpg">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.1/css/all.css" integrity="sha384-vp86vTRFVJgpjF9jiIGPEEqYqlDwgyBgEF109VFjmqGmIY/Y4HV4d3Gp2irVfcrp" crossorigin="anonymous">
    <link rel="stylesheet" href="/resources/bootstrap/4.5.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/css/index.css">
    <link rel="stylesheet" href="/resources/css/login.css" />
    <link rel="stylesheet" href="/resources/jquery-ui/jquery-ui.css">
    <link rel="stylesheet" href="/resources/css/product-list.css">
    <link rel="stylesheet" href="/resources/w3css/w3.css">
    <link rel="stylesheet" href="/resources/css/add-product.css">
    <link rel="stylesheet" href="/resources/css/product-detail-all.css">
    <link rel="stylesheet" href="/resources/css/checkout.css">
    <link rel="stylesheet" href="/resources/css/checkout-order-product.css">
    <link rel="stylesheet" href="/resources/css/checkout-order-adress.css">
    <link rel="stylesheet" href="/resources/css/checkout-order-payment.css">
    <link rel="stylesheet" href="/resources/css/product-detail.css">
    <link rel="stylesheet" href="/resources/css/product-detail-like.css">
    <link rel="stylesheet" href="/resources/css/product-detail-tabs.css">
    <link rel="stylesheet" href="/resources/css/product-detail-1.css">
    <link rel="stylesheet" href="/resources/css/product-detail-2.css">
    <script src="/resources/jquery/3.5.1/jquery.min.js"></script>
    <script src="/resources/bootstrap/4.5.3/js/bootstrap.min.js"></script>
    <script src="/resources/jquery-ui/jquery-1.12.4.js"></script>
    <script src="/resources/jquery-ui/jquery-ui.js"></script>
    <script src="/resources/popper/popper.min.js"></script>
    <script src="/resources/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="/resources/js/mapjsapi/postcode.v2.js"></script>
</head>
<body>
<!-- Header -->
<header id="header" class="container-fluid">
    <!-- Navbar-->
    <nav class="navbar row">
        <div class="col-1"></div>
        <div class="navbar_logo col-1">
            <a class="logo" style="height: 100px;" href="/">
                <img class="logo" src="/resources/img/top_logo.png">
            </a>
        </div>
        <!-- Search -->
        <div class="navbar_search col-5">
            <div class="row form-inline">
                <div class="col-5"></div>
                <div class="col-5">
                    <input class="form-control active-pink" id="productSearch" type="search" placeholder="제품명 검색" onkeyup="searchFunc()" style="width:100%" autocomplete="off">
                </div>
                <div class="col-2">
                    <a onclick="doSearch()" id="search"><i style="color: rgb(255, 48, 79);" class="fas fa-search fa-2x"></i></a>
                </div>
            </div>
        </div>
        <!-- NavMenu -->
        <!-- 비로그인 상태 -->
        <sec:authorize access="isAnonymous()">
            <div class="col-4">
                <a class="navbar_toggleBtn"><i class="fas fa-bars"></i></a>
                <br>
                <ul class="navbar_menu font-set">
                    <li>
                        <a href="/member/loginPage">로그인</a>
                    </li>
                    <li>
                        <a href="/member/loginPage">회원가입</a>
                    </li>
                    <li>
                        <a href="#">고객센터</a>
                    </li>
                    <li>
                        <a href="#">장바구니</a>
                    </li>
                </ul>
            </div>
        </sec:authorize>
        <!-- 로그인 상태 -->
        <sec:authorize access="isAuthenticated()"> <sec:authentication property="principal" var="user" />
            <div class="col-4">
                <a class="navbar_toggleBtn"><i class="fas fa-bars"></i></a>
                <br>
                <ul class="navbar_menu font-set">
                    <li>
                        <a href="/member/my-page"><i><u class="font-set">${user.memberName}님</u></i></a>
                    <li>
                        <a href="/member/my-page">마이페이지</a>
                    </li>
                    <li>
                        <a href="#" onclick="$('#logout-form').submit();">로그아웃</a>
                        <!-- Logout Form -->
                        <form id="logout-form" action="/logout" method="POST">
                            <!-- 포스트방식으로 리퀘스트시 무조건 넣기 -->
                            <input type="hidden" name="${ _csrf.parameterName }" value="${ _csrf.token }">
                        </form>
                    </li>
                    <li>
                        <a href="#">고객센터</a>
                    </li>
                    <li>
                        <a href="/basket/basket-page">장바구니</a>
                    </li>
                </ul>
            </div>
        </sec:authorize>
    </nav>
    <div class="col-1"></div>
    <!-- Mega Drop Menu -->
    <div class="row">
        <div class="col-1"></div>
        <div class="col-10 megadrop-menu">
            <ul class="menu" style="width: 100%;">
                <li>
                    <a href="/product-list-MainCategory?pageNum=1&amount=12&Type=10&Category=-MainCategory">운동화</a>
                    <div>
                        <div class="menu-column">
                            <ul>
                                <li>
                                    <a href="/product-list?pageNum=1&amount=12&Type=11">스니커즈</a>
                                </li>
                                <li>
                                    <a href="/product-list?pageNum=1&amount=12&Type=12">캔버스화</a>
                                </li>
                                <li>
                                    <a href="/product-list?pageNum=1&amount=12&Type=13">슬립온</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </li>
                <li>
                    <a href="/product-list-MainCategory?pageNum=1&amount=12&Type=30&Category=-MainCategory">스포츠</a>
                    <div>
                        <div class="menu-column">
                            <ul>
                                <li>
                                    <a href="/product-list?pageNum=1&amount=12&Type=31">런닝화</a>
                                </li>
                                <li>
                                    <a href="/product-list?pageNum=1&amount=12&Type=32">축구화</a>
                                </li>
                                <li>
                                    <a href="/product-list?pageNum=1&amount=12&Type=33">등산화</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </li>
                <li>
                    <a href="/product-list-MainCategory?pageNum=1&amount=12&Type=50&Category=-MainCategory">구두</a>
                    <div>
                        <div class="menu-column">
                            <ul>
                                <li>
                                    <a href="/product-list?pageNum=1&amount=12&Type=51">로퍼</a>
                                </li>
                                <li>
                                    <a href="/product-list?pageNum=1&amount=12&Type=52">레이스업</a>
                                </li>
                                <li>
                                    <a href="/product-list?pageNum=1&amount=12&Type=53">힐/펌프스</a>
                                </li>
                                <li>
                                    <a href="/product-list?pageNum=1&amount=12&Type=54">플랫슈즈</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </li>
                <li>
                    <a href="/product-list-MainCategory?pageNum=1&amount=12&Type=70&Category=-MainCategory">부츠</a>
                    <div>
                        <div class="menu-column">
                            <ul>
                                <li>
                                    <a href="/product-list?pageNum=1&amount=12&Type=71">첼시부츠</a>
                                </li>
                                <li>
                                    <a href="/product-list?pageNum=1&amount=12&Type=72">워크부츠</a>
                                </li>
                                <li>
                                    <a href="/product-list?pageNum=1&amount=12&Type=73">퍼부츠</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </li>
            </ul>
        </div>
        <div class="col-1"></div>
    </div>
</header>
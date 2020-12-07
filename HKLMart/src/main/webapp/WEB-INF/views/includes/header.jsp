<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

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

        header>div.row>div.col-10>ul>li>a {
            font-size: 20px;
            font-family: 'Godo';
        }

        header>div.row>div.col-10>ul>li>div>div>ul>li>a {
            margin-top: 10px;
            margin-bottom: 10px;
            font-family: 'Godo';
        }

        header>nav>div>ul>li>a {
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

        header>nav>div.col-4>ul>li>a:hover {
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

            header>nav>div.col-4>ul>li>a:hover {
                color: rgb(255, 48, 79);
                text-decoration: none;
            }
        }
    </style>
</head>

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
            <!-- 비로그인 상태 -->
            <sec:authorize access="isAnonymous()">
            <div class="col-4">
                <a class="navbar_toggleBtn">
                    <i class="fas fa-bars"></i>
                </a>
                <br>
                <ul class="navbar_menu font-set">
                    <li><a href="/member/loginPage">로그인</a></li>
                    <li><a href="/member/loginPage">회원가입</a></li>
                    <li><a href="#">고객센터</a></li>
                    <li><a href="#">장바구니</a></li>
                </ul>
            </div>
            </sec:authorize>
            
            <!-- 로그인 상태 -->
            <sec:authorize access="isAuthenticated()">
            <sec:authentication property="principal" var="user"/>
            <div class="col-4">
                <a class="navbar_toggleBtn">
                    <i class="fas fa-bars"></i>
                </a>
                <br>
                <ul class="navbar_menu font-set">
               		<li><a href="#"><i><u>${user.memberName}님</u></i></a>
                    <li><a href="#">마이페이지</a></li>
                    <li><a href="#" onclick="$('#logout-form').submit();">로그아웃</a>
                    	
                    	<!-- Logout Form -->
	                    <form id="logout-form" action="/logout" method="POST">
					    	<input type="hidden" name="${ _csrf.parameterName }" value="${ _csrf.token }">
						</form>
		
					</li>
                    <li><a href="#">고객센터</a></li>
                    <li><a href="#">장바구니</a></li>
                </ul>                
            </div>
            </sec:authorize>
           
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
</header>

<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>:: HKL Mart ::</title>
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
    <script src="/resources/jquery/3.5.1/jquery.min.js"></script>
    <script src="/resources/bootstrap/4.5.3/js/bootstrap.min.js"></script>
    <script src="/resources/jquery-ui/jquery-1.12.4.js"></script>
    <script src="/resources/jquery-ui/jquery-ui.js"></script>
    <script src="/resources/popper/popper.min.js"></script>
    <script src="/resources/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="/resources/js/mapjsapi/postcode.v2.js"></script>
</head>
<body>
<div class="toast toast-position" data-autohide="false">
    <div class="toast-header">
        <strong class="mr-auto">꼭 읽어주세요!!</strong> <small class="text-muted">readme</small>
        <button type="button" class="ml-2 mb-1 close" data-dismiss="toast">&times;</button>
    </div>
    <div class="toast-body">
        <dl>
            <dt>PC환경에 최적화 되어있습니다</dt>
            <dd>&emsp;모바일에서 완벽하게 동작하지 않습니다</dd>
            <dd>&emsp;가급적이면 PC로 접속해주세요</dd>
            <hr>
            <dt>회원가입을 해주세요</dt>
            <dd>&emsp;개인정보는 모두암호화 됩니다</dd>
            <hr>
            <dt>Test용 관리자 계정</dt>
            <dd>&emsp;ID : tester</dd>
            <dd>&emsp;PW : qwe123Q!</dd>
            <br>
        </dl>
    </div>
</div>
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
                    <input class="form-control active-pink" id="productSearch" type="search" placeholder="제품명 검색" onkeyup="searchFunc(), enterKeyUp()" style="width:100%" autocomplete="off">
                </div>
                <div class="col-2">
                    <a onclick="doSearch()" id="search" style="cursor: pointer"><i style="color: rgb(255, 48, 79);" class="fas fa-search fa-2x"></i></a>
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
                        <a href="/basket/basket-page">장바구니</a>
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
        <div class="col-10">
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
    </div>
    <div class="col-1"></div>
    <br>
</header>
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
<br><br>
<!-- Body -->
<div id="body" class="container-fluid">
    <!-- 여기에 본문 기입 -->
    <!-- -->
</div>
<br><br>
<hr style="border: solid 1px #ffb6b6;">
<!-- Footer -->
<footer id="footer" class="container-fluid footer-wrap">
    <br>
    <div class="row">
        <div class="col-3"></div>
        <div class="col-3 text-left"></div>
        <div class="col-3"></div>
        <div class="col-3"></div>
    </div>
    <br>
    <!-- Footer top -->
    <div class="row footer-top">
        <div class="col-4"></div>
        <div class="col-2 font-set text-left">
            <p>
                <span>고객센터</span>
                <br>
                <span>080-1234-5678 · 1588-1234</span>
                <br>
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
                <span>(주)에이치케이엘</span>
                <br>
                <span>대표이사 : 한김이</span>
                <br>
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
    <hr style="border: solid 1px #ffb6b6;">
    <!-- Footer bottom -->
    <div class="row footer-bottom">
        <p class="col-12 text-center">
            <a href="#header">
                <img src="/resources/img/bottom_logo.png">
            </a>
            <br><br> 본 상품의 상품 이미지 저작권은 ㈜에이치케이엘에 있으며 내용의 무단복제를 금합니다. <br> COPYRIGHT Ⓒ HKL-MART CO,LTD. ALL RIGHTS RESERVED.
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

	$(document).ready(function () {
		$('a[href^="#"]').on('click', function (e) {
			e.preventDefault();

			var target = this.hash;
			var $target = $(target);

			$('html, body').stop().animate({
				'scrollTop': $target.offset().top
			}, 900, 'swing', function () {
				window.location.hash = target;
			});
		});
	});

	function searchFunc() {
		let productSearch = document.getElementById('productSearch').value;
		$.ajax({
			url        : "/ajax/search",
			type       : "GET",
			dataType   : "json",
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			data       : {"searchStr": productSearch},
			success    : function (data) {
				let dataList = data.searchList;
				$("#productSearch").autocomplete({
					source: dataList
				});
			},
			error      : function () {
				alert("Error. 관리자에게 문의하십시오.");
			},
		});
	}

	function enterKeyUp() {
		if (event.keyCode == 13) {
			doSearch();
		}
	}

	function doSearch() {
		let searchKeyword = document.getElementById('productSearch').value;
		location.href = "/search?keyword=" + searchKeyword;
	}

	$(document).ready(function () {
		$('.toast').toast('show');
	});
</script>
</html>
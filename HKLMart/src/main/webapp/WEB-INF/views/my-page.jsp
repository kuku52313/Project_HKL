<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <title>HKL Mart :: My Page</title>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.1/css/all.css" integrity="sha384-vp86vTRFVJgpjF9jiIGPEEqYqlDwgyBgEF109VFjmqGmIY/Y4HV4d3Gp2irVfcrp"
          crossorigin="anonymous"/>
    <link rel="stylesheet" href="/resources/bootstrap/4.5.3/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="/resources/css/index.css"/>
    <link rel="stylesheet" href="/resources/css/login.css"/>
    <link rel="shortcut icon" href="/resources/img/back_exception.jpg">
    <script src="/resources/jquery/3.5.1/jquery.min.js"></script>
    <script src="/resources/bootstrap/4.5.3/js/bootstrap.min.js"></script>
</head>

<body>
<input type="hidden" id="pwCheckHidden" value="0"/>
<input type="hidden" id="pwckCheckHidden" value="0"/>
<sec:authentication property="principal" var="user"/>
<!-- Header -->
<header id="header" class="container-fluid">
    <!-- Navbar-->
    <nav class="navbar row">
        <div class="col-1"></div>
        <div class="navbar_logo col-1">
            <a class="logo" style="height: 100px" href="/">
                <img class="logo" src="/resources/img/top_logo.png"/>
            </a>
        </div>

        <!-- Search -->
        <div class="navbar_search col-5">
            <div class="row form-inline">
                <div class="col-10">
                    <input class="form-control active-pink" type="search" placeholder="Search" style="width: 50%; float: right"/>
                </div>

                <div class="col-2">
                    <a href="#" id="search">
                        <i style="color: rgb(255, 48, 79)" class="fas fa-search fa-2x"></i>
                    </a>
                </div>
            </div>
        </div>

        <!-- NavMenu -->
        <!-- 비로그인 상태 -->

        <!-- 로그인 상태 -->
        <div class="col-4">
            <a class="navbar_toggleBtn">
                <i class="fas fa-bars"></i>
            </a>
            <br/>
            <ul class="navbar_menu font-set">
                <li>
                    <a href="/member/my-page"
                    ><i><u class="font-set">${user.memberName}님</u></i></a
                    >
                </li>
                <li><a href="/member/my-page">마이페이지</a></li>
                <li>
                    <a href="#" onclick="$('#logout-form').submit()">로그아웃</a>

                    <!-- Logout Form -->
                    <form id="logout-form" action="/logout" method="POST">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    </form>
                </li>
                <li><a href="#">고객센터</a></li>
                <li><a href="#shopping-basket">장바구니</a></li>
            </ul>
        </div>
    </nav>
    <div class="col-1"></div>

    <!-- Mega Drop Menu -->
    <div class="row">
        <div class="col-1"></div>

        <div class="col-10">
            <ul class="menu" style="width: 100%">
                <li>
                    <a href="#header">운동화</a>
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
                    <a href="#header">스포츠</a>
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
                <li>
                    <a href="#header">구두</a>
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
                <li>
                    <a href="#header">부츠</a>
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
    <div class="col-1"></div>
</header>

<!-- Body -->
<div id="body" class="container-fluid">
    <div class="row">
        <!-- 왼쪽 공백 -->
        <div class="col-1"></div>

        <!-- 사이드 메뉴 -->
        <div class="col-2">
            <ul class="sidebar" id="sidebar">
                <hr/>
                <li><a class="sidebarMain" href="#header">MY 쇼핑</a></li>
                <li><a href="#order-history">주문내역</a></li>
                <li><a href="#shopping-basket">장바구니</a></li>
                <hr/>
                <li><a class="sidebarMain" href="#header">MY 활동</a></li>
                <li><a href="/member/my-page-ask-board">문의하기</a></li>
                <li><a href="#inquire_history">문의내역</a></li>
                <li><a href="#reviews">구매후기</a></li>
                <li><a href="#wishlist">찜한상품</a></li>
                <hr/>
                <li><a class="sidebarMain" href="#header">MY 정보</a></li>
                <li><a href="#privacy">개인정보확인/수정</a></li>
                <hr/>
                <sec:authorize access="hasRole('ROLE_ADMIN')">
                    <li><a class="sidebarMain" href="#header">관리자</a></li>
                    <li><a href="/manager/manager-page">관리자 페이지</a></li>
                    <hr/>
                </sec:authorize>
            </ul>
        </div>

        <!-- 작업중 -->
        <div class="col-7" style="font-family: Godo; text-align: center; font-weight: bold">
            <br/><br/>
            <div id="order-history">
                <span class="font-set" style="font-size: 25px">주문내역</span>
                <a href="#" class="font-set" style="font-size: 15px; color: gray; margin-left: 50px">더보기</a>
                <hr/>
            </div>

            <br/><br/>
            <div id="shopping-basket">
                <span class="font-set" style="font-size: 25px">장바구니</span>
                <a href="#" class="font-set" style="font-size: 15px; color: gray; margin-left: 50px">더보기</a>
                <hr/>
                <c:choose>
                    <c:when test="${fn:length(productList) > 0 && fn:length(productList) < 12}">
                        <div class="row basket-card">
                            <c:forEach var="list" items="${productList}" varStatus="status">
                                <div class="card col-1">
                                    <img class="card-img-top"
                                         src="https://img1.daumcdn.net/thumb/R720x0.q80/?scode=mtistory2&fname=http%3A%2F%2Fcfile7.uf.tistory.com%2Fimage%2F24283C3858F778CA2EFABE"
                                         alt="Card image" style="width: 100%"/>
                                    <div class="card-body">
                                        <h6 class="card-title">상품명</h6>
                                    </div>
                                </div>
                            </c:forEach>
                        </div
                    </c:when>
                    <c:when test="${fn:length(productList) > 11}">
                        <div class="row basket-card">
                            <c:forEach var="list" items="${productList}" varStatus="status">
                                <div class="card col-1">
                                    <img class="card-img-top"
                                         src="https://img1.daumcdn.net/thumb/R720x0.q80/?scode=mtistory2&fname=http%3A%2F%2Fcfile7.uf.tistory.com%2Fimage%2F24283C3858F778CA2EFABE"
                                         alt="Card image" style="width: 100%"/>
                                    <div class="card-body">
                                        <h6 class="card-title">상품명</h6>
                                    </div>
                                </div>
                            </c:forEach>
                            <div class="col-1" style="margin:auto">
                                <i class="fas fa-ellipsis-h fa-2x" style="color:grey"></i>
                            </div>
                        </div
                    </c:when>
                    <c:otherwise>
                        <div>
                            <h6 class="font-set" style="padding: 10px; color: gray">장바구니가 비었습니다</h6>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>

            <br/><br/>
            <div id="inquire_history">
                <span class="font-set" style="font-size: 25px">문의내역</span>
                <a href="#" class="font-set" style="font-size: 15px; color: gray; margin-left: 50px">더보기</a>
                <hr/>
            </div>

            <br/><br/>
            <div id="reviews">
                <span class="font-set" style="font-size: 25px">구매후기</span>
                <a href="#" class="font-set" style="font-size: 15px; color: gray; margin-left: 50px">더보기</a>
                <hr/>
            </div>

            <br/><br/>
            <div id="wishlist">
                <span class="font-set" style="font-size: 25px">찜한상품</span>
                <a href="#" class="font-set" style="font-size: 15px; color: gray; margin-left: 50px">더보기</a>
                <hr/>
            </div>

            <br/><br/>
            <div id="privacy">
                <span class="font-set" style="font-size: 25px">개인정보 확인/수정</span>
                <hr/>
                <!-- 개인정보 보기 -->
                <table class="table-hover info-table">
                    <tr>
                        <td class="font-set">ID</td>
                        <td class="font-set"><input type="text" class="input-check" id="userId" value="${user.username}" readonly style="width: 80%"/></td>
                    </tr>
                    <tr>
                        <td class="font-set">성명</td>
                        <td class="font-set"><input type="text" class="input-field" id="userName" value="${user.memberName}" readonly/></td>
                    </tr>
                    <tr>
                        <td class="font-set">Email</td>
                        <td class="font-set"><input type="text" class="input-field" id="userEmail" value="${user.memberEmail}" readonly/></td>
                    </tr>
                    <tr>
                        <td class="font-set">전화번호</td>
                        <td class="font-set"><input type="text" class="input-field" id="userTel" value="${user.memberTel}" readonly/></td>
                    </tr>
                </table>

                <hr/>

                <!-- 비밀번호 변경 -->
                <form name="passwordForm" action="/member/update" method="POST">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    <table class="table-hover info-table">
                        <tr>
                            <td class="font-set">비밀번호</td>
                            <td class="font-set"><input type="password" class="input-field" onkeyup="checkPwfn()" id="userPw" name="memberPw" placeholder="알파벳 대,소문자,특수문자,숫자 포함"
                                                        required/></td>
                            <td><input type="button" id="pwCheckBtn" class="pwCheckBtn"/></td>
                        </tr>
                        <tr>
                            <td class="font-set">비밀번호확인</td>
                            <td class="font-set"><input type="password" class="input-field" onkeyup="checkPwfn(), enterKeyUp()" id="userPwCk" placeholder="비밀번호 재입력" required/></td>
                            <td><input type="button" id="pwckCheckBtn" class="pwckCheckBtn"/></td>
                        </tr>
                    </table>
                    <br/>
                    <button type="button" class="submitBtn font-set" onclick="updatePassword()" style="color: white; font-weight: bold">수정하기</button>
                </form>
            </div>
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
    let search = document.querySelector(".navbar_search");
    let menu = document.querySelector(".navbar_menu");

    toggleBtn.addEventListener("click", () => {
        search.classList.toggle("active");
        menu.classList.toggle("active");
    });

    function checkPwfn() {
        const checkPwSik = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,15}$/;
        let userPw = $("#userPw").val();
        let checkpw = $("#userPw").val() === $("#userPwCk").val();

        if (checkPwSik.test(userPw)) {
            $("#pwCheckBtn").css("border", "");
            $("#pwCheckBtn").css("border", "solid 5px #007bff");
            $("#pwCheckHidden").val("1");
        }

        if (!checkPwSik.test(userPw)) {
            $("#pwCheckBtn").css("border", "");
            $("#pwCheckBtn").css("border", "solid 5px rgb(245, 99, 99)");
            $("#pwCheckHidden").val("0");
        }

        if (checkpw) {
            $("#pwckCheckBtn").css("border", "");
            $("#pwckCheckBtn").css("border", "solid 5px #007bff");
            $("#pwckCheckHidden").val("1");
        } else {
            $("#pwckCheckBtn").css("border", "");
            $("#pwckCheckBtn").css("border", "solid 5px rgb(245, 99, 99)");
            $("#pwckCheckHidden").val("0");
        }
    }

    function enterKeyUp() {
        if (event.keyCode === 13) {
            updatePassword();
        }
    }

    function updatePassword() {
        let submitPasswordForm = document.passwordForm;
        if ($("#pwCheckHidden").val() === 1 && $("#pwckCheckHidden").val() === 1) {
            alert("비밀번호가 변경되었습니다");
            submitPasswordForm.submit();
        } else {
            alert("비밀번호 양식이 틀렸습니다");
        }
    }

    $(document).ready(function () {
        $('a[href^="#"]').on("click", function (e) {
            e.preventDefault();

            let target = this.hash;
            let $target = $(target);

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





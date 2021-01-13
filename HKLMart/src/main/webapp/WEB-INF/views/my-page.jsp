<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@include file="includes/header.jsp" %>
<title>HKLMart :: 마이 페이지</title>
<!-- Body -->
<div id="body" class="container-fluid">
    <div class="row">
        <!-- 왼쪽 공백 -->
        <div class="col-1"></div>
        <!-- 사이드 메뉴 -->
        <div class="col-2">
            <ul class="sidebar" id="sidebar">
                <hr />
                <li>
                    <a class="sidebarMain" href="#header">MY 쇼핑</a>
                </li>
                <li>
                    <a href="/member/user-order-list?pageNum=1&amount=10">주문내역</a>
                </li>
                <li>
                    <a href="/basket/basket-page">장바구니</a>
                </li>
                <li>
                    <a class="sidebarMain" href="#header">MY 활동</a>
                </li>
                <li>
                    <a href="/member/my-page-ask-board">문의하기</a>
                </li>
                <li>
                    <a href="/member/user-ask-list?pageNum=1&pageNumReview=1&amount=10">문의내역</a>
                </li>
                <li>
                    <a href="/member/user-review-list?pageNum=1&pageNumReview=1&amount=10">구매후기</a>
                </li>
                <li>
                    <a href="/like/get?pageNum=1&amount=12">찜한상품</a>
                </li>
                <li>
                    <a class="sidebarMain" href="#header">MY 정보</a>
                </li>
                <li>
                    <a href="#privacy">개인정보확인/수정</a>
                </li>
                <sec:authorize access="hasRole('ROLE_ADMIN')"> <br>
                    <li>
                        <a class="sidebarMain" href="#header">MANAGER</a>
                    </li>
                    <li>
                        <a href="/manager/manager-page">관리</a>
                    </li>
                    <hr />
                </sec:authorize>
            </ul>
        </div>
        <!-- 작업중 -->
        <div class="col-7" style="font-family: Godo; text-align: center; font-weight: bold">
            <br /><br />
            <div id="order-history">
                <span class="font-set" style="font-size: 25px">주문내역</span>
                <a href="/member/user-order-list?pageNum=1&amount=10" class="font-set" style="font-size: 15px; color: gray; margin-left: 50px">더보기</a>
                <hr />
            </div>
            <br /><br />
            <div id="shopping-basket">
                <span class="font-set" style="font-size: 25px">장바구니</span>
                <a href="/basket/basket-page" class="font-set" style="font-size: 15px; color: gray; margin-left: 50px">더보기</a>
                <hr />
                <c:choose> <c:when test="${fn:length(basketList) > 0 && fn:length(basketList) < 6}">
                    <div class="row basket-card">
                        <c:forEach var="list" items="${basketList}">
                            <div class="card col-2">
                                <a href="/product-detail?pageNum=1&amount=5&productCode=${list.productCode}">
                                    <img class="card-img-top" src="${list.productImgPath}${list.productThumbnail}" alt="장바구니" style="width: 100%" />
                                    <div class="card-body">
                                        <p class="card-title" style="font-size: 15px; color: #5a6268">${list.productBrand}</p>
                                        <span class="card-subtitle" style="font-size: 13px">${list.productName}</span>
                                    </div>
                                </a>
                            </div>
                        </c:forEach>
                    </div>
                </c:when> <c:when test="${fn:length(basketList) > 5}">
                    <div class="row basket-card">
                        <c:forEach var="list" items="${basketList}" begin="0" end="4">
                            <div class="card col-2">
                                <a href="/product-detail?pageNum=1&amount=5&productCode=${list.productCode}">
                                    <img class="card-img-top" src="${list.productImgPath}${list.productThumbnail}" alt="장바구니" style="width: 100%" />
                                    <div class="card-body">
                                        <p class="card-title" style="font-size: 15px; color: #5a6268">${list.productBrand}</p>
                                        <span class="card-subtitle" style="font-size: 12px">${list.productName}</span>
                                    </div>
                                </a>
                            </div>
                        </c:forEach>
                        <div class="col-2" style="margin:auto">
                            <a href="/basket/basket-page"><i class="fas fa-ellipsis-h fa-2x" style="color:grey"></i></a>
                        </div>
                    </div>
                </c:when> <c:otherwise>
                    <div>
                        <h6 class="font-set" style="padding: 10px; color: gray">장바구니가 비었습니다</h6>
                    </div>
                </c:otherwise> </c:choose>
            </div>
            <br /><br />
            <div id="inquire_history">
                <span class="font-set" style="font-size: 25px">문의내역</span>
                <a href="/member/user-ask-list?pageNum=1&pageNumReview=1&amount=10" class="font-set" style="font-size: 15px; color: gray; margin-left: 50px">더보기</a>
                <hr />
            </div>
            <br /><br />
            <div id="reviews">
                <span class="font-set" style="font-size: 25px">구매후기</span>
                <a href="/member/user-review-list?pageNum=1&pageNumReview=1&amount=10" class="font-set" style="font-size: 15px; color: gray; margin-left: 50px">더보기</a>
                <hr />
            </div>
            <br /><br />
            <div id="wishlist">
                <span class="font-set" style="font-size: 25px">찜한상품</span>
                <a href="/like/get?pageNum=1&amount=12" class="font-set" style="font-size: 15px; color: gray; margin-left: 50px">더보기</a>
                <hr />
                <c:choose> <c:when test="${fn:length(likeList) > 0 && fn:length(likeList) < 6}">
                    <div class="row basket-card">
                        <c:forEach var="list" items="${likeList}">
                            <div class="card col-2">
                                <a href="/product-detail?pageNum=1&amount=5&productCode=${list.productCode}">
                                    <img class="card-img-top" src="${list.productImgPath}${list.productThumbnail}" alt="찜한상품" style="width: 100%" />
                                    <div class="card-body">
                                        <p class="card-title" style="font-size: 15px; color: #5a6268">${list.productBrand}</p>
                                        <span class="card-subtitle" style="font-size: 13px">${list.productName}</span>
                                    </div>
                                </a>
                            </div>
                        </c:forEach>
                    </div>
                </c:when> <c:when test="${fn:length(likeList) > 5}">
                    <div class="row basket-card">
                        <c:forEach var="list" items="${likeList}" begin="0" end="4">
                            <div class="card col-2">
                                <a href="/product-detail?pageNum=1&amount=5&productCode=${list.productCode}">
                                    <img class="card-img-top" src="${list.productImgPath}${list.productThumbnail}" alt="찜한상품" style="width: 100%" />
                                    <div class="card-body">
                                        <p class="card-title" style="font-size: 15px; color: #5a6268">${list.productBrand}</p>
                                        <span class="card-subtitle" style="font-size: 12px">${list.productName}</span>
                                    </div>
                                </a>
                            </div>
                        </c:forEach>
                        <div class="col-2" style="margin:auto">
                            <a href="/like/get?pageNum=1&amount=12"><i class="fas fa-ellipsis-h fa-2x" style="color:grey"></i></a>
                        </div>
                    </div>
                </c:when> <c:otherwise>
                    <div>
                        <h6 class="font-set" style="padding: 10px; color: gray">찜한 상품이 없습니다</h6>
                    </div>
                </c:otherwise> </c:choose>
            </div>
            <br /><br />
            <div id="privacy">
                <span class="font-set" style="font-size: 25px">개인정보 확인/수정</span>
                <hr />
                <!-- 개인정보 보기 -->
                <table class="table-hover info-table">
                    <tr>
                        <td class="font-set">ID</td>
                        <td class="font-set"><input type="text" class="input-check" id="userId" value="${user.username}" readonly /></td>
                    </tr>
                    <tr>
                        <td class="font-set">성명</td>
                        <td class="font-set"><input type="text" class="input-field" id="userName" value="${user.memberName}" readonly /></td>
                    </tr>
                    <tr>
                        <td class="font-set">Email</td>
                        <td class="font-set"><input type="text" class="input-field" id="userEmail" value="${user.memberEmail}" readonly /></td>
                    </tr>
                    <tr>
                        <td class="font-set">전화번호</td>
                        <td class="font-set"><input type="text" class="input-field" id="userTel" value="${user.memberTel}" readonly /></td>
                    </tr>
                </table>
                <hr />
                <!-- 비밀번호 변경 -->
                <input type="hidden" id="pwCheckHidden" value="0" /> <input type="hidden" id="pwckCheckHidden" value="0" />
                <form name="passwordForm" action="/member/update" method="POST">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                    <table class="table-hover info-table">
                        <tr>
                            <td class="font-set">비밀번호</td>
                            <td class="font-set">
                                <input type="password" class="input-field" onkeyup="checkPwfn()" id="userPw" name="memberPw" placeholder="알파벳 대,소문자,특수문자,숫자 포함" required />
                            </td>
                            <td>
                                <input type="button" id="pwCheckBtn" class="pwCheckBtn" />
                            </td>
                        </tr>
                        <tr>
                            <td class="font-set">비밀번호확인</td>
                            <td class="font-set">
                                <input type="password" class="input-field" onkeyup="checkPwfn(), enterKeyUp()" id="userPwCk" placeholder="비밀번호 재입력" required />
                            </td>
                            <td>
                                <input type="button" id="pwckCheckBtn" class="pwckCheckBtn" />
                            </td>
                        </tr>
                    </table>
                    <br />
                    <button type="button" class="submitBtn font-set" onclick="updatePassword()" style="color: white; font-weight: bold">수정하기</button>
                </form>
            </div>
        </div>
        <form name="userAskReviewList" method="post" action="/member/user-ask-review-list">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> <input type="hidden" name="pageNum" value="1"> <input type="hidden" name="pageNumReview" value="1"> <input type="hidden" name="amount" value="5">
            <input type="hidden" name="memberId" value="${user.username}">
        </form>
        <!-- 오른쪽 공백 -->
        <div class="col-2"></div>
    </div>
</div>
<br><br>
<hr style="border: solid 1px #ffb6b6;">
<!-- Footer -->
<footer id="footer" class="container-fluid footer-wrap">
    <br />
    <div class="row">
        <div class="col-3"></div>
        <div class="col-3 text-left"></div>
        <div class="col-3"></div>
        <div class="col-3"></div>
    </div>
    <br />
    <!-- Footer top -->
    <div class="row footer-top">
        <div class="col-4"></div>
        <div class="col-2 font-set text-left">
            <p>
                <span>고객센터</span>
                <br />
                <span>080-1234-5678 · 1588-1234</span>
                <br />
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
                <br />
                <span>대표이사 : 한김이</span>
                <br />
                <span>주소 : 서울특별시 종로구 청와대로 1</span>
            </p>
            <p>
                <span>사업자등록번호 : 111-11-11111</span>
                <br />
                <span>통신판매업신고 : 제 2020-서울종로구-1111호</span>
            </p>
            <p>
                <span>개인정보보호 책임자 : 홍길동</span>
                <br />
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
                <img src="/resources/img/bottom_logo.png" />
            </a>
            <br /><br /> 본 상품의 상품 이미지 저작권은 ㈜에이치케이엘에 있으며 내용의 무단복제를 금합니다. <br /> COPYRIGHT Ⓒ HKL-MART CO,LTD. ALL RIGHTS RESERVED.
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
		let pwCheck = $('#pwCheckHidden').val() == 1;
		let pwCkCheck = $('#pwckCheckHidden').val() == 1;
		if (pwCheck && pwCkCheck) {
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
</script>
</html>





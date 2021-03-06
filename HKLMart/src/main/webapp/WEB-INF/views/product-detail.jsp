<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@include file="includes/header.jsp" %>
<title>HKL Mart :: 제품 상세</title>
<style>
    #size-select-box {
        width: 80%;
        height: 45px;
        color: #1e1e1e;
        font-size: 16px;
        line-height: 50px;
        vertical-align: middle;
    }
</style>
<sec:authorize access="isAnonymous()"> <input type="hidden" id="memberId" value="none"> <input type="hidden" id="stateLogin" value="0"> </sec:authorize> <sec:authorize access="isAuthenticated()"> <sec:authentication property="principal" var="user" />
    <input type="hidden" id="stateLogin" value="1"> <input type="hidden" id="memberId" value="${user.memberId}"> </sec:authorize> <input type="hidden" id="productCodeId" value="${infoShoes.productCode}">
<div data-v-7b122ae2="" fragment="546c7337ea" id="container">
    <div data-v-a489fb08="" class="Page_products-detail">
        <div data-v-a489fb08="" class="wrap-products-info">
            <div data-v-060016d8="" data-v-a489fb08="" class="Mod_goods-thumbs">
                <div data-v-060016d8="" class="swiper-container goods-thumbs-pic">
                    <div data-v-060016d8="" class="swiper-wrapper">
                        <div data-v-060016d8="" data-thumb="" class="swiper-slide" style="background-image: url(${infoShoes.productImgpath}${infoShoes.productImg});"></div>
                    </div>
                </div>
            </div>
            <div data-v-a489fb08="" class="wrap-detail_info">
                <div data-v-a489fb08="" class="detail_basic-info">
                    <div data-v-04adba36="" data-v-a489fb08="" class="Mod_seller-info">
                        <a data-v-04adba36="" href="#" class="seller-info-pc">${infoShoes.productBrand}</a>
                    </div>
                    <h1 data-v-a489fb08="" class="detail_title">${infoShoes.productName}</h1>
                    <div data-v-a489fb08="" class="detail_price">
                        <em data-v-a489fb08="" class="price">
                            <span data-v-a489fb08="" class="number">
                                <fmt:formatNumber value="${infoShoes.productPrice}" pattern="#,###" /></span>
                            원</em>
                        <div data-v-a489fb08="" class="detail_purchaser-reaction">
                            <span data-v-a489fb08="" class="total-sales">${reviewTotal} 리뷰</span>
                        </div>
                    </div>
                    <div data-v-a489fb08="" class="detail_delivery-info">
                        <h2 data-v-a489fb08="" class="tit">배송정보</h2>
                        <div data-v-a489fb08="" class="conts">일반배송</div>
                    </div>
                    <div data-v-a489fb08="" class="Mod_goods-option-payment">
                        <div data-v-a489fb08="" class="wrap-btn-purchase-wish">
                            <button data-v-a489fb08="" type="button" class="btn-purchase" onclick="goOrderFn()">구매하기</button>
                            <button data-v-a489fb08="" type="button" class="btn-wish">
                                <span data-v-a489fb08="" class="txt" onclick="clickLike()">찜</span>
                            </button>
                        </div>
                        <div data-v-a489fb08="" class="wrap-goods-options">
                            <div data-v-a489fb08="" class="detail_options padding-top-20">
                                <select id="size-select-box">
                                    <option data-title="true" name="noSize" value="-1" class="ui-selectmenu-text"> [size]를 선택하세요.</option>
                                    <option data-date name="240" value="${infoShoes.stock240}">240 (재고 : ${infoShoes.stock240} EA)</option>
                                    <option data-date name="245" value="${infoShoes.stock245}">245 (재고 : ${infoShoes.stock245} EA)</option>
                                    <option data-date name="250" value="${infoShoes.stock250}">250 (재고 : ${infoShoes.stock250} EA)</option>
                                    <option data-date name="255" value="${infoShoes.stock255}">255 (재고 : ${infoShoes.stock255} EA)</option>
                                    <option data-date name="260" value="${infoShoes.stock260}">260 (재고 : ${infoShoes.stock260} EA)</option>
                                    <option data-date name="265" value="${infoShoes.stock265}">265 (재고 : ${infoShoes.stock265} EA)</option>
                                    <option data-date name="270" value="${infoShoes.stock270}">265 (재고 : ${infoShoes.stock270} EA)</option>
                                    <option data-date name="275" value="${infoShoes.stock275}">275 (재고 : ${infoShoes.stock275} EA)</option>
                                    <option data-date name="280" value="${infoShoes.stock280}">280 (재고 : ${infoShoes.stock280} EA)</option>
                                    <option data-date name="285" value="${infoShoes.stock285}">285 (재고 : ${infoShoes.stock285} EA)</option>
                                    <option data-date name="290" value="${infoShoes.stock290}">290 (재고 : ${infoShoes.stock290} EA)</option>
                                    <option data-date name="295" value="${infoShoes.stock295}">295 (재고 : ${infoShoes.stock295} EA)</option>
                                </select>
                                <div data-v-a489fb08="" class="wrap-selected-options"></div>
                                <dl data-v-a489fb08="" class="wrap-price">
                                    <dt data-v-a489fb08="">총 상품 금액</dt>
                                    <dd data-v-a489fb08="">
                                        <strong data-v-a489fb08="" class="price"><fmt:formatNumber value="${infoShoes.productPrice}" pattern="#,###" /></strong>원
                                    </dd>
                                </dl>
                                <form id="wrap-btn-purchase" method="GET">
                                    <button type="button" data-v-a489fb08="" id="btn_buy" onclick="goOrderFn()" class="btn-buy">바로 구매
                                    </button>
                                    <button type="button" data-v-a489fb08="" id="btn_cart_ico" class="btn-cart-ico" onclick="clickBasket(this)"></button>
                                    <button type="button" data-v-a489fb08="" id="btn_favor_ico" class="btn-favor-ico" onclick="clickLike(this)"></button>
                                </form>
                            </div>
                        </div>
                        <div data-v-a489fb08="" class="dummy"></div>
                    </div>
                </div>
            </div>
        </div>
        <div data-v-0677f871="" data-v-a489fb08="" class="wrap-detail-info" style="padding-top: 0px;">
            <div data-v-0677f871="" class="Tab_detail-info" style="top: 0; bottom: auto;">
                <ul data-v-0677f871="" class="tab">
                    <li data-v-0677f871="" class="active">
                        <a data-v-0677f871="" href="#product-detail-1">상품정보</a>
                    </li>
                    <li data-v-0677f871="">
                        <a data-v-0677f871="" href="#product-detail-2">
                            리뷰
                            <span data-v-0677f871="" class="counting">(${reviewTotal})</span>
                        </a>
                    </li>
                </ul>
            </div>
            <div data-v-6011926c="" data-v-0677f871="" class="detail_info-container" id="product-detail-1">
                <div data-v-6011926c="" id="info_container_1">
                    <div style="text-align: center">
                        <img src="${infoShoes.productImgpath}${infoShoes.productContent}" style="font-size: 9pt">
                    </div>
                </div>
                <div data-v-1c49b806="" data-v-0677f871="" id="product-detail-2" class="detail_info-container">
                    <div data-v-1c49b806="" class="detail_info-heading">
                        <h2 data-v-1c49b806="" class="txt-heading">
                            리뷰
                            <span data-v-1c49b806="" class="count">(${reviewTotal})</span>
                        </h2>
                    </div>
                </div>
            </div>
        </div>
        <div>
            <br> <br> <c:forEach items="${BoardReviewList}" var="list" varStatus="status">
            <table class="ask_table">
                <tr>
                    <th class="product_info">상품 정보</th>
                    <th class="product"></th>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <a href="/" id="product" style="color: black">
                            <img src="<%=request.getContextPath() %>${list.boardReviewImgpath}${list.boardReviewThumbnail}" style="width: 200px;  height: 200px; object-fit: fill;">
                        </a>
                    </td>
                    <td class="">
                        <dt>리뷰번호
                            <span> : ${list.boardReviewNumber}</span>
                        </dt>
                        <dt>
                            <span class="st_on" style="width:85.4%">리뷰 별점 : ${list.boardReviewScore} </span>
                        </dt>
                        <dt>작성자
                            <span> : ${list.boardReviewMemberId}</span>
                        </dt>
                        <dt>상품이름
                            <span> : ${list.productName}</span>
                        </dt>
                        <dt>리뷰 코멘트
                            <span> : ${list.boardReviewContent}</span>
                        </dt>
                    </td>
                </tr>
            </table>
            <br> </c:forEach>
            <ul class="pagination justify-content-center" style="margin:20px 0">
                <c:if test="${pageMaker.prev}">
                    <li class="page-item">
                        <a class="page-link" style="color: black;" href="/manager/manager-review-list?pageNum=${pageMaker.startPage - 1}&amount=10">≪</a>
                    </li>
                </c:if> <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
                <li class="page-item ${pageMaker.cri.pageNum == num ? "active":""}">
                    <a class="page-link" style="color: black;" href="/manager/manager-review-list?pageNum=${num}&amount=10">${num}</a>
                </li>
            </c:forEach> <c:if test="${pageMaker.next}">
                <li class="page-item ">
                    <a class="page-link" style="color: black;" href="/manager/manager-review-list?pageNum=${pageMaker.endPage + 1}&amount=10">≫</a>
                </li>
            </c:if>
            </ul>
            <form id="pageForm" action="/manager/manager-review-list" method="get">
                <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}" /> <input type="hidden" name="amount" value="${pageMaker.cri.amount}" />
            </form>
            <hr style="border: solid 1px black;">
        </div>
    </div>
</div>
<br><br>
<hr style="border: solid 1px #ffb6b6;">
<script>
	function clickBasket(obj) {
		let thisCode = document.getElementById('productCodeId').value;
		let memberId = document.getElementById('memberId').value;
		if (memberId === "none") {
			alert("로그인이 필요한 서비스입니다");
			location.href = "/member/login-page";
			return 0;
		}
		let sendData = {memberId: memberId, productCode: thisCode};
		$.ajax({
			url        : "/basket/check",
			type       : "GET",
			dataType   : "json",
			contentType: "application/json; charset=UTF-8",
			data       : sendData,
			success    : function (data) {
				if (data.result === 0) {
					alert("해당 상품을 장바구니에 담았습니다")
				} else if (data.result === 1) {
					alert("이미 장바구니에 있는 상품입니다");
				}
			},
			error      : function () {
				alert("Error. 관리자에게 문의하십시오.");
			},
		});
	}

	function clickLike(obj) {
		let thisCode = $("#productCodeId").val();
		let stateLogin = document.getElementById('stateLogin').value;
		if (stateLogin === "0") {
			alert("로그인이 필요한 서비스입니다");
			location.href = "/member/login-page";
			return 0;
		}
		let sendData = {productCode: thisCode};
		$.ajax({
			url        : "/like/check",
			type       : "GET",
			dataType   : "json",
			contentType: "application/json; charset=UTF-8",
			data       : sendData,
			success    : function (data) {
				if (data.result === 0) {
					alert("해당 상품을 찜했습니다")
				} else if (data.result === 1) {
					alert("이미 찜한 상품입니다");
				}
			},
			error      : function () {
				alert("Error. 관리자에게 문의하십시오.");
			},
		});
	}

	$(document).ready(function () {
		$('[data-toggle="tooltip"]').tooltip();
	});

	function goOrderFn() {
		var productCode = $("#productCodeId").val();
		var productStock = $("#size-select-box").val();
		var productSize = $("#size-select-box option:selected").attr("name");

		if (productSize == 'noSize') {
			alert("사이즈를 선택하여주세요")
			return;
		}
		if (productStock == 0) {
			alert("재고가 부족합니다")

		} else {
			location.href = '/order/order-page?productCode=' + productCode + '&Size=' + productSize;
		}

	}

	onchange = "fn_setAsscatnNm(this);"
</script>
<%@include file="includes/footer.jsp" %>
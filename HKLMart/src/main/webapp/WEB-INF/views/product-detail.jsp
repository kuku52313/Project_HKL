<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>

<%@include file="includes/header.jsp" %>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <title>HKL MART</title>

    <link rel="stylesheet" href="/resources/css/product-detail.css">
    <link rel="stylesheet" href="/resources/css/product-detail-like.css">
    <link rel="stylesheet" href="/resources/css/product-detail-tabs.css">
    <link rel="stylesheet" href="/resources/css/product-detail-1.css">
    <link rel="stylesheet" href="/resources/css/product-detail-2.css">
    <link rel="stylesheet" href="/resources/css/product-detail-all.css">
    <link rel="shortcut icon" href="/resources/img/back_exception.jpg">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.1/css/all.css"
          integrity="sha384-vp86vTRFVJgpjF9jiIGPEEqYqlDwgyBgEF109VFjmqGmIY/Y4HV4d3Gp2irVfcrp" crossorigin="anonymous">
    <link rel="stylesheet" href="/resources/css/ask-review.css">
</head>


    <div data-v-7b122ae2="" fragment="546c7337ea" id="container">
        <div data-v-a489fb08="" class="Page_products-detail">
            <div data-v-a489fb08="" class="wrap-products-info">
                <div data-v-060016d8="" data-v-a489fb08="" class="Mod_goods-thumbs">
                    <div data-v-060016d8="" class="swiper-container goods-thumbs-pic">
                        <div data-v-060016d8="" class="swiper-wrapper">
                            <div data-v-060016d8="" data-thumb="" class="swiper-slide"
                                 style="background-image: url(${infoShoes.productImgpath}${infoShoes.productImg});"></div>
                        </div>
                        <!---->
                    </div>
                    <!---->
                </div>
                <div data-v-a489fb08="" class="wrap-detail_info">
                    <div data-v-a489fb08="" class="detail_basic-info">
                        <div data-v-04adba36="" data-v-a489fb08="" class="Mod_seller-info">
                            <a data-v-04adba36="" href="#" class="seller-info-pc">${infoShoes.productBrand}</a>
                        </div>
                        <!--브랜드 명-->
                        <h1 data-v-a489fb08="" class="detail_title">${infoShoes.productName}</h1>
                        <!--제품 명-->
                        <div data-v-a489fb08="" class="detail_price">
                            <!---->
                            <em data-v-a489fb08="" class="price"><span data-v-a489fb08=""
                                                                       class="number"><fmt:formatNumber
                                    value="${infoShoes.productPrice}" pattern="#,###"/></span>원 <!--제품 가격--> </em>
                            <!---->
                            </dd>
                            </dl>
                            <!---->

                            <div data-v-a489fb08="" class="detail_purchaser-reaction">
                                <div data-v-a489fb08="" class="review-info">
                                    <div data-v-a489fb08="" class="ico-score">
                                        <div data-v-a489fb08="" class="score" style="width: 100%;">5점</div>
                                        <!--상품 좋아요 // 여기 점수에 따라 별 갯수가 나옴. ex.4점 = 별4개-->
                                    </div>
                                    <a data-v-a489fb08="" href="#" class="total-reviews">19개 리뷰 보기</a>
                                </div>
                                <span data-v-a489fb08="" class="total-sales">155개 구매중</span>
                            </div>
                        </div>
                        <div data-v-a489fb08="" class="detail_delivery-info">
                            <h2 data-v-a489fb08="" class="tit">배송정보</h2>
                            <div data-v-a489fb08="" class="conts">일반배송</div>
                        </div>
                        <!---->
                        <!---->

                        <!-- 모바일 버전에서의 구매하기, 찜 버튼 -->
                        <div data-v-a489fb08="" class="Mod_goods-option-payment">
                            <div data-v-a489fb08="" class="wrap-btn-purchase-wish">
                                <button data-v-a489fb08="" type="button" class="btn-purchase">구매하기</button>
                                <button data-v-a489fb08="" type="button" class="btn-wish">
                                    <span data-v-a489fb08="" class="txt">찜</span>
                                </button>
                            </div>
                            </form>

                            <div data-v-a489fb08="" class="wrap-goods-options">
                                <div data-v-a489fb08="" class="detail_options padding-top-20">
                                    <select id="ui-id-1">
                                        <option value data-title="true" class="ui-selectmenu-text"> [size]를 선택하세요.
                                        </option>
                                        <option data-date value="240">240 (${infoShoes.stock240} EA)</option>
                                        <option data-date value="245">245 (${infoShoes.stock245} EA)</option>
                                        <option data-date value="250">250 (${infoShoes.stock250} EA)</option>
                                        <option data-date value="255">255 (${infoShoes.stock255} EA)</option>
                                        <option data-date value="260">260 (${infoShoes.stock260} EA)</option>
                                        <option data-date value="265">265 (${infoShoes.stock265} EA)</option>
                                        <option data-date value="270">275 (${infoShoes.stock270} EA)</option>
                                        <option data-date value="270">280 (${infoShoes.stock275} EA)</option>
                                        <option data-date value="270">285 (${infoShoes.stock280} EA)</option>
                                        <option data-date value="270">290 (${infoShoes.stock290} EA)</option>
                                        <option data-date value="270">295 (${infoShoes.stock295} EA)</option>
                                        </option>
                                    </select>


                                    <div data-v-a489fb08="" class="wrap-selected-options"></div>
                                    <dl data-v-a489fb08="" class="wrap-price">
                                        <dt data-v-a489fb08="">총 상품 금액</dt>
                                        <dd data-v-a489fb08="">
                                            <strong data-v-a489fb08="" class="price">0</strong>원
                                        </dd>
                                    </dl>


                                    <form id="wrap-btn-purchase" method="GET">
                                        <button type="button" data-v-a489fb08="" id="btn_buy" class="btn-buy">바로 구매
                                        </button>
                                        <button type="button" data-v-a489fb08="" id="btn_cart_ico" class="btn-cart-ico"
                                                onclick="addCart()"></button>
                                        <button type="button" data-v-a489fb08="" id="btn_favor_ico"
                                                class="btn-favor-ico" onclick="likeClick()"></button>
                                </div>
                                </form>

                            </div>
                            <div data-v-a489fb08="" class="dummy"></div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- 탭 페이지 -->

            <div data-v-0677f871="" data-v-a489fb08="" class="wrap-detail-info" style="padding-top: 0px;">
                <div data-v-0677f871="" class="Tab_detail-info" style="top: 0px; bottom: auto;">
                    <ul data-v-0677f871="" class="tab">
                        <li data-v-0677f871="" class="active"><a data-v-0677f871="" href="#product-detail-1">상품정보</a>
                        </li>
                        <li data-v-0677f871=""><a data-v-0677f871="" href="#product-detail-2">
                            리뷰<span data-v-0677f871="" class="counting">(${reviewTotal})</span>
                        </a></li>

                    </ul>
                </div>

                <div data-v-6011926c="" data-v-0677f871="" class="detail_info-container" id="product-detail-1">
                    <!---->
                    <div data-v-6011926c="" id="info_container_1">
                        <div style="text-align: center">
                            <img src="${infoShoes.productImgpath}${infoShoes.productContent}" style="font-size: 9pt">
                        </div>
                    </div>
                    <div data-v-1c49b806="" data-v-0677f871="" id="product-detail-2" class="detail_info-container">
                        <div data-v-1c49b806="" class="detail_info-heading">
                            <h2 data-v-1c49b806="" class="txt-heading">
                                리뷰 <span data-v-1c49b806="" class="count">(${reviewTotal})</span>
                            </h2>


                        </div>
                    </div>
                </div>
            </div>
            <div>
                <br>

                <br>

                <c:forEach items="${BoardReviewList}" var="list" varStatus="status">
                    <table class="ask_table">
                        <tr>
                            <th class="product_info">상품 정보</th>
                            <th class="product"></th> <!-- 여긴 빈칸-->
                        </tr>

                        <tr>
                            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="/" id="product" style="color: black"><img
                                    src="<%=request.getContextPath() %>${list.boardReviewImgpath}${list.boardReviewThumbnail}.png"
                                    style="width: 200px;  height: 200px; object-fit: fill;"></a>
                              </td>
                            <td class="">
                                <dt>리뷰번호 <span> : ${list.boardReviewNumber}</span></dt>
                                <dt><span class="st_on" style="width:85.4%">리뷰 별점 : ${list.boardReviewScore} </span></dt>
                                <dt>작성자 <span> : ${list.boardReviewMemberId}</span></dt>
                                <dt>상품이름 <span> : ${list.productName}</span></dt>
                                <dt>리뷰 코멘트 <span> : ${list.boardReviewContent}</span></dt>
                            </td>
                        </tr>

                    </table>
                    <br>
                </c:forEach>

                <ul class="pagination justify-content-center" style="margin:20px 0">

                    <c:if test="${pageMaker.prev}">
                        <li class="page-item"><a class="page-link" style="color: black;"
                                                 href="/manager/manager-review-list?pageNum=${pageMaker.startPage - 1}&amount=10">≪</a>
                        </li>
                    </c:if>


                    <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
                        <li class="page-item ${pageMaker.cri.pageNum == num ? "active":""}">
                            <a class="page-link" style="color: black;"
                               href="/manager/manager-review-list?pageNum=${num}&amount=10">${num}</a>
                        </li>
                    </c:forEach>

                    <c:if test="${pageMaker.next}">
                        <li class="page-item ">
                            <a class="page-link" style="color: black;"
                               href="/manager/manager-review-list?pageNum=${pageMaker.endPage + 1}&amount=10">≫</a>
                        </li>
                    </c:if>
                </ul>

                <form id="pageForm" action="/manager/manager-review-list" method="get">
                    <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}"/>
                    <input type="hidden" name="amount" value="${pageMaker.cri.amount}"/>
                </form>
                <hr style="border: solid 1px black;">
            </div>



            <script>
                function addCart() {

                }
            </script>
<%@include file="includes/footer.jsp" %>
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
    <meta charset="utf-8">
    <title>HKL MART</title>

    <link rel="stylesheet" href="/resources/css/product-detail.css">
    <link rel="stylesheet" href="/resources/css/product-detail-like.css">
    <link rel="stylesheet" href="/resources/css/product-detail-tabs.css">
    <link rel="stylesheet" href="/resources/css/product-detail-1.css">
    <link rel="stylesheet" href="/resources/css/product-detail-2.css">
    <link rel="stylesheet" href="/resources/css/product-detail-all.css">
    <link rel="shortcut icon" href="/resources/img/back_exception.jpg">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.1/css/all.css" integrity="sha384-vp86vTRFVJgpjF9jiIGPEEqYqlDwgyBgEF109VFjmqGmIY/Y4HV4d3Gp2irVfcrp" crossorigin="anonymous">

    <style>
        select:not(:-internal-list-box) {
            overflow: visible !important;
        }

    </style>
    <div data-v-7b122ae2="" fragment="546c7337ea" id="container">
        <div data-v-a489fb08="" class="Page_products-detail">
            <div data-v-a489fb08="" class="wrap-products-info">
                <div data-v-060016d8="" data-v-a489fb08="" class="Mod_goods-thumbs">
                    <div data-v-060016d8="" class="swiper-container goods-thumbs-pic">
                        <div data-v-060016d8="" class="swiper-wrapper">
                            <div data-v-060016d8="" data-thumb="https://image.brandi.me/cproduct/2020/11/03/22846694_1604364241_image1_L.jpg" class="swiper-slide" style="background-image: url(&quot;https://image.brandi.me/cproduct/2020/11/03/22846694_1604364241_image1_L.jpg&quot;);"></div>
                        </div>
                        <!---->
                    </div>
                    <!---->
                </div>
                <div data-v-a489fb08="" class="wrap-detail_info">
                    <div data-v-a489fb08="" class="detail_basic-info">
                        <div data-v-04adba36="" data-v-a489fb08="" class="Mod_seller-info">
                            <a data-v-04adba36="" href="#" class="seller-info-pc">공구홀릭</a>
                            ${infoShoes.productCode}
                        </div>
                        <!--브랜드 명-->
                        <h1 data-v-a489fb08="" class="detail_title">소피아 뽀글이 슈즈</h1>
                        <!--제품 명-->
                        <div data-v-a489fb08="" class="detail_price">
                            <!---->
                            <em data-v-a489fb08="" class="price"><span data-v-a489fb08="" class="number">17,500</span>원 <!--제품 가격--> </em>
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
                                    <select id="ui-id-1" >
                                        <option value data-title="true" class="ui-selectmenu-text"> [size]를 선택하세요.</option>
                                        <option data-date value="240">240 ( EA)</option>
                                        <option data-date value="245">245</option>
                                        <option data-date value="250">250</option>
                                        <option data-date value="255">255</option>
                                        <option data-date value="260">260</option>
                                        <option data-date value="265">265</option>
                                        <option data-date value="270">275</option>
                                        <option data-date value="270">280</option>
                                        <option data-date value="270">285</option>
                                        <option data-date value="270">290</option>
                                        <option data-date value="270">295
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
                                            <button type="button" data-v-a489fb08="" id="btn_buy" class="btn-buy">바로 구매</button>
                                            <button type="button" data-v-a489fb08="" id="btn_cart_ico" class="btn-cart-ico" onclick="addCart()"></button>
                                            <button type="button" data-v-a489fb08="" id="btn_favor_ico" class="btn-favor-ico" onclick="likeClick()"></button>
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
                    <li data-v-0677f871="" class="active"><a data-v-0677f871="" href="#product-detail-1">상품정보</a></li>
                    <li data-v-0677f871=""><a data-v-0677f871="" href="#product-detail-2">
                        리뷰<span data-v-0677f871="" class="counting">(ex.19)</span>
                    </a></li>

                </ul>
            </div>

            <div data-v-6011926c="" data-v-0677f871="" class="detail_info-container" id="product-detail-1">
                <!---->
                <div data-v-6011926c="" id="info_container_1">
                    <div style="text-align: center">
                        <img src="http://09holic.co.kr/product/AC070/AC070_01.jpg" style="font-size: 9pt"><span style="font-size: 9pt"> </span><img
                            src="http://09holic.co.kr/product/AC070/AC070_02.jpg" style="font-size: 9pt"><span style="font-size: 9pt"> </span><img src="http://09holic.co.kr/product/09holic.png"
                                                                                                                                                   style="font-size: 9pt"> <span
                            style="font-size: 9pt"> </span><br> <br> <br> <br> !주문폭주!<br> &nbsp;우선 '소피아 뽀글이 슈즈'를<br> 많이 사랑해주셔서 감사합니다 ♥<br> <br> &nbsp;현재 주문폭주로인한 제작리오더중입니다!<br> 영업일 6~7일내외 발송예정이며,&nbsp;<br>
                        색상/사이즈별로 출고예정일이 상이하오니<br> 자세한 배송예정일은 문의게시판에 남겨주세요 :)<br> <br> <br> <br> &nbsp;
                    </div>

                    <div style="text-align: center">
                        <span style="background-color: #ffff00">✓ SIZE TIP</span><br> <br> <br> 230-250까지의 사이즈가 있는<br> 요즘 어딜가도 눈에 띄는 '소피아 뽀글이 슈즈'에요 :D<br> <br> MD 사이즈 : 운동화 225/구두 230/발볼 9cm&nbsp;<br>
                        <br> MD가 230을 착용 했을 때,<br> 발을 안전하게 감싸주는 착용감이었어요 !<br> 추워지는 요즘 포인트로 신기 너무 좋은 아이템이라<br> 모든 공구님들에게 적극 추천해드리고 싶은 상품이랄까요 ?!<br> 거기다 안에 기모 안감이라 정말 따뜻하게 착용 가능하답니다 !<br> <br> 이 상품은 살짝
                        작게나와서<br> 두꺼운 양말을 신으실 분들이나 발볼이 좀 넓으신 분들께서<br> 넉넉하고 편안하게 착용하시길 원하신다면 반사이즈 업해서 주문 부탁드려요 :)<br> <br> <br> <strong><span style="font-size: 14px"><span style="color: #ff8c00">브랜디 특가 판매 중 (한정수량)</span></span></strong><br>
                        <br> <br> <br> <br> <br> <img src="http://09holic.co.kr/product/AC070/AC070_03.jpg" style="font-size: 9pt"><span style="font-size: 9pt"></span> <img
                            src="http://09holic.co.kr/product/AC070/AC070_04.jpg" style="font-size: 9pt"><span style="font-size: 9pt"></span> <img
                            src="http://09holic.co.kr/product/AC070/AC070_05.jpg" style="font-size: 9pt"
                    ><span style="font-size: 9pt"> </span> <img src="http://09holic.co.kr/product/09holic2.png" style="font-size: 9pt"><span style="font-size: 9pt"> </span>
                    </div>
                </div>
            </div>
            <div data-v-1c49b806="" data-v-0677f871="" id="product-detail-2" class="detail_info-container">
                <div data-v-1c49b806="" class="detail_info-heading">
                    <h2 data-v-1c49b806="" class="txt-heading">
                        리뷰 <span data-v-1c49b806="" class="count">(19)</span>
                    </h2>
                    <div data-v-1c49b806="" class="wrap-filters">
                        <a data-v-1c49b806="" href="#" class="active">전체 (19)</a>
                    </div>
                </div>
                <dl data-v-1c49b806="" class="review_view-rating">
                    <dt data-v-1c49b806="">만족도</dt>
                    <dd data-v-1c49b806="">
                        <div data-v-1c49b806="" class="ico-score">
                            <div data-v-1c49b806="" class="score" style="width: 100%;"></div>
                        </div>
                        <div data-v-1c49b806="" class="txt-score">
                            <em data-v-1c49b806="" class="score">5</em> / 5
                        </div>
                    </dd>
                </dl>
                <div data-v-1c49b806="" class="detail_review-container">
                    <div data-v-1b035faf="" data-v-1c49b806="" class="Artc_review-conts">
                        <div data-v-1b035faf="" class="header">
                            <div data-v-1b035faf="" class="wrap-score">
                                <div data-v-1b035faf="" class="score" style="width: 100%;">5점</div>
                            </div>
                            <strong data-v-1b035faf="" class="user-name">anyjeong0604</strong> <span data-v-1b035faf="" class="date">2020.12.07</span>
                        </div>
                        <div data-v-1b035faf="" class="conts">
                            <ul data-v-1b035faf="" class="reviewer-info">
                                <li data-v-1b035faf="">165cm</li>
                                <li data-v-1b035faf="">상의 55</li>
                                <li data-v-1b035faf="">하의 55</li>
                                <li data-v-1b035faf="">235mm</li>
                                <li data-v-1b035faf="">화이트/240 잘 맞아요</li>
                            </ul>
                            <p data-v-1b035faf="" class="review-text">235 신는데 240시켰어요 ! 그냥 양말신고도 딱 맞고, 두꺼운 니트양말 신어도 딱 맞아요 넘 예뻐서 밖에 신고나가기 아까워서 집에서 신기로 했어요 ㅋㅋㅋㅋㅋ 수족냉증있는데 이거신고 돌아다니니까 수족냉증 사라지는듯한 기분 짱이에요
                                ☺️ 또 살거에요 ㅋㅋㅋ !</p>
                            <div data-v-1b035faf="" class="review-thumbs">
                                <div data-v-1b035faf="" class="thumbs">
                                    <a data-v-1b035faf="" href="https://image.brandi.me/media/2020/12/07/33868_1607335607_image1_L.jpg" rel="review-thumbs6244588">
                                        <img data-v-1b035faf="" src="https://image.brandi.me/media/2020/12/07/33868_1607335607_image1_S.jpg" alt="리뷰 이미지">
                                    </a>
                                </div>
                                <!---->
                            </div>
                        </div>
                    </div>
                    <div data-v-1b035faf="" data-v-1c49b806="" class="Artc_review-conts">
                        <div data-v-1b035faf="" class="header">
                            <div data-v-1b035faf="" class="wrap-score">
                                <div data-v-1b035faf="" class="score" style="width: 100%;">5점</div>
                            </div>
                            <strong data-v-1b035faf="" class="user-name">dhwltn000</strong> <span data-v-1b035faf="" class="date">2020.12.06</span>
                        </div>
                        <div data-v-1b035faf="" class="conts">
                            <ul data-v-1b035faf="" class="reviewer-info">
                                <li data-v-1b035faf="">160cm</li>
                                <li data-v-1b035faf="">상의 55</li>
                                <li data-v-1b035faf="">하의 55</li>
                                <li data-v-1b035faf="">245mm</li>
                                <li data-v-1b035faf="">블랙/245 잘 맞아요</li>
                            </ul>
                            <p data-v-1b035faf="" class="review-text">실물 넘 귀여워요 이 가격대로 믿기지 않는 깜찍함•• 다들 사세요</p>
                            <div data-v-1b035faf="" class="review-thumbs">
                                <div data-v-1b035faf="" class="thumbs">
                                    <a data-v-1b035faf="" href="https://image.brandi.me/media/2020/12/06/2601420_1607245479_image1_L.jpg" rel="review-thumbs6231715">
                                        <img data-v-1b035faf="" src="https://image.brandi.me/media/2020/12/06/2601420_1607245479_image1_S.jpg" alt="리뷰 이미지">
                                    </a>
                                </div>
                                <!---->
                            </div>
                        </div>
                    </div>
                    <div data-v-1b035faf="" data-v-1c49b806="" class="Artc_review-conts">
                        <div data-v-1b035faf="" class="header">
                            <div data-v-1b035faf="" class="wrap-score">
                                <div data-v-1b035faf="" class="score" style="width: 100%;">5점</div>
                            </div>
                            <strong data-v-1b035faf="" class="user-name">vov89</strong> <span data-v-1b035faf="" class="date">2020.12.04</span>
                        </div>
                        <div data-v-1b035faf="" class="conts">
                            <ul data-v-1b035faf="" class="reviewer-info">
                                <li data-v-1b035faf="">157cm</li>
                                <li data-v-1b035faf="">상의 55</li>
                                <li data-v-1b035faf="">하의 66</li>
                                <li data-v-1b035faf="">225mm</li>
                                <li data-v-1b035faf="">베이지/230 조금 커요</li>
                            </ul>
                            <p data-v-1b035faf="" class="review-text">발볼이 넓어 한치수 크게 주문했어요 양말신고 신으면 딱이네용😆 실물이 더 귀여워요 ㅎㅎ 배송이 빨라 좋았어요</p>
                            <div data-v-1b035faf="" class="review-thumbs">
                                <div data-v-1b035faf="" class="thumbs">
                                    <a data-v-1b035faf="" href="https://image.brandi.me/media/2020/12/04/1009006_1607048742_image1_L.jpg" rel="review-thumbs6201261">
                                        <img data-v-1b035faf="" src="https://image.brandi.me/media/2020/12/04/1009006_1607048742_image1_S.jpg" alt="리뷰 이미지">
                                    </a>
                                </div>
                                <!---->
                            </div>
                        </div>
                    </div>
                    <div data-v-1b035faf="" data-v-1c49b806="" class="Artc_review-conts">
                        <div data-v-1b035faf="" class="header">
                            <div data-v-1b035faf="" class="wrap-score">
                                <div data-v-1b035faf="" class="score" style="width: 100%;">5점</div>
                            </div>
                            <strong data-v-1b035faf="" class="user-name">dodosin5</strong> <span data-v-1b035faf="" class="date">2020.12.03</span>
                        </div>
                        <div data-v-1b035faf="" class="conts">
                            <ul data-v-1b035faf="" class="reviewer-info">
                                <li data-v-1b035faf="">160cm</li>
                                <li data-v-1b035faf="">상의 55</li>
                                <li data-v-1b035faf="">하의 44</li>
                                <li data-v-1b035faf="">225mm</li>
                                <li data-v-1b035faf="">블랙/230 잘 맞아요</li>
                            </ul>
                            <p data-v-1b035faf="" class="review-text">두꺼운 양말을 신으면 한사이즈업하는게 좋으실거같아요 아니면 정사이즈해도 잘 맞는거같아요 :) 배송은 2~3일정도 걸린거 같아요</p>
                            <div data-v-1b035faf="" class="review-thumbs">
                                <div data-v-1b035faf="" class="thumbs">
                                    <a data-v-1b035faf="" href="https://image.brandi.me/media/2020/12/03/157957_1606980046_image1_L.jpg" rel="review-thumbs6189333">
                                        <img data-v-1b035faf="" src="https://image.brandi.me/media/2020/12/03/157957_1606980046_image1_S.jpg" alt="리뷰 이미지">
                                    </a>
                                </div>
                                <!---->
                            </div>
                        </div>
                    </div>
                    <div data-v-1b035faf="" data-v-1c49b806="" class="Artc_review-conts">
                        <div data-v-1b035faf="" class="header">
                            <div data-v-1b035faf="" class="wrap-score">
                                <div data-v-1b035faf="" class="score" style="width: 100%;">5점</div>
                            </div>
                            <strong data-v-1b035faf="" class="user-name">klklove</strong> <span data-v-1b035faf="" class="date">2020.12.03</span>
                        </div>
                        <div data-v-1b035faf="" class="conts">
                            <ul data-v-1b035faf="" class="reviewer-info">
                                <li data-v-1b035faf="">163cm</li>
                                <li data-v-1b035faf="">상의 55</li>
                                <li data-v-1b035faf="">하의 55</li>
                                <li data-v-1b035faf="">235mm</li>
                                <li data-v-1b035faf="">화이트/235 잘 맞아요</li>
                            </ul>
                            <p data-v-1b035faf="" class="review-text">한치수 크게 주문했는데 잘한거 같아요 실물이 훨씬 귀염뽀짝합니다</p>
                            <div data-v-1b035faf="" class="review-thumbs">
                                <div data-v-1b035faf="" class="thumbs" style="display: none;"></div>
                                <!---->
                            </div>
                        </div>
                    </div>
                    <div data-v-1c49b806="" class="wrap-paging">
                        <div data-v-1c49b806="" class="Nav_paging">
                            <a href="#" class="first disabled">
                                <span class="txt">시작 페이지</span>
                            </a>
                            <a href="#" class="prev disabled">
                                <span class="txt">이전 페이지</span>
                            </a>
                            <a href="#" class="page active">1</a>
                            <a href="#" class="page">2</a>
                            <a href="#" class="page">3</a>
                            <a href="#" class="page">4</a>
                            <a href="#" class="next disabled">
                                <span class="txt">다음 페이지</span>
                            </a>
                            <a href="#" class="last disabled">
                                <span class="txt">끝 페이지</span>
                            </a>
                        </div>
                        <!---->
                    </div>
                </div>
            </div>
        </div>
    </div>

</head>


<script>
    function addCart() {

    }
</script>
<%@include file="includes/footer.jsp" %>
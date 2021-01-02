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
    <title>HKL 장바구니 페이지입니다.</title>
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=3">

    <link rel="stylesheet" href="/resources/css/product-detail-all.css">
    <link rel="stylesheet" href="/resources/css/checkout.css">
    <link rel="stylesheet" href="/resources/css/checkout-order-product.css">
    <link rel="stylesheet" href="/resources/css/checkout-order-adress.css">
    <link rel="stylesheet" href="/resources/css/checkout-order-payment.css">
    <link rel="shortcut icon" href="/resources/img/back_exception.jpg">

    <script type="text/javascript" charset="UTF-8" src="//t1.daumcdn.net/adfit/static/kp.js"></script>
    <script type="text/javascript" src="https://wcs.naver.net/wcslog.js"></script>
    <script type="text/javascript"></script>
    <script async="" src="https://www.googletagmanager.com/gtag/js?id=UA-59629214-19"></script>
    <noscript><img height=1 width=1 style=display:none src="https://www.facebook.com/tr?id=1161187400597904&ev=Page_view&noscript=1"></noscript>
    <script type="text/javascript" charset="utf-8"></script>


    <script type="text/javascript" charset="UTF-8" src="//t1.daumcdn.net/adfit/static/kp.js"></script>
    <script type="text/javascript" src="https://wcs.naver.net/wcslog.js"></script>
    <script type="text/javascript"></script>
    <script async="" src="https://www.googletagmanager.com/gtag/js?id=UA-59629214-19"></script>
    <noscript><img height=1 width=1 style=display:none src="https://www.facebook.com/tr?id=1161187400597904&ev=Page_view&noscript=1"></noscript>
    <script type="text/javascript" charset="utf-8"></script>
</head>
<body>
<div data-v-7b122ae2="" fragment="5c8f7b94a1" id="container">
    <!--fragment#9ce731cb19#head-->
    <div data-v-2c642cc6="" fragment="9ce731cb19" class="pagetitle">
        <h1 data-v-2c642cc6="">장바구니</h1>
    </div>
    <div data-v-2c642cc6="" fragment="9ce731cb19" class="frame">
        <h2 data-v-2c642cc6="">주문상품 정보</h2>
        <!---->
        <div data-v-2c642cc6="" class="normal-seller-wrapper">
            <div data-v-2c642cc6="" class="wrap-normal-shipping-title"><strong data-v-2c642cc6="" class="title">일반배송</strong></div>
            <div data-v-2c642cc6="" class="cart-seller-list cart_list_full">
                <div data-v-44e1d284="" data-v-2c642cc6="">
<%--                    <c:forEach items="${BasketList}" var="list" varStatus="status">--%>
                    <div data-v-44e1d284="" class="order_item">
                        <dl data-v-44e1d284="">
                            <dt data-v-44e1d284=""><%--<c:out value="${list.}">--%></dt>
                            <dt data-v-44e1d284=""></dt>
                            <dt data-v-44e1d284=""></dt>
                            <dt data-v-44e1d284=""><%--<c:out value="${list.productPrice}">--%></dt>
                        </dl>
                        <dl data-v-6dcc2f72="" data-v-44e1d284="">
                            <dd data-v-6dcc2f72=""><a data-v-6dcc2f72=""><img data-v-6dcc2f72="" src="https://image.brandi.me/cproduct/2020/11/03/22846694_1604364241_image1_S.jpg"></a></dd>
                            <dd data-v-6dcc2f72=""><a data-v-6dcc2f72=""><span data-v-6dcc2f72="" class="itemname"><%--<c:out value="${list.productName}">--%></span></a> <span data-v-6dcc2f72=""><%--<c:out value="${고른옵션(사이즈)}">--%></span> <span
                                    data-v-6dcc2f72=""><%--<c:out value="${고른옵션(상품갯수)}">--%></span></dd>
                            <dd data-v-6dcc2f72="">
                                <!---->
                            </dd>
                            <dd data-v-6dcc2f72=""><%--<c:out value="${list.productPriceAll}">--%></dd> <%--전체 아이템 결제 가격이 나와야 함.--%>
                        </dl>
                    </div>
                    <input data-v-44e1d284="" type="hidden" value="0">
                </div>
            </div>
        </div>
        <div data-v-2c642cc6="" class="price_total">총 주문금액 <span data-v-2c642cc6=""><%--<c:out value="${list.productPriceAll}">--%></span></div>

        <div data-v-06f5e281="" data-v-2c642cc6="">
            <h2 data-v-06f5e281="" class="orderer-info-title">주문자 정보</h2>
            <div data-v-06f5e281="" class="order_delivery">
                <dl data-v-06f5e281="">
                    <dt data-v-06f5e281="">이름</dt>
                    <dd data-v-06f5e281=""><input data-v-06f5e281="" type="text" name="" id="orderer_name" placeholder="이름" maxlength="15" class="w100per"></dd>
                </dl>
                <dl data-v-06f5e281="">
                    <dt data-v-06f5e281="">휴대폰</dt>
                    <dd data-v-06f5e281=""><input data-v-06f5e281="" type="tel" name="" id="shipping_telephone1" maxlength="3" class="w80px"> -
                        <input data-v-06f5e281="" type="tel" name="" id="shipping_telephone2" maxlength="4" class="w80px"> -
                        <input data-v-06f5e281="" type="tel" name="" id="shipping_telephone3" maxlength="4" class="w80px"></dd>
                    <!---->
                    </dd>
                </dl>

                <dl data-v-06f5e281="">
                    <dt data-v-06f5e281="">이메일</dt>
                    <dd data-v-06f5e281=""><input data-v-06f5e281="" type="text" name="" id="orderer_email1"> @
                        <input data-v-06f5e281="" type="text" name="" id="orderer_email2"></dd>
                </dl>
            </div>
        </div>

        <h2 data-v-06f5e281="">배송지 정보<span data-v-06f5e281="" class="checkout-inpt"><input data-v-06f5e281="" type="checkbox" name="" id="order_delivery_chk" class="checkbox-style"><label
                data-v-06f5e281="" for="order_delivery_chk">주문자 정보와 동일</label></span></h2> <%--여길 체크 하면 위 리스트 정보 고대로 내려오게..--%>
        <div data-v-06f5e281="" class="order_delivery">
            <dl data-v-06f5e281="">
                <dt data-v-06f5e281="">수령인</dt>
                <dd data-v-06f5e281=""><input data-v-06f5e281="" type="text" name="" id="shipping_name" placeholder="이름" class="w100per"></dd>
            </dl>
            <dl data-v-06f5e281="">
                <dt data-v-06f5e281="">휴대폰</dt>
                <dd data-v-06f5e281=""><input data-v-06f5e281="" type="tel" name="" id="shipping_telephone1" maxlength="3" class="w80px"> -
                    <input data-v-06f5e281="" type="tel" name="" id="shipping_telephone2" maxlength="4" class="w80px"> -
                    <input data-v-06f5e281="" type="tel" name="" id="shipping_telephone3" maxlength="4" class="w80px"></dd>
            </dl>
            <dl data-v-06f5e281="">
                <dt data-v-06f5e281="">배송주소</dt>
                <dd data-v-06f5e281=""><input data-v-06f5e281="" type="text" name="" readonly="readonly" class="w49per"> <input data-v-06f5e281="" type="button" value="우편번호 찾기"
                                                                                                                                class="btn_in_orderforn"><br data-v-06f5e281="">
                    <div data-v-06f5e281="" id="daumPostCodeArea" style="display: none; border: 1px solid; width: 100% !important; height: auto; margin: 5px 0px; position: relative;"><img
                            data-v-06f5e281="" src="//t1.daumcdn.net/localimg/localimages/07/postcode/320/close.png" id="btnFoldWrap" alt="접기 버튼"
                            style="cursor: pointer; position: absolute; right: 0px; top: -1px; z-index: 1;"></div>
                    <input data-v-06f5e281="" type="text" name="" id="address1" readonly="readonly" class="w49per order_addr"> <input data-v-06f5e281="" type="text" name="" id="address2"
                                                                                                                                      class="w49per order_addr">
                    <div data-v-06f5e281="" class="delivery_add_info_text">* 제주도, 도서 산간 지역 등은 배송이 하루 이상 추가 소요될 수 있습니다</div>
                </dd>
            </dl>
            <dl data-v-06f5e281="">
                <dt data-v-06f5e281="">배송메모</dt>
                <dd data-v-06f5e281="">
                    <select data-v-06f5e281="" class="coupon" id="ui-id-1" style="display: none;">
                        <option data-v-06f5e281="" value="">배송시 요청사항을 선택해주세요</option>
                        <option data-v-06f5e281="" value="2">문 앞에 놓아주세요</option>
                        <option data-v-06f5e281="" value="1">경비(관리)실에 맡겨주세요</option>
                        <option data-v-06f5e281="" value="6">택배함에 넣어주세요</option>
                        <option data-v-06f5e281="" value="3">직접 받겠습니다</option>
                        <option data-v-06f5e281="" value="5">직접입력</option>
                    </select><span tabindex="0" id="ui-id-1-button" role="combobox" aria-expanded="false" aria-autocomplete="list" aria-owns="ui-id-1-menu" aria-haspopup="true"
                                   class="ui-selectmenu-button Slct_customized-2-button ui-selectmenu-button-closed ui-corner-all ui-button ui-widget"><span
                        class="ui-selectmenu-icon ui-icon ui-icon-triangle-1-s"></span><span class="ui-selectmenu-text">배송시 요청사항을 선택해주세요</span></span>
                    <div data-v-06f5e281="" id="select-box">
                        <div class="ui-selectmenu-menu Slct_customized-2-menu ui-front">
                            <ul aria-hidden="true" aria-labelledby="ui-id-1-button" id="ui-id-1-menu" role="listbox" tabindex="0" class="ui-menu ui-corner-bottom ui-widget ui-widget-content"></ul>
                        </div>
                    </div>
                    <input data-v-06f5e281="" type="text" id="delivery-memo" name="" placeholder="50자 이내로 작성해주세요" maxlength="50" class="w98per delivery-memo" style="display: none;">
                </dd>
            </dl>
            <dl style="width: 100%">
                <input type="button" class="btn_in_orderforn" style="" value="결제 하기">
            </dl>
        </div>
        <!---->
    </div>
    <!---->
    <!---->
    <div data-v-2c642cc6="" fragment="9ce731cb19" class="frame">
        <form class="last-check">
            <h2 data-v-2c642cc6="">최종 결제 금액</h2>
            <dl data-v-2c642cc6="" class="order_totalpay">
                <dt data-v-2c642cc6="">총 상품금액</dt>
                <dd data-v-2c642cc6=""> <%--<c:out value="${list.productPriceAll}">--%></dd>
                <dt data-v-2c642cc6="">총 배송비</dt>
                <dd data-v-2c642cc6="">0 원</dd> <%--배송비를 2500원으로 고정시켜 놓을지 전상품 무료배송 때릴지..?--%>
                <!---->
                <!---->
                <!---->
                <!---->
                <dt data-v-2c642cc6="" class="large">결제 예상 금액</dt>
                <dd data-v-2c642cc6="" class="red large"><%--<c:out value="${list.productPriceAll}">--%></dd> <%--배송비 있으면 +2500원 --%>
            </dl>
            <!---->

        </form>
    </div>
</div>
</div>
</div>
</div>

</div>
</body>

<%@include file="includes/footer.jsp" %>

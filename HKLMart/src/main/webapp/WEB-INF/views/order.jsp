<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page contentType="text/html; charset=UTF-8"%> 
<%@ page trimDirectiveWhitespaces="true"%>

 <%@include file="includes/header.jsp" %>
    
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="utf-8">
    <title>HKL 상품 주문 페이지입니다.</title>
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=3">

    <link rel="stylesheet" href="/resources/css/product-detail-all.css">
    <link rel="stylesheet" href="/resources/css/checkout.css">
    <link rel="stylesheet" href="/resources/css/checkout-order-product.css">
    <link rel="stylesheet" href="/resources/css/checkout-order-adress.css">
    <link rel="stylesheet" href="/resources/css/checkout-order-payment.css">

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
    
    
        <div data-v-7b122ae2="" fragment="5c8f7b94a1" id="container">
            <!--fragment#9ce731cb19#head-->
            <div data-v-2c642cc6="" fragment="9ce731cb19" class="pagetitle">
                <h1 data-v-2c642cc6="">주문하기</h1>
            </div>
            <div data-v-2c642cc6="" fragment="9ce731cb19" class="frame">
                <h2 data-v-2c642cc6="">주문상품 정보</h2>
                <!---->
                <div data-v-2c642cc6="" class="normal-seller-wrapper">
                    <div data-v-2c642cc6="" class="wrap-normal-shipping-title"><strong data-v-2c642cc6="" class="title">일반배송</strong></div>
                    <div data-v-2c642cc6="" class="cart-seller-list cart_list_full">
                        <div data-v-44e1d284="" data-v-2c642cc6="">
                            <div data-v-44e1d284="" class="order_item">
                                <dl data-v-44e1d284="">
                                    <dt data-v-44e1d284="">공구홀릭</dt>
                                    <dt data-v-44e1d284=""></dt>
                                    <dt data-v-44e1d284=""></dt>
                                    <dt data-v-44e1d284="">주문금액</dt>
                                </dl>
                                <dl data-v-6dcc2f72="" data-v-44e1d284="">
                                    <dd data-v-6dcc2f72=""><a data-v-6dcc2f72=""><img data-v-6dcc2f72="" src="https://image.brandi.me/cproduct/2020/11/03/22846694_1604364241_image1_S.jpg"></a></dd>
                                    <dd data-v-6dcc2f72=""><a data-v-6dcc2f72=""><span data-v-6dcc2f72="" class="itemname">소피아 뽀글이 슈즈</span></a> <span data-v-6dcc2f72="">화이트/235</span> <span data-v-6dcc2f72="">1개</span></dd>
                                    <dd data-v-6dcc2f72="">
                                        <!---->
                                    </dd>
                                    <dd data-v-6dcc2f72="">17,500원</dd>
                                </dl>
                            </div> <input data-v-44e1d284="" type="hidden" value="0">
                        </div>
                    </div>
                </div>
                <div data-v-2c642cc6="" class="price_total">총 주문금액 <span data-v-2c642cc6="">17,500원</span></div>

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
                    
                    <h2 data-v-06f5e281="">배송지 정보<span data-v-06f5e281="" class="checkout-inpt"><input data-v-06f5e281="" type="checkbox" name="" id="order_delivery_chk" class="checkbox-style"><label data-v-06f5e281="" for="order_delivery_chk">주문자 정보와 동일</label></span></h2>
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
                            <dd data-v-06f5e281=""><input data-v-06f5e281="" type="text" name="" readonly="readonly" class="w49per"> <input data-v-06f5e281="" type="button" value="우편번호 찾기" class="btn_in_orderforn"><br data-v-06f5e281="">
                                <div data-v-06f5e281="" id="daumPostCodeArea" style="display: none; border: 1px solid; width: 100% !important; height: auto; margin: 5px 0px; position: relative;"><img data-v-06f5e281="" src="//t1.daumcdn.net/localimg/localimages/07/postcode/320/close.png" id="btnFoldWrap" alt="접기 버튼" style="cursor: pointer; position: absolute; right: 0px; top: -1px; z-index: 1;"></div> <input data-v-06f5e281="" type="text" name="" id="address1" readonly="readonly" class="w49per order_addr"> <input data-v-06f5e281="" type="text" name="" id="address2" class="w49per order_addr">
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
                                </select><span tabindex="0" id="ui-id-1-button" role="combobox" aria-expanded="false" aria-autocomplete="list" aria-owns="ui-id-1-menu" aria-haspopup="true" class="ui-selectmenu-button Slct_customized-2-button ui-selectmenu-button-closed ui-corner-all ui-button ui-widget"><span class="ui-selectmenu-icon ui-icon ui-icon-triangle-1-s"></span><span class="ui-selectmenu-text">배송시 요청사항을 선택해주세요</span></span>
                                <div data-v-06f5e281="" id="select-box">
                                    <div class="ui-selectmenu-menu Slct_customized-2-menu ui-front">
                                        <ul aria-hidden="true" aria-labelledby="ui-id-1-button" id="ui-id-1-menu" role="listbox" tabindex="0" class="ui-menu ui-corner-bottom ui-widget ui-widget-content"></ul>
                                    </div>
                                </div> <input data-v-06f5e281="" type="text" id="delivery-memo" name="" placeholder="50자 이내로 작성해주세요" maxlength="50" class="w98per delivery-memo" style="display: none;">
                            </dd>
                        </dl>
                        <div>
                            <input type="button" class="btn_in_orderforn" style="" value="작성 완료">
                        </div>
                    </div>
                    <!---->
                </div>
                <!---->
                <!---->
                <form class="last-check">
                <h2 data-v-2c642cc6="">최종 결제 금액</h2>
                <dl data-v-2c642cc6="" class="order_totalpay">
                    <dt data-v-2c642cc6="">총 상품금액</dt>
                    <dd data-v-2c642cc6=""> 17,500 원</dd>
                    <dt data-v-2c642cc6="">총 배송비</dt>
                    <dd data-v-2c642cc6="">0 원</dd>
                    <!---->
                    <!---->
                    <!---->
                    <!---->
                    <dt data-v-2c642cc6="" class="large">결제 예상 금액</dt>
                    <dd data-v-2c642cc6="" class="red large">17,500 원</dd>
                </dl>
                <!---->
                <div data-v-76328540="" data-v-2c642cc6="">
                    <h2 data-v-76328540="">결제수단</h2>
                    <div data-v-76328540="" class="order_paymethod_wrap">
                        <div data-v-76328540="" class="order_paymethod">
                            <input data-v-76328540="" type="radio" name="paymethod" value="PAY_NAVER" id="pay2">
                            <label data-v-76328540="" for="pay2">
                                <img data-v-76328540="" src="">&nbsp;&nbsp;
                                <em data-v-76328540="" class="sub-txt">(네이버페이 1% 적립)</em></label>
                            <input data-v-76328540="" type="radio" name="paymethod" value="PAY_KAKAO" id="pay1">
                            <label data-v-76328540="" for="pay1">
                                <img data-v-76328540="" src="">
                                <span data-v-76328540="">카카오페이</span></label>
                            <input data-v-76328540="" type="radio" name="paymethod" value="PAY_TOSS" id="pay7">
                            <label data-v-76328540="" for="pay7">토스
                                <img data-v-76328540="" src="" class="toss"></label>
                            <input data-v-76328540="" type="radio" name="paymethod" value="PAY_CARD" id="pay3">
                            <label data-v-76328540="" for="pay3">신용 / 체크카드</label>
                            <input data-v-76328540="" type="radio" name="paymethod" value="PAY_BANK" id="pay5">
                            <label data-v-76328540="" for="pay5" class="">무통장 입금</label>
                            <input data-v-76328540="" type="radio" name="paymethod" value="PAY_BANK_ES" id="pay6">
                            <label data-v-76328540="" for="pay6" class="">무통장 입금(에스크로)</label>
                            <input data-v-76328540="" type="radio" name="paymethod" value="PAY_PHONE" id="pay4">
                            <label data-v-76328540="" for="pay4">휴대폰 결제</label>
                        </div>
                        <!---->
                        <!---->
                        <div data-v-76328540="" class="escrow-info-box" style="display: none;">
                            <p data-v-76328540="">무통장입금(에스크로) 결제를 통한 여러 상품 구매 시, </p>
                            <p data-v-76328540="">특정 상품의 부분취소가 불가합니다.</p>
                            <p data-v-76328540="">(부분취소를 원할 시, 결제한 전체 상품 모두 취소 후 재 구매 가능) </p>
                        </div>
                    </div>
                </div>
                <div data-v-43a28004="" data-v-2c642cc6="">
                    <h2 data-v-43a28004="">정보수집동의</h2>
                    <!--fragment#55b3af2225#head-->
                    <div data-v-14b173c0="" fragment="55b3af2225" class="order_paymethod">
                        <h4 data-v-14b173c0="" class="left"><input data-v-14b173c0="" type="checkbox" id="agree_1"><label data-v-14b173c0="" for="agree_1">HKL MART 약관 동의 <span data-v-14b173c0="">(필수)</span></label><a data-v-14b173c0="" href="/access-term?type=popup" target="_blank" class="agree_more">더보기 &gt;</a></h4>
                        <div data-v-5c464106="" data-v-14b173c0="" class="term">
                            <pre data-v-5c464106="">서비스 이용약관
                            </pre>
                        </form>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </head>
<%@include file="includes/footer.jsp" %>
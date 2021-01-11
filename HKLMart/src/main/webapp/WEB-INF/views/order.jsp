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
    <title>HKL 상품 주문 페이지입니다.</title>
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
    <noscript>
        <img height=1 width=1 style=display:none src="https://www.facebook.com/tr?id=1161187400597904&ev=Page_view&noscript=1">
    </noscript>
    <script type="text/javascript" charset="utf-8"></script>
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script type="text/javascript" charset="UTF-8" src="//t1.daumcdn.net/adfit/static/kp.js"></script>
    <script type="text/javascript" src="https://wcs.naver.net/wcslog.js"></script>
    <script type="text/javascript"></script>
    <script async="" src="https://www.googletagmanager.com/gtag/js?id=UA-59629214-19"></script>
    <noscript>
        <img height=1 width=1 style=display:none src="https://www.facebook.com/tr?id=1161187400597904&ev=Page_view&noscript=1">
    </noscript>
    <script type="text/javascript" charset="utf-8"></script>
    <style>
        #ui-id-2 {
            width: 80%;
            height: 45px;
            color: #1e1e1e;
            font-size: 16px;
            line-height: 50px;
            font-family: "Spoqa Han Sans", Sans-serif;
            vertical-align: middle;
        }
    </style>
</head>
<body>
<div data-v-7b122ae2="" fragment="5c8f7b94a1" id="container">
    <!--fragment#9ce731cb19#head-->
    <div class="frame">
        <h2>주문상품 정보</h2>
        <!---->
        <div class="normal-seller-wrapper">
            <div class="wrap-normal-shipping-title"><strong class="title">일반배송</strong></div>
            <div class="cart-seller-list cart_list_full">
                <div>
                    <div class="order_item">
                        <dl>
                            <dt>${productInfo.productBrand}</dt>
                            <dt></dt>
                            <dt></dt>
                            <dt>주문금액</dt>
                        </dl>
                        <dl data-v-6dcc2f72="">
                            <dd data-v-6dcc2f72="">
                                <a data-v-6dcc2f72="">
                                    <img data-v-6dcc2f72="" src="${productInfo.productImgPath}${productInfo.productThumbnail}">
                                </a>
                            </dd>
                            <dd data-v-6dcc2f72="">
                                <a data-v-6dcc2f72="">
                                    <span data-v-6dcc2f72="" class="itemname">${productInfo.productName}</span>
                                </a>
                                <span data-v-6dcc2f72="">Size ${param.Size}</span>
                                <span data-v-6dcc2f72="">1개</span>
                            </dd>
                            <dd data-v-6dcc2f72="">
                                <!---->
                            </dd>
                            <dd data-v-6dcc2f72=""><fmt:formatNumber value="${productInfo.productPrice}" pattern="#,###" /> 원</dd>
                        </dl>
                    </div>
                    <input type="hidden" value="0">
                </div>
            </div>
        </div>
        <div class="price_total">총 주문금액
            <span><fmt:formatNumber value="${productInfo.productPrice}" pattern="#,###" /> 원</span>
        </div>
        <fmt:formatNumber var="TelFmt" value="${user.memberTel}" pattern="###,##,####" minIntegerDigits="11" />
        <div>
            <h2 class="orderer-info-title">주문자 정보</h2>
            <div class="order_delivery">
                <dl>
                    <dt>이름</dt>
                    <dd>
                        <input type="text" name="" id="orderer_name" placeholder="이름" maxlength="15" class="w100per" value="${user.memberName}" readonly>
                    </dd>
                </dl>
                <dl>
                    <dt>휴대폰</dt>
                    <dd>
                        <input type="tel" name="" id="shipping_telephone" maxlength="11" class="w80px" readonly value="<c:out value="${fn:replace(TelFmt, ',', '-')}" />" style="text-align: left">
                        <input type="hidden" id="memberTelId" value="${user.memberTel}">
                    </dd>
                </dl>
                <dl>
                    <dt>이메일</dt>
                    <dd><input type="text" name="" id="orderer_email1" value="${user.memberEmail}" readonly></dd>
                </dl>
                <dl>
                    <dt>배송주소</dt>
                    <dd>
                        <input type="text" name="memberAddressPostcode" readonly="readonly" class="w49per" id="memberPostcode" value="${memberInfo.memberAddressPostcode}" style="width: 50%;
                        background-color: #E1E1E1"> <br> <input type="text" name="memberAddress" id="memberAddress" readonly="readonly" value="${memberInfo.memberAddress}" class="w49per order_addr" style="background-color: #E1E1E1">
                        <input type="text" name="memberAddressMember" id="memberUserAddress" readonly="readonly" value="${memberInfo.memberAddressMember}" class="w49per order_addr" style="background-color: #E1E1E1">
                    </dd>
                </dl>
            </div>
        </div>
        <form method="post" name="orderForm" id="orderForm" action="/order/pay">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> <input type="hidden" id="orderFnHidden" name="" value="0" /> <input type="hidden" value="0" id="orderFormHidden">
            <input type="hidden" id="productCodeHidden" name="orderProductCode" value="${productInfo.productCode}" /> <input type="hidden" id="memberIdHidden" name="orderMemberId" value="${memberInfo.memberId}" />
            <input type="hidden" name="orderPayment" value="${productInfo.productPrice}"> <input type="hidden" name="stockSize" id="sizeHidden" value="stock_${param.Size}" />
            <input type="hidden" name="stockSizeColumn" value="order_list_stock_${param.Size}" /> <input type="hidden" id="sizeStockHidden" name="productSize" value="${param.Size}" />
            <h2>배송지 정보
                <span class="checkout-inpt">
                <input type="checkbox" name="" id="checkBoxId" class="checkbox-style"><label for="checkBoxId">&nbsp;주문자 정보와 동일</label></span>
            </h2>
            <div class="order_delivery">
                <dl>
                    <dt>수령인</dt>
                    <dd><input type="text" name="orderName" id="orderNameId" placeholder="이름" class="w100per"></dd>
                </dl>
                <dl>
                    <dt>휴대폰</dt>
                    <dd>
                        <input type="tel" id="InOrderTelId" placeholder="특수문자 제외" maxlength="11" class="w80px" style="text-align: left"> <input type="hidden" id="orderTelId" name="orderTel" value="${user.memberTel}">
                    </dd>
                </dl>
                <dl>
                    <dt>배송주소</dt>
                    <dd>
                        <input type="text" name="orderAddressPostcode" readonly="readonly" class="w49per" id="sample4_postcode" style="width: 50%"> <input type="button" value="주소 찾기" class="btn_in_orderforn" onclick="execDaumPostcode()"><br>
                        <div id="daumPostCodeArea" style="display: none; border: 1px solid; width: 100% !important; height: auto; margin: 5px 0px; position: relative;">
                            <img src="//t1.daumcdn.net/localimg/localimages/07/postcode/320/close.png" id="btnFoldWrap" alt="접기 버튼" style="cursor: pointer; position: absolute; right: 0px; top: -1px; z-index: 1;">
                        </div>
                        <input type="text" name="orderAddress" id="sample4_roadAddress" readonly="readonly" class="w49per order_addr"> <input type="text" name="orderAddressMember" id="userAddress" placeholder="상세 주소 입력" class="w49per order_addr">
                        <div class="delivery_add_info_text">* 제주도, 도서 산간 지역 등은 배송이 하루 이상 추가 소요될 수 있습니다</div>
                    </dd>
                </dl>
                <dl>
                    <dt>배송메모</dt>
                    <dd>
                        <select id="ui-id-2" name="orderMemo">
                            <option>배송시 요청사항을 선택해주세요</option>
                            <option>문 앞에 놓아주세요</option>
                            <option>경비(관리)실에 맡겨주세요</option>
                            <option>택배함에 넣어주세요</option>
                            <option>직접 받겠습니다</option>
                        </select>
                    </dd>
                </dl>
                <dl style="width: 100%">
                    <input type="button" class="btn_in_orderforn" style="" onclick="updateAddressFn()" value="이 주소로 업데이트">
                </dl>
            </div>
        </form>
        <!---->
    </div>
    <!---->
    <!---->
    <div class="frame">
        <h2>최종 결제 금액</h2>
        <dl class="order_totalpay">
            <dt>총 상품금액</dt>
            <dd><fmt:formatNumber value="${productInfo.productPrice}" pattern="#,###" /> 원</dd>
            <dt>총 배송비</dt>
            <dd>0 원</dd>
            <!---->
            <!---->
            <!---->
            <!---->
            <dt class="large">결제 예상 금액</dt>
            <dd class="red large"><fmt:formatNumber value="${productInfo.productPrice}" pattern="#,###" /> 원</dd>
        </dl>
        <!---->
        <div>
            <h2>결제수단</h2>
            <div class="order_paymethod_wrap">
                <div class="order_paymethod">
                    <input type="radio" name="paymethod" value="PAY_NAVER" id="pay2">
                    <label for="pay2">
                        <img src="">&nbsp;&nbsp;<em class="sub-txt">(네이버페이 1% 적립)</em></label>
                    <input type="radio" name="paymethod" value="PAY_KAKAO" id="pay1">
                    <label for="pay1">
                        <img src="">
                        <span>카카오페이</span>
                    </label>
                    <input type="radio" name="paymethod" value="PAY_TOSS" id="pay7">
                    <label for="pay7">토스
                        <img src="" class="toss">
                    </label>
                    <input type="radio" name="paymethod" value="PAY_CARD" id="pay3">
                    <label for="pay3">신용 / 체크카드</label>
                    <input type="radio" name="paymethod" value="PAY_BANK" id="pay5">
                    <label for="pay5" class="">무통장 입금</label>
                    <input type="radio" name="paymethod" value="PAY_BANK_ES" id="pay6">
                    <label for="pay6" class="">무통장 입금(에스크로)</label>
                    <input type="radio" name="paymethod" value="PAY_PHONE" id="pay4">
                    <label for="pay4">휴대폰 결제</label>
                </div>
                <div class="escrow-info-box" style="display: none;">
                    <p>무통장입금(에스크로) 결제를 통한 여러 상품 구매 시, </p>
                    <p>특정 상품의 부분취소가 불가합니다.</p>
                    <p>(부분취소를 원할 시, 결제한 전체 상품 모두 취소 후 재 구매 가능) </p>
                </div>
            </div>
        </div>
        <div>
            <h2>정보수집동의</h2>
            <div class="order_paymethod">
                <h4 class="text-left"><input type="checkbox" id="agree_1">
                    <label for="agree_1">
                        &nbsp;&nbsp; HKL MART 약관 동의
                        <span>(필수)</span>
                    </label>
                    <a onclick="popup()" class="agree_more" style="cursor: pointer">더보기 &gt;</a>
                </h4>
            </div>
        </div>
        <input type="button" class="btn_in_orderforn" style="float: right; width: 80px; height: 60px; font-size: 17px" onclick="doPayFn()" value="결제">
    </div>
</div>
</div></div></div></div>
</body>
<script>
    $(document).ready(function () {
        $("#checkBoxId").change(function () {

            var orderFnHidden = $("#orderFnHidden").val();

            var orderer_name = $("#orderer_name").val();
            var memberTelId = $("#memberTelId").val();
            var memberPostcode = $("#memberPostcode").val();
            var memberAddress = $("#memberAddress").val();
            var memberUserAddress = $("#memberUserAddress").val();


            if ($("#checkBoxId").is(":checked")) {

                $("#orderNameId").val(orderer_name);

                $("#InOrderTelId").val(memberTelId);

                $("#InOrderTelId").val(memberTelId);

                $("#sample4_postcode").val(memberPostcode);
                $("#sample4_roadAddress").val(memberAddress);
                $("#userAddress").val(memberUserAddress);

                $("#orderNameId").attr("readonly", true);
                $("#InOrderTelId").attr("readonly", true);
                $("#userAddress").attr("readonly", true);
            } else {

                $("#orderNameId").val(null);

                $("#InOrderTelId").val(null);

                $("#InOrderTelId").val(null);

                $("#sample4_postcode").val(null);
                $("#sample4_roadAddress").val(null);
                $("#userAddress").val(null);

                $("#orderNameId").attr("readonly", false);
                $("#InOrderTelId").attr("readonly", false);
                $("#userAddress").attr("readonly", false);
            }
        });
    });

    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function (data) {
                var roadAddr = data.roadAddress;
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
            }
        }).open();
    }

    function updateAddressFn() {

        var memberAddressPostcodeId = $("#sample4_postcode").val();
        var memberAddressId = $("#sample4_roadAddress").val();
        var memberAddressMemberId = $("#userAddress").val();

        let sendData = {memberAddressPostcode: memberAddressPostcodeId, memberAddress: memberAddressId, memberAddressMember: memberAddressMemberId};

        if ((memberAddressPostcodeId == '' && memberAddressId == '' && memberAddressMemberId == '')) {
            alert("주소를 입력하여 주세요")
        } else {
            $.ajax({
                url        : "/member/updateAddress",
                type       : "GET",
                dataType   : "json",
                contentType: "application/json; charset=UTF-8",
                data       : sendData,
                success    : function (data) {
                    if (data.message == 1) {
                        alert("주소가 변경되었습니다")

                        $("#memberPostcode").val(memberAddressPostcodeId);
                        $("#memberAddress").val(memberAddressId);
                        $("#memberUserAddress").val(memberAddressMemberId);


                    } else {
                        alert("오류입니다")
                    }

                },
                error      : function () {
                    alert("Error. 관리자에게 문의하십시오.");
                },
            });


        }
    }

    function doPayFn() {
        let productSizeId = $("#sizeStockHidden").val();
        let stock = $("#sizeHidden").val();
        let productCodeId = $("#productCodeHidden").val();

        let sendData = {stockSize: stock, productCode: productCodeId};

        let subForm = document.orderForm;

        if ($('input:radio[name=paymethod]:checked').length == 0) {
            alert("결제수단을 선택하여 주십시오");
        } else if (document.getElementById('agree_1').checked == false) {
            alert("약관에 동의하여 주십시오");
        } else if (productSizeId == '') {
            alert("사이즈 선택이 안되었습니다")
        } else {


            $.ajax({
                url        : "/order/check-stock",
                type       : "GET",
                dataType   : "json",
                contentType: "application/json; charset=UTF-8",
                data       : sendData,
                success    : function (data) {
                    if (data.cnt > 0) {

                        subForm.submit();


                    } else {
                        alert("품절되었습니다")
                    }

                },
                error      : function () {
                    alert("Error. 관리자에게 문의하십시오.");
                },
            });
        }
    }
</script>
<%@include file="includes/footer.jsp" %>
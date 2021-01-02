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
    <noscript><img height=1 width=1 style=display:none src="https://www.facebook.com/tr?id=1161187400597904&ev=Page_view&noscript=1"></noscript>
    <script type="text/javascript" charset="utf-8"></script>
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

    <script type="text/javascript" charset="UTF-8" src="//t1.daumcdn.net/adfit/static/kp.js"></script>
    <script type="text/javascript" src="https://wcs.naver.net/wcslog.js"></script>
    <script type="text/javascript"></script>
    <script async="" src="https://www.googletagmanager.com/gtag/js?id=UA-59629214-19"></script>
    <noscript><img height=1 width=1 style=display:none src="https://www.facebook.com/tr?id=1161187400597904&ev=Page_view&noscript=1"></noscript>
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
    <div data-v-2c642cc6="" fragment="9ce731cb19" class="frame">
        <h2 data-v-2c642cc6="">주문상품 정보</h2>
        <!---->
        <div data-v-2c642cc6="" class="normal-seller-wrapper">
            <div data-v-2c642cc6="" class="wrap-normal-shipping-title"><strong data-v-2c642cc6="" class="title">일반배송</strong></div>
            <div data-v-2c642cc6="" class="cart-seller-list cart_list_full">
                <div data-v-44e1d284="" data-v-2c642cc6="">
                    <div data-v-44e1d284="" class="order_item">
                        <dl data-v-44e1d284="">
                            <dt data-v-44e1d284="">${prductInfo.productBrand}</dt>
                            <dt data-v-44e1d284=""></dt>
                            <dt data-v-44e1d284=""></dt>
                            <dt data-v-44e1d284="">주문금액</dt>
                        </dl>
                        <dl data-v-6dcc2f72="" data-v-44e1d284="">
                            <dd data-v-6dcc2f72=""><a data-v-6dcc2f72=""><img data-v-6dcc2f72="" src="${prductInfo.productImgPath}${prductInfo.productThumbnail}"></a></dd>
                            <dd data-v-6dcc2f72=""><a data-v-6dcc2f72=""><span data-v-6dcc2f72="" class="itemname">${prductInfo.productName}</span></a> <span data-v-6dcc2f72="">Size
                                ${param.Size}</span> <span
                                    data-v-6dcc2f72="">1개</span></dd>
                            <dd data-v-6dcc2f72="">
                                <!---->
                            </dd>
                            <dd data-v-6dcc2f72=""><fmt:formatNumber
                                    value="${prductInfo.productPrice}" pattern="#,###"/> 원</dd>
                        </dl>
                    </div>
                    <input data-v-44e1d284="" type="hidden" value="0">
                </div>
            </div>
        </div>
        <div data-v-2c642cc6="" class="price_total">총 주문금액 <span data-v-2c642cc6=""><fmt:formatNumber
                value="${prductInfo.productPrice}" pattern="#,###"/> 원</span></div>

        <fmt:formatNumber var="TelFmt" value="${memberInfo.memberTel}" pattern="###,##,####" minIntegerDigits="11"/>
        <div data-v-06f5e281="" data-v-2c642cc6="">
            <h2 data-v-06f5e281="" class="orderer-info-title">주문자 정보</h2>
            <div data-v-06f5e281="" class="order_delivery">
                <dl data-v-06f5e281="">
                    <dt data-v-06f5e281="">이름</dt>
                    <dd data-v-06f5e281=""><input data-v-06f5e281="" type="text" name="" id="orderer_name" placeholder="이름" maxlength="15" class="w100per" value="${memberInfo.memberName}" readonly></dd>
                </dl>
                <dl data-v-06f5e281="">
                    <dt data-v-06f5e281="">휴대폰</dt>
                    <dd data-v-06f5e281=""><input data-v-06f5e281="" type="tel" name="" id="shipping_telephone" maxlength="11" class="w80px"
                                                  readonly value="<c:out value="${fn:replace(TelFmt, ',', '-')}" />">
                        <input type="hidden" id="memberTelId" value="${memberInfo.memberTel}">
                        <!---->
                    </dd>
                </dl>
                <dl data-v-06f5e281="">
                    <dt data-v-06f5e281="">이메일</dt>
                    <dd data-v-06f5e281=""><input data-v-06f5e281="" type="text" name="" id="orderer_email1" value="${memberInfo.memberEmail}" readonly></dd>
                </dl>
                <dl data-v-06f5e281="">
                    <dt data-v-06f5e281="">배송주소</dt>
                    <dd data-v-06f5e281="">
                        <input data-v-06f5e281="" type="text" name="" readonly="readonly" class="w49per" id="memberPostcode"> <br data-v-06f5e281="">

                        <div data-v-06f5e281="" id="" style="display: none; border: 1px solid; width: 100% !important; height: auto; margin: 5px 0px; position: relative;" ><img
                                data-v-06f5e281="" src="//t1.daumcdn.net/localimg/localimages/07/postcode/320/close.png" alt="접기 버튼"
                                style="cursor: pointer; position: absolute; right: 0px; top: -1px; z-index: 1;"></div>


                        <input data-v-06f5e281="" type="text" name="" id="memberAddress" readonly="readonly"
                               class="w49per order_addr" >
                        <input data-v-06f5e281="" type="text" name="userAddress" id="memberUserAddress" readonly="readonly"
                               class="w49per order_addr">

                    </dd>
                </dl>

            </div>
        </div>
        <form method="post" name="orderForm" id="orderForm">
        <input type="hidden" id="orderFnHidden"  name="" value="0" />
        <input type="hidden" value="0" id="orderFormHidden" >

        <input type="hidden" id="productCodeHidden" name="productCode"  value="${prductInfo.productCode}" />
        <input type="hidden" id="memberIdHidden" name="memberId" value="${memberInfo.memberId}" />
        <input type="hidden" id="sizeHidden" name="stock_${param.Size}" value="1" />
        <input type="hidden" id="sizeStockHidden" name="productSize" value="${param.Size}" />

        <h2 data-v-06f5e281="">배송지 정보<span data-v-06f5e281="" class="checkout-inpt"><input data-v-06f5e281="" type="checkbox" name="" id="checkBoxId" class="checkbox-style"><label
                data-v-06f5e281="" for="checkBoxId">주문자 정보와 동일</label></span></h2> <%--여길 체크 하면 위 리스트 정보 고대로 내려오게..--%>
        <div data-v-06f5e281="" class="order_delivery">
            <dl data-v-06f5e281="">
                <dt data-v-06f5e281="">수령인</dt>
                <dd data-v-06f5e281=""><input data-v-06f5e281="" type="text" name="orderName" id="orderNameId" placeholder="이름" class="w100per"></dd>
            </dl>
            <dl data-v-06f5e281="">
                <dt data-v-06f5e281="">휴대폰</dt>
                <dd data-v-06f5e281=""><input data-v-06f5e281="" type="tel" name="orderTel" id="InOrderTelId" placeholder="특수문자를 제외하고 입력하여주세요 ex) 01012345678" maxlength="11" class="w80px"></dd>
                <input type="hidden" id="orderTelId" name="orderTel" value="${memberInfo.memberTel}">
            </dl>
            <dl data-v-06f5e281="">
                <dt data-v-06f5e281="">배송주소</dt>
                <dd data-v-06f5e281="">
                    <input data-v-06f5e281="" type="text" name="" readonly="readonly" class="w49per" id="sample4_postcode"> <input data-v-06f5e281="" type="button" value="주소 찾기"
                                                                                                                                   class="btn_in_orderforn"onclick="execDaumPostcode()"><br data-v-06f5e281="">

                    <div data-v-06f5e281="" id="daumPostCodeArea" style="display: none; border: 1px solid; width: 100% !important; height: auto; margin: 5px 0px; position: relative;" ><img
                            data-v-06f5e281="" src="//t1.daumcdn.net/localimg/localimages/07/postcode/320/close.png" id="btnFoldWrap" alt="접기 버튼"
                            style="cursor: pointer; position: absolute; right: 0px; top: -1px; z-index: 1;"></div>


                    <input data-v-06f5e281="" type="text" name="" id="sample4_roadAddress" readonly="readonly"
                           class="w49per order_addr" >
                    <input data-v-06f5e281="" type="text" name="userAddress" id="userAddress" placeholder="상세 주소 입력"
                           class="w49per order_addr">
                    <input type="hidden" id="orderAddress" name="orderAddress" value="0">
                    <div data-v-06f5e281="" class="delivery_add_info_text">* 제주도, 도서 산간 지역 등은 배송이 하루 이상 추가 소요될 수 있습니다</div>
                </dd>
            </dl>
            <dl data-v-06f5e281="">
                <dt data-v-06f5e281="">배송메모</dt>
                <dd data-v-06f5e281="">
                    <select id="ui-id-2" name="orderMemo">
                        <option data-v-06f5e281="" value="">배송시 요청사항을 선택해주세요</option>
                        <option data-v-06f5e281="0" value="2">문 앞에 놓아주세요</option>
                        <option data-v-06f5e281="0" value="1">경비(관리)실에 맡겨주세요</option>
                        <option data-v-06f5e281="0" value="6">택배함에 넣어주세요</option>
                        <option data-v-06f5e281="0" value="3">직접 받겠습니다</option>
                    </select>
                </dd>
            </dl>
            <dl style="width: 100%">
                <input type="button" class="btn_in_orderforn" style="" value="주소 업데이트" >
            </dl>
        </div>

        <!---->
    </div>
    <!---->
    <!---->
    <div data-v-2c642cc6="" fragment="9ce731cb19" class="frame">

            <h2 data-v-2c642cc6="">최종 결제 금액</h2>
            <dl data-v-2c642cc6="" class="order_totalpay">
                <dt data-v-2c642cc6="">총 상품금액</dt>
                <dd data-v-2c642cc6=""><fmt:formatNumber
                        value="${prductInfo.productPrice}" pattern="#,###"/> 원</dd>
                <dt data-v-2c642cc6="">총 배송비</dt>
                <dd data-v-2c642cc6="">0 원</dd>
                <!---->
                <!---->
                <!---->
                <!---->
                <dt data-v-2c642cc6="" class="large">결제 예상 금액</dt>
                <dd data-v-2c642cc6="" class="red large"><fmt:formatNumber
                        value="${prductInfo.productPrice}" pattern="#,###"/> 원</dd>
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
                    <h4 data-v-14b173c0="" class="left"><input data-v-14b173c0="" type="checkbox" id="agree_1"><label data-v-14b173c0="" for="agree_1">HKL MART 약관 동의 <span
                            data-v-14b173c0="">(필수)</span></label><a data-v-14b173c0="" href="/access-term?type=popup" target="_blank" class="agree_more">더보기 &gt;</a></h4>
                    <div data-v-5c464106="" data-v-14b173c0="" class="term">
                            <pre data-v-5c464106="">서비스 이용약관
                            </pre>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
</div>
</div>
</div>

</div>
</body>

<script>

    $(document).ready(function(){
        $("#checkBoxId").change(function(){

            var orderFnHidden = $("#orderFnHidden").val();

            var orderer_name = $("#orderer_name").val();
            var memberTelId = $("#memberTelId").val();

            var orderNameId = $("#orderNameId").val();
            var InOrderTelId = $("#InOrderTelId").val();
            var OrderTelIdHidden = $("#InOrderTelId").val();

            if($("#checkBoxId").is(":checked")){

                $("#orderNameId").val(orderer_name);

                $("#InOrderTelId").val(memberTelId);

                $("#InOrderTelId").val(memberTelId);

                $("#orderNameId").attr("readonly",true);
                $("#InOrderTelId").attr("readonly",true);
            }else{

                $("#orderNameId").val(null);

                $("#InOrderTelId").val(null);

                $("#InOrderTelId").val(null);

                $("#orderNameId").attr("readonly",false);
                $("#InOrderTelId").attr("readonly",false);
            }
        });
    });

    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;

                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }


</script>

<%@include file="includes/footer.jsp" %>
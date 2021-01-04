<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>

<%@include file="includes/header.jsp" %>

<title>HKL :: 장바구니</title>

<style>
    #ui-id-2 {
        width: 80%;
        height: 45px;
        color: #1e1e1e;
        font-size: 16px;
        line-height: 50px;
        vertical-align: middle;
    }
</style>

<div id="container">
    <div class="pagetitle">
        <h1>장바구니</h1>
    </div>
    <div class="frame">
        <h2>주문상품 정보</h2>
        <div class="normal-seller-wrapper">
            <div class="wrap-normal-shipping-title">
                <strong class="title">일반배송</strong>
            </div>
            <div class="cart-seller-list cart_list_full">
                <div>
                    <div class="order_item">
                        <dl data-v-6dcc2f72=""><%--<c:out value="${list.}">--%>
                            <dt>
                                <input type="checkbox" id="checkAll" name="checkAll" checked>
                                <label for="checkAll"></label>
                            </dt>
                            <dt><p style="text-align: left; margin-bottom: 0px;">전체선택</p></dt>
                            <dt></dt>
                            <dt>주문금액</dt>
                        </dl>

                        <c:forEach items="${orderBasketList}" var="list" varStatus="status">
                            <%! int gl_var = 0; %>
                            <% gl_var++; %>
                        <dl class="order_item" data-v-6dcc2f72="">
                            <dd data-v-6dcc2f72="">
                                <input type="checkbox" name="items" id="checkAItem<%=gl_var%>" value="">
                                <label for="checkAItem<c:out value="<%=gl_var%>"/>"></label>
                            </dd>
                            <dd data-v-6dcc2f72="">
                                <a data-v-6dcc2f72="">
                                    <img data-v-6dcc2f72="" src="<c:out value="${list.productImgpath}${list.productThumbnail}"/>"/>
                                </a>
                            </dd>
                            <dd data-v-6dcc2f72=""><a>
                                <span data-v-6dcc2f72="" class="itemname"><c:out value="${list.productName}"/></span></a>
                                <span data-v-6dcc2f72="">고른옵션(사이즈)<%--<c:out value="${고른옵션(사이즈)}">--%></span>
                                <span data-v-6dcc2f72="">고른옵션(상품갯수)<%--<c:out value="${고른옵션(상품갯수)}">--%></span></dd>
                            <dd data-v-6dcc2f72=""><%--<c:out value="${productPriceAll}">--%>원</dd>
                        </dl>
                        </c:forEach>
                    </div>

                    <input type="hidden" value="0">
                </div>
            </div>
        </div>
        <div class="price_total">총 주문금액 <span><%--<c:out value="${list.productPriceAll}">--%></span></div>

        <fmt:formatNumber var="TelFmt" value="${memberInfo.memberTel}" pattern="###,##,####" minIntegerDigits="11"/>
        <div>
            <h2 class="orderer-info-title">주문자 정보</h2>
            <div class="order_delivery">
                <dl>
                    <dt>이름</dt>
                    <dd>
                        <input type="text" name="" id="orderer_name" placeholder="이름" maxlength="15" class="w100per" value="${memberInfo.memberName}" readonly>
                    </dd>
                </dl>
                <dl>
                    <dt>휴대폰</dt>
                    <dd>
                        <input type="tel" name="" id="shipping_telephone" maxlength="11" class="w80px" readonly value="<c:out value="${fn:replace(TelFmt, ',', '-')}" />" style="text-align: left">
                        <input type="hidden" id="memberTelId" value="${memberInfo.memberTel}">
                    </dd>
                </dl>
                <dl>
                    <dt>이메일</dt>
                    <dd><input type="text" name="" id="orderer_email1" value="${memberInfo.memberEmail}" readonly></dd>
                </dl>
                <dl>
                    <dt>배송주소</dt>
                    <dd>
                        <input type="text" name="memberAddressPostcode" readonly="readonly" class="w49per" id="memberPostcode" value="${memberInfo.memberAddressPostcode}" style="width: 50%;
                        background-color: #E1E1E1">
                        <br>
                        <input type="text" name="memberAddress" id="memberAddress" readonly="readonly" value="${memberInfo.memberAddress}"
                               class="w49per order_addr" style="background-color: #E1E1E1">
                        <input type="text" name="memberAddressMember" id="memberUserAddress" readonly="readonly" value="${memberInfo.memberAddressMember}"
                               class="w49per order_addr" style="background-color: #E1E1E1">

                    </dd>
                </dl>
            </div>
        </div>
        <form method="post" name="orderForm" id="orderForm">
            <input type="hidden" id="orderFnHidden" name="" value="0"/>
            <input type="hidden" value="0" id="orderFormHidden">
<%--            <input type="hidden" id="productCodeHidden" name="productCode" value="${prductInfo.productCode}"/>--%>
            <input type="hidden" id="memberIdHidden" name="memberId" value="${memberInfo.memberId}"/>
            <input type="hidden" id="sizeHidden" name="stock_${param.Size}" value="1"/>
            <input type="hidden" id="sizeStockHidden" name="productSize" value="${param.Size}"/>

            <h2>배송지 정보<span class="checkout-inpt">
                <input type="checkbox" name="" id="checkBoxId" class="checkbox-style"><label for="checkBoxId">&nbsp;주문자 정보와 동일</label></span></h2>
            <div class="order_delivery">
                <dl>
                    <dt>수령인</dt>
                    <dd><input type="text" name="orderName" id="orderNameId" placeholder="이름" class="w100per"></dd>
                </dl>
                <dl>
                    <dt>휴대폰</dt>
                    <dd>
                        <input type="tel" name="orderTel" id="InOrderTelId" placeholder="특수문자 제외" maxlength="11" class="w80px" style="text-align: left">
                        <input type="hidden" id="orderTelId" name="orderTel" value="${user.memberTel}">
                    </dd>
                </dl>
                <dl>
                    <dt>배송주소</dt>
                    <dd>
                        <input type="text" name="orderAddressPostcode" readonly="readonly" class="w49per" id="sample4_postcode" style="width: 50%">
                        <input type="button" value="주소 찾기" class="btn_in_orderforn" onclick="execDaumPostcode()"><br>
                        <div id="daumPostCodeArea" style="display: none; border: 1px solid; width: 100% !important; height: auto; margin: 5px 0px; position: relative;">
                            <img src="//t1.daumcdn.net/localimg/localimages/07/postcode/320/close.png" id="btnFoldWrap" alt="접기 버튼"
                                 style="cursor: pointer; position: absolute; right: 0px; top: -1px; z-index: 1;">
                        </div>
                        <input type="text" name="orderAddress" id="sample4_roadAddress" readonly="readonly" class="w49per order_addr">
                        <input type="text" name="orderAddressMember" id="userAddress" placeholder="상세 주소 입력" class="w49per order_addr">
                        <input type="hidden" name="orderAddress" id="orderAddress" value="0">
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
    </div>
    <div class="frame">

        <h2>최종 결제 금액</h2>
        <dl class="order_totalpay">
            <dt>총 상품금액</dt>
            <dd><fmt:formatNumber value="${prductInfo.productPrice}" pattern="#,###"/> 원</dd>
            <dt>총 배송비</dt>
            <dd>2,000 원</dd>
            <dt class="large">결제 예상 금액</dt>
            <dd class="red large"><fmt:formatNumber value="${prductInfo.productPrice}" pattern="#,###"/> 원
            </dd>
        </dl>
        <div>
            <h2>결제수단</h2>
            <div class="order_paymethod_wrap">
                <div class="order_paymethod">
                    <input type="radio" name="paymethod" value="PAY_NAVER" id="pay2">
                    <label for="pay2"><img src="">&nbsp;&nbsp;<em class="sub-txt">(네이버페이 1% 적립)</em></label>
                    <input type="radio" name="paymethod" value="PAY_KAKAO" id="pay1">
                    <label for="pay1"><img src=""><span>카카오페이</span></label>
                    <input type="radio" name="paymethod" value="PAY_TOSS" id="pay7">
                    <label for="pay7">토스<img src="" class="toss"></label>
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
                        &nbsp;&nbsp;
                        HKL MART 약관 동의
                        <span>(필수)</span>
                    </label>
                    <a onclick="popup()" class="agree_more">더보기 &gt;</a>
                </h4>
            </div>
        </div>
    </div>
</div>

<br><br>
<hr style="border: solid 1px #ffb6b6;">

<script>
    let getS = document.getElementById("ui-id-2");
    let sVAl = getS.options[getS.selectedIndex].value;

    function memoShow(sVal) {
        if (sVAl == "5") {
            $("#delivery-memo").css("display", "visible");
        } else {
            $("#delivery-memo").css("display", "none");
        }
    }

    var $checkAll = $('#checkAll');
    $checkAll.change(function () {
        var $this = $(this);
        var checked = $this.prop('checked');
        $('input[name="items"]').prop('checked', checked);
    });
    var boxes = $('input[name="items"]');
    boxes.change(function () {
        var boxLength = boxes.length;
        var checkedLength = $('input[name="items"]:checked').length;
        var selectAll = (boxLength == checkedLength);
        $checkAll.prop('checked', selectAll);
    });
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

    function popup() {
        let top = window.screen.height;
        let left = window.screen.width;
        let win = window.open("/terms", "서비스 이용 약관", 'scrollbars=no,width=10,height=10,status=no,resizable=no' + ',top=' + ((top / 2) - 400) + ',left=' + ((left / 2) - 200));
        win.opener.self;
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
                url: "/member/updateAddress",
                type: "GET",
                dataType: "json",
                contentType: "application/json; charset=UTF-8",
                data: sendData,
                success: function (data) {
                    if (data.message == 1) {
                        alert("주소가 변경되었습니다")
                    } else {
                        alert("오류입니다")
                    }

                },
                error: function () {
                    alert("Error. 관리자에게 문의하십시오.");
                },
            });


        }
    }

</script>

<%@include file="includes/footer.jsp" %>
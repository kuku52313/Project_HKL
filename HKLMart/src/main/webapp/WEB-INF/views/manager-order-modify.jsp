<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@include file="includes/header.jsp" %>
<style>
    label {
        display: inline-block;
        width: 100px;
        line-height: 50px;
    }

    .formCode {
        background-color: #e1e4ee;
    }

    .flex-container {
        　width: 100%;
        　display: flex;
    }

    .flex-items {
        　height: 40px;
        　width: 100px;
        　background-color: #999;
        　border: 1px solid #FFF;
        flex-direction: row;
        border: solid 1px #ffb6b6;
        display: inline-block;
    }

    dl {
        display: block;
        padding: 5px;
        width: 150px;
        height: 95px;
    }

    dl dd {
        font-size: 15px;
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
    }
</style>
<title>HKLMart :: 주문 처리</title>
<div class="container-fluid">
    <div class="row">
        <div class="col-1"></div>
        <!-- 사이드 메뉴 -->
        <div class="col-2">
            <ul class="sidebar" id="sidebar">
                <hr />
                <li>
                    <a class="sidebarMain" href="/manager/manager-page">MANAGER</a>
                </li>
                <li>
                    <a href="/manager/manager-product">제품 관리 페이지</a>
                </li>
                <li>
                    <a href="/manager/manager-order-list">주문 전체 내역</a>
                </li>
                <li>
                    <a href="/manager/manager-ask-board">회원 문의 내역</a>
                </li>
                <li>
                    <a href="/manager/manager-review-list">리뷰 관리 페이지</a>
                </li>
                <li>
                    <a href="/manager/manager-member-list">회원 조회 페이지</a>
                </li>
                <li>
                    <a href="/product/product-regist">제품 등록 페이지</a>
                </li>
                <br>
                <li>
                    <a class="sidebarMain" href="/member/my-page">MEMBER</a>
                </li>
                <li>
                    <a href="/member/my-page">내 정보</a>
                </li>
                <hr />
            </ul>
        </div>
        <br>
        <div class="col-6" style="z-index: 500">
            <!-- form header -->
            <form class="insertform" name="modifyForm" action="/manager/manager-order-modify-up" method="POST">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                <div class="form-header">
                    <h1>주문 관리</h1>
                </div>
                <!-- form body -->
                <div>
                    <div class="record">
                        <label>주문 번호</label>&nbsp;&nbsp; <input type="text" class="formCode" id="orderNumber" name="orderNumber" readonly value="${modify.orderNumber}" />
                    </div>
                    <hr style="border: solid 1px #ffb6b6;">
                    <div class="record">
                        <label>회원 ID</label>&nbsp;&nbsp; <input type="text" class="formCode" id="orderMemberId" name="orderMemberId" readonly value="${modify.orderMemberId}" />
                    </div>
                    <hr style="border: solid 1px #ffb6b6;">
                    <div class="record">
                        <label>이름</label>&nbsp;&nbsp; <input type="text" class="formCode" id="orderName" name="orderName" readonly value="${modify.orderName}" />
                    </div>
                    <hr style="border: solid 1px #ffb6b6;">
                    <div class="record">
                        <label>전화번호</label>&nbsp;&nbsp; <input type="text" class="formCode" id="orderTel" name="orderTel" readonly value="${modify.orderTel}" />
                    </div>
                    <hr style="border: solid 1px #ffb6b6;">
                    <div class="record">
                        <label>배송지 주소</label>&nbsp;&nbsp;
                        <input type="text" class="formCode" id="addressMember" name="memberAddress" readonly value="(${modify.orderAddressPostcode})&nbsp;&nbsp;${modify.orderAddress}&nbsp;&nbsp;${modify.orderAddressMember}" />
                    </div>
                    <hr style="border: solid 1px #ffb6b6;">
                    <div class="record">
                        <label>배송 메모</label>&nbsp;&nbsp; <input type="text" class="formCode" id="orderMemoId" name="orderMemo" readonly value="${modify.orderMemo}" />
                    </div>
                    <hr style="border: solid 1px #ffb6b6;">
                    <div class="record flex-container">
                        <label>구매 목록</label>&nbsp;&nbsp; <br> <c:forEach items="${productList}" var="list">
                        <div class="flex-items">
                            <dl>
                                <dd>제품 코드 : ${list.orderListProduct}</dd>
                                <dd>제품명 : ${list.productName}</dd>
                                <dd>구매 갯수 : ${list.stockEA}</dd>
                            </dl>
                        </div>
                    </c:forEach>
                    </div>
                    <div class="record">
                        <label>결제 금액</label>&nbsp;&nbsp; <input type="text" class="formCode" id="orderPaymentId" name="orderPayment" readonly value="${modify.orderPayment}" />
                    </div>
                    <hr style="border: solid 1px #ffb6b6;">
                    <select class="formText" id="orderStateId" name="orderState">
                        <option value="출고 준비">- 출고 준비 -</option>
                        <option value="출고 완료">- 출고 완료 -</option>
                        <option value="배송중">- 배송중 -</option>
                        <option value="배송 완료">- 배송 완료 -</option>
                        <option value="반품 처리중">- 반품 처리중 -</option>
                        <option value="반품 완료">- 반품 완료 -</option>
                    </select>
                    <hr style="border: solid 1px #ffb6b6;">
                </div>
                <input type="button" class="insertBtn" onclick="ModifyCheckfn()" value="수정 완료" /> <input type="button" class="insertBtn" onclick="location.href = '/manager/manager-order-list';" value="뒤로" />
            </form>
        </div>
        <div class="col-3"></div>
    </div>
</div>
<br><br>
<hr style="border: solid 1px #ffb6b6;">
<script>
	function searchFunc() {
		let productSearch = document.getElementById('productSearch').value;
		$.ajax({
			url        : "/ajax/search",
			type       : "GET",
			dataType   : "json",
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			data       : {searchStr: productSearch},
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

	function ModifyCheckfn() {

		var subForm = document.modifyForm;

		subForm.submit();

	}
</script>
<%@include file="includes/footer.jsp" %>
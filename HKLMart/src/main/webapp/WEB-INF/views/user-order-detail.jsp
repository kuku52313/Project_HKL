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
        /*　height: 40px;*/
        /*　width: 100px;*/
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
        /*overflow: hidden;*/
        /*text-overflow: ellipsis;*/
        white-space: nowrap;
    }

</style>
<title>HKLMart :: 상세 주문 페이지</title>

<div class="container-fluid">
    <div class="row">
        <div class="col-1"></div>

        <!-- 사이드 메뉴 -->
        <div class="col-2">
            <ul class="sidebar" id="sidebar">
                <hr/>
                <li><a class="sidebarMain" href="#header">MY 쇼핑</a></li>
                <li><a href="/member/user-order-list?pageNum=1&amount=10">주문내역</a></li>
                <li><a href="/basket/basket-page">장바구니</a></li>
                <li><a class="sidebarMain" href="#header">MY 활동</a></li>
                <li><a href="/member/my-page-ask-board">문의하기</a></li>
                <li><a href="/member/user-ask-review-list?pageNum=1&pageNumReview=1&amount=5">문의내역</a></li>
                <li><a href="#reviews">구매후기</a></li>
                <li><a href="/like/get">찜한상품</a></li>
                <li><a class="sidebarMain" href="#header">MY 정보</a></li>
                <li><a href="#privacy">개인정보확인/수정</a></li>
                <sec:authorize access="hasRole('ROLE_ADMIN')">
                    <br>
                    <li><a class="sidebarMain" href="#header">MANAGER</a></li>
                    <li><a href="/manager/manager-page">관리</a></li>
                    <hr/>
                </sec:authorize>
            </ul>
        </div>

        <br>

        <div class="col-6" style="z-index: 500">
            <!-- form header -->
            <form class="insertform" name="modifyForm" action="" method="POST">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                <div class="form-header">
                    <h1>주문 관리</h1>
                </div>
                <!-- form body -->
                <div>
                    <div class="record">
                        <label>주문 번호</label>&nbsp;&nbsp;
                        <input type="text" class="formCode" id="orderNumber" name="orderNumber" readonly
                               value="${orderList.orderNumber}"/>
                    </div>
                    <hr style="border: solid 1px #ffb6b6;">

                    <div class="record">
                        <label>회원 ID </label>&nbsp;&nbsp;
                        <input type="text" class="formCode" id="orderMemberId" name="orderMemberId" readonly
                               value="${orderList.orderMemberId}"/>
                    </div>
                    <hr style="border: solid 1px #ffb6b6;">

                    <div class="record">
                        <label>이름 </label>&nbsp;&nbsp;
                        <input type="text" class="formCode" id="orderName" name="orderName" readonly
                               value="${orderList.orderName}"/>
                    </div>
                    <hr style="border: solid 1px #ffb6b6;">

                    <div class="record">
                        <label>전화번호 </label>&nbsp;&nbsp;
                        <input type="text" class="formCode" id="orderTel" name="orderTel" readonly
                               value="${orderList.orderTel}"/>
                    </div>
                    <hr style="border: solid 1px #ffb6b6;">

                    <div class="record">
                        <label>배송지 주소</label>&nbsp;&nbsp;
                        <input type="text" class="formCode" id="addressMember" name="memberAddress" readonly
                               value="(${orderList.orderAddressPostcode})&nbsp;&nbsp;${orderList.orderAddress}&nbsp;&nbsp;${orderList.orderAddressMember}"/>
                    </div>
                    <hr style="border: solid 1px #ffb6b6;">

                    <div class="record">
                        <label>배송 메모 </label>&nbsp;&nbsp;
                        <input type="text" class="formCode" id="orderMemoId" name="orderMemo" readonly
                               value="${orderList.orderMemo}"/>
                    </div>
                    <hr style="border: solid 1px #ffb6b6;">
                    <c:set var="i" value="1" /> <c:set var="j" value="5" />
                    <div class="record flex-container">
                        <label>구매 목록 </label>&nbsp;&nbsp;
                        <br>
                            <div class="row basket-card">
                                <c:forEach var="list" items="${productList}">
                                    <div class="card col-2" style="display: inline-block">
                                        <a href="/product-detail?pageNum=1&amount=5&productCode=${list.productCode}">
                                            <img class="card-img-top" src="${list.productImgPath}${list.productThumbnail}" alt="장바구니" style="width: 100%"/>
                                            <div class="card-body">
                                                <p class="card-title" style="font-size: 15px; color: #5a6268">${list.productBrand}</p>
                                                <span class="card-subtitle" style="font-size: 13px">${list.productName}</span>
                                                <span class="card-subtitle" style="font-size: 13px">${list.stockEA}개</span>
                                            </div>
                                        </a>
                                    </div>
                                    <c:if test="${i%j == 0 }">
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    </c:if>
                                    <c:set var="i" value="${i+1 }" />
                                </c:forEach>
                            </div>
                    </div>

                    <div class="record">
                        <label>결제 금액 </label>&nbsp;&nbsp;
                        <input type="text" class="formCode" id="orderPaymentId" name="orderPayment" readonly
                               value="${orderList.orderPayment}"/>
                    </div>
                    <hr style="border: solid 1px #ffb6b6;">

                    <div class="record">
                        <label>주문 상태 </label>&nbsp;&nbsp;
                        <input type="text" class="formCode"  name="orderState" readonly
                               value="${orderList.orderState}"/>
                    </div>
                    <hr style="border: solid 1px #ffb6b6;">


                </div>

                <input type="button" class="insertBtn" onclick="location.href = '/member/user-order-list?pageNum=1&amount=10';"
                       value="뒤로"/>
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
            url: "/ajax/search",
            type: "GET",
            dataType: "json",
            contentType: "application/x-www-form-urlencoded; charset=UTF-8",
            data: {searchStr: productSearch},
            success: function (data) {
                let dataList = data.searchList;
                $("#productSearch").autocomplete({
                    source: dataList
                });
            },
            error: function () {
                alert("Error. 관리자에게 문의하십시오.");
            },
        });
    }

</script>

<%@include file="includes/footer.jsp" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@include file="includes/header.jsp" %>
<title>HKL Mart :: 찜 목록</title>
<style>
    a {
        text-decoration: none
    }

    a:hover {
        text-decoration: none;
    !important;
        color: black;
    }
</style>
<!-- Body --> <sec:authorize access="isAnonymous()"> <input type="hidden" id="stateLogin" value="0"> </sec:authorize> <sec:authorize access="isAuthenticated()"> <input type="hidden" id="stateLogin" value="1"> </sec:authorize>
<div class="container-fluid" style="padding-top: 35px;">
    <div class="row">
        <!-- 왼쪽 공백 -->
        <div class="col-1"></div>
        <!-- 사이드 메뉴 -->
        <div class="col-2">
            <ul class="sidebar" id="sidebar">
                <hr />
                <li>
                    <a class="sidebarMain" href="#header">MY 쇼핑</a>
                </li>
                <li>
                    <a href="/member/user-order-list?pageNum=1&amount=10">주문내역</a>
                </li>
                <li>
                    <a href="/basket/basket-page">장바구니</a>
                </li>
                <li>
                    <a class="sidebarMain" href="#header">MY 활동</a>
                </li>
                <li>
                    <a href="/member/my-page-ask-board">문의하기</a>
                </li>
                <li>
                    <a href="/member/user-ask-list?pageNum=1&pageNumReview=1&amount=10">문의내역</a>
                </li>
                <li>
                    <a href="/member/user-review-list?pageNum=1&pageNumReview=1&amount=10">구매후기</a>
                </li>
                <li>
                    <a href="/like/get?pageNum=1&amount=12">찜한상품</a>
                </li>
                <li>
                    <a class="sidebarMain" href="#header">MY 정보</a>
                </li>
                <li>
                    <a href="/member/my-page#privacy">개인정보확인/수정</a>
                </li>
                <sec:authorize access="hasRole('ROLE_ADMIN')"> <br>
                    <li>
                        <a class="sidebarMain" href="#header">MANAGER</a>
                    </li>
                    <li>
                        <a href="/manager/manager-page">관리</a>
                    </li>
                    <hr />
                </sec:authorize>
            </ul>
        </div>
        <div class="col-7 w3-main">
            <c:set var="TypeValue" value="${param.Type}" />
            <div class="w3-row-padding w3-center product-card-wrapper">
                <c:forEach items="${searchList}" var="list" varStatus="status">
                    <div class="w3-quarter product-card">
                        <a href="/product-detail?pageNum=1&amount=5&productCode=${list.productCode}">
                    <span>
                        <img src="<%=request.getContextPath()%>${list.productImgPath}${list.productThumbnail}" data-toggle="tooltip" data-placement="top" title="제품 상세 페이지로 이동" style="width:100%" />
                    </span>
                            <span class="font-m">${list.productBrand}</span>
                            <br />
                            <p class="font-s">${list.productName}</p>
                            <span class="font-b"><fmt:formatNumber value="${list.productPrice}" pattern="#,###" />&nbsp;</span>
                            원 <br /><br />
                            <div class="basket">
                                <a class="${list.productCode}" onclick="clickBasket(this)"><i class="fas fa-shopping-basket fa-2x" data-toggle="tooltip" data-placement="top" title="장바구니에 추가하기"></i></a> &nbsp;&nbsp;&nbsp;
                                <a class="${list.productCode}" onclick="clickDelete(this)"><i class="fas fa-trash fa-2x" data-toggle="tooltip" data-placement="top" title="삭제하기"></i></a>
                            </div>
                        </a>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</div>
<hr style="border: solid 1px #ffb6b6;">
<script>
    function clickBasket(obj) {
        let thisCode = $(obj).attr('class');
        let stateLogin = document.getElementById('stateLogin').value;
        if (stateLogin === "0") {
            alert("로그인이 필요한 서비스입니다");
            location.href = "/member/login-page";
            return 0;
        }
        let sendData = {productCode: thisCode};
        console.log(sendData);
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

    $(document).ready(function () {
        $('[data-toggle="tooltip"]').tooltip();
    });

    function clickDelete(obj) {
        let thisCode = $(obj).attr('class');
        location.href = "/like/delete?productCode=" + thisCode;
        alert("찜목록에서 삭제하였습니다")
        location.href = "/like/get?pageNum=1&amount=12"
    }
</script>
<%@include file="includes/footer.jsp" %>
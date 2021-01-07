<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>

<%@include file="includes/header.jsp" %>

<title>HKLMart :: 주문 내역</title>

<body>
<link rel="stylesheet" href="/resources/css/ask-review.css">
<div class="container-fluid">
    <div class="row">
        <!-- 왼쪽 공백 -->
        <div class="col-1"></div>

        <!-- 사이드 메뉴 -->
        <div class="col-2">
            <ul class="sidebar" id="sidebar">
                <hr/>
                <li><a class="sidebarMain" href="/manager/manager-page">MANAGER</a></li>
                <li><a href="/manager/manager-product">제품 관리 페이지</a></li>
                <li><a href="#orderListPage">주문 전체 내역</a></li>
                <li><a href="/manager/manager-ask-board">회원 문의 내역</a></li>
                <li><a href="/manager/manager-review-list">리뷰 관리 페이지</a></li>
                <li><a href="/manager/manager-member-list">회원 조회 페이지</a></li>
                <li><a href="/product/product-regist">제품 등록 페이지</a></li>
                <br>
                <li><a class="sidebarMain" href="/member/my-page">MEMBER</a></li>
                <li><a href="/member/my-page">내 정보</a></li>
                <hr/>
            </ul>
        </div>

        <br>

        <div class="col-6">
            <br>
            <div class="form-header">
                <h1>주문 내역</h1>
            </div>
            <br>
            <div class="frame">
                <h2>주문상품 정보</h2>
            <c:forEach items="${orderProductList}" var="list" varStatus="status">


                <div  class="order_item">
                    <dl >
                        <dt >브랜드 : ${list.productBrand}</dt>
                        <dt >주문 번호</dt>
                        <dt >주문 날짜</dt>
                        <dt >주문금액</dt>
                        <dt> 주문 상태</dt>
                    </dl>
                    <dl data-v-6dcc2f72="" >
                        <dd data-v-6dcc2f72=""><a data-v-6dcc2f72=""><img data-v-6dcc2f72="" src="${list.productImgPath}${list.productThumbnail}"></a></dd>
                        <dd data-v-6dcc2f72=""><a data-v-6dcc2f72=""><span data-v-6dcc2f72="" class="itemname">${list.productName}</span></a> <span data-v-6dcc2f72="">Size
                                ${list.stockSize}</span> <span
                                data-v-6dcc2f72="">${list.stockEA} 개</span></dd>
                        <dd data-v-6dcc2f72="">
                                ${list.orderNumber}
                        </dd>
                        <dd data-v-6dcc2f72="">
                            ${list.orderDate}
                        </dd>
                        <dd data-v-6dcc2f72=""><fmt:formatNumber
                                value="${list.productPrice}" pattern="#,###"/> 원</dd>
                        <dd data-v-6dcc2f72="">
                                ${list.orderState}
                        </dd>
                    </dl>
                </div>
            </c:forEach>
            </div>


            <ul class="pagination justify-content-center" style="margin:20px 0">

                <c:if test="${pageMaker.prev}">
                    <li class="page-item"><a class="page-link" style="color: black;"
                                             href="/manager/manager-order-list?pageNum=${pageMaker.startPage - 1}&amount=10">≪</a>
                    </li>
                </c:if>


                <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
                    <li class="page-item ${pageMaker.cri.pageNum == num ? "active":""}">
                        <a class="page-link" style="color: black;"
                           href="/manager/manager-order-list?pageNum=${num}&amount=10">${num}</a>
                    </li>
                </c:forEach>

                <c:if test="${pageMaker.next}">
                    <li class="page-item ">
                        <a class="page-link" style="color: black;"
                           href="/manager/manager-order-list?pageNum=${pageMaker.endPage + 1}&amount=10">≫</a>
                    </li>
                </c:if>
            </ul>

            <hr style="border: solid 1px #ffb6b6;">
        </div>
    </div>
    <!-- 오른쪽 공백 -->
    <div class="col-3"></div>
</div>

<br><br>
<hr style="border: solid 1px #ffb6b6;">

<%@include file="includes/footer.jsp" %>
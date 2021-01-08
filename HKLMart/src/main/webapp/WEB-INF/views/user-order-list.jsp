<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>

<%@include file="includes/header.jsp" %>

<title>HKLMart :: 주문 내역</title>

<style>
    .itemname {
        width: 100px;
    }

    .order_item dl dt {
        font-weight: 400;
    }

    .orderDate {
        width: 50px;
    }
</style>
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

        <div class="col-6">
            <br>
            <div class="form-header">
                <h1>주문 내역</h1>
            </div>
            <br>
            <div class="frame">
                <h2>주문상품 정보</h2>
                <c:forEach items="${orderProductList}" var="list" varStatus="status">


                    <div class="order_item">
                        <dl>
                            <dt>${list.productBrand}</dt>
                            <dt><a href="/member/user-order-detail?orderNumber=${list.orderNumber}">주문 번호: ${list.orderNumber}</a></dt>
                            <dt class="orderDate">주문 날짜</dt>
                            <dt>주문금액</dt>
                            <dt> 주문 상태</dt>
                            <dt>리뷰 작성</dt>
                        </dl>
                        <dl data-v-6dcc2f72="">
                            <dd data-v-6dcc2f72=""><a data-v-6dcc2f72=""><img data-v-6dcc2f72=""
                                                                              src="${list.productImgPath}${list.productThumbnail}"></a>
                            </dd>
                            <dd data-v-6dcc2f72=""><a data-v-6dcc2f72=""><span data-v-6dcc2f72=""
                                                                               class="itemname">${list.productName}</span></a>
                                <span data-v-6dcc2f72="">Size
                                        ${list.stockSize}</span> <span
                                        data-v-6dcc2f72="">${list.stockEA} 개</span></dd>
                            <dd data-v-6dcc2f72="" style="text-align: center;">
                                    ${list.orderDate}
                            </dd>
                            <dd data-v-6dcc2f72=""><fmt:formatNumber
                                    value="${list.productPrice}" pattern="#,###"/> 원
                            </dd>
                            <dd data-v-6dcc2f72="">
                                    ${list.orderState}
                            </dd>
                            <dd data-v-6dcc2f72="" style="text-align: center"><a href="/board/review-insert?productCode=${list.productCode}&productName=${list.productName}">
                                <i class="far fa-edit"></i></a>
                            </dd>
                    </div>
                </c:forEach>
            </div>


            <ul class="pagination justify-content-center" style="margin:20px 0">

                <c:if test="${pageMaker.prev}">
                    <li class="page-item"><a class="page-link" style="color: black;"
                                             href="/member/user-order-list?pageNum=${pageMaker.startPage - 1}&amount=10">≪</a>
                    </li>
                </c:if>


                <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
                    <li class="page-item ${pageMaker.productCri.pageNum == num ? "active":""}">
                        <a class="page-link" style="color: black;"
                           href="/member/user-order-list?pageNum=${num}&amount=10">${num}</a>
                    </li>
                </c:forEach>

                <c:if test="${pageMaker.next}">
                    <li class="page-item ">
                        <a class="page-link" style="color: black;"
                           href="/member/user-order-list?pageNum=${pageMaker.endPage + 1}&amount=10">≫</a>
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
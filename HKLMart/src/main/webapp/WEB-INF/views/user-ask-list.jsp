<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@include file="includes/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/resources/css/ask-review.css">
    <link rel="shortcut icon" href="/resources/img/back_exception.jpg">
    <title>1:1문의, 나의 리뷰내역 조회 페이지</title>
</head>
<body>
<div class="container-fluid">
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
                    <a href="/member/user-ask-list?pageNum=1&amount=10">문의내역</a>
                </li>
                <li>
                    <a href="/member/user-review-list?pageNum=1&amount=10">구매후기</a>
                </li>
                <li>
                    <a href="/like/get">찜한상품</a>
                </li>
                <li>
                    <a class="sidebarMain" href="#header">MY 정보</a>
                </li>
                <li>
                    <a href="#privacy">개인정보확인/수정</a>
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
        <br>
        <div class="col-6">
            <br>
            <div class="form-header">
                <h1>문의 내역</h1>
            </div>
            <br>
            <table class="table table-bordered table-striped" style="background-color: #ffffff;">
                <thead>
                <tr>
                    <th>문의 번호</th>
                    <th>종류</th>
                    <th>제목</th>
                    <th>접수 날짜</th>
                    <th>접수 상태</th>
                </tr>
                </thead>
                <c:forEach items="${AskBoardList}" var="list" varStatus="status">
                    <tr>
                        <th>
                            <a href="/member/user-ask-view?boardAskNumber=${list.boardAskNumber}&amount=10&pageNum=${PageMaker.productCri.pageNum}" style="color: black">
                                <c:out value="${list.boardAskNumber}" /></a>
                        </th>
                        <th><c:out value="${list.boardAskType}" /></th>
                        <th><c:out value="${list.boardAskTitle}" /></th>
                        <th><c:out value="${list.boardAskDate}" /></th>
                        <th><c:out value="${list.boardAskState}" /></th>
                    </tr>
                </c:forEach>
            </table>
            <!-- 문의 내역 페이징 버튼-->
            <ul class="pagination justify-content-center" style="margin:20px 0">
                <c:if test="${PageMaker.prev}">
                    <li class="page-item">
                        <a class="page-link" style="color: black;" href="/member/user-ask-list?pageNum=${PageMaker.startPage - 1}&amount=10">≪</a>
                    </li>
                </c:if> <c:forEach var="num" begin="${PageMaker.startPage}" end="${PageMaker.endPage}">
                <li class="page-item ${PageMaker.productCri.pageNum == num ? "active":""}">
                    <a class="page-link" style="color: black;" href="/member/user-ask-list?pageNum=${num}&amount=10">${num}</a>
                </li>
            </c:forEach> <c:if test="${PageMaker.next}">
                <li class="page-item">
                    <a class="page-link" style="color: black;" href="/member/user-ask-list?pageNum=${PageMaker.endPage + 1}&amount=10">≫</a>
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
</body>
<script></script>
<%@include file="includes/footer.jsp" %>
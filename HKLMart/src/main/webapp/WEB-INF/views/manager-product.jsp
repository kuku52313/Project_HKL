<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@include file="includes/header.jsp" %>
<title>HKLMart :: 제품 관리</title>
<div class="container-fluid">
    <div class="row">
        <!-- 왼쪽 공백 -->
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
        <div class="col-6">
            <br>
            <div class="form-header">
                <h1>제품 조회 내역</h1>
            </div>
            <br>
            <table class="table table-bordered table-striped" style="background-color: #ffffff;">
                <thead>
                <tr>
                    <th>번호</th>
                    <th>제품 코드</th>
                    <th>제품명</th>
                    <th>브랜드</th>
                    <th>제품 종류</th>
                </tr>
                </thead>
                <c:forEach items="${productList}" var="list" varStatus="status">
                    <tr>
                        <th><c:out value="${list.rn}" /></th>
                        <th>
                            <a href="/manager/product-modify?productCode=<c:out value="${list.productCode}&amount=10&pageNum=${pageMaker.cri.pageNum}" />" style="color: black">
                                <c:out value="${list.productCode}" /></a>
                        </th>
                        <th><c:out value="${list.productName}" /></th>
                        <th><c:out value="${list.productBrand}" /></th>
                        <th><c:out value="${list.productType}" /></th>
                    </tr>
                </c:forEach>
            </table>
            <ul class="pagination justify-content-center" style="margin:20px 0">
                <c:if test="${pageMaker.prev}">
                    <li class="page-item">
                        <a class="page-link" style="color: black;" href="/manager/manager-product?pageNum=${pageMaker.startPage - 1}&amount=10">≪</a>
                    </li>
                </c:if> <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
                <li class="page-item ${pageMaker.cri.pageNum == num ? "active":""}">
                    <a class="page-link" style="color: black;" href="/manager/manager-product?pageNum=${num}&amount=10">${num}</a>
                </li>
            </c:forEach> <c:if test="${pageMaker.next}">
                <li class="page-item">
                    <a class="page-link" style="color: black;" href="/manager/manager-product?pageNum=${pageMaker.endPage + 1}&amount=10">≫</a>
                </li>
            </c:if>
            </ul>
            <form id="pageForm" action="/manager/manager-review-list" method="get">
                <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}" /> <input type="hidden" name="amount" value="${pageMaker.cri.amount}" />
            </form>
            <hr style="border: solid 1px #ffb6b6;">
        </div>
    </div>
    <!-- 오른쪽 공백 -->
    <div class="col-3"></div>
</div>
<br><br>
<hr style="border: solid 1px #ffb6b6;">
<%@include file="includes/footer.jsp" %>
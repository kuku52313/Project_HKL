<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>

<%@include file="includes/header.jsp" %>

<title>HKLMart :: 리뷰 관리</title>

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
                <h1>리뷰 리스트</h1>
            </div>
            <br>

            <c:forEach items="${BoardReviewList}" var="list" varStatus="status">
                <table class="ask_table">
                    <tr>
                        <th class="product_info">상품 정보</th>
                        <th class="product"><a class="deletebtn" href="manager-review-delete?boardReviewNumber=${list.boardReviewNumber}">삭제</a></th> <!-- 여긴 빈칸-->
                    </tr>

                    <tr>
                        <!--  <td><a href="/" id="product" style="color: black"><img src="${list.boardReviewImgpath}${list.boardReviewThumbnail}.png"></a></td> -->
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="/" id="product" style="color: black"><img
                                src="<%=request.getContextPath() %>${list.boardReviewImgpath}${list.boardReviewThumbnail}.png"
                                style="width: 200px;  height: 200px; object-fit: fill;"></a>
                            <!--각 product로 갈 수 있게 해야함--></td>
                        <td class="">
                            <dt>리뷰번호 <span> : ${list.boardReviewNumber}</span></dt>
                            <dt><span class="st_on" style="width:85.4%">리뷰 별점 : ${list.boardReviewScore} </span></dt>
                            <dt>작성자 <span> : ${list.boardReviewMemberId}</span></dt>
                            <dt>상품이름 <span> : ${list.productName}</span></dt>
                            <dt>리뷰 코멘트 <span> : ${list.boardReviewContent}</span></dt>
                        </td>
                    </tr>

                    <tr>
                        <td></td> <!-- 빈칸 맞음.-->
                        <td><span>${review_content}</span></td>

                    </tr>

                    <tr>
                        <td></td>
                        <td><span>${review_comment}</span></td>
                    </tr>

                </table>
                <br>
            </c:forEach>

            <ul class="pagination justify-content-center" style="margin:20px 0">

                <c:if test="${pageMaker.prev}">
                    <li class="page-item"><a class="page-link" style="color: black;"
                                             href="/manager/manager-review-list?pageNum=${pageMaker.startPage - 1}&amount=10">≪</a>
                    </li>
                </c:if>


                <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
                    <li class="page-item ${pageMaker.cri.pageNum == num ? "active":""}">
                        <a class="page-link" style="color: black;"
                           href="/manager/manager-review-list?pageNum=${num}&amount=10">${num}</a>
                    </li>
                </c:forEach>

                <c:if test="${pageMaker.next}">
                    <li class="page-item ">
                        <a class="page-link" style="color: black;"
                           href="/manager/manager-review-list?pageNum=${pageMaker.endPage + 1}&amount=10">≫</a>
                    </li>
                </c:if>
            </ul>

            <form id="pageForm" action="/manager/manager-review-list" method="get">
                <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}"/>
                <input type="hidden" name="amount" value="${pageMaker.cri.amount}"/>
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
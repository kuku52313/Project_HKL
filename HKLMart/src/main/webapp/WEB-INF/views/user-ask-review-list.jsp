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
                <hr/>
                <li><a class="sidebarMain" href="#header">MY 쇼핑</a></li>
                <li><a href="/member/user-order-list?pageNum=1&amount=10">주문내역</a></li>
                <li><a href="/basket/basket-page">장바구니</a></li>
                <li><a class="sidebarMain" href="#header">MY 활동</a></li>
                <li><a href="/member/my-page-ask-board">문의하기</a></li>
                <li><a href="javascript:void(0);" onclick="userAskReviewListFn()">문의내역</a></li>
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
                <h1>구매 후기</h1>
            </div>
            <br>

            <c:forEach items="${BoardReviewList}" var="listR" varStatus="status">
                <table class="ask_table">
                    <tr>
                        <th class="product_info">상품 정보</th>
                        <th class="product"><a class="deletebtn" href="manager-review-delete?boardReviewNumber=${listR.boardReviewNumber}">삭제</a></th> <!-- 여긴 빈칸-->
                    </tr>

                    <tr>
                        <!--  <td><a href="/" id="product" style="color: black"><img src="${listR.boardReviewImgpath}${listR.boardReviewThumbnail}.png"></a></td> -->
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="/" id="product" style="color: black">
                            <img src="<%=request.getContextPath() %>${listR.boardReviewImgpath}${listR.boardReviewThumbnail}"
                                 style="width: 200px;  height: 200px; object-fit: fill;"></a>
                            <!--각 product로 갈 수 있게 해야함--></td>
                        <td class="">
                            <dt>리뷰번호 <span> : ${listR.boardReviewNumber}</span></dt>
                            <dt><span class="st_on" style="width:85.4%">리뷰 별점 : ${listR.boardReviewScore} </span></dt>
                            <dt>작성자 <span> : ${listR.boardReviewMemberId}</span></dt>
                            <dt>상품이름 <span> : ${listR.productName}</span></dt>
                            <dt>리뷰 코멘트 <span> : ${listR.boardReviewContent}</span></dt>
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
            <!-- 리뷰 내역 페이징 버튼-->
            <ul class="pagination justify-content-center" style="margin:20px 0">

                <c:if test="${ReviewPageMaker.prev}">
                    <li class="page-item">
                        <a class="page-link-review" style="color: black;"
                           href="javascript:;" value="${ReviewPageMaker.startPage - 1}"
                        >≪</a>
                    </li>
                </c:if>


                <c:forEach var="num" begin="${ReviewPageMaker.startPage}" end="${ReviewPageMaker.endPage}">
                    <li class="page-item ${ReviewPageMaker.productCri.pageNum == num ? "active":""}">
                        <a class="page-link-review" style="color: black;"
                           href="javascript:;" value="${num}">${num}</a>
                    </li>
                </c:forEach>

                <c:if test="${ReviewPageMaker.next}">
                    <li class="page-item ">
                        <a class="page-link-review" style="color: black;"
                           href="javascript:;" value="${ReviewPageMaker.endPage + 1}">≫</a>
                    </li>
                </c:if>
            </ul>
            <br>
            <div class="form-header">
                <h1>문의 내역</h1>
            </div>
            <br>

            <table class="table table-bordered table-striped"
                   style="background-color: #ffffff;">

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
                            <a href="/manager/manager-ask-answer?boardAskNumber=<c:out value="${list.boardAskNumber}"/>&pageNum=<c:out value="${pageMaker.productCri.pageNum}"/>&amount=<c:out value="${pageMaker.cri.amount}"/>"
                               style="color: black">
                                <c:out value="${list.boardAskNumber}"/></a></th>
                        <th><c:out value="${list.boardAskType}"/></th>
                        <th><c:out value="${list.boardAskTitle}"/></th>
                        <th><c:out value="${list.boardAskDate}"/></th>
                        <th><c:out value="${list.boardAskState}"/></th>
                    </tr>
                </c:forEach>

            </table>
            <!-- 문의 내역 페이징 버튼-->
            <ul class="pagination justify-content-center" style="margin:20px 0">

                <c:if test="${AskPageMaker.prev}">
                    <li class="page-item"><a class="page-link" style="color: black;" class="page-link" style="color: black;"
                                             href="javascript:;" value="${AskPageMaker.startPage - 1}">≪</a>
                    </li>
                </c:if>


                <c:forEach var="num" begin="${AskPageMaker.startPage}" end="${AskPageMaker.endPage}">
                    <li class="page-item ${AskPageNum == num ? "active":""}">
                        <a class="page-link" style="color: black;"
                           href="javascript:;" value="${num}">${num}</a>
                    </li>
                </c:forEach>

                <c:if test="${AskPageMaker.next}">
                    <li class="page-item">
                        <a class="page-link" style="color: black;"
                           href="javascript:;" value="${AskPageMaker.endPage + 1}">≫</a>
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

<form name="userAskReviewList" method="post" action="/member/user-ask-review-list">
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    <input type="hidden" id="pageNumAskId" name="pageNum" value="${AskPageNum}">
    <input type="hidden" id="pageNumReviewId" name="pageNumReview" value="${ReviewPageMaker.productCri.pageNum}">
    <input type="hidden" name="amount" value="5">
    <input type="hidden" name="memberId" value="${user.username}">
</form>

</body>
<script>
    // console.log(userAskReviewListForm.pageNum.valueOf());
    // $("#pageNumId").val(2)

    $(document).on("click", ".page-link", function () {
        let userAskReviewListForm = document.userAskReviewList;

        $("#pageNumAskId").val($(this).attr('value'));
        console.log(userAskReviewListForm.pageNum.valueOf());
        alert($("#pageNumAskId").val());
        userAskReviewListForm.submit();
    });

    $(document).on("click", ".page-link-review", function () {
        let userAskReviewListForm = document.userAskReviewList;

        $("#pageNumReviewId").val($(this).attr('value'));
        console.log(userAskReviewListForm.pageNumReview.valueOf());
        alert($("#pageNumReviewId").val());
        userAskReviewListForm.submit();
    });

    // function userAskReviewListFn() {
    //     let userAskReviewListForm = document.userAskReviewList;
    //
    //
    //     userAskReviewListForm.submit();
    // }
</script>

<%@include file="includes/footer.jsp" %>
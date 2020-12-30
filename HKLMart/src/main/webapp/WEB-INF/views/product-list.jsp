<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@include file="includes/header.jsp" %>

<head>
    <link rel="stylesheet" href="/resources/css/product-list.css">
</head>

<title>HKL Mart :: 제품 조회</title>

<!-- Body -->
<sec:authorize access="isAnonymous()">
    <input type="hidden" id="memberId" value="none">
</sec:authorize>
<sec:authorize access="isAuthenticated()">
    <sec:authentication property="principal" var="user"/>
    <input type="hidden" id="memberId" value="${user.memberId}">
</sec:authorize>

<div class="container-fluid">
    <!-- !PAGE CONTENT! -->
    <div class="w3-main w3-content w3-padding" style="max-width:1200px;margin-top:10px">

        <div class="w3-row-padding w3-padding-16 w3-center">
            <!-- ${param.type} 로 제품종류 가져오기 -->
            <p style="font-size : 40px;">구두</p>
        </div>
        <!-- s : 190412 수정 // 카테고리 리스트 page-title-wrap 밖으로 마크업 위치 변경  -->

        <div class="w3-row-padding w3-padding-16 w3-center">
            <ul>
                <!-- DESC : 선택된 소메뉴에 active 클래스 추가 -->
                <li style="display: inline; font-size : 19px;"><a href="/display/category?ctgrNo=1000000270" class="">첼시 부츠</a>
                    |
                </li>
                <!-- DESC : 선택된 소메뉴에 active 클래스 추가 -->
                <li style="display: inline; font-size : 19px;"><a href="/display/category?ctgrNo=1000000267" class="">워크 부츠</a>
                    |
                </li>
                <!-- DESC : 선택된 소메뉴에 active 클래스 추가 -->
                <li style="display: inline; font-size : 19px;"><a href="/display/category?ctgrNo=1000000268" class="">퍼 부츠</a></li>
            </ul>
        </div>

        <div class="w3-row-padding w3-padding-16 w3-center product-card-wrapper">
            <c:forEach items="${productList}" var="list" varStatus="status">
                <div class="w3-quarter product-card">
                    <span><img src="<%=request.getContextPath()%>${list.productImgpath}${list.productThumbnail}" style="width:100%"/><br></span>
                    <span class="font-m">${list.productBrand}</span><br/>
                    <p class="font-s">${list.productName}</p>
                    <span class="font-b"><fmt:formatNumber value="${list.productPrice}" pattern="#,###"/>&nbsp;</span>원
                    <br/><br/>
                    <div class="basket">
                        <a class="${list.productCode}" href="#" onclick="clickBasket(this)"><i class="fas fa-shopping-basket fa-2x"></i></a>
                        &nbsp;
                        <a href="#" onclick="clickLike(this)"><i class="fas fa-heart fa-2x"></i></a>
                    </div>
                </div>
            </c:forEach>
        </div>

    </div>
</div>
<ul class="pagination justify-content-center" style="margin:20px 0">
    <c:set var="CategoryPath" value="${param.Category}"/>

    <c:if test="${pageMaker.prev}">
        <li class="page-item">
            <a class="page-link" style="color: black;" href="/product-list${param.Category}?pageNum=${pageMaker.startPage - 1}&amount=10<c:if test="${CategoryPath eq '-MainCategory'}" >&Category=-MainCategory
    </c:if>">Previous</a>
        </li>
    </c:if>


    <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
        <li class="page-item ${pageMaker.productCri.pageNum == num ? "active":""}">
            <a class="page-link " style="color: black;"
               href="/product-list${param.Category}?pageNum=${num}&amount=12&Type=${param.Type}<c:if test="${CategoryPath eq '-MainCategory'}" >&Category=-MainCategory
    </c:if>">${num}</a>
        </li>
    </c:forEach>

    <c:if test="${pageMaker.next}">
        <li class="page-item">
            <a class="page-link" style="color: black;" href="/product-list${param.Category}?pageNum=${pageMaker.endPage + 1}&amount=12<c:if test="${CategoryPath eq '-MainCategory'}" >&Category=-MainCategory
    </c:if>">Next</a>
        </li>
    </c:if>
</ul>

<form id="pageForm" action="/product-list" method="get">
    <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}"/>
    <input type="hidden" name="amount" value="${pageMaker.cri.amount}"/>
</form>

<hr style="border: solid 1px #ffb6b6;">

<%@include file="includes/footer.jsp" %>

<script>
    function clickBasket(obj) {
        let thisCode = $(obj).attr('class');
        let memberId = document.getElementById('memberId').value;
        if (memberId === "none") {
            alert("로그인이 필요한 서비스입니다");
            location.href = "/member/login-page";
            return 0;
        }
        let sendData = {memberId: memberId, productCode: thisCode};
        console.log(sendData);
        $.ajax({
            url: "/basket/check",
            type: "GET",
            dataType: "json",
            contentType: "application/json; charset=UTF-8",
            data: sendData,
            success: function (data) {
                if (data.result === 0) {
                    alert("해당 상품을 장바구니에 담았습니다")
                } else if (data.result === 1) {
                    alert("이미 장바구니에 있는 상품입니다");
                }
            },
            error: function () {
                alert("Error. 관리자에게 문의하십시오.");
            },
        });
    }

    function clickLike(obj) {
        alert("찜");
    }
</script>
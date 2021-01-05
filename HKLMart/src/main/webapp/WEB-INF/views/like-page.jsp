<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>

<%@include file="includes/header.jsp" %>

<title>HKL Mart :: 제품 조회</title>
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
<!-- Body -->
<sec:authorize access="isAnonymous()">
    <input type="hidden" id="stateLogin" value="0">
</sec:authorize>
<sec:authorize access="isAuthenticated()">
    <input type="hidden" id="stateLogin" value="1">
</sec:authorize>

<div class="container-fluid">
    <div class="w3-main w3-content w3-padding" style="max-width:1200px;margin-top:10px">
        <c:set var="TypeValue" value="${param.Type}"/>

        <div class="w3-row-padding w3-padding-16 w3-center product-card-wrapper">
            <c:forEach items="${likeList}" var="list" varStatus="status">
                <div class="w3-quarter product-card">
                    <a href="/product-detail?pageNum=1&amount=5&productCode=${list.productCode}">
                    <span>
                        <img src="<%=request.getContextPath()%>${list.productImgPath}${list.productThumbnail}" data-toggle="tooltip" data-placement="top" title="제품 상세 페이지로 이동" style="width:100%"/>
                    </span>
                        <span class="font-m">${list.productBrand}</span><br/>
                        <p class="font-s">${list.productName}</p>
                        <span class="font-b"><fmt:formatNumber value="${list.productPrice}" pattern="#,###"/>&nbsp;</span>원
                        <br/><br/>
                        <div class="basket">
                            <a class="${list.productCode}" onclick="clickBasket(this)"><i class="fas fa-shopping-basket fa-2x" data-toggle="tooltip" data-placement="top" title="장바구니에 추가하기"></i></a>
                            &nbsp;&nbsp;&nbsp;
                            <a class="${list.productCode}" onclick="clickLike(this)"><i class="fas fa-trash fa-2x" data-toggle="tooltip" data-placement="top" title="삭제하기"></i></a>
                        </div>
                    </a>
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

    $(document).ready(function () {
        $('[data-toggle="tooltip"]').tooltip();
    });
</script>

<%@include file="includes/footer.jsp" %>
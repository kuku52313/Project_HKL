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
</style>
<title>HKLMart :: 회원 관리</title>
<div class="container-fluid">
    <div class="row">
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
        <div class="col-6" style="z-index: 500">
            <!-- form header -->
            <input type="hidden" name="memberId" value="${modify.memberId}" />
            <form class="insertform" name="modifyForm" action="/manager/manager-member-modify" method="POST">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                <div class="form-header">
                    <h1>회원 관리</h1>
                </div>
                <!-- form body -->
                <div>
                    <div class="record">
                        <label>회원 ID</label>&nbsp;&nbsp; <input type="text" class="formCode" id="idMember" name="memberId" readonly value="${modify.memberId}" />
                    </div>
                    <hr style="border: solid 1px #ffb6b6;">
                    <div class="record">
                        <label>회원명</label>&nbsp;&nbsp; <input type="text" class="formCode" id="nameMember" name="memberName" readonly value="${modify.memberName}" />
                    </div>
                    <hr style="border: solid 1px #ffb6b6;">
                    <div class="record">
                        <label>회원 이메일</label>&nbsp;&nbsp; <input type="text" class="formCode" id="emailMember" name="memberEmail" readonly value="${modify.memberEmail}" />
                    </div>
                    <hr style="border: solid 1px #ffb6b6;">
                    <div class="record">
                        <label>회원 전화번호</label>&nbsp;&nbsp; <input type="text" class="formCode" id="telMember" name="memberTel" readonly value="${modify.memberTel}" />
                    </div>
                    <hr style="border: solid 1px #ffb6b6;">
                    <div class="record">
                        <label>회원 가입 날짜</label>&nbsp;&nbsp; <input type="text" class="formCode" id="regdateMember" name="memberRegdate" readonly value="${modify.memberRegdate}" />
                    </div>
                    <hr style="border: solid 1px #ffb6b6;">
                    <div class="record">
                        <label>회원 주소</label>&nbsp;&nbsp;
                        <input type="text" class="formCode" id="addressMember" name="memberAddress" readonly value="(${modify.memberAddressPostcode})&nbsp;&nbsp;${modify.memberAddress}&nbsp;&nbsp;${modify.memberAddressMember}" />
                    </div>
                    <hr style="border: solid 1px #ffb6b6;">
                    <div class="record">
                        <label>회원 권한</label>&nbsp;&nbsp; <input type="text" class="formCode" id="authorityMember" name="memberAuthority" readonly value="${modify.memberAuthority}" />
                    </div>
                    <hr style="border: solid 1px #ffb6b6;">
                </div>
                <sec:authorize access="hasRole('ROLE_ADMIN')"> <c:set var="Authority" value="${modify.memberAuthority}" /> <c:if test="${Authority != '관리자'}"> <input type="button" class="insertBtn" onclick="DeleteCheckfn()" value="회원 탈퇴" /> </c:if>
                </sec:authorize> <input type="button" class="insertBtn" onclick="location.href = '/manager/manager-member-list?amount=${param.amount}&pageNum=${param.pageNum}';" value="뒤로" />
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
			url        : "/ajax/search",
			type       : "GET",
			dataType   : "json",
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			data       : {searchStr: productSearch},
			success    : function (data) {
				let dataList = data.searchList;
				$("#productSearch").autocomplete({
					source: dataList
				});
			},
			error      : function () {
				alert("Error. 관리자에게 문의하십시오.");
			},
		});
	}

	function DeleteCheckfn() {

		var subForm = document.modifyForm;

		subForm.action = "/manager/manager-member-delete";

		subForm.submit();

	}
</script>
<%@include file="includes/footer.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@include file="includes/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>HKLMart :: 1:1 문의</title>
    <link rel="shortcut icon" href="/resources/img/back_exception.jpg">
</head>
<body>
<form class="insertform" name="insertForm" action="/manager/ask-answer-up" method="post">
    <input type="hidden" name="pageNum" value="${param.pageNum}" /> <input type="hidden" name="amount" value="${param.amount}" /> <input type="hidden" name="boardAskNumber" value="${answer.boardAskNumber}" />
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
    <!-- form header -->
    <div class="form-header">
        <h1> 1:1 문의 답변 </h1>
    </div>
    <br>
    <!-- form body -->
    <div class="row">
        &nbsp;&nbsp;
        <label>문의 내역</label>&nbsp;&nbsp;&nbsp;&nbsp; <input type="text" class="formText" id="AskType" name="boardAskType" value="${answer.boardAskType}" readonly="readonly" style="background-color: #e1e4ee;">
    </div>
    <hr style="border: solid 1px #ffb6b6;">
    <div class="row">
        &nbsp;&nbsp;
        <label>제품 코드</label>&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="text" class="formText" id="codeProduct" name="boardAskProductCode" minlength="6" maxlength="6" placeholder="문의종류를 입력하여주세요" value="${answer.boardAskProductCode}" readonly="readonly" style="background-color: #e1e4ee;">
    </div>
    <hr style="border: solid 1px #ffb6b6;">
    <div class="row">
        &nbsp;&nbsp;
        <label>주문 번호</label>&nbsp;&nbsp;&nbsp;&nbsp; <input type="text" class="formText" id="orderNum" name="boardAskOrderNumber" value="${answer.boardAskOrderNumber}" readonly="readonly" style="background-color: #e1e4ee;">
    </div>
    <hr style="border: solid 1px #ffb6b6;">
    <div class="row">
        &nbsp;&nbsp;
        <label>문의 ID</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="text" class="formText" id="memberId" name="boardAskMemberId" value="${answer.boardAskMemberId}" readonly="readonly" style="background-color: #e1e4ee;">
    </div>
    <hr style="border: solid 1px #ffb6b6;">
    <div class="row">
        &nbsp;&nbsp;
        <label>문의 제목</label>&nbsp;&nbsp;&nbsp;&nbsp; <input type="text" class="formText" id="askTitle" name="boardAskTitle" value="${answer.boardAskTitle}" readonly="readonly" style="background-color: #e1e4ee;">
    </div>
    <hr style="border: solid 1px #ffb6b6;">
    <div class="row">
        &nbsp;&nbsp;
        <label>문의 내용</label>
    </div>
    <div>
        <textarea id="content" name="boardAskContent" cols="90" rows="10" style="border-color:#ffb6b6 ;" readonly="readonly">${answer.boardAskContent}</textarea>
    </div>
    <hr style="border: solid 1px #ffb6b6;">
    <div class="row">
        &nbsp;&nbsp;
        <label>답변</label>
    </div>
    <div>
        <textarea id="AnswerContent" name="boardAskAnswer" cols="90" rows="10" style="border-color:#ffb6b6 ;" readonly="readonly">${answer.boardAskAnswer}</textarea>
    </div>
    <hr style="border: solid 1px #ffb6b6;">
    <input type="text" class="formText" id="AnswerType" name="boardAskState" value="${answer.boardAskState}" readonly="readonly" style="background-color: #e1e4ee;">
    <hr style="border: solid 1px #ffb6b6;">
    <input type="button" class="insertBtn" onclick="location.href = '/member/user-ask-list';" value="홈으로" />
</form>
<br> <br>
<hr style="border: solid 1px #ffb6b6;">
<script>
    //  document.getElementById('idCheckBtn').value = "사용불가";


    function insertCheckfn() {
        //서프밋 전 확인

        var subForm = document.insertForm;
        alert("등록성공")
        subForm.submit();

    }

    function DeleteCheckfn() {

        var subForm = document.insertForm;

        subForm.action = "/manager/manager-ask-delete";

        subForm.submit();

    }
</script>
</body>
<%@include file="includes/footer.jsp" %>
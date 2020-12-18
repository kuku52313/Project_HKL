<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>


<%@include file="includes/header.jsp" %>

<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <title>HKLMart :: 1:1문의</title>
  <link rel="stylesheet" href="/resources/css/add-product.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>

<body>
    
   
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


	
    <form class="insertform" name="insertForm" action="/board/ask-board" method="post">
   		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
   		<input type="hidden" id="boardAskId" name="boardAskMemberId" value="${user.username}" />
        <input type="hidden" id="codeProductHidden" value="0">
        <input type="hidden" id="orderNumHidden" value="0">
        <!-- form header -->
        <div class="form-header">
            <h1> 1:1문의 </h1>
        </div>
		<br>
        <!-- form body -->
        <select class="formText" id="askType" name="boardAskType" onchange="askTypeFn()">
            <option value="0" name="none">- 문의 종류 -</option>
            <option value="1" name="none">- 환불 -</option>
            <option value="2" name="none">- 교환 및 A/S -</option>
            <option value="3" name="none">- 재입고 문의 -</option>
            <option value="4" name="none">- 주문 및 결제 -</option>
            <option value="5" name="none">- 배송 문의 -</option>
            <option value="6" name="none">- 기타 문의 사항 -</option>
        </select>
        <hr style="border: solid 1px #ffb6b6;">
        <div class="row">
        &nbsp;&nbsp;
            <label>제품 코드</label>&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="text" class="formText" id="codeProduct" name="boardAskProductCode"
            minlength="6" maxlength="6" placeholder="문의종류를 입력하여주세요" value="${productCode}">
          </div>
          <hr style="border: solid 1px #ffb6b6;">
          <div class="row">
          &nbsp;&nbsp;
            <label>주문 번호 </label>&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="text" class="formText" id="orderNum" name="boardAskOrderNumber" placeholder="문의종류를 입력하여주세요" value="${orderNumber}">
        </div>
        <hr style="border: solid 1px #ffb6b6;">
          <div class="row">
          &nbsp;&nbsp;
            <label>문의 제목 </label>&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="text" class="formText" id="askTitle" name="boardAskTitle" placeholder="제목을 입력하여 주세요">
        </div>
        
        
        <hr style="border: solid 1px #ffb6b6;">
        <div class="row">
        &nbsp;&nbsp;
            <label>문의 내용</label>

        </div>
        <div>
            <textarea id="content" name="boardAskContent" cols="90" rows="10" style="border-color:#ffb6b6 ;"></textarea>

         
        </div>
      
        <hr style="border: solid 1px #ffb6b6;">
        <button type="button" class="insertBtn"  onclick="insertCheckfn()">등록</button>
    </form>    
        
    <br>
    <br>
	<hr style="border: solid 1px #ffb6b6;">

    <script>

//  document.getElementById('idCheckBtn').value = "사용불가";


        function insertCheckfn() {
            //서프밋 전 확인
        

            var subForm = document.insertForm;

            var codeProduct = $("#codeProduct").val();
            var orderNum = $("#orderNum").val();
            var askType = $("#askType").val();

            var checkCode = /^[A-za-z0-9]{1,6}/;

            if(askType == 0) {

            alert("문의 종류를 선택해여 주세요")

            }else if(askType==1){

                if ((!checkCode.test(codeProduct))) {
                  alert("제품코드를 잘못입력하였습니다")

                } else if ((!codeProduct.length == 6)) {
                 alert("제품코드 자릿수 형식이 다릅니다")

                }
                else {
                alert("등록성공")
                subForm.submit();
               }


            }else if(askType==2){

                if ((!checkCode.test(codeProduct))) {
                  alert("제품코드를 잘못입력하였습니다")

                } else if ((!codeProduct.length == 6)) {
                 alert("제품코드 자릿수 형식이 다릅니다")

                }
                else {
                alert("등록성공")
                subForm.submit();
               }


            }else if(askType==3){



                if ((!checkCode.test(codeProduct))) {
                  alert("제품코드를 잘못입력하였습니다")

                } else if ((!codeProduct.length == 6)) {
                 alert("제품코드 자릿수 형식이 다릅니다")

                }
                else {
                alert("등록성공")
                subForm.submit();
               }


            }else if(askType==4){


                if ((!checkCode.test(codeProduct))) {
                  alert("제품코드를 잘못입력하였습니다")

                } else if ((!codeProduct.length == 6)) {
                 alert("제품코드 자릿수 형식이 다릅니다")

                }
                else {
                alert("등록성공")
                subForm.submit();
               }



            }else if(askType==5){
                
                if ((!checkCode.test(codeProduct))) {
                  alert("제품코드를 잘못입력하였습니다")

                } else if ((!codeProduct.length == 6)) {
                 alert("제품코드 자릿수 형식이 다릅니다")

                }
                else {
                alert("등록성공")
                subForm.submit();
               }


            }else if(askType==6){
                

            }else{
                 alert("Error")
            }


        }
 function  askTypeFn() {
        var askType = $("#askType").val();
        var orderNum = $("#orderNum").val();

            if(askType==1){
                document.getElementById('codeProduct').placeholder="필수 입력 / 예시 코드 ex) AA0010";
                document.getElementById('orderNum').placeholder="필수 입력";
              
            }else if(askType==2){
                document.getElementById('codeProduct').placeholder="필수 입력 / 예시 코드 ex) AA0010";
                document.getElementById('orderNum').placeholder="필수 입력";
                
            }else if(askType==3){
                document.getElementById('codeProduct').placeholder="필수 입력 / 예시 코드 ex) AA0010";
                document.getElementById('orderNum').placeholder=" ";
            }else if(askType==4){
                document.getElementById('codeProduct').placeholder="필수 입력 / 예시 코드 ex) AA0010";
                document.getElementById('orderNum').placeholder="문의하는 주문번호 입력 /생략가능";
               
            }else if(askType==5){
                document.getElementById('codeProduct').placeholder="필수 입력 / 예시 코드 ex) AA0010";
                document.getElementById('orderNum').placeholder="필수 입력";
                
            }else if(askType==6){
                document.getElementById('codeProduct').placeholder=" ";
                document.getElementById('orderNum').placeholder=" ";
                
            }else if(askType==0){
                document.getElementById('codeProduct').placeholder="문의종류를 입력하여주세요";
                document.getElementById('orderNum').placeholder="문의종류를 입력하여주세요";
            }
            else{
                 alert("Error")
            }




 }
       




    </script>
</body>

<%@include file="includes/footer.jsp" %>
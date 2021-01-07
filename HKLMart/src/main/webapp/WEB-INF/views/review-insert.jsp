<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>


<%@include file="includes/header.jsp" %>

<head>
    <title>HKLMart :: Review 작성</title>
    <link rel="stylesheet" href="/resources/css/add-product.css">
    <link rel="shortcut icon" href="/resources/img/back_exception.jpg">

</head>

<body>

<form class="insertform" name="insertForm" action="/board/review-insert?${_csrf.parameterName}=${_csrf.token}" method="post" enctype="multipart/form-data">
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    <input type="hidden" id="boardReviewId" name="boardReviewMemberId" value="${user.username}"/>

    <!-- form header -->
    <div class="form-header">
        <h1> 리뷰 작성 </h1>
    </div>
    <br>
    <!-- form body -->

    <div class="row">
        &nbsp;&nbsp;
        <label>제품 코드 </label>&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="text" class="formText" id="codeProduct" name="boardReviewProductCode"
               minlength="6" maxlength="6" placeholder="제품코드 테스트끝나면 리드온리로 바꾸기" value="${param.productCode}" readonly>
    </div>
    <hr style="border: solid 1px #ffb6b6;">

    <div class="row">
        &nbsp;&nbsp;
        <label>제품명</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="text" class="formText" id="nameProduct" name="boardReviewProductName"
               minlength="6" maxlength="6" placeholder="제품이름 테스트끝나면 리드온리로 바꾸기" value="${param.productName}">
    </div>


    <hr style="border: solid 1px #ffb6b6;">
    <div class="row">
        &nbsp;&nbsp;
        <label>리뷰 별점 </label>&nbsp;&nbsp;&nbsp;&nbsp;
        <select class="formText" id="reviewScore" name="boardReviewScore">
            <option value="0" name="none">- 별점을 선택해주세요 -</option>
            <option value="5" name="none">- ★★★★★ 완전 만족스러워요 -</option>
            <option value="4" name="none">- ★★★★☆ 대체로 만족스러워요 -</option>
            <option value="3" name="none">- ★★★☆☆ 보통이에요 -</option>
            <option value="2" name="none">- ★★☆☆☆ 좀 아쉬워요 -</option>
            <option value="1" name="none">- ★☆☆☆☆ 제품이 많이 아쉬워요 -</option>
        </select>

    </div>
    <hr style="border: solid 1px #ffb6b6;">
    <div class="row">
        &nbsp;&nbsp;
        <label>리뷰 내용</label>

    </div>
    <div>
        <textarea id="content" name="boardReviewContent" cols="90" rows="10" style="border-color:#ffb6b6 ;"></textarea>
        <div class="form-group left">
            <%--@declare id="contentfile"--%><label for="contentFile" class="fileTitle"></label>
            <input type="file" id="choose-file" name="uploadImg" accept=".bmp, .jpg, .jpeg, .png" size="80" style="margin-top: 10px; margin-bottom: 10px;"/>
            <div id="select_img" style="width: 100%; text-align: center">
                <img src=""/>
            </div>
        </div>
    </div>

    <hr style="border: solid 1px #ffb6b6;">
    <button type="button" class="insertBtn" onclick="insertCheckfn()">등록</button>
</form>

<br>
<br>
<hr style="border: solid 1px #ffb6b6;">

<script>


    function insertCheckfn() {
        //서프밋 전 확인

        console.log($("#codeProduct").val());

        var subForm = document.insertForm;
        var reviewScore = $("#reviewScore").val();

        if (reviewScore == 1) {
            alert("등록완료")
            subForm.submit();

        } else if (reviewScore == 2) {
            alert("등록완료")
            subForm.submit();

        } else if (reviewScore == 3) {
            alert("등록완료")
            subForm.submit();

        } else if (reviewScore == 4) {
            alert("등록완료")
            subForm.submit();

        } else if (reviewScore == 5) {
            alert("등록완료")
            subForm.submit();

        } else {
            alert("별점을 입력하여주세요")
        }


    }


    function checkImage(fileName, fileSize) {
        var imageExtension = /([^\s]+(?=\.(jpg|jpeg|png|bmp|JPG|JPEG|PNG|BMP))\.\2)/
        if (!imageExtension.test(fileName)) {
            alert("이미지만 등록 가능합니다");
            document.getElementById("choose-file").value = "";
            return false;
        }
        if (fileSize >= 3145728) {
            alert("이미지 크기가 너무 큽니다");
            document.getElementById("choose-file").value = "";
            return false;
        }
        return true;
    }

    $("#choose-file").change(function () {
        var file = document.getElementById("choose-file");
        var filePath = file.value;
        var filePathSplit = filePath.split('\\');
        var filePathLength = filePathSplit.length;
        var fileName = filePathSplit[filePathLength - 1];
        var fileSize = file.files[0].size;

        if (checkImage(fileName, fileSize)) {
            if (this.files && this.files[0]) {
                var reader = new FileReader;
                reader.onload = function (data) {
                    $("#select_img img").attr("src", data.target.result).width(300).height(300);
                }
                reader.readAsDataURL(this.files[0]);
            }
        } else {
            document.getElementById("choose-file").value = "";
        }
    });
</script>
</body>

<%@include file="includes/footer.jsp" %>
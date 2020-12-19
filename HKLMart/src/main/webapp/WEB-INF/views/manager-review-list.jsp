<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<%@include file="includes/header.jsp"%>

<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>HKL Mart :: 관리자 리뷰 전체 조회</title>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.1/css/all.css"
	integrity="sha384-vp86vTRFVJgpjF9jiIGPEEqYqlDwgyBgEF109VFjmqGmIY/Y4HV4d3Gp2irVfcrp"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="/resources/bootstrap/4.5.3/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/index.css">
<script src="/resources//jquery/3.5.1/jquery.min.js"></script>
<script src="/resources//bootstrap/4.5.3/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/resources/css/ask-review.css">
<link rel="stylesheet" href="/resources/css/add-product.css">


<style>
.table-bordered {
	border: 1px solid #ffb6b6;
}

.table {
	width: 100%;
	margin-bottom: 1rem;
	color: #212529;
}

.table td, .table th {
	padding: 0.75rem;
	vertical-align: top;
	border-top: 1px solid #ffb6b6;
}

.table-bordered {
	border: 1px solid #ffb6b6;
}

.table-bordered td, .table-bordered th {
	border: 1px solid #ffb6b6;
}

.table-bordered thead td, .table-bordered thead th {
	border-bottom-width: 2px;
}

.table thead th {
	vertical-align: bottom;
	border-bottom: 2px solid #ffb6b6;
}

</style>
</head>

<body>
	<div id="body" class="container-fluid">
		<div class="row">
			<!-- 왼쪽 공백 -->
			<div class="col-2"></div>


			<!-- 
				<div class="col-2">
					사이드 메뉴 
				</div> -->
			<br>
			<div class="col-8">
				<br>
				<div class="form-header">
					<h1>리뷰 리스트</h1>
				</div>
				<br>

			<c:forEach items="${BoardReviewList}" var="list" varStatus="status">
				 <table class="ask_table">
            <tr>
                <th class="product_info" >상품 정보</th>
                <th class="product"></th> <!-- 여긴 빈칸-->
            </tr>

            <tr>
                <td><a href="/" id="product" style="color: black"><img src="${list.boardReviewImgpath}${list.boardReviewThumbnail}"></a> <!--각 product로 갈 수 있게 해야함--></td>
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
			<hr style="border: solid 1px #ffb6b6;">		
			</div>
		</div>
		<!-- 오른쪽 공백 -->
		<div class="col-2"></div>
	</div>






</body>



<%@include file="includes/footer.jsp"%>
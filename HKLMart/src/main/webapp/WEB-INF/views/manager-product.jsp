<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<%@include file="includes/header.jsp"%>

<html>

<head>
<meta charset="UTF-8">
<title>HKL Mart :: 관리자 제품관리</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.1/css/all.css"
	integrity="sha384-vp86vTRFVJgpjF9jiIGPEEqYqlDwgyBgEF109VFjmqGmIY/Y4HV4d3Gp2irVfcrp"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="/resources/bootstrap/4.5.3/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/index.css">
<script src="/resources//jquery/3.5.1/jquery.min.js"></script>
<script src="/resources//bootstrap/4.5.3/js/bootstrap.min.js"></script>
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
					<h1>제품 조회 리스트</h1>
				</div>
				<br>

				<table class="table table-bordered table-striped"
					style="background-color: #ffffff;">

					<thead>
						<tr>
							<th>번호</th>
							<th>제품 코드</th>
							<th>제품명</th>
							<th>브랜드</th>
							<th>제품 종류</th>
						</tr>
					</thead>

<%-- <td><a href='/board/get?bno=<c:out value="${board.bno}" />'>
									<c:out value="${board.title}" />
							</a></td> --%>
					<c:forEach items="${productList}" var="list" varStatus="status">
						<tr>
							<th><c:out value="${status.count}"/></th>
							<th><a href="/manager/product-modify?productCode=<c:out value="${list.productCode}" />" style="color: black">
									<c:out value="${list.productCode}" /></a></th>
							<th><c:out value="${list.productName}" /></th>
							<th><c:out value="${list.productBrand}" /></th>
							<th><c:out value="${list.productType}" /></th>
						</tr>
					</c:forEach>




				</table>
				<hr style="border: solid 1px #ffb6b6;">
			</div>
		</div>
		<!-- 오른쪽 공백 -->
		<div class="col-2"></div>
	</div>






</body>



<%@include file="includes/footer.jsp"%>
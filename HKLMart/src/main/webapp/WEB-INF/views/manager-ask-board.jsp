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
<title>HKL Mart :: 관리자 1:1 문의 처리</title>
<link rel="shortcut icon" href="/resources/img/back_exception.jpg">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.1/css/all.css"
	integrity="sha384-vp86vTRFVJgpjF9jiIGPEEqYqlDwgyBgEF109VFjmqGmIY/Y4HV4d3Gp2irVfcrp"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="/resources/bootstrap/4.5.3/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/index.css">
<script src="/resources/jquery/3.5.1/jquery.min.js"></script>
<script src="/resources/bootstrap/4.5.3/js/bootstrap.min.js"></script>
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
					<h1>1:1 문의 답변</h1>
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
							<th>작성 ID</th>
						</tr>
					</thead>

<%-- <td><a href='/board/get?bno=<c:out value="${board.bno}" />'>
									<c:out value="${board.title}" />
							</a></td> --%>
					<c:forEach items="${AskBoardList}" var="list" varStatus="status">
						<tr>
							<th><a href="/testKim/manager-ask-answer?boardAskNumber=<c:out value="${list.boardAskNumber}"/>&pageNum=<c:out value="${pageMaker.cri.pageNum}"/>&amount=<c:out value="${pageMaker.cri.amount}"/>" style="color: black">
									<c:out value="${list.boardAskNumber}" /></a></th>
							<th><c:out value="${list.boardAskType}" /></th>
							<th><c:out value="${list.boardAskTitle}" /></th>
							<th><c:out value="${list.boardAskDate}" /></th>
							<th><c:out value="${list.boardAskState}" /></th>
							<th><c:out value="${list.boardAskMemberId}"/></th>
						</tr>
					</c:forEach>




				</table>

                 <div class="pull-right">
                                    	<ul class="pagination">

                                    		<c:if test="${pageMaker.prev}">
                                    			<li class="paginate_button previous"><a href="${pageMaker.startPage - 1}">Previous</a>
                                    			</li>
                                    			</c:if>

                                    			<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
                                    				<li class="paginate_button ${pageMaker.cri.pageNum == num ? "active":""} ">
                                    				<a href="${num}">${num}</a>
                                    				</li>
                                    			</c:forEach>

                                    			<c:if test="${pageMaker.next}">
                                    				<li class="paginate_button next">
                                    				<a href="${pageMaker.endPage + 1}">Next</a>
                                    				</li>
                                    			</c:if>
                                    	</ul>
                                    </div>

                                    <form id="pageForm" action="manager/manager-ask-board" method="get">
                                    	<input type="hidden" name="pageNum" value = "${pageMaker.cri.pageNum}" />
                                    	<input type="hidden" name="amount" value = "${pageMaker.cri.amount}" />
                                    </form>


				<hr style="border: solid 1px #ffb6b6;">
			</div>
		</div>
		<!-- 오른쪽 공백 -->
		<div class="col-2"></div>
	</div>






</body>

<script>
var pageForm = $("#pageForm");

                    $(".paginate_button a").on("click", function(e){
					e.preventDefault();

					console.log("click");

					pageForm.find("input[name='pageNum']").val($(this).attr("href"));
					pageForm.submit();

				})



</script>


<%@include file="includes/footer.jsp"%>
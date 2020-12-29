<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<%@include file="includes/header.jsp"%>

<!DOCTYPE html>
<head>
  <title>HKL Mart :: 제품 조회</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
  <link rel="stylesheet" href="/resources/css/product-list.css">
  <link rel="shortcut icon" href="/resources/img/back_exception.jpg">
</head>
<body>
  <!-- Body -->
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
            | </li>
          <!-- DESC : 선택된 소메뉴에 active 클래스 추가 -->
          <li style="display: inline; font-size : 19px;"><a href="/display/category?ctgrNo=1000000267" class="">워크 부츠</a>
            | </li>
          <!-- DESC : 선택된 소메뉴에 active 클래스 추가 -->
          <li style="display: inline; font-size : 19px;"><a href="/display/category?ctgrNo=1000000268" class="">퍼 부츠</a></li>

        </ul>
      </div>

      <div class="w3-row-padding w3-padding-16 w3-center">
      <c:forEach items="${productList}" var="list" varStatus="status">
        <c:if test="${status.index%4==0}">
        <br>
        </c:if>
        <div class="w3-quarter" style= "float:left;">
          <a href=""><img src="<%=request.getContextPath()%>${list.productImgpath}${list.productThumbnail}" style="width:100%"/></a>
          <a href=""><h3>${list.productBrand}</h3></a>
          <a href=""><p style="font-size : 19px;">${list.productName}</p> </a>
          <a href=""><p id="price" style="font-size : 28px; display: inline;">${list.productPrice}</p> <span>원</span></a>
        </div>
        </c:forEach>
        </div>

    </div>
  </div>


  <ul class="pagination justify-content-center" style="margin:20px 0">

                                              	<c:if test="${pageMaker.prev}">
                                               <li class="page-item" ><a class="page-link" href="/product-list?pageNum=${pageMaker.startPage - 1}&amount=10">Previous</a>
                                                </li>
                                               </c:if>



                                                                                  			<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
                                                                                  				<li class="page-item">
                                                                                  				<a class="page-link" style="color: black;" href="/product-list?pageNum=${num}&amount=12">${num}</a>
                                                                                  				</li>
                                                                                  			</c:forEach>

                                                                                  			<c:if test="${pageMaker.next}">
                                                                                  				<li class="page-item">
                                                                                  				<a class="page-link" style="color: black;" href="/product-list?pageNum=${pageMaker.endPage + 1}&amount=12">Next</a>
                                                                                  				</li>
                                                                                  			</c:if>
                                                                                  	</ul>


                                                                                  <form id="pageForm" action="/product-list" method="get">
                                                                                  	<input type="hidden" name="pageNum" value = "${pageMaker.cri.pageNum}" />
                                                                                  	<input type="hidden" name="amount" value = "${pageMaker.cri.amount}" />
                                                                                  </form>

<hr style="border: solid 1px #ffb6b6;">


  </body>

  <script>
  </script>

<%@include file="includes/footer.jsp"%>
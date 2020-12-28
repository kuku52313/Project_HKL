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
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
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
      <!-- First Photo Grid 제품 1번라인-->
      <c:forEach items="${productList}" var="list" varStatus="status">

      <div class="w3-row-padding w3-padding-16" id="food">
        <div class="w3-quarter">
          <a href=""><img src="<%=request.getContextPath()%>${list.productImgpath}${list.productThumbnail}.png" style="width:100%"/></a>
          <a href=""><h3>${list.productBrand}</h3> <!-- 브랜드--></a>
          <a href=""><p style="font-size : 19px;">${list.productName}</p> </a><!-- 제품명-->
          <a href=""><p id="price" style="font-size : 28px; display: inline;">${list.productPrice}</p> <span>원</span></a>
        </div>

        </c:forEach>
        <div class="w3-quarter">
          <img src="/resources/img/product-list/2.jpg" style="width:100%"/>
          <h3>호킨스</h3>
          <p style="font-size : 19px;">첼시부츠</p>
          <p id="price" style="font-size : 28px; display: inline;">49,000</p> <span>원</span>
        </div>
        <div class="w3-quarter">
          <img src="/resources/img/product-list/3.jpg" style="width:100%"/>
          <h3>호킨스</h3>
          <p style="font-size : 19px;">버널</p>
          <p id="price" style="font-size : 28px; display: inline;">119,000</p> <span>원</span>
        </div>
        <div class="w3-quarter">
          <img src="/resources/img/product-list/4.jpg" style="width:100%"/>
          <h3>호킨스</h3>
          <p style="font-size : 19px;">킹스키너</p>
          <p id="price" style="font-size : 28px; display: inline;">29,000</p> <span>원</span>
        </div>
      </div>

      <!-- Second Photo Grid 제품 2번 라인-->
      <div class="w3-row-padding w3-padding-16">
        <div class="w3-quarter">
          <img src="/resources/img/product-list/5.jpg" style="width:100%"/>
          <h3>호킨스</h3>
          <p style="font-size : 19px;">알피</p>
          <p id="price" style="font-size : 28px; display: inline;">29,000</p> <span>원</span>
        </div>
        <div class="w3-quarter">
          <img src="/resources/img/product-list/6.jpg" style="width:100%"/>
          <h3>호킨스</h3>
          <p style="font-size : 19px;">옥스포드</p>
          <p id="price" style="font-size : 28px; display: inline;">99,000</p> <span>원</span>
        </div>
        <div class="w3-quarter">
          <img src="/resources/img/product-list/7.jpg" style="width:100%"/>
          <h3>레브</h3>
          <p style="font-size : 19px;">레브 스웨이드 삭스 부츠 포 키즈</p>
          <p id="price" style="font-size : 28px; display: inline;">59,000</p> <span>원</span>
        </div>
        <div class="w3-quarter">
          <img src="/resources/img/product-list/8.jpg" style="width:100%"/>
          <h3>휠라</h3>
          <p style="font-size : 19px;">디스럽터 쉐어링 케이디</p>
          <p id="price" style="font-size : 28px; display: inline;">47,000</p> <span>원</span>
        </div>
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
                                                                                  				<a class="page-link" style="color: black;" href="/product-list?pageNum=${num}&amount=10">${num}</a>
                                                                                  				</li>
                                                                                  			</c:forEach>

                                                                                  			<c:if test="${pageMaker.next}">
                                                                                  				<li class="page-item">
                                                                                  				<a class="page-link" style="color: black;" href="/product-list?pageNum=${pageMaker.endPage + 1}&amount=10">Next</a>
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
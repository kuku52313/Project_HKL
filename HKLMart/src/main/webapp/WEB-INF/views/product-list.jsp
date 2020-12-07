<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

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
  <link rel="stylesheet" href="productlist.css">

  <!-- Body -->
  <div class="container-fluid">
    <!-- !PAGE CONTENT! -->
    <div class="w3-main w3-content w3-padding" style="max-width:1200px;margin-top:10px">

      <div class="w3-row-padding w3-padding-16 w3-center">
        <p style="font-size : 40px;">부츠</p>
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
      <div class="w3-row-padding w3-padding-16" id="food">
        <div class="w3-quarter">
          <a href=""><img src="img/productlist/1.jpg" style="width:100%"></a>
          <a href=""><h3>마크모크</h3> <!-- 브랜드--></a>
          <a href=""><p style="font-size : 19px;"> Kalli</p> </a><!-- 제품명-->
          <a href=""><p id="price" style="font-size : 28px; display: inline;">99,000 </p> <span>원</span></a>
          <!--가격-->
        </div>
        <div class="w3-quarter">
          <img src="img/productlist/2.jpg" style="width:100%">
          <h3>호킨스</h3>
          <p style="font-size : 19px;">첼시부츠</p>
          <p id="price" style="font-size : 28px; display: inline;">49,000</p> <span>원</span>
        </div>
        <div class="w3-quarter">
          <img src="img/productlist/3.jpg" style="width:100%">
          <h3>호킨스</h3>
          <p style="font-size : 19px;">버널</p>
          <p id="price" style="font-size : 28px; display: inline;">119,000</p> <span>원</span>
        </div>
        <div class="w3-quarter">
          <img src="img/productlist/4.jpg" style="width:100%">
          <h3>호킨스</h3>
          <p style="font-size : 19px;">킹스키너</p>
          <p id="price" style="font-size : 28px; display: inline;">29,000</p> <span>원</span>
        </div>
      </div>

      <!-- Second Photo Grid 제품 2번 라인-->
      <div class="w3-row-padding w3-padding-16">
        <div class="w3-quarter">
          <img src="img/productlist/5.jpg" style="width:100%">
          <h3>호킨스</h3>
          <p style="font-size : 19px;">알피</p>
          <p id="price" style="font-size : 28px; display: inline;">29,000</p> <span>원</span>
        </div>
        <div class="w3-quarter">
          <img src="img/productlist/6.jpg" style="width:100%">
          <h3>호킨스</h3>
          <p style="font-size : 19px;">옥스포드</p>
          <p id="price" style="font-size : 28px; display: inline;">99,000</p> <span>원</span>
        </div>
        <div class="w3-quarter">
          <img src="img/productlist/7.jpg" style="width:100%">
          <h3>레브</h3>
          <p style="font-size : 19px;">레브 스웨이드 삭스 부츠 포 키즈</p>
          <p id="price" style="font-size : 28px; display: inline;">59,000</p> <span>원</span>
        </div>
        <div class="w3-quarter">
          <img src="img/productlist/8.jpg" style="width:100%">
          <h3>휠라</h3>
          <p style="font-size : 19px;">디스럽터 쉐어링 케이디</p>
          <p id="price" style="font-size : 28px; display: inline;">47,000</p> <span>원</span>
        </div>
      </div>

    </div>
  </div>

  </body>

  <script>
  </script>

</html>
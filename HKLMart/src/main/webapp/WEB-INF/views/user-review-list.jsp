<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<%@include file="includes/header.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/resources/css/ask-review.css">
    <title>1:1문의, 나의 리뷰내역 조회 페이지</title>
</head>
<body>
    <form class="insertform" action="/askreview" method="post">

        <!-- form header -->
        <div class="form-header">
          <h1>1:1 문의 내역</h1>          
        </div>
        <figure id="">
            <table class="ask_table">
            <tr>
                <th class="ask_kind" >문의 유형</th>
                <th class="ask_content">내용</th>
            </tr>
            <tr>
                <td class="ask_kind">${a}</td>
                <td class="ask_content">${a}</td>
            </tr>
        </table>
       </figure>

        <!-- form body -->
        <div class="row">
            
        </div>


    </form>

    <form class="insertform" action="/askreview" method="post">
        <div class="form-header">
            <h1>나의 리뷰 내역</h1>
        </div>

        <figure id="">
            <table class="ask_table">
            <tr>
                <th class="product_info" >상품 정보</th>
                <th class="product"></th> <!-- 여긴 빈칸-->
            </tr>

            <tr>
                <td><a href="/" id="product" style="color: black">상품사진 넣는곳</a> <!--각 product로 갈 수 있게 해야함--></td>
                <td class="">
                    <dt><span class="st_on" style="width:85.4%">만족도 별점</span></dt>
                    <dt>상품코드 <span>${product_code}</span></dt>
                    <dt>상품이름 <span>${product_name}</span></dt>
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

    
     </form>

</body>


<%@include file="includes/footer.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>

<%@include file="includes/header.jsp" %>

<head>
    <title>HKL Mart :: manager-page</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.1/css/all.css" integrity="sha384-vp86vTRFVJgpjF9jiIGPEEqYqlDwgyBgEF109VFjmqGmIY/Y4HV4d3Gp2irVfcrp" crossorigin="anonymous">
    <link rel="stylesheet" href="/resources/bootstrap/4.5.3/css/bootstrap.min.css">
    <link rel="shortcut icon" href="/resources/img/back_exception.jpg">
    <link rel="stylesheet" href="/resources/css/index.css">
    <link rel="stylesheet" href="/resources/css/login.css">
</head>

<!-- Body -->
<div id="body" class="container-fluid">
    <div class="row">
        <!-- 왼쪽 공백 -->
        <div class="col-1"></div>

        <!-- 사이드 메뉴 -->
        <div class="col-2">
            <ul class="sidebar" id="sidebar">
                <hr/>
                <li><a class="sidebarMain" href="#header">관리자 페이지</a></li>
                <li><a href="/manager/manager-product">제품 관리 페이지</a></li>
                <li><a href="#orderListPage">주문 전체 내역</a></li>
                <li><a href="/manager/manager-ask-board">회원 문의 내역</a></li>
                <li><a href="/manager/manager-review-list">리뷰 관리 페이지</a></li>
                <li><a href="/manager/manager-member-list">회원 조회 페이지</a></li>
                <li><a href="/product/product-regist">제품 등록 페이지</a></li>
                <hr/>
            </ul>
        </div>

        <!-- 작업중 -->
        <div class="col-7" style="font-family: Godo; text-align: center; font-weight: bold">
            <br/><br/>
            <div id="prudctListPage">
                <span class="font-set" style="font-size: 25px">제품 관리 페이지</span>
                <a href="/manager/manager-product" class="font-set" style="font-size: 15px; color: gray; margin-left: 50px">더보기</a>
                <hr/>
            </div>

            <br/><br/>
            <div id="orderListPage">
                <span class="font-set" style="font-size: 25px">주문 전체 내역 페이지</span>
                <a href="#" class="font-set" style="font-size: 15px; color: gray; margin-left: 50px">더보기</a>
                <hr/>
            </div>

            <br/><br/>
            <div id="askBoardPage">
                <span class="font-set" style="font-size: 25px">회원 문의 관리 페이지</span>
                <a href="/manager/manager-ask-board" class="font-set" style="font-size: 15px; color: gray; margin-left: 50px">더보기</a>
                <hr/>
            </div>

            <br/><br/>
            <div id="boardReviews">
                <span class="font-set" style="font-size: 25px">리뷰 관리 페이지</span>
                <a href="/manager/manager-review-list" class="font-set" style="font-size: 15px; color: gray; margin-left: 50px">더보기</a>
                <hr/>
            </div>

            <br/><br/>
            <div id="memberList">
                <span class="font-set" style="font-size: 25px">회원정보 조회 페이지</span>
                <a href="/manager/manager-member-list" class="font-set" style="font-size: 15px; color: gray; margin-left: 50px">더보기</a>
                <hr/>
            </div>

            <br/><br/>

        </div>

        <!-- 오른쪽 공백 -->
        <div class="col-2"></div>
    </div>
</div>

<br/><br/>
<hr/>

<%@include file="includes/footer.jsp" %>
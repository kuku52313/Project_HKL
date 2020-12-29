<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>

<!DOCTYPE html>
<html lang="ko">

<head>
    <title>:: HKL Mart ::</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.1/css/all.css" integrity="sha384-vp86vTRFVJgpjF9jiIGPEEqYqlDwgyBgEF109VFjmqGmIY/Y4HV4d3Gp2irVfcrp" crossorigin="anonymous">
    <link rel="stylesheet" href="/resources/bootstrap/4.5.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/css/index.css">
    <link rel="stylesheet" href="/resources/css/add-product.css">
    <link rel="shortcut icon" href="/resources/img/back_exception.jpg">
</head>

<body>
<!-- Header -->
<header id="header" class="container-fluid">

    <!-- Navbar-->
    <nav class="navbar row">
        <div class="col-1"></div>
        <div class="navbar_logo col-1">
            <a class="logo" style="height: 100px;" href="/">
                <img class="logo" src="/resources/img/top_logo.png">
            </a>
        </div>

        <!-- Search -->
        <div class="navbar_search col-5">

            <div class="row form-inline">

                <div class="col-10">
                    <input class="form-control active-pink" type="search" placeholder="Search" style="width: 50%; float: right;">
                </div>

                <div class="col-2">
                    <a href="#" id="search">
                        <i style="color: rgb(255, 48, 79);" class="fas fa-search fa-2x"></i>
                    </a>
                </div>
            </div>
        </div>

        <!-- NavMenu -->
        <!-- 비로그인 상태 -->
        <sec:authorize access="isAnonymous()">
            <div class="col-4">
                <a class="navbar_toggleBtn">
                    <i class="fas fa-bars"></i>
                </a>
                <br>
                <ul class="navbar_menu font-set">
                    <li><a href="/member/loginPage">로그인</a></li>
                    <li><a href="/member/loginPage">회원가입</a></li>
                    <li><a href="#">고객센터</a></li>
                    <li><a href="#">장바구니</a></li>
                </ul>
            </div>
        </sec:authorize>

        <!-- 로그인 상태 -->
        <sec:authorize access="isAuthenticated()">
            <sec:authentication property="principal" var="user"/>
            <div class="col-4">
                <a class="navbar_toggleBtn">
                    <i class="fas fa-bars"></i>
                </a>
                <br>
                <ul class="navbar_menu font-set">
                    <li><a href="/member/my-page">
                        <i>
                            <u class="font-set">${user.memberName}님</u>
                        </i>
                    </a>
                    <li><a href="/member/my-page">마이페이지</a></li>
                    <li><a href="#" onclick="$('#logout-form').submit();">로그아웃</a> <!-- Logout Form -->
                        <form id="logout-form" action="/logout" method="POST">
                            <!-- 포스트방식으로 리퀘스트시 무조건 넣기 -->
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                        </form>
                    </li>
                    <li><a href="#">고객센터</a></li>
                    <li><a href="/member/my-page">장바구니</a></li>
                </ul>
            </div>
        </sec:authorize>

    </nav>
    <div class="col-1"></div>

    <!-- Mega Drop Menu -->
    <div class="row">
        <div class="col-1"></div>

        <div class="col-10">
            <ul class="menu" style="width: 100%;">
                <li><a href="#header">운동화</a>
                    <div>
                        <div class="menu-column">
                            <ul>
                                <li><a href="#">스니커즈</a></li>
                                <li><a href="#">캔버스화</a></li>
                                <li><a href="#">슬립온</a></li>
                            </ul>
                        </div>
                    </div>
                </li>
                <li><a href="#header">스포츠</a>
                    <div>
                        <div class="menu-column">
                            <ul>
                                <li><a href="#">런닝화</a></li>
                                <li><a href="#">축구화</a></li>
                                <li><a href="#">등산화</a></li>
                            </ul>
                        </div>
                    </div>
                </li>
                <li><a href="#header">구두</a>
                    <div>
                        <div class="menu-column">
                            <ul>
                                <li><a href="#">로퍼</a></li>
                                <li><a href="#">레이스업</a></li>
                                <li><a href="#">힐/펌프스</a></li>
                                <li><a href="#">플랫슈즈</a></li>
                            </ul>
                        </div>
                    </div>
                </li>
                <li><a href="#header">부츠</a>
                    <div>
                        <div class="menu-column">
                            <ul>
                                <li><a href="#">첼시부츠</a></li>
                                <li><a href="#">워크부츠</a></li>
                                <li><a href="#">퍼부츠</a></li>
                            </ul>
                        </div>
                    </div>
                </li>
            </ul>
        </div>
    </div>

    <div class="col-1"></div>

    <br>
</header>

<!-- form header -->
<form class="insertform" name="productData" action="/product/product-modify-up?${_csrf.parameterName}=${_csrf.token}" method="POST" enctype="multipart/form-data">
    <div class="form-header">
        <h1>제품 수정 및 재고 수정</h1>
    </div>
    <!-- form body -->
    <div>
        <div class="record">
            <label>제품명 </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="text" class="formText" id="nameProduct" name="productName" value="${product.productName}"/>
        </div>
        <hr style="border: solid 1px #ffb6b6;">
        <div class="record">
            <label>브랜드 </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="text" class="formText" id="brandProduct" name="productBrand" value="${product.productBrand}"/>
        </div>
        <hr style="border: solid 1px #ffb6b6;">
        <div class="record">
            <label>제품 코드</label>&nbsp;&nbsp;
            <input type="text" class="formText" id="codeProduct" name="productCode" value="${product.productCode}" readonly="readonly" style="background-color: #e1e4ee"/>
        </div>
        <hr style="border: solid 1px #ffb6b6;">
        <div class="record">
            <label>제품 가격</label>&nbsp;&nbsp;
            <input type="text" class="formText" id="priceProduct" name="productPrice" value="${product.productPrice}"/>
        </div>
        <hr style="border: solid 1px #ffb6b6;">
    </div>
    <div class="record">
        <label>제품 종류</label>&nbsp;&nbsp;
        <input type="text" class="formText" id="kindProduct" name="productType" value="${product.productType}" readonly="readonly" style="background-color: #e1e4ee"/>
    </div>
    <hr style="border: solid 1px #ffb6b6;">
    <div class="form-group left">
        <label>제품 이미지</label><br/>
        <input type="file" id="choose-file" name="uploadImg" accept=".bmp, .jpg, .jpeg, .png" size="80" style="margin-top: 10px; margin-bottom: 10px;"/>
        <div id="select_img" style="width: 100%; text-align: center">
            <img src="<%=request.getContextPath()%>${product.productImgPath}${product.productImg}"/>
        </div>
    </div>
    <hr style="border: solid 1px #ffb6b6;">

    <div class="form-group left">
        <label>제품 상세 이미지</label><br/>
        <input type="file" id="content-file" name="contentImg" accept=".bmp, .jpg, .jpeg, .png" size="80" style="margin-top: 10px; margin-bottom: 10px;"/>
        <div id="select_content_img" style="width: 100%; text-align: center">
            <img src="<%=request.getContextPath()%>${product.productImgPath}${product.productContent}"/>
        </div>
    </div>

    <hr style="border: solid 1px #ffb6b6;">
    <!-- 재고 등록 -->
    <label>사이즈별 재고 수량</label>
    <div style="margin-top: 10px; margin-bottom: 10px; background-color: rgb(241, 213, 234);">
        <label style="margin-left: 7px;">240</label>
        <input type="number" class="stockInt" name="stock240" value="${product.stock240}" min="0" step="1"/>
        <label style="border-right: solid 3px #ffb6b6;">EA &nbsp;</label> <label style="margin-left: 7px;">245</label>
        <input type="number" class="stockInt" name="stock245" value="${product.stock245}" min="0" step="1">
        <label style="border-right: solid 3px #ffb6b6;">EA &nbsp;</label> <label style="margin-left: 7px;">250</label>
        <input type="number" class="stockInt" name="stock250" value="${product.stock250}" min="0" step="1"/>
        <label style="border-right: solid 3px #ffb6b6;">EA &nbsp;</label> <label style="margin-left: 7px;">255</label>
        <input type="number" class="stockInt" name="stock255" value="${product.stock255}" min="0" step="1"/>
        <label style="border-right: solid 3px #ffb6b6;">EA &nbsp;</label>
    </div>

    <hr style="border: thin 1px #ffb6b6">

    <div style="margin-top: 10px; margin-bottom: 10px; background-color: rgb(238, 226, 235);">
        <label style="margin-left: 7px;">260</label>
        <input type="number" class="stockInt" name="stock260" value="${product.stock260}" min="0" step="1"/>
        <label style="border-right: solid 3px #ffb6b6;">EA &nbsp;</label> <label style="margin-left: 7px;">265</label>
        <input type="number" class="stockInt" name="stock265" value="${product.stock265}" min="0" step="1"/>
        <label style="border-right: solid 3px #ffb6b6;">EA &nbsp;</label> <label style="margin-left: 7px;">270</label>
        <input type="number" class="stockInt" name="stock270" value="${product.stock270}" min="0" step="1"/>
        <label style="border-right: solid 3px #ffb6b6;">EA &nbsp;</label> <label style="margin-left: 7px;">275</label>
        <input type="number" class="stockInt" name="stock275" value="${product.stock275}" min="0" step="1"/>
        <label style="border-right: solid 3px #ffb6b6;">EA &nbsp;</label>
    </div>

    <hr style="border: thin 1px #ffb6b6">

    <div style="margin-top: 10px; margin-bottom: 10px; background-color: rgb(250, 248, 249);">
        <label style="margin-left: 7px;">280</label>
        <input type="number" class="stockInt" name="stock280" value="${product.stock280}" min="0" step="1"/>
        <label style="border-right: solid 3px #ffb6b6;">EA &nbsp;</label> <label style="margin-left: 7px;">285</label>
        <input type="number" class="stockInt" name="stock285" value="${product.stock285}" min="0" step="1"/>
        <label style="border-right: solid 3px #ffb6b6;">EA &nbsp;</label> <label style="margin-left: 7px;">290</label>
        <input type="number" class="stockInt" name="stock290" value="${product.stock290}" min="0" step="1"/>
        <label style="border-right: solid 3px #ffb6b6;">EA &nbsp;</label> <label style="margin-left: 7px;">295</label>
        <input type="number" class="stockInt" name="stock295" value="${product.stock295}" min="0" step="1"/>
        <label style="border-right: solid 3px #ffb6b6;">EA &nbsp;</label>
    </div>

    <hr style="border: solid 1px #ffb6b6;">

    <input type="button" class="insertBtn" onclick="insertCheckfn()" value="수정"/>
    <input type="button" class="insertBtn" onclick="location.href = '/manager/manager-product';" value="홈으로"/>
</form>

<br>
<br>
<hr style="border: solid 1px #ffb6b6;">

<!-- Footer top -->
<footer>
    <div class="row footer-top">

        <div class="col-4"></div>

        <div class="col-2 font-set text-left">
            <p>
                <span>고객센터</span><br> <span>080-1234-5678 · 1588-1234</span><br> <span>주소 : 서울특별시 종로구 청와대로 1</span>
            </p>
            <p>
                <span>월~금 9:00 ~ 12:00 / 13:00 ~ 18:00</span>
            </p>
            <p>
                <span>주말, 공휴일 휴무</span>
            </p>
        </div>

        <div class="col-3 font-set text-left">
            <p>
                <span>(주)에이치케이엘</span><br> <span>대표이사 : 한김이</span><br> <span>주소 : 서울특별시 종로구 청와대로 1</span>
            </p>
            <p>
                <span>사업자등록번호 : 111-11-11111</span> <br> <span>통신판매업신고 : 제 2020-서울종로구-1111호</span>
            </p>
            <p>
                <span>개인정보보호 책임자 : 홍길동</span> <br> <span>이메일 : hklmart@hkl.com</span>
            </p>
        </div>

        <div class="col-3"></div>

    </div>

    <hr>

    <!-- Footer bottom -->
    <div class="row footer-bottom">
        <p class="col-12 text-center">
            <a href="#header">
                <img src="/resources/img/bottom_logo.png">
            </a>
            <br> <br> 본 상품의 상품 이미지 저작권은 ㈜에이치케이엘에 있으며 내용의 무단복제를 금합니다. <br> COPYRIGHT Ⓒ HKL-MART CO,LTD. ALL RIGHTS RESERVED.
        </p>
    </div>
</footer>
</body>

<script>
    const toggleBtn = document.querySelector('.navbar_toggleBtn');
    const search = document.querySelector('.navbar_search');
    const menu = document.querySelector('.navbar_menu');


    toggleBtn.addEventListener('click', () => {
        search.classList.toggle('active');
        menu.classList.toggle('active');
    });

    $(document).ready(function () {
        $('a[href^="#"]').on('click', function (e) {
            e.preventDefault();

            let target = this.hash;
            let $target = $(target);

            $('html, body').stop().animate({
                'scrollTop': $target.offset().top
            }, 900, 'swing', function () {
                window.location.hash = target;
            });
        });
    });

    function insertCheckfn() {

        let productDataForm = document.productData;

        let productName = $("#nameProduct").val();
        let productBrand = $("#brandProduct").val();
        let codeProduct = $("#codeProduct").val();
        let priceProduct = $("#priceProduct").val();
        let kindProduct = $("#kindProduct").val();
        let image = $("#choose-file").val();
        let productContent = $("#content-file").val();

        let checkCode = /^[A-za-z0-9]{1,6}/;
        let checkprice = /^[0-9]+$/;

        if ($("#codeCheckHidden").val() === 0) {
            alert("제품코드를 확인하여 주십시오");
        } else if (productName === '' || productName === null || productName === undefined || productName === 0) {
            alert("제품명을 입력하세요");
        } else if (productBrand === '' || productBrand === null || productBrand === undefined || productBrand === 0) {
            alert("브랜드명을 입력하세요");
        } else if (!checkCode.test(codeProduct)) {
            alert("제품코드를 잘못입력하였습니다");
        } else if (!(codeProduct.length === 6)) {
            alert("제품코드 자릿수 형식이 다릅니다");
        } else if (!checkprice.test(priceProduct)) {
            alert("가격 형식에 문제가 있습니다. 숫자만 입력하여 주십시오");
        } else if (kindProduct === 1) {
            alert("제품종류를 잘못선택하였습니다");
        } else {
            alert("등록하였습니다");
            productDataForm.submit();
        }
    }

    function checkImage(fileName, fileSize) {
        let imageExtension = /([^\s]+(?=\.(jpg|jpeg|png|bmp|JPG|JPEG|PNG|BMP))\.\2)/
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

    function contentCheckImage(fileName, fileSize) {
        let imageExtension = /([^\s]+(?=\.(jpg|jpeg|png|bmp|JPG|JPEG|PNG|BMP))\.\2)/
        if (!imageExtension.test(fileName)) {
            alert("이미지만 등록 가능합니다");
            document.getElementById("content-file").value = "";
            return false;
        }
        if (fileSize >= 10485760) {
            alert("이미지 크기가 너무 큽니다");
            document.getElementById("content-file").value = "";
            return false;
        }
        return true;
    }

    $("#choose-file").change(function () {
        let file = document.getElementById("choose-file");
        let filePath = file.value;
        let filePathSplit = filePath.split('\\');
        let filePathLength = filePathSplit.length;
        let fileName = filePathSplit[filePathLength - 1];
        let fileSize = file.files[0].size;

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

    $("#content-file").change(function () {
        let file = document.getElementById("content-file");
        let filePath = file.value;
        let filePathSplit = filePath.split('\\');
        let filePathLength = filePathSplit.length;
        let fileName = filePathSplit[filePathLength - 1];
        let fileSize = file.files[0].size;

        if (contentCheckImage(fileName, fileSize)) {
            if (this.files && this.files[0]) {
                var reader = new FileReader;
                reader.onload = function (data) {
                    $("#select_content_img img").attr("src", data.target.result).width(300).height(300);
                }
                reader.readAsDataURL(this.files[0]);
            }
        } else {
            document.getElementById("content-file").value = "";
        }
    });

    function codeCheck() {
        let insertCode = $("#codeProduct").val();
        console.log(insertCode);
        if (insertCode.length === 6) {
            $.ajax({
                type: 'post',
                data: insertCode, //서버로 보낼 data
                url: '/codeCheck',
                dataType: 'json', //서버에서 받을 데이터
                contentType: "application/json; charset=UTF-8", //보낼 data 타입을 json으로 설정
                beforeSend: function (xhr) { /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
                    xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
                },
                success: function (data) {
                    if (data.cnt > 0) {
                        document.getElementById('codeCheckBtn').value = "사용불가";
                        document.getElementById('codeCheckBtn').style.background = '#6c757d';
                        $("#codeCheckHidden").val("0");
                    } else {
                        document.getElementById('codeCheckBtn').value = "사용가능";
                        document.getElementById('codeCheckBtn').style.background = '#a7e3ff';
                        $("#codeCheckHidden").val("1");
                    }
                },
                error: function () {
                    alert("Error. 관리자에게 문의하십시오.");
                }
            });
        }
    }

</script>

</html>
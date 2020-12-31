<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>

<%@include file="includes/header.jsp" %>

<title>HKLMart :: 제품 수정</title>

<!-- Body -->
<div class="container-fluid">
    <div class="row">
        <!-- 왼쪽 공백 -->
        <div class="col-1"></div>

        <!-- 사이드 메뉴 -->
        <div class="col-2">
            <ul class="sidebar" id="sidebar">
                <hr/>
                <li><a class="sidebarMain" href="/manager/manager-page">MANAGER</a></li>
                <li><a href="/manager/manager-product">제품 관리 페이지</a></li>
                <li><a href="#orderListPage">주문 전체 내역</a></li>
                <li><a href="/manager/manager-ask-board">회원 문의 내역</a></li>
                <li><a href="/manager/manager-review-list">리뷰 관리 페이지</a></li>
                <li><a href="/manager/manager-member-list">회원 조회 페이지</a></li>
                <li><a href="/product/product-regist">제품 등록 페이지</a></li>
                <li><a class="sidebarMain" href="/member/my-page">MEMBER</a></li>
                <li><a href="/member/my-page">내 정보</a></li>
                <hr/>
            </ul>
        </div>

        <!-- 작업중 -->
        <div class="col-6" style="font-family: Godo; text-align: center; font-weight: bold; z-index: 500">
            <br/><br/>
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
                        <img src="<%=request.getContextPath()%>${product.productImgPath}${product.productImg}" width="300px" height="auto"/>
                    </div>
                </div>
                <hr style="border: solid 1px #ffb6b6;">

                <div class="form-group left">
                    <label>제품 상세 이미지</label><br/>
                    <input type="file" id="content-file" name="contentImg" accept=".bmp, .jpg, .jpeg, .png" size="80" style="margin-top: 10px; margin-bottom: 10px;"/>
                    <div id="select_content_img" style="width: 100%; text-align: center">
                        <img src="<%=request.getContextPath()%>${product.productImgPath}${product.productContent}" width="300px" height="auto"/>
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

                <hr style="border: solid 1px #ffb6b6;">

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

                <hr style="border: solid 1px #ffb6b6;">

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
                <button type="button" class="insertBtn" onclick="DeleteCheckfn()">삭제</button>
                <input type="button" class="insertBtn" onclick="location.href = '/manager/manager-product';" value="홈으로"/>
            </form>
        </div>

        <!-- 오른쪽 공백 -->
        <div class="col-3"></div>
    </div>
</div>

<br><br>
<hr style="border: solid 1px #ffb6b6;">

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

    function DeleteCheckfn() {

        var productDataForm = document.productData;

        productDataForm.action = "/manager/manager-product-delete?${_csrf.parameterName}=${_csrf.token}";

        productDataForm.submit();

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

    function searchFunc() {
        let productSearch = document.getElementById('productSearch').value;
        if (productSearch !== "") {
            $.ajax({
                url: "/ajax/search",
                type: "GET",
                dataType: "json",
                contentType: "application/x-www-form-urlencoded; charset=UTF-8",
                data: {"searchStr": productSearch},
                success: function (data) {
                    var list = data.searchList;
                    $("#productSearch").autocomplete({
                        source: list
                    })
                },
                error: function () {
                    alert("Error. 관리자에게 문의하십시오.");
                },
            });
        }
    }
</script>

<%@include file="includes/footer.jsp" %>
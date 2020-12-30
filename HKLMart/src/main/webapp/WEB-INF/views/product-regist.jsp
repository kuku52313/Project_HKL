<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>

<%@include file="includes/header.jsp" %>

<title>HKLMart :: 제품 등록</title>

<div class="container-fluid">
    <div class="row">
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

        <br>

        <div class="col-6">
            <!-- form header -->
            <input type="hidden" id="codeCheckHidden" value="0"/>
            <form class="insertform" name="productData" action="/product/product-regist-up?${_csrf.parameterName}=${_csrf.token}" method="POST" enctype="multipart/form-data">
                <div class="form-header">
                    <h1>제품 등록</h1>
                </div>
                <!-- form body -->
                <div>
                    <div class="record">
                        <label>제품명 </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="text" class="formText" id="nameProduct" name="productName"/>
                    </div>
                    <hr style="border: solid 1px #ffb6b6;">
                    <div class="record">
                        <label>브랜드 </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="text" class="formText" id="brandProduct" name="productBrand"/>
                    </div>
                    <hr style="border: solid 1px #ffb6b6;">

                    <div class="record">
                        <label>제품 종류</label>&nbsp;&nbsp;
                        <select class="formText" id="kindProduct" name="productType">
                            <option value="1" name="none">- 세부코드를 선택하여주세요 -</option>
                            <option value="1" name="none">-운동화 (10 ~ 29) -</option>
                            <option value="11" name="productType">스니커즈 (11)</option>
                            <option value="12" name="productType">캔버스화 (12)</option>
                            <option value="13" name="productType">슬립온 (13)</option>

                            <option value="1" name="none">-스포츠 (30 ~ 49) -</option>
                            <option value="31" name="productType">런닝화 (31)</option>
                            <option value="32" name="productType">축구화 (32)</option>
                            <option value="33" name="productType">등산화 (33)</option>

                            <option value="1" name="none">-구두 (50 ~ 69) -</option>
                            <option value="51" name="productType">로퍼 (51)</option>
                            <option value="52" name="productType">레이스업 (52)</option>
                            <option value="53" name="productType">힐/펌프스 (53)</option>
                            <option value="54" name="productType">플랫슈즈 (54)</option>

                            <option value="1" name="none">-부츠 (70 ~ 99) -</option>
                            <option value="71" name="productType">첼시부츠 (71)</option>
                            <option value="72" name="productType">워크부츠 (72)</option>
                            <option value="73" name="productType">퍼부츠 (73)</option>
                        </select>
                    </div>
                    <hr style="border: solid 1px #ffb6b6;">
                    <div class="record">
                        <label>제품 코드</label>&nbsp;&nbsp;
                        <input type="text" class="formCode" id="codeProduct" name="productCode" minlength="6" maxlength="6" placeholder="예시 코드 ex) AA0010" onkeyup="codeCheck()"/>
                        <input type="button" id="codeCheckBtn" class="codeCheckBtn" value="등록불가"/>

                    </div>
                    <hr style="border: solid 1px #ffb6b6;">

                    <div class="record">
                        <label>제품 가격</label>&nbsp;&nbsp;
                        <input type="text" class="formText" id="priceProduct" name="productPrice" placeholder="주의사항) ,와 원 미입력 ex) 30000"/>
                    </div>
                    <hr style="border: solid 1px #ffb6b6;">
                </div>
                <div class="form-group left">
                    <label>제품 이미지</label><br/>
                    <input type="file" id="choose-file" name="uploadImg" accept=".bmp, .jpg, .jpeg, .png" size="80" style="margin-top: 10px; margin-bottom: 10px;"/>
                    <div id="select_img" style="width: 100%; text-align: center">
                        <img src=""/>
                    </div>
                </div>
                <hr style="border: solid 1px #ffb6b6;">

                <div class="form-group left">
                    <label>제품 상세 이미지</label><br/>
                    <input type="file" id="content-file" name="contentImg" accept=".bmp, .jpg, .jpeg, .png" size="80" style="margin-top: 10px; margin-bottom: 10px;"/>
                    <div id="select_content_img" style="width: 100%; text-align: center">
                        <img src=""/>
                    </div>
                </div>

                <hr style="border: solid 1px #ffb6b6;">
                <!-- 재고 등록 -->
                <label>사이즈별 재고 수량</label>
                <div style="margin-top: 10px; margin-bottom: 10px; background-color: rgb(241, 213, 234);">
                    <label style="margin-left: 7px;">240</label>
                    <input type="number" class="stockInt" name="stock240" value="0" min="0" step="1"/>
                    <label style="border-right: solid 3px #ffb6b6;">EA &nbsp;</label> <label style="margin-left: 7px;">245</label>
                    <input type="number" class="stockInt" name="stock245" value="0" min="0" step="1">
                    <label style="border-right: solid 3px #ffb6b6;">EA &nbsp;</label> <label style="margin-left: 7px;">250</label>
                    <input type="number" class="stockInt" name="stock250" value="0" min="0" step="1"/>
                    <label style="border-right: solid 3px #ffb6b6;">EA &nbsp;</label> <label style="margin-left: 7px;">255</label>
                    <input type="number" class="stockInt" name="stock255" value="0" min="0" step="1"/>
                    <label style="border-right: solid 3px #ffb6b6;">EA &nbsp;</label>
                </div>

                <hr style="border: solid 1px #ffb6b6;">

                <div style="margin-top: 10px; margin-bottom: 10px; background-color: rgb(238, 226, 235);">
                    <label style="margin-left: 7px;">260</label>
                    <input type="number" class="stockInt" name="stock260" value="0" min="0" step="1"/>
                    <label style="border-right: solid 3px #ffb6b6;">EA &nbsp;</label> <label style="margin-left: 7px;">265</label>
                    <input type="number" class="stockInt" name="stock265" value="0" min="0" step="1"/>
                    <label style="border-right: solid 3px #ffb6b6;">EA &nbsp;</label> <label style="margin-left: 7px;">270</label>
                    <input type="number" class="stockInt" name="stock270" value="0" min="0" step="1"/>
                    <label style="border-right: solid 3px #ffb6b6;">EA &nbsp;</label> <label style="margin-left: 7px;">275</label>
                    <input type="number" class="stockInt" name="stock275" value="0" min="0" step="1"/>
                    <label style="border-right: solid 3px #ffb6b6;">EA &nbsp;</label>
                </div>

                <hr style="border: solid 1px #ffb6b6;">

                <div style="margin-top: 10px; margin-bottom: 10px; background-color: rgb(250, 248, 249);">
                    <label style="margin-left: 7px;">280</label>
                    <input type="number" class="stockInt" name="stock280" value="0" min="0" step="1"/>
                    <label style="border-right: solid 3px #ffb6b6;">EA &nbsp;</label> <label style="margin-left: 7px;">285</label>
                    <input type="number" class="stockInt" name="stock285" value="0" min="0" step="1"/>
                    <label style="border-right: solid 3px #ffb6b6;">EA &nbsp;</label> <label style="margin-left: 7px;">290</label>
                    <input type="number" class="stockInt" name="stock290" value="0" min="0" step="1"/>
                    <label style="border-right: solid 3px #ffb6b6;">EA &nbsp;</label> <label style="margin-left: 7px;">295</label>
                    <input type="number" class="stockInt" name="stock295" value="0" min="0" step="1"/>
                    <label style="border-right: solid 3px #ffb6b6;">EA &nbsp;</label>
                </div>


                <hr style="border: solid 1px #ffb6b6;">
                <input type="button" class="insertBtn" onclick="insertCheckfn()" value="등록"/>
            </form>
        </div>
        <div class="col-3"></div>
    </div>
</div>

<br><br>
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
        } else if (image === '' || image === null || image === undefined || image === 0) {
            alert("제품 이미지를 등록하세요");
        } else if (productContent === '' || productContent === null || productContent === undefined || productContent === 0) {
            alert("제품 상세 이미지를 등록하세요");
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
                let reader = new FileReader;
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
                let reader = new FileReader;
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
        $.ajax({
            url: "/ajax/search",
            type: "GET",
            dataType: "json",
            contentType: "application/x-www-form-urlencoded; charset=UTF-8",
            data: {searchStr: productSearch},
            success: function (data) {
                let dataList = data.searchList;
                $("#productSearch").autocomplete({
                    source: dataList
                });
            },
            error: function () {
                alert("Error. 관리자에게 문의하십시오.");
            },
        });
    }
</script>

</html>
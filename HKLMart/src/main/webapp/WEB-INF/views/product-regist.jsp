<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<%@include file="includes/header.jsp" %>

<body>
    <form class="insertform">
 
        <!-- form header -->
        <div class="form-header">
            <h1>제품 등록 </h1>
        </div>

        <!-- form body -->
        <div>
            <div class="record">
                <label>제품명 </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="text" class="formText" id="nameProduct" name="productName">
            </div>
            <hr style="border: solid 1px #ffb6b6;">
            <div class="record">
                <label>브랜드 </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="text" class="formText" id="brandProduct" name="productBrand">
            </div>
            <hr style="border: solid 1px #ffb6b6;">
            <div class="record">
                <label>제품 코드</label>&nbsp;&nbsp;
                <input type="text" class="formText" id="codeProduct" name="productCode" minlength="6" maxlength="6"
                    placeholder="예시 코드 ex) AA0010">
            </div>
            <hr style="border: solid 1px #ffb6b6;">
            <div class="record">
                <label>제품 가격</label>&nbsp;&nbsp;
                <input type="text" class="formText" id="priceProduct" name="productPrice"
                    placeholder="주의사항) ,와 원 미입력 ex) 30000">
            </div>
            <hr style="border: solid 1px #ffb6b6;">
        </div>
        <div class="record">
            <label>제품 종류</label>&nbsp;&nbsp;
            <select class="formText" id="kindProduct" name="productKind">
                <option value="1" name="none">- 세부코드를 선택하여주세요 -</option>
                <option value="1" name="none">-운동화 (10 ~ 29) -</option>
                <option value="11" name="productKind">스니커즈 (11)</option>
                <option value="12" name="productKind">캔버스화 (12)</option>
                <option value="13" name="productKind">슬립온 (13)</option>
                <option value="1" name="none">-스포츠 (30 ~ 49) -</option>
                <option value="31" name="productKind">런닝화 (31)</option>
                <option value="32" name="productKind">축구화 (32)</option>
                <option value="33" name="productKind">등산화 (33)</option>
                <option value="1" name="none">-구두 (50 ~ 69) -</option>
                <option value="51" name="productKind">로퍼 (51)</option>
                <option value="52" name="productKind">레이스업 (52)</option>
                <option value="53" name="productKind">힐/펌프스 (53)</option>
                <option value="54" name="productKind">플랫슈즈 (54)</option>
                <option value="1" name="none">-부츠 (70 ~ 99) -</option>
                <option value="71" name="productKind">첼시부츠 (71)</option>
                <option value="72" name="productKind">워크부츠 (72)</option>
                <option value="73" name="productKind">퍼부츠 (73)</option>
            </select>
        </div>
        <hr style="border: solid 1px #ffb6b6;">
        <div class="record">
            <label>제품 설명</label>

        </div>
        <div>
            <textarea id="content" name="productContent" cols="90" row="10" style="border-color:#ffb6b6 ;"></textarea>

            <div class="form-group left">
                <label for="contentFile" class="fileTitle"></label>
                <input type="file" id="choose-file" size="80" style="margin-top: 10px; margin-bottom: 10px;">
            </div>
        </div>
        <hr style="border: solid 1px #ffb6b6;">
        <!-- 재고 등록 -->
        <label>사이즈별 재고 수량</label>
        <div style="margin-top: 10px; margin-bottom: 10px; background-color: rgb(241, 213, 234);">
            <label style="margin-left: 7px; ">240</label>
            <input type="number" class="stockInt" id="" name="stock240" value="0" min="0" step="1">
            <label style="border-right: solid 3px #ffb6b6;">EA &nbsp;</label>
            <label style="margin-left: 7px;">245</label>
            <input type="number" class="stockInt" id="" name="stock245" value="0" min="0" step="1">
            <label style="border-right: solid 3px #ffb6b6;">EA &nbsp;</label>
            <label style="margin-left: 7px;">250</label>
            <input type="number" class="stockInt" id="" name="stock250" value="0" min="0" step="1">
            <label style="border-right: solid 3px #ffb6b6;">EA &nbsp;</label>
            <label style="margin-left: 7px;">255</label>
            <input type="number" class="stockInt" id="" name="stock255" value="0" min="0" step="1">
            <label style="border-right: solid 3px #ffb6b6;">EA &nbsp;</label>
        </div>

        <hr style="border: thin 1px #ffb6b6">

        <div style="margin-top: 10px; margin-bottom: 10px; background-color: rgb(238, 226, 235);">
            <label style="margin-left: 7px;">260</label>
            <input type="number" class="stockInt" id="" name="stock260" value="0" min="0" step="1">
            <label style="border-right: solid 3px #ffb6b6;">EA &nbsp;</label>
            <label style="margin-left: 7px;">265</label>
            <input type="number" class="stockInt" id="" name="stock265" value="0" min="0" step="1">
            <label style="border-right: solid 3px #ffb6b6;">EA &nbsp;</label>
            <label style="margin-left: 7px;">270</label>
            <input type="number" class="stockInt" id="" name="stock270" value="0" min="0" step="1">
            <label style="border-right: solid 3px #ffb6b6;">EA &nbsp;</label>
            <label style="margin-left: 7px;">275</label>
            <input type="number" class="stockInt" id="" name="stock275" value="0" min="0" step="1">
            <label style="border-right: solid 3px #ffb6b6;">EA &nbsp;</label>
        </div>

        <hr style="border: thin 1px #ffb6b6 ">

        <div style="margin-top: 10px; margin-bottom: 10px; background-color: rgb(250, 248, 249);">
            <label style="margin-left: 7px;">280</label>
            <input type="number" class="stockInt" id="" name="stock280" value="0" min="0" step="1">
            <label style="border-right: solid 3px #ffb6b6;">EA &nbsp;</label>
            <label style="margin-left: 7px;">285</label>
            <input type="number" class="stockInt" id="" name="stock285" value="0" min="0" step="1">
            <label style="border-right: solid 3px #ffb6b6;">EA &nbsp;</label>
            <label style="margin-left: 7px;">290</label>
            <input type="number" class="stockInt" id="" name="stock290" value="0" min="0" step="1">
            <label style="border-right: solid 3px #ffb6b6;">EA &nbsp;</label>
            <label style="margin-left: 7px;">295</label>
            <input type="number" class="stockInt" id="" name="stock295" value="0" min="0" step="1">
            <label style="border-right: solid 3px #ffb6b6;">EA &nbsp;</label>
        </div>


        <hr style="border: solid 1px #ffb6b6;">
        <button class="insertBtn" onclick="insertCheckfn()">등록</button>
    </form>    
        
    <br>
    <br>
    <hr style="border: solid 1px #ffb6b6;">
</body>

    <script>

        function insertCheckfn() {
            console.log($("#codeProduct").val());

            var codeProduct = $("#codeProduct").val();
            var priceProduct = $("#priceProduct").val();
            var kindProduct = $("#kindProduct").val();



            var checkCode = /^[A-za-z0-9]{1,6}/;
            var checkprice = /^[0-9]+$/;


            if ((!checkCode.test(codeProduct))) {
                alert("제품코드를 잘못입력하였습니다")

            } else if ((!codeProduct.length == 6)) {
                alert("제품코드 자릿수 형식이 다릅니다")

            }
            else if ((!checkprice.test(priceProduct))) {
                alert("가격 형식에 문제가 있습니다. 숫자만 입력하여 주십시오")

            } else if (kindProduct == 1) {
                alert("제품종류를 잘못선택하였습니다")

            }
            else {
                alert("등록성공")
                submit()
            }
        }
    </script>

<%@include file="includes/footer.jsp" %>
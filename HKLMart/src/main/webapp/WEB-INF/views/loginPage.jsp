<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<html>

<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <title>sign in/sign up</title>
    <link rel="stylesheet" href="/resources/css/loginCss.css">
</head>

<body>
    <input type="hidden" id="idCheckHidden" value="0">
    <input type="hidden" id="pwCheckHidden" value="0">
    <input type="hidden" id="pwckCheckHidden" value="0">
    <input type="hidden" id="emailCheckHidden" value="0">
    <input type="hidden" id="nameCheckHidden" value="0">
    <input type="hidden" id="telCheckHidden" value="0">

    <div class="wrap">
        <div class="form-wrap">
        
        	<!-- toggle -->
            <div class="button-wrap">
                <div id="btn"></div>
                <button type="button" class="togglebtn" onclick="login()">LOG IN</button>

                <button type="button" class="togglebtn" onclick="register()">REGISTER</button>
            </div>
            
            <div class="logo" style="text-align: center;">
                <a href=""> <img src="resources/img/login/twitter_header_photo_1.png"></a>
            </div>
			
			<!-- Login -->
            <form class="input-group" id="login" action="/login" method="POST">
                <input type="text" class="input-field_log" name="memberId" placeholder="User ID" required>

                <input type="password" class="input-field_log" name="memberPw" placeholder="Enter Password" required>
                
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

                <button class="submit">Login</button>
            </form>
            
			<!-- Sign up -->
            <form id="register" action="" name="member" class="input-group">

                <input type="text" class="input-check" id="userId" name="memberId" placeholder="User ID ex) hkl123" onchange="idCheck()" required>

                <input type="button" id="idCheckBtn" class="idCheckBtn" value="ID Check">

                <input type="password" class="input-field" onkeyup="checkPwfn()" id="userPw" name="memberPw" placeholder="PW : 알파벳 대,소문자,특수문자,숫자 포함" required>
               
                &nbsp; &nbsp;

                <input type="button" id="pwCheckBtn" class="pwCheckBtn">
                
                <input type="password" class="input-field" onkeyup="checkPwfn()" id="userPwCk" name="memberPwCheck" placeholder="PW 확인" required>
                    
                &nbsp;&nbsp;

                <input type="button" id="pwckCheckBtn" class="pwckCheckBtn">

                <input type="text" class="input-field" id="userEmail" onkeyup="checkEmailfn()" name="memberEmail" placeholder="Email ex) qwer1@hkl.com" required>

                &nbsp;&nbsp;

                <input type="button" id="emailCheckBtn" class="emailCheckBtn">

                <input type="text" class="input-field" id="userName" name="memberName" onkeyup="checkNamefn()" placeholder="name ex) 홍길동" required>
                
                &nbsp; &nbsp;

                <input type="button" id="nameCheckBtn" class="nameCheckBtn">

                <input type="text" class="input-field" id="userTel" name="memberTel" onkeyup="telCheckfn()" placeholder="Tel ex) 010-1234-5678" required>

                &nbsp; &nbsp;

                <input type="button" id="telCheckBtn" class="telCheckBtn">

                <input type="button" onclick="memberCheckfn()" class="submit" value="REGISTER">


            </form>
        </div>
    </div>

</body>

<script>

    const x = document.getElementById("login");
    const y = document.getElementById("register");
    const z = document.getElementById("btn");






    function login() {
        x.style.left = "50px";
        y.style.left = "450px";
        z.style.left = "0";
    }

    function register() {
        x.style.left = "-400px";
        y.style.left = "50px";
        z.style.left = "110px";
    }

    function idCheck() {
        var userId = $("#userId").val();
        var checkId = /^[a-zA-Z0-9]{2,15}$/;

        if (!checkId.test(userId)) {
            document.getElementById('idCheckBtn').value = "사용불가";
            document.getElementById('idCheckBtn').style.background = '#6c757d';
            $("#idCheckHidden").val("0");
        }
        else if (checkId.test(userId)) {
            document.getElementById('idCheckBtn').value = "사용가능";
            document.getElementById('idCheckBtn').style.background = '#a7e3ff';
            $("#idCheckHidden").val("1");
        }

    }

    function checkPwfn() {

        var userPw = $("#userPw").val();


        var checkPwSik = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,15}$/;

        if ((checkPwSik.test(userPw))) {
            $('#pwCheckBtn').css("border", "");
            $('#pwCheckBtn').css("border", "solid 5px #007bff");
            $("#pwCheckHidden").val("1");
        }

        if (!(checkPwSik.test(userPw))) {
            $('#pwCheckBtn').css("border", "");
            $('#pwCheckBtn').css("border", "solid 5px rgb(245, 99, 99)");
            $("#pwCheckHidden").val("0");
        }

        var checkpw = $("#userPw").val() === $("#userPwCk").val();


        if (checkpw) {
            $('#pwckCheckBtn').css("border", "");
            $('#pwckCheckBtn').css("border", "solid 5px #007bff");
            $("#pwckCheckHidden").val("1");
        } else {
            $('#pwckCheckBtn').css("border", "");
            $('#pwckCheckBtn').css("border", "solid 5px rgb(245, 99, 99)");
            $("#pwckCheckHidden").val("0");
        }



    }

    function checkEmailfn() {

        var userEmail = $("#userEmail").val();

        var checkEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;



        if ((checkEmail.test(userEmail))) {
            $('#emailCheckBtn').css("border", "");
            $('#emailCheckBtn').css("border", "solid 5px #007bff");
            $("#emailCheckHidden").val("1");
        }
        if (!(checkEmail.test(userEmail))) {
            $('#emailCheckBtn').css("border", "");
            $('#emailCheckBtn').css("border", "solid 5px rgb(245, 99, 99)");
            $("#emailCheckHidden").val("0");
        }
    }



    function checkNamefn() {

        var userName = $("#userName").val();


        var checkName = /^[가-힣]{2,5}$/;

        if ((checkName.test(userName))) {
            $('#nameCheckBtn').css("border", "");
            $('#nameCheckBtn').css("border", "solid 5px #007bff");
            $("#nameCheckHidden").val("1");
        }

        if (!(checkName.test(userName))) {
            $('#nameCheckBtn').css("border", "");
            $('#nameCheckBtn').css("border", "solid 5px rgb(245, 99, 99)");
            $("#nameCheckHidden").val("0");
        }

    }

    function telCheckfn() {



        var userTel = $("#userTel").val();


        var checkTel = /^[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}$/

        if (checkTel.test(userTel)) {
            $('#telCheckBtn').css("border", "");
            $('#telCheckBtn').css("border", "solid 5px #007bff");
            $("#telCheckHidden").val("1");
        }


        if (!checkTel.test(userTel)) {
            $('#telCheckBtn').css("border", "");
            $('#telCheckBtn').css("border", "solid 5px rgb(245, 99, 99)");
            $("#telCheckHidden").val("0");
        }
    }

    function memberCheckfn() {

        if (
            ($("#idCheckHidden").val() == 1 &&
                $("#pwCheckHidden").val() == 1 &&
                $("#pwckCheckHidden").val() == 1 &&
                $("#emailCheckHidden").val() == 1 &&
                $("#nameCheckHidden").val() == 1 &&
                $("#telCheckHidden").val() == 1)
        ) { alert("회원가입을 환영합니다") }
        else {
            alert("양식에 오류가있습니다. 다시입력하여 주십시오.")
        }
    }


</script>


</html>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>로그인</title>
        <link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" href="Login.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500&display=swap" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
        <script src="https://kit.fontawesome.com/8855691a8d.js" crossorigin="anonymous"></script>
<%
    request.setCharacterEncoding("UTF-8");
%>
<script defer>
    function checkValue(){
        inputForm = eval("documnet.loginInfo");
        if(!inputForm.user_id.value){
            alert("아이디를 입력하세요");
            inputForm.user_id.focus();
            return false;
        }
        if(!inputForm.user_pw.value){
            alert("비밀번호를 입력하세요");
            inputForm.user_pw.focus();
            return false;
        }
    }
    
    // 회원가입 버튼 클릭 시 회원가입 화면으로 이동
    function goSignup() {
        location.href = "signUp.jsp";
    }
</script>
    </head>

    <body>
        <nav class="navbar navbar-expand-lg bg-body-tertiary">
            <a class="navlogo" href="Main.html">
                Logo
            </a>
        </nav>

        <div class="frontbar">
            <div class="loginbar active">로그인 하기</div>
            <div class="signbar">회원가입 하기</div>
            <div class="findbar">ID/PW 찾기</div>
        </div>

        <div class="navout">
            <h1>로그인</h1>
            <div class="input">
                <div class="input-group flex-nowrap">
                    <span class="input-group-text" id="addon-wrapping"><i class="fa-solid fa-user"></i></span>
                    <input type="text" class="form-control" placeholder="Username" aria-label="Username" aria-describedby="addon-wrapping">
                </div>
                <div class="input-group flex-nowrap">
                    <span class="input-group-text" id="addon-wrapping"><i class="fa-solid fa-key"></i></span>
                    <input type="password" class="form-control" id="floatingPassword" placeholder="Password">
                </div>
                <i class="fa-solid fa-eye"></i>
            </div>
           
            <div class="form-check">
                <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
                <label class="form-check-label" for="flexCheckDefault">로그인 유지하기</label>
            </div>
            
            <div class="social">
                <img src="./Img/kakao.png" href="#" alt="kakao">
                <img src="./Img/Naver.png" href="#" alt="naver">
                <img src="./Img/Google.png" href="#" alt="google">
            </div>
            <button type="button" class="btn btn-primary">로그인</button>
        </div>

        

    </body>
</html>

<html>
<head>
<%
    request.setCharacterEncoding("UTF-8");
%>
<meta charset="UTF-8">
<title>로그인</title>
<script defer>
    function checkValue(){
        inputForm = eval("documnet.loginInfo");
        if(!inputForm.user_id.value){
            alert("아이디를 입력하세요");
            inputForm.user_id.focus();
            return false;
        }
        if(!inputForm.user_pw.value){
            alert("비밀번호를 입력하세요");
            inputForm.user_pw.focus();
            return false;
        }
    }
    
    // 회원가입 버튼 클릭 시 회원가입 화면으로 이동
    function goSignup() {
        location.href = "signUp.jsp";
    }
</script>
</head>
<body>
    <form name="loginInfo" method="post" action="../proc/loginProc.jsp" onsubmit="return checkValue()">
        <table>
            <tr>
                <td>아이디</td>
                <td><input type="text" name="user_id"></td>
            </tr>
            <tr>
                <td>비밀번호</td>
                <td><input type="password" name="user_pw"></td>
            </tr>
        </table>
        <br>
        <input type="submit" value="로그인"/>
        <input type="button" value="회원가입" onclick="goSignup()"/>
    </form>
    
    <%
        String msg=request.getParameter("msg");
    
        if(msg!=null && msg.equals("0")){
            out.println("<br>");
            out.println("<font color='red' size='5'>비밀번호를 확인해주세요.</font>");
        }
        else if(msg!=null && msg.equals("-1")){
            out.println("<br>");
            out.println("<font color='red' size='5'>아이디를 확인해주세요.</font>");
        }
    %>
</body>
</html>
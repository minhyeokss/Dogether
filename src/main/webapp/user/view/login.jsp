<%@ page contentType="text/html; charset=UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Dogether</title>
<%@ include file="/header.jsp"%>
<link rel="stylesheet" href="login.css">
<script defer>
    function checkValue() {
        inputForm = eval("document.loginInfo");
        if (!inputForm.user_id.value) {
            alert("아이디를 입력하세요");
            inputForm.user_id.focus();
            return false;
        }
        if (!inputForm.user_pw.value) {
            alert("비밀번호를 입력하세요");
            inputForm.user_pw.focus();
            return false;
        }
    }
</script>
</head>
<body>
  <!-- Navigation Bar -->
  <nav class="navbar navbar-expand-lg bg-body-tertiary">
    <a class="navlogo" href="/Dogether">Dogether</a>
  </nav>
  <div class="frontbar">
    <a href="login.jsp"><div class="loginbar active">로그인 하기</div></a> <a href="signUp.jsp"><div class="signbar">회원가입 하기</div></a> <a href=""><div class="findbar">ID/PW 찾기</div></a>
  </div>

  <div class="navout">
    <h1>로그인</h1>
    <form name="loginInfo" action="../proc/loginProc.jsp" method="post" onsubmit="return checkValue()">
      <div class="input">
        <div class="input-group flex-nowrap">
          <span class="input-group-text" id="addon-wrapping"><i class="fa-solid fa-user"></i></span>
          <input type="text" name="user_id" class="form-control" placeholder="ID" aria-label="UserID" aria-describedby="addon-wrapping">
        </div>
        <div class="input-group flex-nowrap">
          <span class="input-group-text" id="addon-wrapping"><i class="fa-solid fa-key"></i></span>
          <input type="password" name="user_pw" class="form-control" id="floatingPassword" placeholder="Password">
        </div>
        <i class="fa-solid fa-eye"></i>
      </div>
      <div class="form-check">
        <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
        <label class="form-check-label" for="flexCheckDefault">로그인 유지하기</label>
      </div>
      <div class="social">
        <!--
        <img src="./Img/kakao.png" href="#" alt="kakao"> <img src="./Img/Naver.png" href="#" alt="naver"> <img src="./Img/Google.png" href="#" alt="google">
        -->
      </div>
      <input type="submit" value="로그인" class="btn btn-primary">
    </form>
  </div>
</body>
</html>
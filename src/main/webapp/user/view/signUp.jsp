<%@ page contentType="text/html; charset=UTF-8" %>
<!doctype html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Place with your dog</title>
        <link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" href="signup.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500&display=swap" rel="stylesheet">
        <script defer src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
        <script defer src="https://kit.fontawesome.com/8855691a8d.js" crossorigin="anonymous"></script>
        <script defer>
  //필수 정보 입력되었는지 확인
  function checkValue() {
    if (!document.userInfo.user_id.value) {
      alert("아이디를 입력하세요.");
      return false;
    }

    if (!document.userInfo.user_pw.value) {
      alert("비밀번호를 입력하세요.");
      return false;
    }

    // 비밀번호 동일한지 확인
    if (document.userInfo.user_pw.value != document.userInfo.user_pwcheck.value) {
      alert("비밀번호를 동일하게 입력하세요.");
      return false;
    }

    if (!document.userInfo.user_email.value) {
      alert("이메일을 입력하세요.");
      return false;
    }

    // 이메일 인증 구현
    //if(!document.userInfo.emailCode.value){
    //  alert("이메일 인증 코드를 입력하세요.");
    //  return false;
    //}
    console.log(document.userInfo.user_name.value);
    console.log(2);
    if (!document.userInfo.user_name.value) {
      alert("이름을 입력하세요.");
      return false;
    }

    if (!document.userInfo.user_nickname.value) {
      alert("닉네임을 입력하세요.");
      return false;
    }
/*
    if (!document.userInfo.birthyy.value) {
      alert("연도를 입력하세요.");
      return false;
    }

    if (!document.userInfo.birthdd.value) {
      alert("날짜를 입력하세요.");
      return false;
    }*/
    document.form.submit();
  }

  // 취소 버튼 클릭 시 로그인 화면으로 이동
  function goLogin() {
    location.href = "login.jsp";
  }
</script>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg bg-body-tertiary">
            <div class="navlogo">
                Logo
            </div>
        </nav>
        <div class="frontbar">
            <div class="loginbar">로그인 하기</div>
            <div class="signbar active">회원가입 하기</div>
            <div class="findbar">ID/PW 찾기</div>
        </div>

        <div class="navout">
            
        </div>

        <br><br>
        <div>
            
            <div class="container_2">
                <h2 class="join">회원가입</h2>
                <br>
                <form method="post" action="../proc/signUpProc.jsp" name="userInfo" onsubmit="return checkValue()">
                <div class="input-group mb-3">
                    <span class="input-group-text" id="basic-addon1">아이디</span>
                    <input type="text" class="form-control" placeholder="Username" aria-label="Username" aria-describedby="basic-addon1" name="user_id">
                </div>
                <br>

                <div class="userCheck">
                    <div class="input-group mb-3">
                        <span class="input-group-text" id="basic-addon1">비밀번호</span>
                        <input type="password" class="form-control" placeholder="Userpassword" aria-label="Username" aria-describedby="basic-addon1" name="user_pw">
                    </div>
                    <i class="fa-solid fa-eye"></i>
                </div>
                
                <div class="userCheck">
                    <div class="input-group mb-3">
                        <span class="input-group-text" id="basic-addon1">비밀번호 확인</span>
                        <input type="password" class="form-control" placeholder="##" aria-label="Username" aria-describedby="basic-addon1" name="user_pwcheck">
                    </div>
                    <i class="fa-solid fa-eye"></i>
                </div>
                
                <br>

                <div class="icon_botton">
                    <div class="input-group mb-3">
                        <span class="input-group-text" id="basic-addon1">이메일 등록</span>
                        <input type="text" class="form-control" placeholder="##" aria-label="Username" aria-describedby="basic-addon1" name="user_email">
                    </div>
                        <input type="checkbox" class="btn-check" id="btn-check" autocomplete="off">
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <label class="btn btn-primary" for="btn-check">인증 요청</label>
                </div>
                

                <div class="userCheck">
                    <div class="input-group mb-3">
                        <span class="input-group-text" id="basic-addon1">인증 코드</span>
                        <input type="text" class="form-control" placeholder="##" aria-label="Username" aria-describedby="basic-addon1" name="emailCode">
                    </div>
                    <i class="fa-solid fa-circle-check" style="color: #20a117;"></i>&nbsp;
                    <i class="fa-solid fa-circle-xmark" style="color: #fa0000;"></i>
                </div>
                
                <br>
                <div class="input-group mb-3">
                    <span class="input-group-text" id="basic-addon1">이름</span>
                    <input type="text" class="form-control" placeholder="##" aria-label="Username" aria-describedby="basic-addon1" name="user_name">
                </div>
                <div class="input-group mb-3">
                    <span class="input-group-text" id="basic-addon1">닉네임</span>
                    <input type="text" class="form-control" placeholder="##" aria-label="Username" aria-describedby="basic-addon1" name="user_nickname">
                </div>
                <br>
                <div class="input-group mb-3">
                    <span class="input-group-text" id="basic-addon1">생년월일</span>
                    <input type="date" class="form-control" id="start" value="2018-07-22" min="2018-01-01" max="2018-12-31" name="user_birthday">
                </div>
                <br>
                
                <div class="input-group mb-3">
                    <span class="input-group-text Gender" id="basic-addon1">성별</span>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" id="inlineRadio1" value="option1" name="user_gender" value="M" checked>
                        <label class="form-check-label" for="inlineRadio1">남성</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" id="inlineRadio2" value="option2" name="user_gender" value="F">
                        <label class="form-check-label" for="inlineRadio2">여성</label>
                    </div>
                </div>
                
                <div class="userCheck">
                    <span class="input-group-text type" id="basic-addon1">회원 종류</span>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="user_grade" id="inlineRadio1" value="1">
                        <label class="form-check-label" for="inlineRadio1">판매자 회원</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="user_grade" id="inlineRadio2" value="2">
                        <label class="form-check-label" for="inlineRadio2">일반 회원</label>
                    </div>
                </div>
                
                <br><br>
                <span class="sss">
                    <h6>회원 약관 동의(필수)</h6>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <label class="btn btn-outline-secondary" for="btn-check-2-outlined">보기</label><br>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="checkbox" id="inlineCheckbox1" value="option1">
                        <label class="form-check-label" for="inlineCheckbox1">동의함</label>
                    </div>
                </span>
                <br>
                <span class="userCheck">
                    <h6>개인 정보 수집 및 이용 동의(필수)</h6>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <label class="btn btn-outline-secondary" for="btn-check-2-outlined">보기</label><br>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="checkbox" id="inlineCheckbox1" value="option1">
                        <label class="form-check-label" for="inlineCheckbox1">동의함</label>
                    </div>
                </span>
                <br>
                <span class="icon-botton">
                    <input type="checkbox" class="btn-check" id="btn-check" autocomplete="off">
                    <label class="btn btn-primary" for="btn-check">회원가입</label>
                </span>
                </form>
            </div>
        </div>
</body>
</html>

<html>
<head>
<script defer>
  //필수 정보 입력되었는지 확인
  function checkValue() {
    if (!document.userInfo.user_id.value) {
      alert("아이디를 입력하세요.");
      return false;
    }

    if (!document.userInfo.user_pw.value) {
      alert("비밀번호를 입력하세요.");
      return false;
    }

    // 비밀번호 동일한지 확인
    if (document.userInfo.user_pw.value != document.userInfo.user_pwcheck.value) {
      alert("비밀번호를 동일하게 입력하세요.");
      return false;
    }

    if (!document.userInfo.user_email.value) {
      alert("이메일을 입력하세요.");
      return false;
    }

    // 이메일 인증 구현
    //if(!document.userInfo.emailCode.value){
    //  alert("이메일 인증 코드를 입력하세요.");
    //  return false;
    //}
	console.log(document.userInfo.user_name.value);
	console.log(2);
    if (!document.userInfo.user_name.value) {
      alert("이름을 입력하세요.");
      return false;
    }

    if (!document.userInfo.user_nickname.value) {
      alert("닉네임을 입력하세요.");
      return false;
    }
/*
    if (!document.userInfo.birthyy.value) {
      alert("연도를 입력하세요.");
      return false;
    }

    if (!document.userInfo.birthdd.value) {
      alert("날짜를 입력하세요.");
      return false;
    }*/
    document.form.submit();
  }

  // 취소 버튼 클릭 시 로그인 화면으로 이동
  function goLogin() {
    location.href = "login.jsp";
  }
</script>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
  <h1>회원가입</h1>
  <hr>
  <!-- 입력한 값 전송 -->
  <form method="post" action="../proc/signUpProc.jsp" name="userInfo"
    onsubmit="return checkValue()">
    <table>
      <tr>
        <td id="title">아이디</td>
        <td>
        <input type="text" name="user_id"> 
        <input type="button"
          value="중복확인">
          </td>
      </tr>

      <tr>
        <td id="title">비밀번호</td>
        <td><input type="password" name="user_pw"></td>
      </tr>

      <tr>
        <td id="title">비밀번호 확인</td>
        <td><input type="password" name="user_pwcheck"></td>
      </tr>

      <tr>
        <td id="title">이메일 등록</td>
        <td><input type="text" name="user_email"> <input
          type="button" value="인증 요청"></td>
      </tr>

      <tr>
        <td id="title">인증 코드</td>
        <td><input type="text" name="emailCode"></td>
      </tr>

      <tr>
        <td id="title">이름</td>
        <td><input type="text" name="user_name"></td>
      </tr>

      <tr>
        <td id="title">닉네임</td>
        <td><input type="text" name="user_nickname"> <input
          type="button" value="중복확인"></td>
      </tr>

      <tr>
        <td id="title">생년월일</td>
        <td><input type="text" name="birthyy" maxlength="4"
          placeholder="년(4자)" size="6"> <select name="birthmm">
            <option value="">월</option>
            <option value="01">1</option>
            <option value="02">2</option>
            <option value="03">3</option>
            <option value="04">4</option>
            <option value="05">5</option>
            <option value="06">6</option>
            <option value="07">7</option>
            <option value="08">8</option>
            <option value="09">9</option>
            <option value="10">10</option>
            <option value="11">11</option>
            <option value="12">12</option>
        </select> <input type="text" name="birthdd" maxlength="2" placeholder="일"
          size="4"></td>
      </tr>

      <tr>
        <td id="title">성별</td>
        <td><input type="radio" name="user_gender" value="M" checked>남
          <input type="radio" name="user_gender" value="F">여</td>
      </tr>

      <tr>
        <td id="title">회원 종류</td>
        <td><input type="radio" name="user_grade" value="1" checked>판매자
          회원 <input type="radio" name="user_grade" value="2">일반 회원</td>
      </tr>

    </table>

    <br> <input type="submit" value="가입" /> <input type="button"
      value="취소" onclick="goLogin()">
  </form>
</body>
</html>
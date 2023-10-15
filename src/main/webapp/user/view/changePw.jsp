<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dogether</title>
<%@ include file="/header.jsp"%>
<link rel="stylesheet" href="/Dogether/index.css">
</head>
<body>
  <!-- Global Navigation Bar -->
  <jsp:include page="/globalNavigationBar.jsp"></jsp:include>

  <h2>비밀번호 변경</h2>
  <form action="../proc/changePwProc.jsp" method="post">
    현재 비밀번호 :
    <input type="password" name="currentPw">
    <br> <br> 변경할 비밀번호 :
    <input type="password" name="newPw">
    <br> <br> 변경할 비밀번호 확인 :
    <input type="password" name="newPwConfirm">
    <br> <br>
    <input type="submit" value="변경">
  </form>
  <hr>
  <input type="button" value="취소" onclick="location.href='/Dogether'">
</body>
</html>
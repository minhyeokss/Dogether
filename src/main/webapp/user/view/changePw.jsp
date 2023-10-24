<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dogether</title>
<%@ include file="/header.jsp"%>
<link rel="stylesheet" href="changePw.css">
</head>
<body>
  <!-- Global Navigation Bar -->
  <jsp:include page="/globalNavigationBar.jsp"></jsp:include>
  
  <!-- Side Bar -->
  <div class="mylist">
    <h2>마이 페이지</h2>
    <div class="list">
      <a href="/Dogether/user/view/myInfo.jsp"><h4>내 정보 수정</h4></a>
      <a href="/Dogether/user/view/changePw.jsp"><h4 class="active">비밀번호 변경</h4></a>
      <a href="/Dogether/favoritePlace/favorite_place.jsp"><h4>관심 장소 모아보기</h4></a>
      <a href="/Dogether/favoritePost/favorite_post.jsp"><h4>관심 글 모아보기</h4></a>
      <a href="/Dogether/myHistory/my_history.jsp"><h4>활동 내역</h4></a>
    </div>
  </div>

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
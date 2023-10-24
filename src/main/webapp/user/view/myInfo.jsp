<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dogether</title>
<%@ include file="/header.jsp"%>
<link rel="stylesheet" href="myInfo.css">
</head>
<body>
  <!-- Global Navigation Bar -->
  <jsp:include page="/globalNavigationBar.jsp"></jsp:include>

  <jsp:useBean id="userDao" class="user.UserDao" />
  <jsp:useBean id="userDto" class="user.UserDto" />

  <%
  request.setCharacterEncoding("UTF-8");
  %>
  
  <!-- Side Bar -->
  <div class="mylist">
    <h2>마이 페이지</h2>
    <div class="list">
      <a href="/Dogether/user/view/myInfo.jsp"><h4 class="active">내 정보 수정</h4></a>
      <a href="/Dogether/user/view/changePw.jsp"><h4>비밀번호 변경</h4></a>
      <a href="/Dogether/favoritePlace/favorite_place.jsp"><h4>관심 장소 모아보기</h4></a>
      <a href="/Dogether/favoritePost/favorite_post.jsp"><h4>관심 글 모아보기</h4></a>
      <a href="/Dogether/myHistory/my_history.jsp"><h4>활동 내역</h4></a>
    </div>
  </div>
  
  <%
  String user_id = (String) session.getAttribute("sessionID");
  if (user_id == null) {
      response.sendRedirect("login.jsp");
  } else {
      try {
          userDto = userDao.getUser(user_id);
          if (userDto != null) {
  %>
  <h2>내 정보 조회</h2>
  <table border="1">
    <tr>
      <td>닉네임</td>
      <td><%=userDto.getUser_nickname()%></td>
    </tr>
    <tr>
      <td>이메일</td>
      <td><%=userDto.getUser_email()%></td>
    </tr>
    <tr>
      <td>아이디</td>
      <td><%=userDto.getUser_id()%></td>
    </tr>
    <tr>
      <td>이름</td>
      <td><%=userDto.getUser_name()%></td>
    </tr>
    <tr>
      <td>생년월일</td>
      <td>개발중</td>
    </tr>
    <tr>
      <td>성별</td>
      <td><%=userDto.getUser_gender()%></td>
    </tr>
    <tr>
      <td>회원 종류</td>
      <td><%=userDto.getUser_grade()%></td>
    </tr>
  </table>
  <%
  }
  } catch (Exception e) {
  e.printStackTrace();
  }
  }
  %>
  <hr>
  <input type="button" value="메인으로" onclick="location.href='/Dogether'">
  <input type="button" value="회원탈퇴" onclick="location.href='resign.jsp'" />
</body>
</html>
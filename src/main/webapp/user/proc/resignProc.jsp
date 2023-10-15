<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dogether</title>
</head>
<body>
  <jsp:useBean id="userDao" class="user.UserDao" />

  <%
  String session_id = (String) session.getAttribute("sessionID");
  String user_pw = request.getParameter("user_pw");

  int check = userDao.deleteUser(session_id, user_pw);

  if (check == 1) {
  	session.invalidate();
  %>
  <br>
  <br>
  <b>회원정보가 삭제되었습니다.</b>
  <br>
  <br>
  <input type="button" value="확인" onclick="javascript:window.location='/Dogether'">
  <%
  } else {
  %>
  <script>
            alert("비밀번호가 맞지 않습니다.");
            history.go(-1);
        </script>
  <%
  }
  %>
</body>
</html>
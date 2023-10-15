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
  request.setCharacterEncoding("UTF-8");

  String user_id = request.getParameter("user_id");
  String user_pw = request.getParameter("user_pw");

  int check = userDao.loginCheck(user_id, user_pw);
  String msg = "";
  if (check == 1) {
      session.setAttribute("sessionID", user_id);
      msg = "/Dogether";
  } else if (check == 0) { // 비밀번호가 틀린 경우
      msg = "../view/login.jsp?msg=0";
  } else { // 아이디가 틀린 경우
      msg = "../view/login.jsp?msg=-1";
  }
  response.sendRedirect(msg);
  %>
</body>
</html>
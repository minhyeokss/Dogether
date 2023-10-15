<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script defer>
    function changePw() {
        if (!document.userInfo.user_id.value) {
            alert("아이디를 입력하세요.");
            return false;
        }
    }
</script>
<meta charset="UTF-8">
<title>Dogether</title>
</head>
<body>
  <jsp:useBean id="userDao" class="user.UserDao" />
  <jsp:useBean id="userDto" class="user.UserDto" />

  <%
  String currentPw = request.getParameter("currentPw");
  String newPw = request.getParameter("newPw");
  String newPwConfirm = request.getParameter("newPwConfirm");

  String session_id = (String) session.getAttribute("sessionID");
  userDto = userDao.getUser(session_id);

  try {
      if (userDto != null && currentPw.equals(userDto.getUser_pw()) && !newPw.isEmpty()
      && newPw.equals(newPwConfirm)) {
          userDao.updatePw(session_id, newPw);
          out.println("<script>alert('비밀번호가 변경되었습니다.'); location.href='/Dogether';</script>");
      } else if (!currentPw.equals(userDto.getUser_pw())) {
          out.println("<script>alert('비밀번호를 확인해주세요.'); history.go(-1);</script>");
      } else if (newPw.isEmpty()) {
          out.println("<script>alert('새 비밀번호를 입력해주세요.'); history.go(-1);</script>");
      } else if (!newPw.equals(newPwConfirm)) {
          out.println("<script>alert('비밀번호가 일치하지 않습니다. 다시 시도해주세요.'); history.go(-1);</script>");
      } else {
          out.println("<script>alert('비밀번호 변경에 실패했습니다. 다시 시도해주세요.'); history.go(-1);</script>");
      }
  } catch (Exception e) {
      out.println("<script>alert('오류가 발생했습니다. 다시 시도해주세요.'); history.go(-1);</script>");
      e.printStackTrace();
  }
  %>
</body>
</html>
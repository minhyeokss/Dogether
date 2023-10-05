<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index.jsp</title>
</head>
<body>
<h1>메인화면</h1>
<br><br>
<input type="button" value="로그인" onclick="location.href='user/view/login.jsp'">
<input type="button" value="회원가입" onclick="location.href='user/view/signUp.jsp'">
<input type="button" value="비밀번호변경" onclick="location.href='user/view/changePw.jsp'">
<input type="button" value="로그아웃" onclick="location.href='user/proc/logoutProc.jsp'"/>
<% session = request.getSession(); %>
<% System.out.println(session.getAttribute("SessionID")); %>
</body>
</html>
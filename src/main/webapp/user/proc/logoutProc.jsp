<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dogether</title>
</head>
<body>
  <%
  session.invalidate();
  response.sendRedirect("/Dogether");
  %>
</body>
</html>
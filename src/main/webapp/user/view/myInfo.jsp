<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="user.UserDAO"%>
<%@ page import="user.UserBean"%>
<jsp:useBean id="userBean" class="user.UserBean" />
<jsp:useBean id="dao" class="user.UserDAO" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 정보 조회</title>
</head>
<body>
  <%
  request.setCharacterEncoding("UTF-8");
  String id = (String) session.getAttribute("sessionID");
  if (id == null) {
      response.sendRedirect("login.jsp");
  } else {
      try {
          userBean = dao.getUser(id);
          if (userBean != null) {
  %>
  <h2>내 정보 조회</h2>
  <table border="1">
    <tr>
      <td>닉네임</td>
      <td><%=userBean.getUser_nickname()%></td>
    </tr>
    <tr>
      <td>이메일</td>
      <td><%=userBean.getUser_email()%></td>
    </tr>
    <tr>
      <td>아이디</td>
      <td><%=userBean.getUser_id()%></td>
    </tr>
    <tr>
      <td>이름</td>
      <td><%=userBean.getUser_name()%></td>
    </tr>
    <tr>
      <td>생년월일</td>
      <td>개발중</td>
    </tr>
    <tr>
      <td>성별</td>
      <td><%=userBean.getUser_gender()%></td>
    </tr>
    <tr>
      <td>회원 종류</td>
      <td><%=userBean.getUser_grade()%></td>
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

  <input type="button" value="뒤로가기" onclick="location.href='../../index.jsp'">
</body>
</html>
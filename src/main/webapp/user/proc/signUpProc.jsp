<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="user.UserBean"%>
<%@ page import="user.UserDAO"%>
<!DOCTYPE html>
<html>
<head>
<script>
function goLogin() {
    location.href = "../view/login.jsp";
}
</script>
<meta charset="UTF-8">
<title>회원가입 처리</title>
</head>
<body>
  <%
  request.setCharacterEncoding("utf-8");
  %>
  <jsp:useBean id="userBean" class="user.UserBean" />
  <jsp:useBean id="dao" class="user.UserDAO" />
  <jsp:setProperty property="*" name="userBean" />
  <%
  try {
    dao.insertUser(userBean);
  } catch (Exception e) {
    out.println("오류 발생: " + e.getMessage());
  }
  %>
  <h1>회원가입 정보를 확인하세요.</h1>
  <h3><%=userBean.getUser_nickname()%>님 가입을 축하드립니다.
  </h3>
  <table>
    <tr>
      <td id="title">아이디</td>
      <td><%=userBean.getUser_id()%></td>
    </tr>
    <tr>
      <td id="title">비밀번호</td>
      <td><%=userBean.getUser_pw()%></td>
    </tr>
    <tr>
      <td id="title">이메일</td>
      <td><%=userBean.getUser_email()%></td>
    </tr>
    <tr>
      <td id="title">이름</td>
      <td><%=userBean.getUser_name()%></td>
    </tr>
    <tr>
      <td id="title">닉네임</td>
      <td><%=userBean.getUser_nickname()%></td>
    </tr>
    <tr>
      <td id="title">생일</td>
      <td><%=userBean.getUser_birthday()%>
      </td>
    </tr>
    <tr>
      <td id="title">성별</td>
      <td><%=userBean.getUser_gender()%></td>
    </tr>
  </table>
  <br>
  <input type="button" value="확인" onclick="goLogin()">
</body>
</html>
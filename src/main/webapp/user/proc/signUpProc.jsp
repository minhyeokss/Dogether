<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.text.DateFormat"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<!DOCTYPE html>
<html>
<head>
<script>
    function goLogin() {
        location.href = "../view/login.jsp";
    }
</script>
<meta charset="UTF-8">
<title>Dogether</title>
</head>
<body>
  <jsp:useBean id="userDao" class="user.UserDao" />
  <jsp:useBean id="userDto" class="user.UserDto" />

  <%
  request.setCharacterEncoding("utf-8");
  %>
  <%
  // <jsp:setProperty property="*" name="userDto" /> 코드를 사용하면 
  // JSP는 요청의 모든 파라미터를 자동으로 UserDto 객체에 설정 
  // 이 때 "user_birthday" 파라미터 값인 "2018-07-22"를 
  // java.util.Date 객체로 변환하는데 실패하여 오류가 발생

  String user_id = request.getParameter("user_id");
  String user_pw = request.getParameter("user_pw");
  String user_email = request.getParameter("user_email");
  String user_name = request.getParameter("user_name");
  String user_nickname = request.getParameter("user_nickname");
  String user_gender = request.getParameter("user_gender");

  String strDate = request.getParameter("user_birthday");
  DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
  Date date = format.parse(strDate);

  userDto.setUser_id(user_id);
  userDto.setUser_pw(user_pw);
  userDto.setUser_email(user_email);
  userDto.setUser_name(user_name);
  userDto.setUser_nickname(user_nickname);
  userDto.setUser_gender(user_gender);
  userDto.setUser_birthday(date);
  %>
  <%
  try {
      userDao.insertUser(userDto);
  } catch (Exception e) {
      out.println("signUpProc.jsp : " + e.getMessage());
  }
  %>
  <h1>회원가입 정보를 확인하세요.</h1>
  <h3><%=userDto.getUser_nickname()%>님 가입을 축하드립니다.
  </h3>
  <table>
    <tr>
      <td id="title">아이디</td>
      <td><%=userDto.getUser_id()%></td>
    </tr>
    <tr>
      <td id="title">비밀번호</td>
      <td><%=userDto.getUser_pw()%></td>
    </tr>
    <tr>
      <td id="title">이메일</td>
      <td><%=userDto.getUser_email()%></td>
    </tr>
    <tr>
      <td id="title">이름</td>
      <td><%=userDto.getUser_name()%></td>
    </tr>
    <tr>
      <td id="title">닉네임</td>
      <td><%=userDto.getUser_nickname()%></td>
    </tr>
    <tr>
      <td id="title">생일</td>
      <td><%=userDto.getUser_birthday()%>
      </td>
    </tr>
    <tr>
      <td id="title">성별</td>
      <td><%=userDto.getUser_gender()%></td>
    </tr>
  </table>
  <br>
  <input type="button" value="확인" onclick="goLogin()">
</body>
</html>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="user.UserDAO"%>
<%@ page import="user.UserBean"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<%@ page import="java.io.PrintWriter"%>
<jsp:useBean id="userBean" class="user.UserBean" />
<jsp:useBean id="dao" class="user.UserDAO" />
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
<title>Insert title here</title>
</head>
<body>
  <%
  String currentPw = request.getParameter("currentPw");
  String newPw = request.getParameter("newPw");

  session = request.getSession();
  String id = (String) session.getAttribute("sessionID");

  userBean = dao.getUser(id);

  // 출력 스트림을 설정
  response.setContentType("text/html;charset=UTF-8");
  PrintWriter useout = response.getWriter();

  // 현재 비밀번호가 일치하면 새로운 비번으로 업뎃
  try {
      if (userBean != null && currentPw.equals(userBean.getUser_pw()) && !newPw.isEmpty()) {
          dao.updatePw(id, newPw);
          out.println("<script>alert('비밀번호가 변경되었습니다.'); location.href='../../index.jsp';</script>");
      } else if (!currentPw.equals(userBean.getUser_pw())) {
          out.println("<script>alert('비밀번호가 맞지 않습니다. 다시 시도해주세요.'); history.go(-1);</script>");
      } else if (newPw.isEmpty()) {
          out.println("<script>alert('새 비밀번호를 입력해주세요. 다시 시도해주세요.'); history.go(-1);</script>");
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
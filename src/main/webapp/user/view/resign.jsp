<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
    function checkValue() {
        if (!document.resign.user_pw.value) {
            alert("비밀번호를 입력하지 않았습니다.");
            return false;
        }
        return true;
    }
</script>
<meta charset="UTF-8">
<title>Dogether</title>
<%@ include file="/header.jsp"%>
<link rel="stylesheet" href="/Dogether/index.css">
</head>
<body>
  <!-- Global Navigation Bar -->
  <jsp:include page="/globalNavigationBar.jsp"></jsp:include>

  <form name="resign" method="post" action="../../user/proc/resignProc.jsp" onsubmit="return checkValue()">
    <table>
      <tr>
        <td>비밀번호</td>
        <td>
          <input type="password" name="user_pw" maxlength="50">
        </td>
      </tr>
    </table>
    <br>
    <input type="button" value="취소" onclick="location.href='/Dogether'">
    <input type="submit" value="탈퇴" />
  </form>
</body>
</html>
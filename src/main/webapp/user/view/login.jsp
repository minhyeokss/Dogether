<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<%
    request.setCharacterEncoding("UTF-8");
%>
<meta charset="UTF-8">
<title>로그인</title>
<script defer>
    function checkValue(){
        inputForm = eval("documnet.loginInfo");
        if(!inputForm.user_id.value){
            alert("아이디를 입력하세요");
            inputForm.user_id.focus();
            return false;
        }
        if(!inputForm.user_pw.value){
            alert("비밀번호를 입력하세요");
            inputForm.user_pw.focus();
            return false;
        }
    }
    
    // 회원가입 버튼 클릭 시 회원가입 화면으로 이동
    function goSignup() {
        location.href = "signUp.jsp";
    }
</script>
</head>
<body>
    <form name="loginInfo" method="post" action="../proc/loginProc.jsp" onsubmit="return checkValue()">
        <table>
            <tr>
                <td>아이디</td>
                <td><input type="text" name="user_id"></td>
            </tr>
            <tr>
                <td>비밀번호</td>
                <td><input type="password" name="user_pw"></td>
            </tr>
        </table>
        <br>
        <input type="submit" value="로그인"/>
        <input type="button" value="회원가입" onclick="goSignup()"/>
    </form>
    
    <%
        String msg=request.getParameter("msg");
    
        if(msg!=null && msg.equals("0")){
            out.println("<br>");
            out.println("<font color='red' size='5'>비밀번호를 확인해주세요.</font>");
        }
        else if(msg!=null && msg.equals("-1")){
            out.println("<br>");
            out.println("<font color='red' size='5'>아이디를 확인해주세요.</font>");
        }
    %>
</body>
</html>
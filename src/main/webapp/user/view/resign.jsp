<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <script type="text/javascript">
        // 비밀번호 미입력시 경고창
        function checkValue(){
            if(!document.resignProc.pw.value){
                alert("비밀번호를 입력하지 않았습니다.");
                return false;
            }
        }
    </script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form name="deleteform" method="post" action="index.jsp?contentPage=user/proc/resignProc.jsp"
        onsubmit="return checkValue()">
 
        <table>
            <tr>
                <td>비밀번호</td>
                <td><input type="password" name="pw" maxlength="50"></td>
            </tr>
        </table>
        
        <br> 
        <input type="button" value="취소" onclick="javascript:window.location='../../index.jsp'">
        <input type="submit" value="탈퇴" /> 
    </form>
</body>
</html>
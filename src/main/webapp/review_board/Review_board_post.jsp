<!-- JavaBean ��� -->

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>�ı� �Խ���</h1>
	<form name="review_board_post" method="post" action="Review_board_postproc.jsp">
	
		�ӽ� user_id/nickname �Է°� �ޱ�<br>
		<input type="text" name="user_id" placeholder="user_id �ӽ�"/><br>
		<input type="text" name="user_nickname" placeholder="nickname �ӽ�"/><br><br>
	
	
		<input type="text" name="post_title" size="40" placeholder="������ �Է����ּ���"/><br><br>
		<textarea placeholder="������ �Է����ּ���" name="post_content" style="width:80%;height:200px;"></textarea><br><br>
		<input type="text" size="40" placeholder="���� �߰� (������ �ִ� 20����� ��� �����մϴ�)"/>
		<input type="file" name="post_fileName"><br><br>
		<input type="reset" value="�ۼ����"/>
		<input type="submit" value="����ϱ�"/>
	</form>
</body>
</html>
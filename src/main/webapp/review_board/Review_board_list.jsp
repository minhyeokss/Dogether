<!-- JavaBean ��� -->

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*" %>
<%@ page import="review_boardbean.*" %>
<%!
	int totalRecord = 0; // �� ���� ����
	int numPerPage = 3; // �� ������ �� ������ �� ����
	int totalPage = 0; // �� ������ ��
	int nowPage = 0; // ���� ������
	int beginPerPage = 0; // �������� ���� ��ȣ
	int pagePerBlock = 2; // �� �� ������ ��
	int totalBlock = 0; // �� �� ��
	int nowBlock = 0; // ���� ��
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.container{
		display:flex;
		flex-wrap: wrap;
	}
	.place{
		margin: 20px;
	}
	
	/* ���� ���� �Ϻθ� �������� */
	.content {
		display: inline-block;
		width: 200px;
		white-space: nowrap;
		overflow: hidden;
		text-overflow: ellipsis;
	}
</style>
</head>
<script>
	function check(){
		if(document.search.keyWord.value == ""){
			alert("�˻�� �Է��ϼ���.");
			document.search.keyWord.focus();
			return;
		}
		document.search.submit();
	}
</script>
<body>
<jsp:useBean id="dao" class="review_boardbean.BoardDao"/>
<%
	request.setCharacterEncoding("euc-kr");
%>
	<h1>�ı� �Խ���</h1>
	<form method="post" name="search" action="Review_board_list.jsp">
		<div style="float: right;">
			<select name="option" size="1">
				<option value="t" selected>����</option>
				<option value="c">����</option>
				<option value="tc">����+����</option>
				<option value="n">�г���</option>
			</select> 
			<input type="text" name="searchWord" placeholder="�˻�" />
			<input type="submit" value="�˻�" onClick="check()"/>
		</div>
	</form>
	<br><br>
	<div class="container">
	
	<%	
		String option =request.getParameter("option");
		String searchWord = request.getParameter("searchWord");
		
		Vector vector = (Vector)dao.getReviewList(option, searchWord);
		
		totalRecord = vector.size();
		totalPage = (int)Math.ceil((double)totalRecord / numPerPage);
		
		if(request.getParameter("nowPage") != null )
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		
		if(request.getParameter("nowBlock") != null )
			nowBlock = Integer.parseInt(request.getParameter("nowBlock"));
		
		beginPerPage = nowPage * numPerPage;
		totalBlock =(int) Math.ceil((double)totalPage / pagePerBlock);
		
		for (int i=beginPerPage; i<beginPerPage + numPerPage; i++) {
			if(i == totalRecord)
				break;
			BoardDto dto = (BoardDto)vector.get(i);
	
	%>
		<div class="place">
			<div class="image">
				<!-- image �־���� --> <!-- �׸� Ŭ���ص� �ǰԲ� ����� -->
				<img src="../img/img1.jpg" width="200px" heigth="200px" /> 
			</div>
			<div class="text">
				<a href="Review_board_detail.jsp?post_id=<%=dto.getPost_id() %>"><h3><%= dto.getPost_title() %></h3></a>
				<table border="1" width="200px">
					<tr>
						<td colspan="2"><%= dto.getUser_nickname()%></td>
					</tr>
					<tr>
						<td><%=dto.getPost_create_date() %></td>
						<td><%=dto.getPost_views() %></td>
					</tr>
					<tr>
						<td colspan="2"><div class="content"><%=dto.getPost_content() %></div></td>
					</tr>
				</table>
			</div>
		</div>
	<%
		}
	%>
		
	</div><br><br>
	<input type="button" value="�Խñ� �ۼ��ϱ�" onClick="location='Review_board_post.jsp'"/><br>
	<%
		if(nowBlock > 0){
	%>
			<a href="Review_board_list.jsp?nowPage=<%= pagePerBlock*(nowBlock-1)%>&nowBlock=<%=nowBlock-1%>">����</a>
	<%
		}
	
		for(int i=0; i<pagePerBlock; i++) {
			if((nowBlock* pagePerBlock) + i == totalPage)
				break;
	%>
			<a href="Review_board_list.jsp?nowPage=<%=(nowBlock*pagePerBlock)+i%>&nowBlock=<%=nowBlock%>"><%=(nowBlock*pagePerBlock)+1 +i %></a>
	<%
		}
		
		if(nowBlock + 1 <totalBlock){
	%>
			<a href="Review_board_list.jsp?nowPage=<%=pagePerBlock*(nowBlock+1)%>&nowBlock=<%=nowBlock+1%>">����</a>
	<%
		}
	%>
</body>
</html>
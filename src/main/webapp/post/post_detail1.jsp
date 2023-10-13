<!-- JavaBean 방식 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="post.*" %>
<%@ page import="user.*" %>
<%@ page import="comment.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="postDto" class="post.PostDto"/>
<jsp:useBean id="postDao" class="post.PostDao"/>



	<h1>후기 게시판</h1>
	
	<%
		int post_id = Integer.parseInt(request.getParameter("post_id"));
		postDto = postDao.getPost(post_id);
	%>
	
	<table bgcolor="#E2E2E2" width="80%" align="center">
		<tr align="center">
			<td colspan="3"><h3><%=postDto.getPost_title() %></h3></td>
		</tr>
		<tr>
			<td align="left" width="70%">조회수 <%= postDto.getPost_views() %></td>
			<td align="center" width="15%" style="border-right:1px solid black;"><%= postDto.getUser_nickname() %></td>
			<td align="center" width="15%"><%= postDto.getPost_create_date() %></td>
		</tr>		
		<tr>
			<hr/>
			<td colspan="3" height="300px" style="border-top:1px solid black;"><%= postDto.getPost_content() %></td>
		</tr>
		<tr>
			<td colspan="3"><div>이미지<img src=""/></div></td>
		</tr>
	</table>
	
	<br><br>
	
<%
	String user_id = postDto.getUser_id();
	
	if(user_id.equals(session.getAttribute("sessionID"))) {
%>
	<input type="button" value="수정하기" onClick="location='post_update.jsp?post_id=<%=postDto.getPost_id() %>'"/>
	<input type="button" value="삭제하기" onClick="location='post_delete.jsp?post_id=<%=postDto.getPost_id() %>'"/>
<%
	}
%>
	
	<input type="button" value="게시글 좋아요 하기"/>
	<input type="button" value="목록" onClick="location='post_list.jsp'"/>
	
	<br><br>
	
	
<!-- 댓글 등록하기 -->	
	<jsp:useBean id="commentDto" class="comment.CommentDto"/>
	<jsp:setProperty property="post_id" name="commentDto"/>
	<jsp:useBean id="commentDao" class="comment.CommentDao"/>
	<jsp:useBean id="userDao" class="user.UserDao"/>
<%
	Vector vec = (Vector)commentDao.getComment(postDto.getPost_id());
	
	String userId = (String)session.getAttribute("sessionID");

	UserDto user = (UserDto)userDao.getUser(userId);
	String now_user_nickname = user.getUser_nickname();
%>

	<h3>댓글 <%=vec.size()%> 개</h3>
	<form method="post" action="../comment/comment.jsp" >
		<input type="hidden" value="<%=postDto.getPost_id()%>" name="post_id"/>
		<input type="text" value="<%=now_user_nickname %>" name="user_nickname" readonly/>
		<textarea placeholder="댓글을 입력해주세요" name="comment_content" style="width:60%;height:20px;"></textarea>
		<input type="submit" value="댓글 달기"/>
	</form><br>
	<table width="80%" align="center" style="border-collapse:collapse;">

<!-- 댓글 보여주기 -->
<%
	for(int i=0; i<vec.size(); i++){
		CommentDto comment = (CommentDto)vec.get(i);
%>
		<tr style="border-top:1px solid black;">
			<td ><%=comment.getUser_nickname() %></td>
			<td align="right"><%=comment.getComment_create_date() %></td>
		</tr>
		<tr >
			<td><h5><%=comment.getComment_content() %></h5></td>
<%
	String comment_user_id = comment.getUser_id();
	if(comment_user_id.equals(session.getAttribute("sessionID"))) {
%>
			<td align="right">
				<input type="button" value="수정" onClick="location='../comment/comment_update.jsp?comment_id=<%=comment.getComment_id() %>'"/><br>
				<input type="button" value="삭제" onClick="location='../comment/comment_delete.jsp?comment_id=<%=comment.getComment_id()%>'"/>
			</td>
<%
	}
%>
		</tr>
<%
	}
%>
	</table>
	
</body>
</html>
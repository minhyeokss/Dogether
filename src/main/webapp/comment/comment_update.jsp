<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dogether</title>
<%@ include file="/header.jsp"%>
<link rel="stylesheet" href="/Dogether/index.css">
</head>
<body>
  <!-- Global Navigation Bar -->
  <jsp:include page="/globalNavigationBar.jsp"></jsp:include>
  
  <jsp:useBean id="commentDao" class="comment.CommentDao" />
  <jsp:useBean id="commentDto" class="comment.CommentDto" />

  <h1>후기 게시판</h1>
  <hr>
  <h3>댓글 수정하기</h3>
  <br>
  <br>
  <%
  int comment_id = Integer.parseInt(request.getParameter("comment_id"));
  commentDto = commentDao.getCommentUpdate(comment_id);
  int board_id = Integer.parseInt(request.getParameter("board_id"));
  %>
  <form method="post" action="comment_updateproc.jsp">
    <input type="hidden" name="post_id" value="<%=commentDto.getPost_id()%>" />
    <input type="hidden" name="comment_id" value="<%=comment_id%>" />
    <input type="hidden" name="board_id" value="<%=board_id%>" />
    <input type="text" name="user_nickname" value="<%=commentDto.getUser_nickname()%>" readonly />
    <br> <br>
    <textarea rows="3" style="width: 50%;" name="comment_content"><%=commentDto.getComment_content()%></textarea>
    <br> <br>
    <input type="submit" value="수정하기" />
  </form>
</body>
</html>
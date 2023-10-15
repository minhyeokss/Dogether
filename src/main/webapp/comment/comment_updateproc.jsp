<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dogether</title>
</head>
<body>
  <jsp:useBean id="commentDao" class="comment.CommentDao" />
  <jsp:useBean id="commentDto" class="comment.CommentDto" />
  
  <%
  request.setCharacterEncoding("UTF-8");
  %>
  <jsp:setProperty property="*" name="commentDto" />
  <%
  commentDao.updateComment(commentDto);
  int board_id = Integer.parseInt(request.getParameter("board_id"));
  response.sendRedirect(
          "../post/post_detail.jsp?board_id=" + board_id + "&post_id=" + commentDto.getPost_id());
  %>
</body>
</html>
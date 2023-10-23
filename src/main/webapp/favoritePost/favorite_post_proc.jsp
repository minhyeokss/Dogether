<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dogether</title>
</head>
<body>
  <jsp:useBean id="favoritePostDao" class="favoritepost.FavoritePostDao" />
  <jsp:useBean id="favoritePostDto" class="favoritepost.FavoritePostDto" />

  <%
  request.setCharacterEncoding("UTF-8");
  %>
  <jsp:setProperty property="*" name="favoritePostDto" />
  <%
  favoritePostDao.setFavoritePost(favoritePostDto);
  response.sendRedirect(
          "../post/post_detail.jsp?board_id=" + favoritePostDto.getBoard_id() + "&post_id=" + favoritePostDto.getPost_id());
  %>
</body>
</html>
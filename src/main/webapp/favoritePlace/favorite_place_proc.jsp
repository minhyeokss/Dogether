<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dogether</title>
</head>
<body>
  <jsp:useBean id="favoritePlaceDao" class="favoriteplace.FavoritePlaceDao" />
  <jsp:useBean id="favoritePlaceDto" class="favoriteplace.FavoritePlaceDto" />

  <%
  request.setCharacterEncoding("UTF-8");
  %>
  <jsp:setProperty property="*" name="favoritePlaceDto" />
  <%
  favoritePlaceDao.setFavoritePlace(favoritePlaceDto);
  response.sendRedirect(
          "../place/place_detail.jsp?place_category=" + request.getParameter("place_category") + "&place_id=" + favoritePlaceDto.getPlace_id());
  %>
</body>
</html>
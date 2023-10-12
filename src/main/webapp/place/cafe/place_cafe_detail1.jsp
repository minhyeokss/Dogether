<%@ page import="java.util.*"%>
<%@ page import="place.*"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="dao" class="place.PlaceDAO" />
<jsp:useBean id="place" class="place.PlaceBean" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <%
  String p_id = request.getParameter("p_id");
  place = dao.readPlace(p_id);
  %>
  <%=place.getPlace_category()%><br>
  <%=place.getPlace_name()%><br>
  <%=place.getPlace_score()%><br>
  <%=place.getPlace_call()%><br>
  <%=place.getPlace_address()%><br>
  <%=place.getPlace_homepage()%><br>

</body>
</html>
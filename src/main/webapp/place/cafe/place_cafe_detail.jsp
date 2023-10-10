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
  <%=place.getP_category() %><br>
  <%=place.getP_name() %><br>
  <%=place.getP_score() %><br>
  <%=place.getP_call() %><br>
  <%=place.getP_address() %><br>
  <%=place.getP_homepage() %><br>

</body>
</html>
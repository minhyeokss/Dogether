<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="place.*"%>
<%!int totalRecord = 0; // 총 글의 갯수
    int numPerPage = 6; // 한 페이지 당 보여질 글 갯수
    int totalPage = 0; // 총 페이지 수
    int nowPage = 0; // 현재 페이지
    int beginPerPage = 0; // 페이지별 시작 번호
    int pagePerBlock = 5; // 블럭 당 페이지 수
    int totalBlock = 0; // 총 블럭 수
    int nowBlock = 0; // 현재 블럭%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Dogether</title>
<%@ include file="/header.jsp"%>
<link rel="stylesheet" href="favorite_place.css">
</head>
<body>
  <!-- Global Navigation Bar -->
  <jsp:include page="/globalNavigationBar.jsp"></jsp:include>

  <jsp:useBean id="favoritePlaceDao" class="favoriteplace.FavoritePlaceDao" />
  <jsp:useBean id="placeDto" class="place.PlaceDto" />

  <%
  request.setCharacterEncoding("UTF-8");
  %>

  <!-- Side Bar -->
  <div class="mylist">
    <h2>마이 페이지</h2>
    <div class="list">
      <a href="/Dogether/user/view/myInfo.jsp"><h4>내 정보 수정</h4></a>
      <a href="/Dogether/user/view/changePw.jsp"><h4>비밀번호 변경</h4></a>
      <a href="/Dogether/favoritePlace/favorite_place.jsp"><h4 class="active">관심 장소 모아보기</h4></a>
      <a href="/Dogether/favoritePost/favorite_post.jsp"><h4>관심 글 모아보기</h4></a>
      <a href="/Dogether/myHistory/my_history.jsp"><h4>활동 내역</h4></a>
    </div>
  </div>

  <!-- Favorite Post -->
  <div class="navout">
    <div class="favotitle">관심 장소 모아보기</div>
    <div class="favocount">
      내가 관심 표시한 장소 <b>총 31개</b>
    </div>
    <div class="favolists">
      <%
      String session_id = (String) session.getAttribute("sessionID");
      Vector<PlaceDto> vector = favoritePlaceDao.getFavoritePlaceList(session_id);

      totalRecord = vector.size();
      totalPage = (int) Math.ceil((double) totalRecord / numPerPage);

      if (request.getParameter("nowPage") != null) {
          nowPage = Integer.parseInt(request.getParameter("nowPage"));
      }
      if (request.getParameter("nowBlock") != null) {
          nowBlock = Integer.parseInt(request.getParameter("nowBlock"));
      }
      beginPerPage = nowPage * numPerPage;
      totalBlock = (int) Math.ceil((double) totalPage / pagePerBlock);

      for (int i = beginPerPage; i < beginPerPage + numPerPage; i++) {
          if (i == totalRecord)
              break;
          placeDto = vector.get(i);
      %>
      <a href="#" class="card mb-3">
        <div class="row g-0">
          <div class="col-md-2">
            <img src="./image/DownDog.jpg" class="img-fluid rounded-start" alt="...">
          </div>
          <div class="col-md-10">
            <div class="card-body">
              <h4 class="card-title"><%=placeDto.getPlace_name() %></h4>
              <p class="card-text">
                <%=placeDto.getPlace_category()%><br><%=placeDto.getPlace_address() %> | 조회수 : <%=placeDto.getPlace_likes() %>
              </p>
            </div>
          </div>
        </div>
      </a>
      <%
      }
      %>
    </div>

    <!-- Paging -->
    <nav aria-label="Page navigation example">
      <ul class="pagination">
        <li class="page-item"><a class="page-link" href="#" aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
        </a></li>
        <li class="page-item active" aria-current="page"><a class="page-link" href="#">1</a></li>
        <li class="page-item"><a class="page-link" href="#">2</a></li>
        <li class="page-item"><a class="page-link" href="#">3</a></li>
        <li class="page-item"><a class="page-link" href="#">4</a></li>
        <li class="page-item"><a class="page-link" href="#">5</a></li>
        <li class="page-item"><a class="page-link" href="#">6</a></li>
        <li class="page-item"><a class="page-link" href="#">7</a></li>
        <li class="page-item"><a class="page-link" href="#">8</a></li>
        <li class="page-item"><a class="page-link" href="#">9</a></li>
        <li class="page-item"><a class="page-link" href="#">10</a></li>
        <li class="page-item"><a class="page-link" href="#" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
        </a></li>
      </ul>
    </nav>
  </div>
</body>
</html>
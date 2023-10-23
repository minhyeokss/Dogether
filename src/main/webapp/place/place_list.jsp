<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="place.*"%>
<%!int totalRecord = 0; // 총 글의 갯수
    int numPerPage = 8; // 한 페이지 당 보여질 글 갯수
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
<link rel="stylesheet" href="place_list.css">
</head>
<body>
  <!-- Global Navigation Bar -->
  <jsp:include page="/globalNavigationBar.jsp"></jsp:include>

  <jsp:useBean id="placeDao" class="place.PlaceDao" />
  <jsp:useBean id="placeDto" class="place.PlaceDto" />
  <%
  String place_category = request.getParameter("place_category");
  %>

  <!-- Side Bar -->
  <jsp:include page="/place/placeSideBar.jsp">
    <jsp:param name="place_category" value="<%=place_category%>"></jsp:param>
  </jsp:include>

  <!-- Filter -->
  <div class="checkwrap">
    <div class="checkgps">
      현재 검색 위치 :
      <%=session.getAttribute("location")%><br>
      <div class="gpschange">검색 위치 변경</div>
    </div>
    <div class="check">
      <div class="checkbox">
        편의시설
        <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
        <label class="form-check-label" for="flexCheckDefault">주차장</label>
      </div>
      <div class="checkbox">
        위치
        <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
        <label class="form-check-label" for="flexCheckDefault">실내</label>
        <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
        <label class="form-check-label" for="flexCheckDefault">실외</label>
      </div>
      <div class="checkbox">
        영업시간
        <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
        <label class="form-check-label" for="flexCheckDefault">토요일 영업</label>
        <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
        <label class="form-check-label" for="flexCheckDefault">일요일 영업</label>
      </div>
      <div class="checkbox">
        사이즈
        <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
        <label class="form-check-label" for="flexCheckDefault">소형견</label>
        <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
        <label class="form-check-label" for="flexCheckDefault">중형견</label>
        <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
        <label class="form-check-label" for="flexCheckDefault">대형견</label>
      </div>
    </div>
  </div>

  <!-- Place List -->
  <div class="checkresult">
    <div class="resultcheck">
      <div class="checked active">최신순</div>
      <div class="checkeded">|</div>
      <div class="checked">별점 높은순</div>
      <div class="checkeded">|</div>
      <div class="checked">별점 낮은순</div>
    </div>

    <div class="results">
      <%
      Vector<PlaceDto> vector = placeDao.getPlaceList(place_category);
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
          if (i == totalRecord) {
              break;
          }
          placeDto = vector.get(i);
      %>
      <div class="cards">
        <a href="place_detail.jsp?place_id=<%=placeDto.getPlace_id()%>" class="card mb-3" style="max-width: 600px; margin-top: 40px;">
          <div class="row g-0">
            <div class="col-md-4">
              <img src="./image/Cafe<%=(i + 1) % 6 + 1%>.jpg" class="img-fluid rounded-start" alt="...">
            </div>
            <div class="col-md-8">
              <div class="card-body">
                <h4 class="card-title"><%=placeDto.getPlace_name()%><div class="score"><%=placeDto.getPlace_score()%></div>
                </h4>
                <p class="card-text">현재 위치에서 1.2km 거리</p>
                <p class="card-text">
                  <small class="text-body-secondary"><%=placeDto.getPlace_category()%> | <%=placeDto.getPlace_address()%> <br> #주차장 #실내 #토요일 영업 #일요일 영업 #소형견 #중형견 <br> <%=placeDto.getPlace_call()%></small>
                </p>
              </div>
            </div>
          </div>
        </a>
      </div>
      <%
      }
      %>
    </div>

    <!-- Paging -->
    <nav aria-label="Page navigation example">
      <ul class="pagination">
        <!--
        <li class="page-item"><a class="page-link" href="#" aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
        </a></li>
        -->
        <%

        %>
        <%
        if (nowBlock > 0) {
        %>
        <button type="button" class="btn btn-light" onclick="location.href='place_list.jsp?place_category=<%=place_category%>&nowPage=<%=(pagePerBlock * nowBlock) - 1%>&nowBlock=<%=nowBlock - 1%>'">
          <i class="fa-solid fa-angle-left"></i>
        </button>
        <%
        }
        for (int i = 0; i < pagePerBlock; i++) {
        if ((nowBlock * pagePerBlock) + i == totalPage)
            break;
        %>
        <li class="page-item <% if ((nowPage - (nowBlock * pagePerBlock)) == i) { %>active<% } %>" aria-current="page"><a class="page-link" href="place_list.jsp?place_category=<%=place_category%>&nowPage=<%=(nowBlock * pagePerBlock) + i%>&nowBlock=<%=nowBlock%>"><%=(nowBlock * pagePerBlock) + 1 + i%></a></li>
        <%
        }
        if (nowBlock + 1 < totalBlock) {
        %>
        <button type="button" class="btn btn-light" onclick="location.href='place_list.jsp?place_category=<%=place_category%>&nowPage=<%=pagePerBlock * (nowBlock + 1)%>&nowBlock=<%=nowBlock + 1%>'">
          <i class="fa-solid fa-angle-right"></i>
        </button>
        <%
        }
        %>
        <!--
        <li class="page-item"><a class="page-link" href="#" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
        </a></li>
        -->
      </ul>
    </nav>
  </div>
</body>
</html>
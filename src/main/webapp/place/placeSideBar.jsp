<%@ page contentType="text/html; charset=UTF-8" %>
<head>
<link rel="stylesheet" href="place_list.css">
</head>
<% String place_category = request.getParameter("place_category"); %>
  <div class="catewrap">
    <h2>장소 추천</h2>
    <div class="cate"><a href="/Dogether/place/place_list.jsp?place_category=restaurant&nowPage=0&nowBlock=0">
    <% if (place_category.equals("restaurant")) { %>
      <h4 class="active"> <% } else { %>
      <h4> <% } %>
      식당&nbsp;&nbsp;&nbsp;<span class="badge rounded-pill">256</span>
      </h4></a><a href="/Dogether/place/place_list.jsp?place_category=hospital&nowPage=0&nowBlock=0">
    <% if (place_category.equals("hospital")) { %>
      <h4 class="active"> <% } else { %>
      <h4> <% } %>
        병원&nbsp;&nbsp;&nbsp;<span class="badge rounded-pill">124</span>
      </h4></a><a href="/Dogether/place/place_list.jsp?place_category=cafe&nowPage=0&nowBlock=0">
    <% if (place_category.equals("cafe")) { %>
      <h4 class="active"> <% } else { %>
      <h4> <% } %>
        카페&nbsp;&nbsp;&nbsp;<span class="badge rounded-pill">458</span>
      </h4></a><a href="/Dogether/place/place_list.jsp?place_category=dogcafe&nowPage=0&nowBlock=0">
    <% if (place_category.equals("dogcafe")) { %>
      <h4 class="active"> <% } else { %>
      <h4> <% } %>
        애견카페&nbsp;&nbsp;&nbsp;<span class="badge rounded-pill">67</span>
      </h4></a><a href="/Dogether/place/place_list.jsp?place_category=hotel&nowPage=0&nowBlock=0">
    <% if (place_category.equals("hotel")) { %>
      <h4 class="active"> <% } else { %>
      <h4> <% } %>
        숙소&nbsp;&nbsp;&nbsp;<span class="badge rounded-pill">54</span>
      </h4></a><a href="/Dogether/place/place_list.jsp?place_category=school&nowPage=0&nowBlock=0">
    <% if (place_category.equals("school")) { %>
      <h4 class="active"> <% } else { %>
      <h4> <% } %>
        애견유치원&nbsp;&nbsp;&nbsp;<span class="badge rounded-pill">21</span>
      </h4></a><a href="/Dogether/place/place_list.jsp?place_category=training&nowPage=0&nowBlock=0">
    <% if (place_category.equals("training")) { %>
      <h4 class="active"> <% } else { %>
      <h4> <% } %>
        훈련소&nbsp;&nbsp;&nbsp;<span class="badge rounded-pill">16</span>
      </h4></a><a href="/Dogether/place/place_list.jsp?place_category=dogshop&nowPage=0&nowBlock=0">
    <% if (place_category.equals("dogshop")) { %>
      <h4 class="active"> <% } else { %>
      <h4> <% } %>
        애견용품점&nbsp;&nbsp;&nbsp;<span class="badge rounded-pill">59</span>
      </h4></a><a href="/Dogether/place/place_list.jsp?place_category=playground&nowPage=0&nowBlock=0">
    <% if (place_category.equals("playground")) { %>
      <h4 class="active"> <% } else { %>
      <h4> <% } %>
        애견운동장/산책&nbsp;&nbsp;&nbsp;<span class="badge rounded-pill">227</span>
      </h4></a>
    </div>
  </div>
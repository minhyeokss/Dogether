<%@ page contentType="text/html; charset=UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
String cp = request.getContextPath();
int totalRecord = 0;
int numPerpage = 5;
int totalPage = 0;
int nowPage = 0;
int beginPerPage = 0;
int pagePerblock = 4;
int totalBlock = 0;
int nowBlock = 0;
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판</title>
</head>
<body>
  <br />
  <br />
  <table width="600" border="2" cellpadding="0" cellspacing="0" bordercolor="#d6d4a6" align="center">
    <tr height="40">
      <td style="padding-left: 20px;">
        <b>관심목록</b>
      </td>
    </tr>
  </table>
  <br />
  <br />
  <table width="600" align="center">
    <tr>
      <td align="left" colspan="2" width="400">
        Total
        <%=totalRecord%>
        <%=totalPage%>
        pages / Now Page is
        <%=nowPage%>
      </td>
      <td align="right" colspan="1" width="200"></td>
    </tr>
    <tr>
      <td style="border-bottom: 2px solid #DBDBDB;" colspan="3"></td>
    </tr>
    <%
    int newLine = 0;
    int articleCount = 0;
    int cnt = 0;
    for (int i = beginPerPage; i < beginPerPage + numPerpage; i++) {
        if (newLine == 0) {
            out.print("<tr>");
        }
        newLine++;
        articleCount++;
    %>
    <td align="center" width="190">
      <a> <img alt="" src="" width="190" height="190"> <br>
      </a>
    </td>
    <%
    if (newLine == 3) {
        out.print("</tr>");
        newLine = 0;
    }
    }
    while (newLine > 0 && newLine < 2) {
    out.print("<td width='180'></td>");
    newLine++;
    }
    out.print("</tr>");
    %>

    <tr>
      <td style="border-bottom: 2px solid #DBDBDB;" colspan="3"></td>
    </tr>
    <tr>
      <td align="center" colspan="3">
        <%
        if (totalRecord != 0) {
        %>
        <%=nowPage%>
        <%
        }
        %>
        <%
        if (totalRecord == 0) {
        %>
        등록된 파일이 없습니다
        <%
        }
        %>
      </td>
    </tr>
  </table>
  <br />
  <br />
</body>
</html>
<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-06-03
  Time: 오전 1:43
  To change this template use File | Settings | File Templates.
--%>

<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-06-03
  Time: 오전 1:43
  To change this template use File | Settings | File Templates.
--%>

<%--&nbsp;&nbsp;&nbsp;&nbsp; <br>--%>

<%@ page import="setSend.*" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    sendDAO dao = new sendDAO(application);
    List<sendDTO> listSend = dao.viewSend((String) session.getAttribute("UserName"));
%>

<%

    int pageSize = 10; // 한 페이지에 출력할 레코드 갯수

    String pageNum = request.getParameter("pageNum");
    if (pageNum == null) {
        pageNum = "1";
    }

    int currentpage = Integer.parseInt(pageNum);


    int totalCount = listSend.size();
    int startRow = (currentpage - 1) * pageSize;
    int endRow = currentpage * pageSize - 1;

    int totalPage = (int) Math.ceil((double) totalCount / pageSize);
    if (endRow >= totalCount) {
        endRow = totalCount - 1;
    }

    List<sendDTO> pageListSend = listSend.subList(startRow, endRow + 1);
%>

<html>
<head>
    <title>조회</title>
    <link rel="stylesheet" href="../css/formManage.css">
    <link href="../css/styles.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body>
<div class="d-flex flex-row" id="wrapper">
    <%--    <jsp:include page="../main.jsp"/>--%>
    <%--<h1>Login success</h1>--%>
    <jsp:include page="${pageContext.request.contextPath}../sideBar.jsp"/>
    <div id="page-content-wrapper">
        <jsp:include page="${pageContext.request.contextPath}../topNav.jsp"/>
        <div class="containerView d-flex flex-row bd-highlight mb-3" style="margin-top:3%">
            <div class="p-2 bd-highlight itemInfo_view"><br>
                <div id="textArea"><%=session.getAttribute("UserName")%> 의 계좌</div>
                <div id="textArea"><%=session.getAttribute("UserAccount")%> <- 계좌번호</div>
                <div id="textArea"><%=session.getAttribute("UserMoney")%> <- 잔고</div>
                <div id="toSend">
                    <button><a href="../send/sendForm.jsp" onclick="" style="color:white">송금하기</a></button>
                </div>
            </div>
            <div class="p-2 bd-highlight itemSend_view">

                <div id="textSend">총 이체 내역 :  <%=totalCount %>
                </div>
                <hr>
                <div class="Send_Record">
                    <table class="table">
                        <thead>
                        <tr>
                            <th>보낸 이</th>
                            <th>이체 금액</th>
                            <th>받는 이</th>
                            <th>송금 날짜</th>
                        </tr>
                        </thead>

                        <tbody>
                        <% for (sendDTO dto : pageListSend) { %>
                        <tr>
                            <td><%=dto.getSendName()%>
                            </td>
                            <td><%=dto.getRecvName()%>
                            </td>
                            <td><%=dto.getMoney()%>
                            </td>
                            <td><%=dto.getSendDate()%>
                            </td>
                        </tr>
                        <% } %>


                        </tbody>

                    </table>

                </div>
                <div class="pagination">
                    <% if (currentpage > 1) { %>
                    <a href="?pageNum=<%=currentpage-1%>">이전</a>
                    <% } %>

                    <% for (int i = 1; i <= totalPage; i++) {%>
                    <%if (i == currentpage) {%>
                    <strong><%=i%>
                    </strong>
                    <% } else { %>
                    <a href="?pageNum=<%=i%>"><%=i%>
                    </a>
                    <%}%>
                    <%}%>

                    <% if (currentpage < totalPage) {%>
                    <a href="?pageNum=<%=currentpage +1%>">다음</a>
                    <%}%>

                </div>
            </div>
        </div>
    </div>
    <jsp:include page="${pageContext.request.contextPath}../core.jsp"/>
</body>
</html>

<%--&nbsp;&nbsp;&nbsp;&nbsp; <br>--%>

<%--<%@ page import="setSend.*" %>--%>
<%--<%@ page import="java.util.List" %>--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<%--%>
<%--    sendDAO dao = new sendDAO(application);--%>
<%--    List<sendDTO> listSend = dao.viewSend((String)session.getAttribute("UserName"));--%>


<%--%>--%>

<%--<%--%>

<%--    int pageSize = 10; // 한 페이지에 출력할 레코드 갯수--%>

<%--    String pageNum = request.getParameter("pageNum");--%>
<%--    if(pageNum == null){--%>
<%--        pageNum = "1";--%>
<%--    }--%>

<%--    int currentpage = Integer.parseInt(pageNum);--%>

<%--    int startRow = (currentpage-1)*pageSize+1;--%>
<%--    int endRow = currentpage*pageSize;--%>

<%--    int count= listSend.size();--%>
<%--%>--%>

<%--<html>--%>
<%--<head>--%>
<%--    <title>Title</title>--%>
<%--    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/formManage.css">--%>
<%--    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">--%>
<%--</head>--%>
<%--<body>--%>
<%--<h1>Login success</h1>--%>
<%--<hr>--%>
<%--    <div class="containerView">--%>
<%--        <div class="itemInfo_view"><br>--%>
<%--            <div id="textArea"><%=session.getAttribute("UserName")%> 의 계좌</div>--%>
<%--            <div id="textArea"><%=session.getAttribute("UserAccount")%> <- 계좌번호</div>--%>
<%--            <div id="textArea"><%=session.getAttribute("UserMoney")%> <- 잔고</div>--%>
<%--            <div id="toSend">--%>
<%--                <button><a href="${pageContext.request.contextPath}/send/sendForm.jsp" onclick="" style="color:black">송금하기</a></button>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--        <div class="itemSend_view">--%>

<%--            <div id="textSend">총 이체 내역 :  <%=count %></div>--%>
<%--            <hr>--%>
<%--            <div class="Send_Record">--%>
<%--            <table class="table">--%>
<%--                <thead>--%>
<%--                <tr>--%>
<%--                    <th>보낸 이</th>--%>
<%--                    <th>이체 금액</th>--%>
<%--                    <th>받는 이</th>--%>
<%--                    <th>송금 날짜</th>--%>
<%--                </tr>--%>
<%--                </thead>--%>

<%--                <tbody>--%>
<%--                <% for (sendDTO dto : listSend ) { %>--%>
<%--                <tr>--%>
<%--                    <td><%=dto.getSendName()%></td>--%>
<%--                    <td><%=dto.getRecvName()%></td>--%>
<%--                    <td><%=dto.getMoney()%></td>--%>
<%--                    <td><%=dto.getSendDate()%></td>--%>
<%--                </tr>--%>
<%--                <% } %>--%>
<%--                <%--%>
<%--                    if(count>0){--%>

<%--                        int pageCount = count / pageSize + (count%pageSize == 0 ? 0 : 1);--%>

<%--                        int pageBlock = 5;--%>

<%--                        int startPage = ((currentpage-1)/pageBlock)*pageBlock+1;--%>
<%--                        int endPage= startPage + pageBlock-1;--%>

<%--                        if(endPage > pageCount){--%>
<%--                            endPage = pageCount;--%>
<%--                        }0--%>

<%--                        if(startPage > pageBlock)--%>
<%--                %>--%>
<%--                <nav class="pageNav" aria-label="Page navigation">--%>
<%--                    <ul class="pagination">--%>
<%--                        <li class="page-item">--%>
<%--                            <a class="page-link" href="#" aria-label="Previoius">--%>
<%--                                <span aria-hidden="true">&laquo;</span>--%>
<%--                            </a>--%>
<%--                        </li>--%>
<%--                        <%--%>
<%--                            for(int i=startPage; i <= endPage; i ++) {--%>
<%--                                if(i == currentpage){--%>
<%--                        %>--%>
<%--                        <li class="page-item"><a class="page-link" href="#"><%=i%></a></li>--%>
<%--                        <%--%>
<%--                                }--%>
<%--                            }--%>
<%--                            if(endPage < pageCount){--%>
<%--                        %>--%>
<%--                        <li class="page-item">--%>
<%--                            <a class="page-link" href="#" aria-label="Next">--%>
<%--                                <span aria-hidden="true">&raquo;</span>--%>
<%--                            </a>--%>
<%--                        </li>--%>

<%--                    </ul>--%>
<%--                </nav>--%>
<%--                <%--%>
<%--                        }--%>
<%--                    }--%>
<%--                %>--%>

<%--                </tbody>--%>
<%--            </table>--%>

<%--            </div>--%>

<%--            <nav aria-label="Page navigation">--%>
<%--                <ul class="pagination">--%>

<%--                    <li class="page-item">--%>
<%--                        <a class="page-link" href="#" aria-label="Previoius">--%>
<%--                            <span aria-hidden="true">&laquo;</span>--%>
<%--                        </a>--%>
<%--                    </li>--%>
<%--                    <li class="page-item"><a class="page-link" href="#">1</a></li>--%>
<%--                    <li class="page-item"><a class="page-link" href="#">2</a></li>--%>
<%--                    <li class="page-item"><a class="page-link" href="#">3</a></li>--%>
<%--                    <li class="page-item">--%>
<%--                        <a class="page-link" href="#" aria-label="Next">--%>
<%--                            <span aria-hidden="true">&raquo;</span>--%>
<%--                        </a>--%>
<%--                    </li>--%>

<%--                </ul>--%>
<%--            </nav>--%>
<%--        </div>--%>
<%--</div>--%>


<%--</body>--%>
<%--</html>--%>

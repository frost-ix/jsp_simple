<%--
  Created by IntelliJ IDEA.
  User: sung
  Date: 2023/06/02
  Time: 4:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="setSend.*" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    int listNumber = 1;
sendDAO dao = new sendDAO(application);
List<sendDTO> listSend = dao.viewSend((String)session.getAttribute("UserName"));
%>
<table>
    <%=listSend.size()%> <br>
    <tr>
        <th>번호</th>
        <th>송금자</th>
        <th>수신자</th>
        <th>이체 금액</th>
        <th>송금 날짜</th>
    </tr>
<% for (sendDTO dto : listSend ) { %>
<%--    for(int i = 0;  i< listSend.size(); i++)--%>
    <tr>
        <td><%=listNumber%></td>
        <td><%=dto.getSendName()%></td>
        <td><%=dto.getRecvName()%></td>
        <td><%=dto.getMoney()%></td>
        <td><%=dto.getSendDate()%></td>
        <%listNumber++;%>
    </tr>
<% } %>
</table>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%--<%@ page import="setSend.*" %>--%>
<%--<%@ page import="java.util.List" %>--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>

<%--<jsp:useBean id="sendDAO" class="setSend.sendDAO" />--%>
<%--<c:set var="name" scope="session" value="UserName"/>--%>
<%--<c:set var="listSend" value="${sendDAO.Record(name)}" />--%>

<%--<table>--%>
<%--    <tr>--%>
<%--        <th>송금자</th>--%>
<%--        <th>수신자</th>--%>
<%--        <th>이체 금액</th>--%>
<%--        <th>송금 날짜</th>--%>
<%--    </tr>--%>
<%--    <c:forEach items="${listSend}" var="dto">--%>
<%--        <tr>--%>
<%--            <td><c:out value="${dto.getSendName()}" /></td>--%>
<%--            <td><c:out value="${dto.getRecvName()}" /></td>--%>
<%--            <td><c:out value="${dto.getMoney()}" /></td>--%>
<%--            <td><c:out value="${dto.getSendDate()}" /></td>--%>
<%--        </tr>--%>
<%--    </c:forEach>--%>
<%--</table>--%>

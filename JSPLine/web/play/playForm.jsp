<%--
  Created by IntelliJ IDEA.
  User: sung
  Date: 2023/06/03
  Time: 4:06 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<c:set var="count" value="1" />
<form action="playProc.jsp" method="post">
    Play test <br>
    <c:out value="${count}"/> <br>
    <input type="submit" value="숫자 가져오기"> <br>
</form>
</body>
</html>

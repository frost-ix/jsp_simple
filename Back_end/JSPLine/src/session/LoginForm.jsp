<%--
  Created by IntelliJ IDEA.
  User: sung
  Date: 2023/05/18
  Time: 6:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="session.*" %>
<html>
<head>
    <title>get DB test</title>
</head>
<body>
<div class="app">
<h1>Test page......</h1>
이게 보인다면 components 가 성공된 것
    <form action="LoginProcess.jsp">
        ID : <input type="text" name="id">
        PW : <input type="password" name="pw">
        <input type="submit" value="보내기">
    </form>
</div>
<script src="https://unpkg.com/vue@3/dist/vue.global.js"></script>
<script type="module">
    const {createApp} = Vue
    createApp({
        data: {
            user :[{
                id: UserId,
                name : UserName,
            }],
        }
    }).mount('#app')
</script>
</body>
</html>

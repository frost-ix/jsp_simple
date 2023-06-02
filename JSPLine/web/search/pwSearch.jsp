<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>( ): 비밀번호 찾기</title>
<style>
#wrapper{
		position: relative;
    width:300px;
    margin-left : 585px
}
</style>
</head>
<body>
<% if (session.getAttribute("searchedPwd") == null) { %>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/pwSearch.css" />
	<div id="wrapper">
    	<img src="img/a.jpg" width="300px" height="300px" />
		</div>
	<form action="pwSearchProc.jsp">
		<div class = "text">
     <label for="username">사용자 이름:</label>
     <input type="text" id="username" name="userName"><br><br>
    </div>
    <div class = "text">
     <label for="username">사용자 아이디:</label>
     <input type="text" id="userId" name="userId"><br><br>
    </div>
    <div class = "text">
      <label for="confirmPassword">계좌 비밀번호:</label>
     	<input type="password" id="accntPwd" name="accntPwd"><br><br>
    </div>
		 <input type="submit" class="btn" value="비밀번호 찾기">
        <% }
        else { %>
        찾아진 pwd = <%=session.getAttribute("searchedPwd")%>
        <% } %>
	</form>
        
</body>
</html>
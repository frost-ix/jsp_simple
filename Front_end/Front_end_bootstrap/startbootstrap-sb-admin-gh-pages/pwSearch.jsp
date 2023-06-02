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
    height: 300px;
    margin: auto;
}
</style>
</head>
<body>
	<link rel="stylesheet" href="pwsearch.css" />
	<div id="wrapper">
    	<img src="img/a.jpg" width="300px" height="300px" />
		</div>
	<form action="pwSearchProcess.jsp">
		<div class = "text">
     <label for="username">사용자 이름:</label>
     <input type="text" id="username" name="username"><br><br>
    </div>
    <div class = "text">
     <label for="username">사용자 아이디:</label>
     <input type="text" id="userId" name="userId"><br><br>
    </div>
    <div class = "text">
      <label for="confirmPassword">계좌 비밀번호:</label>
     	<input type="password" id="accntPassword" name="accntPassword"><br><br>
    </div>
		 <input type="submit" class="btn" value="비밀번호 찾기" />
	</form>
        
</body>
</html>
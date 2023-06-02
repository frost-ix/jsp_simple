<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>( ) : 회원가입</title>
	<style>
    #wrapper{
        width:300px;
        margin:auto;
    }
</style>
</head>
<body>
	<link rel="stylesheet" href="signUp.css" />
		<div id="wrapper">
    	<img src="img/a.jpg" width="200px" height="200px" />
		</div>
    <form action="registerProcess.jsp" method="post">
        <div class = "text">
        	<label for="username">사용자 이름:</label>
        	<input type="text" id="username" name="username"><br><br>
        </div>
        <div class = "text">
        	<label for="username">사용자 아이디:</label>
        	<input type="text" id="userId" name="userId"><br><br>
        </div>
        <div class = "text">
        	<label for="password">사용자 비밀번호:</label>
        	<input type="password" id="password" name="password"><br><br>
        </div>
        <div class = "text">
        	<label for="confirmPassword">비밀번호 확인:</label>
       	 <input type="password" id="confirmPassword" name="confirmPassword"><br><br>
        </div>
        <div class = "text">
        	<label for="confirmPassword">계좌 비밀번호:</label>
        	<input type="password" id="accntPassword" name="accntPassword"><br><br>
        </div>
        
        <input type="submit" class="btn" value="계정 생성">
    </form>
    <br>
    <div class="a">
		    아이디가 있으신가요?<a href="LoginForm.jsp">Login</a>
    </div>
    </body>
</html>
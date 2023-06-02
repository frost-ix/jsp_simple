<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<html>
		<head>
			<title>로그인</title>
		</head>
	<body>
	<link rel="stylesheet" href="login.css" />
	<jsp:include page="../Common/Link.jsp" />
    <span style="color: red; font-size: 1.2em;"> 
        <%= request.getAttribute("LoginErrMsg") == null ?
                "" : request.getAttribute("LoginErrMsg") %>

    </span>
    <%
    if (session.getAttribute("UserId") == null) {  // 로그인 상태 확인
        // 로그아웃 상태
    %>
    <script>
    function validateForm(form) {
        if (!form.user_id.value) {
            alert("아이디를 입력하세요.");
            return false;
        }
        if (form.user_pw.value == "") {
            alert("패스워드를 입력하세요.");
            return false;
        }
    }
    </script>
  <form action="LoginProcess.jsp">
  	<div class="form-floating">
  	<label for="floatingInput">ID</label><br>
  	<input type="text" class="form-control" id="floatingInput" placeholder="아이디를 입력하세요" name="id" size="40">
		</div>
		
		<div class="form">
  	<label for="floatingPassword">Password</label><br>
  	<input type="password" class="form-control" id="floatingPassword" placeholder="비밀번호를 입력하세요" name="pw"size="40">
		</div>
				<div class="text">
		  		<a href="signUp.jsp">회원가입</a>
		  		<a href="pwSearch.jsp">PW찾기</a>
				</div>
  	<input type="submit" class="btn" value="로 그 인" style="width:375px">
	</form>
    <%
    } else { // 로그인된 상태
    %>
        <%= session.getAttribute("UserName") %> 회원님, 로그인하셨습니다.<br />
        <a href="Logout.jsp">[로그아웃]</a>
    <%
    }
    %>
</body>
</html>
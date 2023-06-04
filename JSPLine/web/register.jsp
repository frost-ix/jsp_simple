<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>
    <title>Register</title>
    <link href="css/stylesOther.css" rel="stylesheet"/>
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>

    <script>
        function validateRegister(form) {
            const name = form.signName;
            const id = form.signId;
            const pw = form.signPw;
            const accountPwd = form.signAccntPwd;

            // Check the name
            if (name === "") {
                alert("이름을 입력하세요.");
                return false;
            }

            // Check the ID
            if (id === "") {
                alert("아이디를 입력하세요.");
                return false;
            }

            // Check the password
            if (pw === "") {
                alert("비밀번호를 입력하세요.");
                return false;
            }

            // Check the account password
            // if (accountPwd == null) {
            //     alert("계좌 비밀번호를 입력하세요.");
            //     return false;
            // }
        }
    </script>

</head>
<body class="bg-primary">
<div id="layoutAuthentication">
    <div id="layoutAuthentication_content">
        <main>
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-7">
                        <div class="card shadow-lg border-0 rounded-lg mt-5">
                            <div class="card-header"><h3 class="text-center font-weight-light my-4">회원 가입</h3></div>
                            <div class="card-body">
                                <form action="<c:url value="/create/createProcess.jsp"/>" method="post">
                                    <div class="form-floating mb-3">
                                        <input class="form-control" id="signName" name="signName" type="text"/>
                                        <label for="inputEmail">사용자 이름</label>
                                    </div>
                                    <div class="form-floating mb-3">
                                        <input class="form-control" id="signId" name="signId" type="text"/>
                                        <label for="inputEmail">ID</label>
                                    </div>
                                    <div class="form-floating mb-3">
                                        <input class="form-control" id="signPw" name="signPw" type="password"/>
                                        <label for="inputEmail">Password </label>
                                    </div>

                                    <div class="form-floating mb-3">
                                        <input class="form-control" id="signPw" name="signPw" type="password"/>
                                        <label for="inputEmail">비밀번호 확인 </label>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-md-6">
                                            <div class="form-floating mb-3 mb-md-0">
                                                <input class="form-control" id="signAccntPw" name="signAccntPw"
                                                       type="password"/>
                                                <label for="inputPassword">계좌 비밀번호</label>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-floating mb-3 mb-md-0">
                                                <input class="form-control" id="signAccntPw" name="signAccntPw"
                                                       type="password"/>
                                                <label for="inputPasswordConfirm">계좌 비밀번호 확인</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="mt-4 mb-0">
                                        <!--전체내용 입력시에 실행 되게 로직 걸어주기, 회원가입 자체 기능으로 input 활성화 시키기-->
<%--                                        <div class="d-grid"><a class="btn btn-primary btn-block" style="cursor:pointer">회원가입</a></div>--%>
                                        <input type="submit" value="회원가입" onclick="return validateRegister(this)">
                                    </div>
                                </form>
                            </div>
                            <div class="card-footer text-center py-3">
                                <div class="small"><a href="index.jsp">이미 계정이 있으신가요?</a></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        crossorigin="anonymous"></script>
<script src="js/scripts.js"></script>
</body>
</html>

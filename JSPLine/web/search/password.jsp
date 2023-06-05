<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>
    <title>Password Reset</title>
    <link href="../css/stylesOther.css" rel="stylesheet"/>
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
</head>
<body class="bg-primary">
<div id="layoutAuthentication">
    <div id="layoutAuthentication_content">
        <main>
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-5">
                        <div class="card shadow-lg border-0 rounded-lg mt-5">
                            <div class="card-header"><h3 class="text-center font-weight-light my-4">비밀번호 찾기</h3></div>
                            <div class="card-body">
                                <form action="pwSearchProc.jsp" method="post">
                                    <div class="form-floating mb-3">
                                        <input class="form-control" id="inputName" name="userName" type="text"/>
                                        <label for="inputEmail">이름 입력</label>
                                    </div>
                                    <div class="form-floating mb-3">
                                        <input class="form-control" id="inputId" name="userId" type="text"/>
                                        <label for="inputEmail">아이디 입력</label>
                                    </div>
                                    <div class="form-floating mb-3">
                                        <input class="form-control" id="inputPwd" name="accntPwd" type="password"/>
                                        <label for="inputEmail">계좌 비밀번호 입력</label>
                                    </div>
                                    <div class="d-flex align-items-center justify-content-between mt-4 mb-0">
                                        <a class="small" href="index.jsp">로그인 화면으로 돌아가기</a>
                                        <!-- 해당 user 에 맞는 비밀번호 출력해주기, 전체내용 입력시에 실행 되게 로직 걸어주기-->
                                        <input type="submit" value="찾기">
                                    </div>
                                </form>
                            </div>
                            <div class="card-footer text-center py-3">
                                <div class="small"><a href="../register.jsp">회원이 아니신가요? 회원가입</a></div>
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
<script src="Front_End/js/scripts.js"></script>
</body>
</html>

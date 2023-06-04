<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>
    <title>Login - SB Admin</title>
    <link href="css/stylesOther.css" rel="stylesheet"/>
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
</head>
<body class="bg-primary">
<div class="container px-4 py-5 mx-auto">
    <div class="card card0">
        <div class="d-flex flex-lg-row flex-column-reverse">
            <div class="card card1">
                <div class="row justify-content-center my-auto">
                    <div class="col-md-8 col-10 my-5">
                        <h3 class="mb-5 text-center heading">로그인</h3>
                        <form action="session/LoginProcess.jsp" method="post">
                            <div class="form-group"><label class="form-control-label text-muted">Username</label> <input
                                    type="text" id="email" name="id" placeholder="아이디를 입력하세요" class="form-control">
                            </div>
                            <div class="form-group"><label class="form-control-label text-muted">Password</label> <input
                                    type="password" id="psw" name="pw" placeholder="비밀번호를 입력하세요" class="form-control">
                            </div>
                            <div class="row justify-content-center my-3 px-3">
                                <button class="btn-block btn-color">로그인</button>
                            </div>
                        </form>
                        <div class="row justify-content-center my-2"><a href="search/password.jsp"><small class="text-muted">비밀번호를
                            잊으셨나요?</small></a></div>
                    </div>
                </div>
                <div class="bottom text-center mb-5">
                    <a href="register.jsp" class="sm-text mx-auto mb-3">회원가입</a>
                </div>
            </div>
            <div class="card card2">
                <div class="my-auto mx-md-5 px-md-5 right">
                    <div class="row justify-content-center px-3 mb-3"><img id="logo" src="img/3888631.png"></div>
                </div>
            </div>
        </div>
    </div>
</div>
<script type='text/javascript'
        src='https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js'></script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        crossorigin="anonymous"></script>
<script src="js/scripts.js"></script>
</body>
</html>

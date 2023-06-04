<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Simple bank</title>
        <!-- Favicon-->
<!--        <link rel="icon" type="image/x-icon" href="../../../test/startbootstrap-simple-sidebar-gh-pages/assets/favicon.ico" />-->
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
    </head>
    <body>
        <div class="d-flex" id="wrapper">
            <!-- Sidebar-->
            <jsp:include page="sideBar.jsp" flush="false" />
            <!-- Page content wrapper-->
            <div id="page-content-wrapper">
                <!-- Top navigation-->
                <jsp:include page="topNav.jsp" flush="false" />
                <!-- Page content-->
                <div class="container-fluid">
                </div>
            </div>
        </div>
    <jsp:include page="core.jsp" />
    </body>
</html>

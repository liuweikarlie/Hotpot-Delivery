<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>首页</title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="${pageContext.request.contextPath }/css/bootstrap.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath }/js/jquery-3.5.1.min.js"></script>
    <script src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
</head>

<script>

    $(document).ready(function () {

        $("#home").click(() => {
            window.location.href = "${pageContext.request.contextPath }/";
        });
    });
</script>
<body>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-4 column">
            <div class="page-header" id="home">
                <h1>
                    Food Mall
                </h1>
            </div>
        </div>
        <div class="col-md-4 column">
        </div>
        <div class="col-md-2 column">
        </div>
        <div class="col-md-1 column">
            <div style="margin-top: 35px;" id="username">
                <c:if test="${sessionScope.user != null}">
                    <a href="${pageContext.request.contextPath }/user/info">${sessionScope.user.username}</a>
                </c:if>

                <c:if test="${empty sessionScope.user}">
                    <a class="btn btn-success btn-default" href="${pageContext.request.contextPath }/user/toLogin">
                        Login
                    </a>
                </c:if>
            </div>
        </div>
    </div>
    <div class="row clearfix">


    </div>
</div>
</body>
</html>

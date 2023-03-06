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
	<link href="https://fonts.googleapis.com/css2?family=Gloria+Hallelujah&display=swap" rel="stylesheet">



</head>

<script>

    $(document).ready(function () {

        $("#home").click(() => {
            window.location.href = "${pageContext.request.contextPath }/";
        })
    });
</script>
 <style>
 
 
      body {
        background-color: rgba(226, 163, 163, 0.5);
        font-family: 'Ubuntu', sans-serif;
		
    }

h1{
	-webkit-text-stroke-width: 3px;
  -webkit-text-stroke-color: #E91010;
  font-size:90px;
  -webkit-text-fill-color: white;
  font-family: 'Gloria Hallelujah', cursive;
	
}
</style>
<body>

 <nav class="navbar navbar-fixed-top navbar-transparent"role="navigation">
		<div class="container-fluid">
			<div class="col-md-1 column"></div>
			<div class="navbar-header">
				<a class="navbar-brand" id="home" style="font-weight: bold;
		font-size: 50px;-webkit-text-stroke-width: 1px;
  -webkit-text-stroke-color: #E91010;
  -webkit-text-fill-color: white;
  font-family: 'Gloria Hallelujah', cursive;">Hot port</a>
				
			</div>
			<ul class="nav navbar-nav navbar-right">
				<c:if test="${not empty sessionScope.user}">
				<li  ><a style="color:white" href="${pageContext.request.contextPath }/user/info"><span class="glyphicon glyphicon-user"></span> ${sessionScope.user.username}</a></li>
				<li><a style="color:white" href="${pageContext.request.contextPath }/user/logout"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
				
				</c:if>
				
				
				<c:if test="${empty sessionScope.user}">
				<li ><a style="color:white" href="${pageContext.request.contextPath }/user/toLogin"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>

				</c:if>
				<li><span></span></li>
				<li></li>
				<li></li>
				<div class="col-md-4 column"></div>
				<div class="col-md-4 column"></div>
				<div class="col-md-4 column"></div>
				<div class="col-md-4 column"></div>
			</ul>
			
		</div>
	</nav>
		<br>
		<br>
		<br>
		
    <div class="row clearfix">
        <div class="col-md-3 column"></div>
        <div class="col-md-6 column">
            <div class="panel panel-primary" style="margin-top: 15%;border:none">
                <div class="panel-heading" style="background-color:#f5576c!important">
                    <div class="panel-title">
                        <h3 style="text-align: center">Update Password</h3>
                    </div>

                </div>
                <div class="panel-body">
                    <form class="form-horizontal" style="" id="form" method="post"
                          action="${pageContext.request.contextPath}/user/update">
                        <input type="hidden" name="id" value="${sessionScope.user.id}"/>
                        <div class="form-group" style="margin-left: 15%">
                            <label class="col-sm-2 control-label">Origin Password:</label>
                            <div class="col-sm-10">
                                <input type="password" style="width: 250px;" class="form-control" name="originPassword"/>
                            </div>
                        </div>
                        <div class="form-group" style="margin-left: 15%">
                            <label class="col-sm-2 control-label">Password:</label>
                            <div class="col-sm-10">
                                <input type="password" style="width: 250px;" class="form-control" name="password"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-5 col-sm-7">
                                <button type="submit" class="btn btn-default btn-primary" style="background-color:#f5576c;border:none">Save</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

</body>
</html>

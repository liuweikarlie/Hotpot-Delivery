<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Merchant Home</title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="${pageContext.request.contextPath }/css/bootstrap.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath }/js/jquery-3.5.1.min.js"></script>
    <script src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
	 <link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Gloria+Hallelujah&display=swap" rel="stylesheet">
</head>

<style>
body{
	background-color:rgba(130, 195, 222, 0.3);
	
}


</style>

<body>

<div class="header">
<br>
    <nav class="navbar navbar-transparent" role="navigation" >
        <div class="container">
            <div class="navbar-header">
                <button class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a href="" class="navbar-brand" style="font-weight: bold;
		font-size: 50px;-webkit-text-stroke-width: 1px;
  -webkit-text-stroke-color: #E91010;
  -webkit-text-fill-color: white;
  font-family: 'Gloria Hallelujah', cursive;">
                    Hot port
                </a>
            </div>
            <div class="collapse navbar-collapse" style="">
                <ul class="nav navbar-nav">
                    <li><a href="">Merchant Management System</a></li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li class='dropdown'>
                        <a id="dLabel" type="button" data-toggle="dropdown" aria-haspopup="true"
                           aria-expanded="false"> ${ sessionScope.merchantUser.merchantName}</a>
                    </li>
                    <li><a href="${pageContext.request.contextPath }/merchant/logout"><span class="glyphicon glyphicon-off"></span> Logout</a></li>
                </ul>
            </div>
        </div>
    </nav>
</div>

<div class="container" style="margin-top:100px;">
    <div class="row">
		<div class="col-md-3 column">
			<img     style="border-radius: 2em" src="${sessionScope.merchantUser.icon}"/>
		</div>
		<div class="col-md-6 column">
			<h1 style="font-weight:bold">${sessionScope.merchantUser.merchantName}</h1>
			<br>
			<p>Address: ${sessionScope.merchantUser.text1}<p>
			<p>Tel: ${sessionScope.merchantUser.text2}<p>
			<p>Hours: ${sessionScope.merchantUser.text3}<p>
		</div>
		<div class="col-md-3 column">
			<br>
			<br>
			<br>
			<button class="list-group-item "><a href="${pageContext.request.contextPath }/merchant/info">Edit profile or stock </a></button>
		</div>
	
	
	
	</div>
	
	
	
	
	<div>
       
    </div>
</div>
</body>
</html>

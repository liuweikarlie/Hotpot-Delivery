<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Home</title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="${pageContext.request.contextPath }/css/bootstrap.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath }/js/jquery-3.5.1.min.js"></script>
    <script src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
	<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Satisfy&display=swap" rel="stylesheet"

<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Gloria+Hallelujah&display=swap" rel="stylesheet">




</head>

<script>

    $(document).ready(function () {
        $('#carousel-1000').carousel({interval: 3000});

        $("#home").click(() => {
            window.location.href = "${pageContext.request.contextPath }/";
        })
    });
</script>

<body>

<style>
body{
font-family: 'Ubuntu', sans-serif;
background-color:#E4C9C9
}

.thumbnail:hover{
	transform:scale(1.1);
}
.pic{
	background:url(${pageContext.request.contextPath }/img/homepage.jfif) no-repeat;
	
	  background-size: cover;
	 text-align:center;
		position:relative;
		display:flex;
		align-items: center;
		justify-content: center;

}
h1{
	-webkit-text-stroke-width: 3px;
  -webkit-text-stroke-color: #E91010;
  font-size:90px;
  -webkit-text-fill-color: white;
  font-family: 'Gloria Hallelujah', cursive;
	
}
</style>
<div>
   
    <nav class="navbar navbar-fixed-top navbar-transparent"role="navigation">
		<div class="container-fluid">
			<div class="col-md-1 column"></div>
			<div class="navbar-header">
				
				
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
	
    <div class="row clearfix">
        <div class="col-md-12 column" style="display:flex">
            <div class="pic"  style="height:400px;width:1507px;">
				
				<h1 align="center";style="display:flex;padding-top:100px;">Hot port</h1>
				
			</div>
			</div>
			<div class="container">
				<div align="center" style="padding-top:50px;font-size:30px;padding-bottom:50px">Select your area to shop</div>
			

            <div class="row">
                <div class="col-md-4">
                    <div class="thumbnail">
                        <a href="${pageContext.request.contextPath}/shop/findByArea?area=HK Island">
                            <img style="width: 100%" src="${pageContext.request.contextPath }/img/HK%20island.png"/>
							<h2 style="text-align: center">HK Island</h2>
                        </a>
                    </div>
                   
                </div>
                <div class="col-md-4">
                    <div class="thumbnail">
                        <a href="${pageContext.request.contextPath}/shop/findByArea?area=Kowloon">
                            <img style="width: 100%" src="${pageContext.request.contextPath }/img/Kowloon.png"/>
							<h2 style="display:inline-box;text-align: center">Kowloon</h2>
                        </a>
                    </div>
                   
                </div>
                <div class="col-md-4">
                    <div class="thumbnail">
                        <a href="${pageContext.request.contextPath}/shop/findByArea?area=New Territories">
                            <img style="width: 100%"
                                 src="${pageContext.request.contextPath }/img/New%20Territories.png"/>
								  <h2 style="text-align: center">New Territories</h2>
                        </a>
                    </div>
                   
                </div>
            </div>

        </div>
    </div>
	
</div>
</body>

</html>
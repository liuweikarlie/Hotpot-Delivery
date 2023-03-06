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
	<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Gloria+Hallelujah&display=swap" rel="stylesheet">
</head>
<style>

body{
font-family: 'Ubuntu', sans-serif;
background:url(${pageContext.request.contextPath }/img/bg.jfif)center center no-repeat;
background-size: cover;


}

.transparent_box{
	height:1000px;
	width:100%;
	background:rgba(96,96,96,.3)
}

 #shoppingHistory{
      border-radius: 5em;
       
        
		text-align:center;
		height:30px;
		margin-top:10px;
		margin-right:5px;
    }
	 #shoppingHistory.hover{
		 
		 transform:scale(1.1);
	 }
	
	#security {
		 
        border-radius: 5em;
        
       
		text-align:center;
		height:30px;
		margin-top:10px;
		
	}


</style>
<script>

    $(document).ready(function () {

        $("#home").click(() => {
            window.location.href = "${pageContext.request.contextPath }/";
        });
        $("#shoppingHistory").click(() => {
            window.location.href = "${pageContext.request.contextPath }/order/userQuery";
        });
        $("#security").click(() => {
            window.location.href = "${pageContext.request.contextPath }/user/toUpdatePassword";
        });
    });
</script>
<body>
<div class="transparent_box">
    <nav class="navbar navbar-transparent">
		<div class="container-fluid">
			<div class="col-md-1 column"></div>
			<div class="navbar-header">
				<a class="navbar-brand" id="home" style="font-weight: bold;
		font-size: 60px;-webkit-text-stroke-width: 1px;
  -webkit-text-stroke-color: #E91010;
  -webkit-text-fill-color: white;
  font-family: 'Gloria Hallelujah', cursive;">Hot port</a>
			</div>
			<ul class="nav navbar-nav">
				
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<c:if test="${not empty sessionScope.user}">
				<li><a style="color:white;" href="${pageContext.request.contextPath }/user/info"><span class="glyphicon glyphicon-user"></span> ${sessionScope.user.username}</a></li>
				<li><a style="color:white;" href="${pageContext.request.contextPath }/user/logout"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
				
				</c:if>
				
				
				<c:if test="${empty sessionScope.user}">
				<li><a href="${pageContext.request.contextPath }/user/toLogin"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
				
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
	
	<div class="container">
    <div class="row clearfix" style="margin-top:10%;background:rgba(244,222,222,0.7);width:100%;height:500px;margin-left:50px;border-radius: 1.5em;">
		 <p align="center" style="padding-top:30px;font-weight:bold;font-size:30px">Personal Information</p>
		<div class="col-md-1 column">
		</div>
        <div class="col-md-4 column" >
            <img align="center"style="float:right;width: 200px;height: 200px;margin-top:20px;padding-top:0px" src="${sessionScope.user.icon}" alt=""/>
        </div>
        <div class="col-md-6 column" style="float:left">
           

            <form align="center" class="form-horizontal" style="padding-top:30px;" id="form" >
                <div class="form-group" style="margin-left: 15%">
                    <label class="col-sm-4 control-label">Name:</label>
                    <label class="col-sm-4 control-label">${sessionScope.user.username}</label>
                </div>
				<br>
				<br>
                <div class="form-group" style="margin-left: 15%">
                    <label class="col-sm-4 control-label">Phone Number:</label>
                    <label class="col-sm-4 control-label">${sessionScope.user.phoneNumber}</label>
                </div>
				<br>
				<br>
                <div class="form-group" style="margin-left: 15%">
                    <label class="col-sm-4 control-label">Address:</label>
                    <label class="col-sm-4 control-label">${sessionScope.user.defaultAddress}</label>
                </div>
            </form>
			
            <div  align="center"  class="col-md-4 column" id="shoppingHistory">
                 <button style=" border-radius: 5em;" type="submit" class="btn btn-default btn-primary" >Shopping History</button>
            </div>
            <div   class="col-md-4 column"id="security">
                
                    <button style=" border-radius: 5em;" type="submit" class="btn btn-default btn-primary" >Security</button>
                      
                   
            </div>
        </div>
    </div>
</div>
</div>
</body>
</html>

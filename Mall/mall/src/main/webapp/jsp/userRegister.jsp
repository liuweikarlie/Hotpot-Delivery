<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>首页</title>

    
    <script src="https://cdn.bootcss.com/jquery/3.4.1/jquery.js"></script>
    <script src="https://cdn.bootcss.com/twitter-bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <link href="https://cdn.bootcss.com/twitter-bootstrap/3.4.0/css/bootstrap.min.css" rel="stylesheet">
	
	
	 <link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Gloria+Hallelujah&display=swap" rel="stylesheet">


</head>
<script>

    $(document).ready(function () {
        $("#home").click(() => {
            window.location.href = "${pageContext.request.contextPath }/";
        })
    });
</script>
<body>

<div>
   <nav class="navbar navbar-fixed-top navbar-transparent"role="navigation">
		<div class="container-fluid">
			<div class="col-md-1 column"></div>
			<div class="navbar-header">
				<a class="navbar-brand" id="home" style="font-weight: bold;
		font-size: 50px;-webkit-text-stroke-width: 1px;
  -webkit-text-stroke-color: #E91010;
  -webkit-text-fill-color: white;
  font-family: 'Gloria Hallelujah', cursive;">Hotport</a>
				
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
		
		
			<div>
			<div class="login_space">
			
			<div class="input_space">
			<h1 align="center"> Register </h1>
			
			
			<div class="enter_infor">
				<form id="form" method="post" enctype="multipart/form-data"
                          action="${pageContext.request.contextPath}/user/register">
						  
						  
					<input class="name" type="text" align="center" placeholder="Name" name="username">
					
					
					<input class="phone" type="text" align="center" placeholder="Phone Number" name="phoneNumber">
					
					<input class="pd" type="password" align="center" placeholder="Password" name="password">
					
					<input class="address" type="text" align="center" placeholder="Address" name="defaultAddress">
					
					
					<div align="center">
					<div style="display:inline; font-size:16px;color:gray">User Icon:</div>
					 <input style="display:inline" class="file" type="file" id="uploadFile" name="uploadFile" />
					</div>
					<button type="submit" class="submit" align="center"> Register </button>
					
					
		
		
				</form>
			</div>
		</div>
	</div>
   
</div>
</body>
 <style>
 
 
      body {
        background-color: rgba(226, 163, 163, 0.5);
        font-family: 'Ubuntu', sans-serif;
    }
    
    .login_space {
        background-color: #FFFFFF;
        width: 500px;
        height: 600px;
        margin: 7em auto;
        border-radius: 1.5em;
        box-shadow: 0px 11px 35px 2px rgba(0, 0, 0, 0.14);
    }
    
    .input_space {
        padding-top: 40px;
        color: #f5576c;
        font-family: 'Ubuntu', sans-serif;
        font-weight: bold;
        font-size: 23px;
    }
    
    input {
    width: 76%;
    color: rgb(38, 50, 56);
    font-weight: 700;
    font-size: 14px;
    letter-spacing: 1px;
    background: rgba(136, 126, 126, 0.04);
    padding: 10px 20px;
    border: none;
    border-radius: 20px;
    outline: none;
    box-sizing: border-box;
    border: 2px solid rgba(0, 0, 0, 0.02);
    margin-bottom: 50px;
    margin-left: 46px;
    text-align: center;
    margin-bottom: 27px;
    font-family: 'Ubuntu', sans-serif;
    }
    
    form.form {
        padding-top: 40px;
    }
    
    
   
    .phone:focus, .pd:focus,.name:focus, .address:focus,.file:focus {
        border: 2px solid rgba(0, 0, 0, 0.18) !important;
        
    }
    
    .submit {
      cursor: pointer;
        border-radius: 5em;
        color: white;
        background-color:#f5576c;
        border: 0;
        padding-left: 40px;
        padding-right: 40px;
        padding-bottom: 10px;
        padding-top: 10px;
        font-family: 'Ubuntu', sans-serif;
        margin-left: 35%;
        font-size: 13px;
        box-shadow: 0 0 20px 1px rgba(0, 0, 0, 0.04);
    }
    
  
    
    a {
        text-shadow: 0px 0px 3px rgba(117, 117, 117, 0.12);
        color: #f5576c;
        text-decoration: none;
		
    }
 
	.file{
		width:30%;
		margin-left: 20px;
		
	}
 
 </style>
</html>

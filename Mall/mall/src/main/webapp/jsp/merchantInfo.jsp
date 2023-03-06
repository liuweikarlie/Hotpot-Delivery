<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Personal Information</title>

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

input{
	 width: 500px ! important;
        height: 200px;
        border-radius: 30px;
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
<div class="container" style="margin-top:50px;">
    <div class="row">
        <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
            <div class="list-group">
                <a href="${pageContext.request.contextPath }/merchant/info" class="list-group-item active">Personal Information</a>
                <a href="${pageContext.request.contextPath }/category/query?merchantId=${sessionScope.merchantUser.id}" class="list-group-item ">Category Manager</a>
                <a href="${pageContext.request.contextPath }/product/merchantQuery?merchantId=${sessionScope.merchantUser.id}" class="list-group-item ">Product Manager</a>
				<br>
				<br>
				<br>
				<br>
				<br>
				<br>
				<br>
				<br>
				<br>
				<br>
				<br>
				<br>
				<br>
				<br>
                <a href="${pageContext.request.contextPath }/order/merchantQuery?merchantId=${sessionScope.merchantUser.id}" class="list-group-item ">Back to home page</a>
            </div>
        </div>
        <div class="col-xs-12 col-sm-10 col-md-10 col-lg-10">
            <div style="border-radius:50px;background-color:white">
                <div class="panel-heading">
                    <h1 align="center">Personal Information</h1>
                </div>
                <form class="form-horizontal" method="post" action="${pageContext.request.contextPath }/merchant/update" id="form"
                      style="margin-top: 30px; " enctype="multipart/form-data">
                    <input type="hidden" name="id" value="${sessionScope.merchantUser.id}"/>
                    <div  class="form-group">
						<div class="col-sm-1"> </div>
                        <label  class="col-sm-3 control-label"  >Merchant Name:</label>
                        <div class="col-sm-8">
                            <input type="text" style="width: 250px;" class="form-control" value="${sessionScope.merchantUser.merchantName}" name="merchantName"/>
                        </div>
                    </div>
					
                    <div class="form-group">
					<div class="col-sm-1"> </div>
                        <label class="col-sm-3 control-label">Login Name:</label>
                        <div class="col-sm-8">
                            <input type="text" style="width: 250px;" readonly class="form-control" value="${sessionScope.merchantUser.loginName}" name="loginName"/>
                        </div>
                    </div>
					
                    <div class="form-group">
					<div class="col-sm-1"> </div>
                        <label class="col-sm-3 control-label">Password:</label>
                        <div class="col-sm-8">
                            <input type="text" style="width: 250px;" class="form-control" value="${sessionScope.merchantUser.password}" name="password"/>
                        </div>
                    </div>
					
                    <div class="form-group">
					<div class="col-sm-1"> </div>
                        <label class="col-sm-3 control-label">Area:</label>
                        <div class="col-sm-8">
${sessionScope.merchantUser.area}
                            <select class="form-control" name="area" id="select" style="width: 500px;">
                                <option value="HK Island" <c:if test="${sessionScope.merchantUser.area eq 'HK Island'}"> selected="selected"</c:if>>--HK Island--</option>
                                <option value="Kowloon" <c:if test="${sessionScope.merchantUser.area eq 'Kowloon'}"> selected="selected"</c:if>>--Kowloon--</option>
                                <option value="New Territories" <c:if test="${sessionScope.merchantUser.area eq 'New Territories'}"> selected="selected"</c:if>>--New Territories--</option>
                            </select>
                        </div>
                    </div>
					
                    
                    <div class="form-group">
					<div class="col-sm-1"> </div>
                        <label class="col-sm-3 control-label">Payee:</label>
                        <div class="col-sm-8">
                            <input type="text" style="width: 250px;" class="form-control" name="payee" value="${sessionScope.merchantUser.payee}"/>
                        </div>
                    </div>
					
                    <div class="form-group">
					<div class="col-sm-1"> </div>
                        <label class="col-sm-3 control-label">Account Number:</label>
                        <div class="col-sm-8">
                            <input type="text" style="width: 500px;" class="form-control" name="shroffAccountNumber" value="${sessionScope.merchantUser.shroffAccountNumber}"/>
                        </div>
                    </div>
					
                    <div class="form-group">
					<div class="col-sm-1"> </div>
                        <label class="col-sm-3 control-label">Text 1:</label>
                        <div class="col-sm-8">
                            <input type="text" style="width: 500px;" class="form-control" name="text1" value="${sessionScope.merchantUser.text1}"/>
                        </div>
                    </div>
					
                    <div class="form-group">
					<div class="col-sm-1"> </div>
                        <label class="col-sm-3 control-label">Text 2:</label>
                        <div class="col-sm-8">
                            <input type="text" style="width: 250px;" class="form-control" name="text2" value="${sessionScope.merchantUser.text2}"/>
                        </div>
                    </div>
					
                    <div class="form-group">
					<div class="col-sm-1"> </div>
                        <label class="col-sm-3 control-label">Text 3:</label>
                        <div class="col-sm-8">
                            <input type="text" style="width: 250px;" class="form-control" name="text3" value="${sessionScope.merchantUser.text3}"/>
                        </div>
                    </div>
					
					<div class="form-group">
					<div class="col-sm-1"> </div>
                        <label class="col-sm-3 control-label">Icon:</label>
                        <div class="col-sm-8">
                            <img class="img-thumbnail"  width="100px" height="100px"  src="${sessionScope.merchantUser.icon}"/>
                            <input type="file" style="height:50px!important;border-radius:0px!important"id="uploadFile" name="uploadFile"/>
                        </div>
                    </div>
				
                    <div class="form-group">
				
                        <div class="col-sm-offset-4 col-sm-10">
                            <button type="submit" class="btn btn-default btn-primary" id="save">Save</button>
                        </div>
						
                    </div>
                </form>
				<br>
            </div>
        </div>
    </div>
</div>
</body>
</html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Add Product</title>

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
<div class="container" style="margin-top:70px;">
    <div class="row">
        <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
            <div class="list-group">
                <a href="${pageContext.request.contextPath }/merchant/info" class="list-group-item ">Personal Information</a>
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
            <div class="panel panel-default" style="border-radius:30px">
                <div >
					<br>
                    <h1 align="center">Product Manager</h1>
                    <a href="${pageContext.request.contextPath }/product/toAdd" class="btn btn-default btn-success" style="margin-left: 85%">Add Product</a>
                </div>
                <form class="form-horizontal" method="post" action="${pageContext.request.contextPath }/product/create" id="form"
                      style="margin-top: 30px;" enctype="multipart/form-data">
                    <input type="hidden" name="merchantId" value="${sessionScope.merchantUser.id}"/>
                    <div class="form-group">
						<div class="col-sm-1"> </div>
                        <label class="col-sm-3 control-label">Product Name:</label>
                        <div class="col-sm-8">
                            <input type="text" style="width: 250px;" class="form-control" name="productName"/>
                        </div>
                    </div>
                    <div class="form-group">
					<div class="col-sm-1"> </div>
                        <label class="col-sm-3 control-label">Description:</label>
                        <div class="col-sm-8">
                            <input type="text" style="width: 250px;" class="form-control" name="description"/>
                        </div>
                    </div>
                    <div class="form-group">
					<div class="col-sm-1"> </div>
                        <label class="col-sm-3 control-label">Category:</label>
                        <div class="col-sm-8">
                            <select class="form-control" name="categoryId" id="select" style="width: 250px;">
                                <c:forEach items="${categories}" var="category">
                                    <option value="${category.id}">${category.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
					<div class="col-sm-1"> </div>
                        <label class="col-sm-3 control-label">Image:</label>
                        <div class="col-sm-8">
                            <input type="file" id="uploadFile" name="uploadFile"/>
                        </div>
                    </div>
                    <div class="form-group">
					<div class="col-sm-1"> </div>
                        <label class="col-sm-3 control-label">Price:</label>
                        <div class="col-sm-8">
                            <input type="number" style="width: 250px;" class="form-control" name="price"/>
                        </div>
                    </div>
                    <div class="form-group">
					<div class="col-sm-1"> </div>
                        <label class="col-sm-3 control-label">Stock:</label>
                        <div class="col-sm-8">
                            <input type="number" style="width: 250px;" class="form-control" name="stock"/>
                        </div>
                    </div>
                    <div class="form-group">
					
                        <div class="col-sm-offset-5 col-sm-10">
                            <button type="submit" class="btn btn-default btn-primary" id="save">Save</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>

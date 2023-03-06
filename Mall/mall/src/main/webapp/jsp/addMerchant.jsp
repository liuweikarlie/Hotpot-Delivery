<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Add Merchant</title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="${pageContext.request.contextPath }/css/bootstrap.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath }/js/jquery-3.5.1.min.js"></script>
    <script src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
</head>
<body>
<div class="header">
    <nav class="navbar navbar-default" role="navigation">
        <div class="container">
            <div class="navbar-header">
                <button class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a href="#" class="navbar-brand">
                    Mall Manager System
                </a>
            </div>
            <div class="collapse navbar-collapse">
                <ul class="nav navbar-nav">
                    <li><a href="#">Administrator Panel</a></li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li class='dropdown'>
                        <a id="dLabel" type="button" data-toggle="dropdown" aria-haspopup="true"
                           aria-expanded="false"> ${ sessionScope.admin.username} <span class="caret"></span></a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</div>
<div class="container">
    <div class="row">
        <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
            <div class="list-group">
                <a href="${pageContext.request.contextPath }/merchant/query/" class="list-group-item active">Merchant Manager</a>
                <a href="${pageContext.request.contextPath }/order/adminQuery" class="list-group-item ">Order Manager</a>
            </div>
        </div>
        <div class="col-xs-12 col-sm-10 col-md-10 col-lg-10">
            <div class="panel panel-default">
                <div class="panel panel-heading">
                    <h1>Merchant Manager</h1>
                    <a href="${pageContext.request.contextPath }/category/toAdd" class="btn btn-default btn-success" style="margin-left: 85%">Add Merchant</a>
                </div>
                <form class="form-horizontal" method="post" action="${pageContext.request.contextPath }/merchant/create" id="form"
                      style="margin-top: 30px;" enctype="multipart/form-data">
                    <div class="form-group">
					<div class="col-sm-1"> </div>
                        <label class="col-sm-3 control-label">MerchantName:</label>
                        <div class="col-sm-8">
                            <input type="text" style="width: 250px;" class="form-control" name="merchantName"/>
                        </div>
                    </div>
                    <div class="form-group">
					<div class="col-sm-1"> </div>
                        <label class="col-sm-3 control-label">LoginName:</label>
                        <div class="col-sm-8">
                            <input type="text" style="width: 250px;" class="form-control" name="loginName"/>
                        </div>
                    </div>
                    <div class="form-group">
					<div class="col-sm-1"> </div>
                        <label class="col-sm-3 control-label">Password:</label>
                        <div class="col-sm-8">
                            <input type="text" style="width: 250px;" class="form-control" name="password"/>
                        </div>
                    </div>
                    <div class="form-group">
					<div class="col-sm-1"> </div>
                        <label class="col-sm-3 control-label">Area:</label>
                        <div class="col-sm-8">
                            <select class="form-control" name="area" id="select" style="width: 250px;">
                                <option value="HK Island">--HK Island--</option>
                                <option value="Kowloon">--Kowloon--</option>
                                <option value="New Territories">--New Territories--</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
					<div class="col-sm-1"> </div>
                        <label class="col-sm-3 control-label">Icon:</label>
                        <div class="col-sm-8">
                            <input type="file" id="uploadFile" name="uploadFile"/>
                        </div>
                    </div>
                    <div class="form-group">
					<div class="col-sm-1"> </div>
                        <label class="col-sm-3 control-label">Payee:</label>
                        <div class="col-sm-8">
                            <input type="text" style="width: 250px;" class="form-control" name="payee"/>
                        </div>
                    </div>
                    <div class="form-group">
					<div class="col-sm-1"> </div>
                        <label class="col-sm-3 control-label">Account Number:</label>
                        <div class="col-sm-8">
                            <input type="text" style="width: 250px;" class="form-control" name="shroffAccountNumber"/>
                        </div>
                    </div>
                    <div class="form-group">
					<div class="col-sm-1"> </div>
                        <label class="col-sm-3 control-label">Text1:</label>
                        <div class="col-sm-8">
                            <input type="text" style="width: 250px;" class="form-control" name="text1"/>
                        </div>
                    </div>
                    <div class="form-group">
					<div class="col-sm-1"> </div>
                        <label class="col-sm-3 control-label">Text2:</label>
                        <div class="col-sm-8">
                            <input type="text" style="width: 250px;" class="form-control" name="text2"/>
                        </div>
                    </div>
                    <div class="form-group">
					<div class="col-sm-1"> </div>
                        <label class="col-sm-3 control-label">Text3:</label>
                        <div class="col-sm-8">
                            <input type="text" style="width: 250px;" class="form-control" name="text3"/>
                        </div>
                    </div>
                    <div class="form-group">
					
                        <div class="col-sm-offset-4 col-sm-10">
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

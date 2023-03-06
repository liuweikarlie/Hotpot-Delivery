<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Admin Login</title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="${pageContext.request.contextPath }/css/bootstrap.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath }/js/jquery-3.5.1.min.js"></script>
    <script src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
</head>
<body>

<div class="container">
    <div class="row clearfix">
        <div class="col-md-3 column"></div>
        <div class="col-md-6 column">
            <div class="panel panel-primary" style="margin-top: 30%">
                <div class="panel-heading">
                    <div class="panel-title">
                        <h3 style="text-align: center">Mall Management System</h3>
                        <h3 style="text-align: center">Administrator Login</h3>
                    </div>

                </div>
                <div class="panel-body">
                    <form class="form-horizontal" action="${pageContext.request.contextPath }/admin/login" style="" id="form">
                        <div class="form-group" style="margin-left: 15%">
                            <label class="col-sm-2 control-label">loginName: </label>
                            <div class="col-sm-10">
                                <input type="text" style="width: 250px;" class="form-control" name="loginName"/>
                            </div>
                        </div>
                        <div class="form-group" style="margin-left: 15%">
                            <label class="col-sm-2 control-label">password:</label>
                            <div class="col-sm-10">
                                <input type="password" style="width: 250px;" class="form-control" name="password"/>
                            </div>
                        </div>
                        <div class="form-group" style="">
                            <div class="col-sm-offset-5 col-sm-7" >
                                <button type="submit" class="btn btn-default btn-primary" id="">Login</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <div class="col-md-3 column"></div>
</div>
</body>
</html>

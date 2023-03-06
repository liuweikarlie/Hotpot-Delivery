<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Merchant Manager</title>

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
                    <h1>Merchant List</h1>
                    <a href="${pageContext.request.contextPath }/merchant/toAdd" class="btn btn-default btn-success" style="margin-left: 85%">Add Merchant</a>
                </div>
                <table class="table table-hover table-bordered">
                    <thead>
                    <tr>
                        <th>
                            Merchant Name
                        </th>
                        <th>
                            Login Name
                        </th>
                        <th>
                            Password
                        </th>
                        <th>
                            Area
                        </th>
                        <th>
                            Icon
                        </th>
                        <th>
                            Payee
                        </th>
                        <th>
                            Shroff Account Number
                        </th>
                        <th>
                            Text1
                        </th>
                        <th>
                            Text2
                        </th>
                        <th>
                            Text3
                        </th>
                        <th>
                            Operation
                        </th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="merchant" items="${merchants}">
                        <tr>
                            <td>${merchant.merchantName}</td>
                            <td>${merchant.loginName}</td>
                            <td>${merchant.password}</td>
                            <td>${merchant.area}</td>
                            <td>
                            <img class="img-thumbnail"  width="100px" height="100px" src="${merchant.icon}" />
                            </td>
                            <td>${merchant.payee}</td>
                            <td>${merchant.shroffAccountNumber}</td>
                            <td>${merchant.text1}</td>
                            <td>${merchant.text2}</td>
                            <td>${merchant.text3}</td>
                            <td><a href="${pageContext.request.contextPath}/merchant/delete?id=${merchant.id}">Delete</a></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>

        </div>
    </div>
</div>
</body>
</html>

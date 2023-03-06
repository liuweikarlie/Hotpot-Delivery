<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Order Manager</title>

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
                    <%--<li><a href="#"><span class="glyphicon glyphicon-off"></span> Logout</a></li>--%>
                </ul>
            </div>
        </div>
    </nav>
</div>
<div class="container">
    <div class="row">
        <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
            <div class="list-group">
                <a href="${pageContext.request.contextPath }/merchant/query/" class="list-group-item ">Merchant Manager</a>
                <a href="${pageContext.request.contextPath }/order/adminQuery" class="list-group-item active">Order Manager</a>
            </div>
        </div>
        <div class="col-xs-12 col-sm-10 col-md-10 col-lg-10">
            <div class="panel panel-default">
                <div class="panel panel-heading">
                    <h1>Order List</h1>
                </div>
                <table class="table table-hover table-bordered">
                    <thead>
                    <tr>
                        <th>
                            Order No
                        </th>
                        <th>
                            Shop Name
                        </th>
                        <th>
                            Total
                        </th>
                        <th>
                            Order Time

                        </th>
                        <th>
                            Status
                        </th>
                        <th>
                            Logistics Company
                        </th>
                        <th>
                            Logistics Number
                        </th>
                        <th>
                            Remark
                        </th>
                        <th>
                            Operation
                        </th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="order" items="${requestScope.orders}">
                        <tr>
                            <td>${order.id}</td>
                            <td>${order.merchant.merchantName}</td>
                            <td>$${order.total}</td>
                            <td><fmt:formatDate value="${order.orderTime}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                            <td>${order.status}</td>
                                <%--<td>--%>
                                <%--<img class="img-thumbnail"  width="100px" height="100px" src="${merchant.icon}" />--%>
                                <%--</td>--%>
                            <td>${order.logisticsCompany}</td>
                            <td>${order.logisticsNumber}</td>
                            <td>${order.reason}</td>
                            <td>
                                <a href="${pageContext.request.contextPath}/order/orderDetail?orderId=${order.id}">Detail</a>
                                <c:if test="${order.status eq 'WAIT_CONFIRM'}">
                                    <a href="${pageContext.request.contextPath}/order/adminConfirm?id=${order.id}">Confirm</a>
                                </c:if>
                            </td>
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

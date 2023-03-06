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
	 
    <script src="https://unpkg.com/bootstrap-table@1.15.4/dist/bootstrap-table.min.js"></script>
	
    <link rel="stylesheet" href="https://unpkg.com/bootstrap-table@1.15.4/dist/bootstrap-table.min.css">
<link href="https://fonts.googleapis.com/css2?family=Gloria+Hallelujah&display=swap" rel="stylesheet">
</head>
<script>
$(document).ready(function () {

	$('table').bootstrapTable({
			search:false,
			pagination : true,
			pageSize:10,
			paginationHAlign:"left",
			pageList:"[10, 20, 50]",
			paginationDetailHAlign:"right",
			columns: [{
        field: 'id',
        title: 'Order No'
    }, {
        field: 'name',
        title: 'Shop Name'
    }, {
        field: 'price',
        title: 'Total'
    },{
        field: 'column1',
        title: 'Order Time'
    },{
        field: 'column2',
        title: 'Status' 
    },{
        field: 'column3',
        title: 'Logistics Company'
    },{
        field: 'column4',
        title: 'Logistics Number'
    } ,{
        field: 'column5',
        title: 'Remark'
    } ,{
        field: 'column6',
        title: 'Operation'
    }, ]
		
		
		
		
});});


</script>
<style>
body{
	background-color:rgba(130, 195, 222, 0.3);
	
}
.fixed-table-container{
	margin-buttom:0px !important;
}
.fixed-table-pagination{
	text-align:center;
	dislay:flex;
	margin-top:0px !important;
	
}

.panel panel-info{
	outline: none !important;
	background-color:rgba(130, 195, 222, 0.3)!important;
}


.form-control search-input{
	text-ailgn:right！important;
	flex:right ！important;
}
</style>

<body>

<div class="header">
<br>
    <nav class="navbar navbar-fixed-top navbar-transparent" role="navigation" >
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
		<div class="col-md-3 column">
			<img     style="border-radius: 2em;height:200px;width:250px" src="${sessionScope.merchantUser.icon}"/>
		</div>
		<div class="col-md-6 column">
			
			<h1 style="font-weight:bold">${sessionScope.merchantUser.merchantName}</h1>
			<br>
			<p> ${sessionScope.merchantUser.text3}<p>
			<p> ${sessionScope.merchantUser.text2}<p>
			<p>Hour：${sessionScope.merchantUser.text1}<p>
		</div>
		<div class="col-md-3 column">
			<br>
			<br>
			<br>
			<button class="list-group-item "><a href="${pageContext.request.contextPath }/merchant/info">Edit profile or stock </a></button>
		</div>
	
	
	
	</div>
	<br>
	<br>
	<br>
    <div class="row" >
      
        <div class="col-md-12 column" style="">
            <div class="" style="background-color:white;min-height:300px;border-radius:30px">
                <div class="panel-heading">
                    <h1  align="center">Order List</h1>
                </div>
                <table class="table table-hover table-bordered" align="center"id="table" style="margin-top:20px;width:90%">
                   
                    <tbody>
                    <c:forEach var="order" items="${requestScope.orders}">
                        <tr>
                            <td>${order.id}</td>
                            <td>${order.merchant.merchantName}</td>
                            <td>$${order.total}</td>
                            <td><fmt:formatDate value="${order.orderTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                            <td>${order.status}</td>
                                <%--<td>--%>
                                <%--<img class="img-thumbnail"  width="100px" height="100px" src="${merchant.icon}" />--%>
                                <%--</td>--%>
                            <td>${order.logisticsCompany}</td>
                            <td>${order.logisticsNumber}</td>
                            <td>${order.reason}</td>
                            <td>
                                <a href="${pageContext.request.contextPath}/order/orderDetail?orderId=${order.id}">Detail</a>
                                <c:if test="${order.status eq 'DELIVERY'}">
                                    <a id="cancel" data-toggle="modal" data-target="#myModal${order.id}">Cancel</a>
                                    <a data-toggle="modal" data-target="#deliveryModal${order.id}">Delivery</a>
                                </c:if>
                            </td>
                        </tr>
                        <div class="modal fade" id="myModal${order.id}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                            &times;
                                        </button>
                                        <h4 class="modal-title" id="myModalLabel">
                                            Cancel Order
                                        </h4>
                                    </div>
                                    <form class="form-horizontal" action="${pageContext.request.contextPath }/order/merchantCancel">
                                    <div class="modal-body">
                                            <input type="hidden" name="id" value="${order.id}">
                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">Reason:</label>
                                                <div class="col-sm-10">
                                                    <input type="text" style="width: 250px;" class="form-control" name="reason"/>
                                                </div>
                                            </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default" data-dismiss="modal">Close
                                        </button>
                                        <button type="submit" class="btn btn-primary">
                                            Submit
                                        </button>
                                    </div>
                                    </form>
                                </div><!-- /.modal-content -->
                            </div><!-- /.modal -->
                        </div>
                        <div class="modal fade" id="deliveryModal${order.id}" tabindex="-1" role="dialog" aria-labelledby="deliveryModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                            &times;
                                        </button>
                                        <h4 class="modal-title" id="deliveryModalLabel">
                                            Deliver goods
                                        </h4>
                                    </div>
                                    <form class="form-horizontal" action="${pageContext.request.contextPath }/order/deliver">
                                        <div class="modal-body">
                                            <input type="hidden" name="orderId" value="${order.id}">
                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">Logistics Company:</label>
                                                <div class="col-sm-10">
                                                    <input type="text" style="width: 250px;" class="form-control" name="logisticsCompany"/>
                                                </div>
                                            </div>
                                            <div class="form-group" style="margin-top: 65px">
                                                <label class="col-sm-2 control-label">Logistics Number:</label>
                                                <div class="col-sm-10">
                                                    <input type="text" style="width: 250px;" class="form-control" name="logisticsNumber"/>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="modal-footer" style="margin-top: 65px">
                                            <button type="button" class="btn btn-default" data-dismiss="modal">Close
                                            </button>
                                            <button type="submit" class="btn btn-primary">
                                                Submit
                                            </button>
                                        </div>
                                    </form>
                                </div><!-- /.modal-content -->
                            </div><!-- /.modal -->
                        </div>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
</body>
</html>

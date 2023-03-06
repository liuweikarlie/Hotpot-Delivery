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

<script>

    $(document).ready(function () {

        $("#home").click(() => {
            window.location.href = "${pageContext.request.contextPath }/";
        });
        $("#commit").click(() => {
            console.log("click");
			if (($("#transfer_account").val()=='')|| ($("#transfer_number").val()=='') || ($("#file").val()=='')){
				alert("Please fill all the information")
				
			}
			else{
            $("#form").submit();
			alert("Order Success!");
			}
        });
    });
</script>
<style>
body{
font-family: 'Ubuntu', sans-serif;
background:url(${pageContext.request.contextPath }/img/bg1.jfif)center center no-repeat;
background-size: cover;


}

.transparent_box{
	height:1000px;
	width:100%;
	background:rgba(96,96,96,.3)
}


</style>
<body>
<div class="transparent_box">
	   <nav class="navbar  navbar-transparent">
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
<div class="container" >
    
    <div class="row clearfix" style="padding-top: 100px;">
        <div class="col-md-8 column">

			
            <ul class="breadcrumb" style="margin-top: 18px; font-size: 20px; font-weight:bold;background-color:#CC6363;border-radius:1.5em;">
				
                <li class="active" align="center" style="color:black;">
                    Select you address
                </li>
            </ul>
            <form id="form" enctype="multipart/form-data" method="post" action="${pageContext.request.contextPath }/order/create">
                <input type="hidden" name="merchantId" value="${sessionScope.merchantId}">
                <input type="hidden" name="userId" value="${sessionScope.user.id}">
                <input type="hidden" name="total" value="${requestScope.total}">
				
				<div style="background: rgba(254, 236, 236, 0.8);
border-radius:1.5em;padding-top:10px;padding-bottom:10px;padding:10px;">
                <div class="radio" >
                    <label>
                        <input type="radio" name="address"  value="${sessionScope.user.defaultAddress}" checked>
                        Default
                        <p class="help-block">${sessionScope.user.defaultAddress}</p>
                    </label>
                </div>
                <div class="radio">
                    <label>
                        <input type="radio" name="address"  value="useInput"> New
                        <input type="text" class="form-control" name="input" style=" border-radius:1.5em;">
                    </label>
                </div>

				</div>
				
                <ul class="breadcrumb" style="margin-top: 18px; font-size: 20px; background-color:#CC6363;border-radius:1.5em;">
                    <li class="active" style="color:black;font-weight:bold;">
                        Payment
                    </li>
                </ul>
				<div style="background: rgba(254, 236, 236, 0.8);
border-radius:1.5em;padding:10px;padding-top:20px;">
                <div class="form-group">
                    <label  class="col-sm-3 control-label">Transfer Name:</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" name="remark" placeholder="" style="border-radius:1.5em;">
                    </div>
                    <br>
                </div>
				<br>
                
                <div class="form-group">
                    <label  class="col-sm-3 control-label">Transfer Account:</label>
                    <div class="col-sm-9">
                        <input id="transfer_account" type="text" class="form-control" name="transferAccount" placeholder="" style="border-radius:1.5em;">
                    </div>
                    <br>
                </div>

                <br>
                <div class="form-group">
                    <label class="col-sm-3 control-label">Transfer Number:</label>
                    <div class="col-sm-9">
                        <input id="transfer_number" type="text" class="form-control" name="transferNumber" placeholder="" style="border-radius:1.5em;">
                    </div>
                    <br>
                </div>
			
               
				
				
				<br>
                <div class="form-group">
                    <label class="col-sm-3 control-label">Update the Transcript</label>
                    <input  id="file" type="file" name="blFile" >
                </div>
				</div>
            </form>

        </div>
        <div class="col-md-4 column">
			
            <div style="background:rgba(244,222,222,0.7);width:350px;height:550px;margin-left:50px;border-radius: 1.5em;padding-left:20px;padding-right:20px;top:0%">
                <p align="center" style="font-weight:bold;font-size:30px">Cart</p>
                <div class="panel-body" style="">
                    <table class="table">
                        <thead>
                        <tr>
                            <th>Product</th>
                            <th>Quantity</th>
                            <th>Price</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="cart" items="${requestScope.carts}">
                            <tr>
                                <td>${cart.productName}</td>
                                <td>${cart.quantity}</td>
                                <td>
                                    <strong style="color: red;  font-size: 16px;">
                                        $${cart.total}
                                    </strong>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>

                    </table>

                    <hr class="simple" color="#6f5499" />
                    <div class="row">
                        <div class="col-md-4 col-md-offset-6">
                            total:
                            <strong style="color: red;  font-size: 16px;">
                                $${requestScope.total}
                            </strong>
                        </div>
                    </div>
                    <br>
                    <br>
                    <div class="row" style="text-align: center;">
                        <button type="button" id="commit" class="btn btn-info btn-lg" style="width:150px;border-radius: 1.5em;background:rgba(196,196,196,0.8);border: none;font-weight:bold;color:black">Commit</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
</body>
</html>

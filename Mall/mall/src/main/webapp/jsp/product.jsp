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
<link href="https://fonts.googleapis.com/css2?family=Satisfy&display=swap" rel="stylesheet">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Gloria+Hallelujah&display=swap" rel="stylesheet">

</head>

<script>

    $(document).ready(function () {

        $("#home").click(() => {
            window.location.href = "${pageContext.request.contextPath }/";
        });

        $(".nav-justified").on("click","li",function(){
            let categoryId = $(this).data("id");
            let userId = ${sessionScope.user.id};
            let merchantId = ${requestScope.merchant.id}
            window.location.href = "http://" + window.location.host + "/product/findByCategory?merchantId=" + merchantId
                + "&userId=" + userId + "&categoryId=" + categoryId + "&page=1" + "&size=4";
        });
        $("#products").on("click",".col-md-6 .thumbnail .product a",function(){
            let productId = $(this).data("id");
            let categoryId = $(this).data("category");
            let userId = ${sessionScope.user.id};
            let merchantId = $(this).data("merchant");
            let page = $(this).data("page");
            let size = $(this).data("size");
            window.location.href = "http://" + window.location.host + "/cart/addToCart?merchantId=" + merchantId + "&productId=" + productId
                    + "&userId=" + userId + "&categoryId=" + categoryId + "&page=" + page + "&size=" + size;
        });
        $("#checkout").click(() => {
            console.log("click");
            let userId = ${sessionScope.user.id};
            let merchantId = ${requestScope.merchantId};
            window.location.href = "${pageContext.request.contextPath }/order/checkout?userId=" + userId + "&merchantId=" + merchantId;
        })
		$(".active").click(()=>{
			$(".active").css("background-color","#f5576c")
		});
		
    });
</script>

<style>


.thumbnail {
  
  background-color: white;
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
  border-radius: 1.5em;
}


	
	
	.thumbnail:hover{
	transform:scale(1.1);
}
body{
font-family: 'Ubuntu', sans-serif;
background:url(${pageContext.request.contextPath }/img/bg1.jfif)center center no-repeat;
background-size: cover;


}

.nav-justified >.active > a, .nav-justified >.active > a:focus {
        color: black;
        background-color: #fcd900;
    }

.nav-justified >.active > a:hover {
            background-color: #efcb00;
            color:black;
        }



.transparent_box{
	height:1000px;
	width:100%;
	background:rgba(96,96,96,.3)
}
.nav-pills > li.active > a, .nav-pills > li.active > a:hover, .nav-pills > li.active > a:focus {
	
    color: #ffffff;
    background-color: #f5576c;
	height:60px;
}

ul.nav nav-pills nav-justified{
	height:30px;
}
.text-success {
    color: white;
}

</style>
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
    <div class="row clearfix" style="padding-top: 100px;">
        <div class="col-md-8 column" >

            <div class="row" >
                
				<nav class="navbar navbar-default navbar-transparent" style="background:rgba(201,108,105,0.8);border:none;border-radius:0.3em;">
                   <div class="container-fluid">
				   <div class="navbar-header">
				<a class="navbar-brand"  align="center" style="font-weight: bold; color:white"><p align="center" style="text-align:center;"class="text-success">
                            ${requestScope.merchant.merchantName}
                        </p></a>
				</div>
                       
                
					<div class="col-md-1"></div>
                    <ul  class="nav nav-pills nav-justified">
                        <c:forEach var="category" items="${categories}">
                            <li <c:if test="${requestScope.categoryId == category.id}">
                                class="active" 
                            </c:if> data-id="${category.id}"><a style="font-size:20px;color:white;height:60px">${category.name}</a></li>
                        </c:forEach>

                    </ul>
                
				</div>
				</nav>
            </div>
            <br>

            <div class="row" id="products">
                <c:forEach var="product" items="${productPage.records}">
                    <div class="col-md-6" >
                        <div class="thumbnail" style="display: inline-block;">
                            <div class="col-md-6">
                                <img style="width: 100%;" src="${product.image}" />
                            </div>
                            <div class="col-md-6 product">
                                <h4>${product.productName}</h4>
                                <ul>
                                    <li>
                                            ${product.description}
                                    </li>
                                </ul>
                                <strong style="color: red;  font-size: 16px;">
                                    $${product.price}
                                </strong><br/>
                                <a class="btn btn-success" style="margin-top: 5px" data-id="${product.id}" data-merchant="${product.merchantId}"
                                   data-category="${product.categoryId}" data-page="${productPage.current}"
                                   data-size="${productPage.size}">Add</a>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
            <%--<div class="row">--%>
                <%--<ul class="pager" style="float: right;">--%>
                    <%--<li><a href="#">Previous</a></li>--%>
                    <%--<li><a href="#">Next</a></li>--%>
                <%--</ul>--%>
            <%--</div>--%>

        </div>
        <div class="col-md-4 column" >
           <div style="background:rgba(244,222,222,0.7);width:350px;height:550px;margin-left:50px;border-radius: 1.5em;padding-left:20px;padding-right:20px;top:0%">
		    <p align="center" style="font-weight:bold;font-size:30px">Cart</p>
					<div style="height:350px;">
                    <table class="table" >
					 
                        <thead>
                        <tr>
                            <th >Product</th>
                            <th>Quantity</th>
                            <th>Price</th>
                        </tr>
                        </thead>
                        <tbody >
                        <c:forEach var="cart" items="${requestScope.carts}">
                            <tr style="font-size:16px;">
                                <td>${cart.productName}</td>
                                <td>
                                    <a href="${pageContext.request.contextPath }/cart/updateCart?merchantId=${cart.merchantId}
                                    &userId=${sessionScope.user.id}&cartId=${cart.id}&quantity=-1&categoryId=${categoryId}
                                    &page=${productPage.current}&size=${productPage.size}">
                                        <span class="glyphicon glyphicon-minus"></span>
                                    </a>
                                    <span style="margin-left: 5px">${cart.quantity}</span>
                                    <a style="margin-left: 5px" href="${pageContext.request.contextPath }/cart/updateCart?merchantId=${cart.merchantId}
                                    &userId=${sessionScope.user.id}&cartId=${cart.id}&quantity=1&categoryId=${categoryId}
                                    &page=${productPage.current}&size=${productPage.size}">
                                        <span class="glyphicon glyphicon-plus"></span>
                                    </a>
                                </td>
                                <td>
                                    <strong style="  font-size: 16px;">
                                        $${cart.total}
                                    </strong>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>

                    </table>
					
					</div>
                    <hr class="simple" color="#6f5499" />
					
                    <div class="row" style="">
                        <div class="col-md-6 col-md-offset-6">
                            Total:
                            <strong style="  font-size: 16px;">
                                $${requestScope.total}
                            </strong>
                        </div>
                    </div>
                    <br>
                    
                    <div class="row" style="text-align: center;">
                        <button type="button" id="checkout" class="btn btn-info btn-lg" style="width:150px;border-radius: 1.5em;background:rgba(196,196,196,0.8);border: none;">Check out</button>
                    </div>
                </div>
            </div>
        </div>
    
</div>
</div>

</body>
</html>

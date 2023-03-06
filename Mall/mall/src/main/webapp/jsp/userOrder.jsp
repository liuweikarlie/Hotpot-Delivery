<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>首页</title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="${pageContext.request.contextPath }/css/bootstrap.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/css/bootstrap-table.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath }/js/jquery-3.5.1.min.js"></script>
    <script src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath }/js/bootstrap-table.min.js"></script>
	<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Gloria+Hallelujah&display=swap" rel="stylesheet">
</head>
<style>

body{
font-family: 'Ubuntu', sans-serif;
background:url(${pageContext.request.contextPath }/img/bg.jfif)center center no-repeat;
background-size: cover;


}

.transparent_box{
	height:1000px;
	width:100%;
	background:rgba(96,96,96,.3)
}

</style>
<script>
//https://blog.csdn.net/Rao_Limon/article/details/88388049
    $(document).ready(function () {

        $("#home").click(() => {
            window.location.href = "${pageContext.request.contextPath }/";
        });
		
		var tablebody= $("tbody");
		var now=currentime();
		console.log(document.all.table.rows.length);
		for(i=0;i<=document.all.table.rows.length-2;i++){
			
			var firstRow=tablebody.children().eq(i);
			var columns = firstRow.children();
			var status=columns.eq(4).html();
			if((status=='WAIT_CONFIRM')||(status=='DELIVERY')){
				var columnValue1 = columns.eq(3).html();
				console.log(columnValue1);
				var realgap=Days1(now,columnValue1)
				var gap=15*60*1000;
				
				if(realgap>gap){
					console.log(realgap);
					var d=columns.eq(8).children(".cancle");
					d.hide();
				}
				
					
				}
				
				 
			
			}
			
				for (i=0;i<=document.all.table.rows.length-2;i++){	
					var first=tablebody.children().eq(i);
					var firstcolumns = first.children();
					var recordtime = firstcolumns.eq(3).html();
					var status=firstcolumns.eq(4).html();
					if((status=='WAIT_CONFIRM')||(status=='DELIVERY')){
					var currentimes=currentime();
					var realgap=Days1(currentimes,recordtime);
					console.log("current-record",realgap/1000);
					var gap=15*60*1000;
					if(realgap<gap){
						//console.log(realgap);
					var btn=firstcolumns.eq(9);
					var a=true 
					if (a) {
								btn.html(((gap/1000)-(realgap/1000)));
								
								var time = setInterval(function() {
									var v=parseFloat(btn.html())
									btn.html( (v) - 1)
									if (btn.html() == '0s') {
										clearInterval(time);
										a = true;
										$("#yes").hide();
									}
								},1000);
								a = false;
							} else {
								return false;
							}
					
					
				
					}
					else{
						$("#yes").hide();
					}
					}
				}
				

    }
	
	
	
	
	
	
	
	
	);
	
	
	function Days1(day1, day2){
                var y1, y2, y3, m1, m2, m3, d1, d2, d3, h1, h2, h3, _m1, _m2, _m3, s1, s2, s3;
                var reg = /-|-|- |\/|:| /;
                //dayinfo -  用正则分割
                var DI1 = day1.split(reg);
                var DI2 = day2.split(reg);
 				console.log(DI1);
				console.log(DI2);
                var date1 = new Date(DI1[0], DI1[1], DI1[2], DI1[3], DI1[4], DI1[5]);
                var date2 = new Date(DI2[0], DI2[1], DI2[2], DI2[3], DI2[4], DI2[5]);
 
                //用距标准时间差来获取相距时间
                var minsec = Date.parse(date1) - Date.parse(date2);
				console.log(minsec);
                //var days = minsec / 1000 / 60 / 60 / 24; //factor: second / minute / hour / day
                //var  num = days.toFixed(4);
                //var newnum=num*24*60*60;
                return minsec;
                
            }
	function currentime(){
		var myDate = new Date();             

		var year=myDate.getFullYear();        //获取当前年
		var month=myDate.getMonth()+1;   //获取当前月
		var date=myDate.getDate();            //获取当前日


		var h=myDate.getHours();              //获取当前小时数(0-23)
		var m=myDate.getMinutes();          //获取当前分钟数(0-59)
		var s=myDate.getSeconds();
		if(month<10){
			month="0"+month;
		}
		if(date<10){
			date="0"+date;
		}
		if (h<10){
			h="0"+h;
		}
		if (m<10){
			m="0"+m;
		}
		if(s<10){
			s="0"+s;
		}
		var now=year+'-'+month+"-"+date+" "+h+':'+m+":"+s;
		return now;
	}

	
</script>
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
  
  <div class="container" >
    <div class="row clearfix" style="margin-top: 100px;color:white; background:rgba(244,222,222,0.7); border-radius:5em;min-height:500px;">
        <h2 style="text-align: center">Shopping History</h2>
		
		
		
		
        <table id="table" class="table">
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
				<th>
					Remain time
				<th>
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
                        <c:if test="${order.status eq 'RECEIVE'}">
                            <a href="${pageContext.request.contextPath}/order/receiver?orderId=${order.id}">Receiver</a>
                        </c:if>
                        <a href="${pageContext.request.contextPath}/order/orderDetail?orderId=${order.id}">Detail</a>
                        <c:if test="${order.status eq 'WAIT_CONFIRM' or order.status eq 'DELIVERY'}">
                            <a class ="cancle" href="${pageContext.request.contextPath}/order/userCancel?orderId=${order.id}">Cancel</a>
                        </c:if>
                    </td>
					<td id="yes" class="countdown">
						
					</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
		<h3 style="color:black!important;margin-left:400px;position:absolute;bottom:100px;font-size:15px;font-weight:bold;text-align: center">if you have any feedback, please email us :hotport@gmail.com </h3>
    </div>
</div>
</div>
</body>
</html>

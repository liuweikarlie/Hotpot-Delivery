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

<body>

<script>
    $(() => {
        $("#home").click(() => {
            window.location.href = "${pageContext.request.contextPath }/";
        });
        let area = "${requestScope.area}";
        console.log(area);
		if(area=="HK Island"){
			$("#HKIsland").css({"font-weight":"bold","color":"black"});
		}
		if(area=="New Territories"){
			$("#NewTerritories").css({"font-weight":"bold","color":"black"});
			
		}
		if(area=="Kowloon"){
				$("#Kowloon").css({"font-weight":"bold","color":"black"});
		}
        if (area) {
            area = area.replace(/\s*/g,"");
            let id = "#" + area;
            $(id).addClass("active");
            $(id).html(area);
            if (area === "HK Island") {
                $(id).html("HK Island");
				
				
            }
            if (area === "New Territories") {
                $(id).html("New Territories");
				
				
            }

			
        }
		
		

        $(".row").on("click",".thumbnail",function(){
            let shopId = $(this).attr("id");
            let userId = "${sessionScope.user.id}";
            if (userId) {
                window.location.href = "http://" + window.location.host + "/product/findByMerchant?merchantId=" + shopId + "&userId=" + userId;
            } else {
                window.location.href = "${pageContext.request.contextPath }/user/toLogin";
            }
        });
    })
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




.container{
	padding-top:100px;
	padding-left:0px;
	padding-right:0px;
	
}
.thumbnail {
  
  background-color: white;
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
  border-radius: 1.5em;
  
}
.thumbnail:hover{
	transform:scale(1.1);
	
}
.breadcrumb{
	 border-radius: 0.5em;
	 background:rgba(201,108,105,0.8);

	 
	
}
.nav navbar-nav navbar-right a{
	color:white;
}
</style>


<div class="transparent_box">
      <nav class="navbar  navbar-transparent" role="navigation">
		<div class="navbar-collapse collapse">
			<div class="col-md-1 column"></div>
			<div class="navbar-header">
				<a class="navbar-brand" id="home" style="font-weight: bold;
		font-size: 50px;-webkit-text-stroke-width: 1px;
  -webkit-text-stroke-color: #E91010;
  -webkit-text-fill-color: white;
  font-family: 'Gloria Hallelujah', cursive;">Hot port</a>
			</div>
			<ul class="nav navbar-nav">
				
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<c:if test="${not empty sessionScope.user}">
				<li><a  style="color:white;"href="${pageContext.request.contextPath }/user/info"><span class="glyphicon glyphicon-user"></span> ${sessionScope.user.username}</a></li>
				<li><a style="color:white;"href="${pageContext.request.contextPath }/user/logout"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
				
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
	
	
	
		
        <div class="col-md-12 column">
			
            <ul class="breadcrumb" style="margin-top: 100px; font-size: 20px;width:100%;">
				<div class="col-md-1 column">    </div>
				<div class="col-md-2 column" style="color:white">Select Area: </div>
                <li id="HKIsland" style="color:black" >
                    <a style="color:black" href="${pageContext.request.contextPath}/shop/findByArea?area=HK Island">HK Island</a>
                </li>
                <li id="Kowloon" >
                    <a style="color:black" href="${pageContext.request.contextPath}/shop/findByArea?area=Kowloon">Kowloon</a>
                </li>
                <li id="NewTerritories">
                    <a style="color:black" href="${pageContext.request.contextPath}/shop/findByArea?area=New Territories">New Territories</a>
                </li>
				
            </ul>
		
            <div class="row" style="padding-top:50px;padding-left:100px;">
                <c:forEach var="shop" items="${shops}">
                    <div class="col-md-4">
                        <div class="thumbnail" style="display: inline-block; width: 100%; height: 150px; display:inline-block" id="${shop.id}">
                            
                            <div class="col-md-6" >
                                <h4 style="font-size:20px;">${shop.merchantName}</h4>
                                
                                    <p style="color:gray">
                                            ${shop.text1}</p>
                                    <p style="color:gray">
                                            ${shop.text2}</p>
                                    <p style="color:gray">
                                            ${shop.text3}</p>
                                  
                            </div>
							<div class="col-md-5">
                                <img style="width: 100%;" src="${shop.icon}"/>
                            </div>
                        </div>
                    </div>
                </c:forEach>

            </div>
			
        </div>
    </div>
</body>

</html>
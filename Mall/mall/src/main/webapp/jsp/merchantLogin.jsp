<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Merchant Login</title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="${pageContext.request.contextPath }/css/bootstrap.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath }/js/jquery-3.5.1.min.js"></script>
    <script src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
	<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Gloria+Hallelujah&display=swap" rel="stylesheet">
</head>
<body>

<div>
			<div class="col-md-12 column" style="height:350px;display:flex;background:url(${pageContext.request.contextPath }/img/homepage.jfif) no-repeat;
	
	  background-size: cover;
	 text-align:center;
		position:relative;
		display:flex;
		align-items: center;
		justify-content: center;">
				
					
					<h1 align="center";style="display:flex;padding-top:100px;">Hot port</h1>
					
			
			</div>
			</div>
               <div class="input_space">
			
					<p class="p_text" align="center">please type your login name and your password</p>
					<div class="enter_infor">
                    <form  method="post" action="${pageContext.request.contextPath }/merchant/login" style="" id="form">
                        
                                <input class="un " type="text" align="center" placeholder="Login Name" name="loginName"/>
                         
                       
                                <input class="pass " type="password" align="center" placeholder="Password" name="password"/>
                          
                                <button type="submit" class="submit" align="center" id="">Login</button>
								<a class="new_acct" href="${pageContext.request.contextPath }/user/toLogin"> switch to customer page</a>
                          
                    </form>
                </div>
            </div>
        </div>
    </div>
   <style>
       body {
        background-color: rgba(130, 195, 222, 0.5);
        font-family: 'Ubuntu', sans-serif;
		
    }

h1{
	-webkit-text-stroke-width: 3px;
  -webkit-text-stroke-color: #E91010;
  font-size:90px;
  -webkit-text-fill-color: white;
  font-family: 'Gloria Hallelujah', cursive;
	
}
    
    .input_space {
       
		
        width: 500px;
        height: 200px;
        margin: 0.3em auto;
        
    }
    .p_text{
		font-size:15px;
		padding-bottom:10px;
		color:#f5576c
	}
    .input_space {
        padding-top: 40px;
        
        font-family: 'Ubuntu', sans-serif;
        font-weight: bold;
        font-size: 20px;
    }
    
    .un {
    width: 76%;
    color: rgb(38, 50, 56);
    font-weight: 700;
    font-size: 14px;
    letter-spacing: 1px;
    background-color: #C4C4C4;
    padding: 10px 20px;
    border: none;
    border-radius: 20px;
    outline: none;
    box-sizing: border-box;
    border: 2px solid rgba(0, 0, 0, 0.02);
    margin-bottom: 50px;
    margin-left: 46px;
    text-align: center;
    margin-bottom: 27px;
    font-family: 'Ubuntu', sans-serif;
    }
    
    form.form {
        padding-top: 40px;
    }
    
    .pass {
            width: 76%;
    color: rgb(38, 50, 56);
    font-weight: 700;
    font-size: 14px;
    letter-spacing: 1px;
    background-color: #C4C4C4;
    padding: 10px 20px;
    border: none;
    border-radius: 20px;
    outline: none;
    box-sizing: border-box;
    border: 2px solid rgba(0, 0, 0, 0.02);
    margin-bottom: 50px;
    margin-left: 46px;
    text-align: center;
    margin-bottom: 27px;
    font-family: 'Ubuntu', sans-serif;
    }
    
   
    .un:focus, .pass:focus {
        border: 2px solid rgba(0, 0, 0, 0.18) !important;
        
    }
    
    .submit {
      cursor: pointer;
        border-radius: 5em;
        color: #fff;
        background: linear-gradient(to right, #f093fb, #f5576c);
		
        border: 0;
        padding-left: 40px;
        padding-right: 40px;
        padding-bottom: 10px;
        padding-top: 10px;
        font-family: 'Ubuntu', sans-serif;
        margin-left: 20%;
        font-size: 13px;
        box-shadow: 0 0 20px 1px rgba(0, 0, 0, 0.04);
    }
	.new_acct {
        text-shadow: 0px 0px 3px rgba(117, 117, 117, 0.12);
        color: #f5576c;
        padding-top: 15px;
		font-size: 13px;
		text-align: center;
    }
   
   
   
   </style>
</div>
</body>
</html>

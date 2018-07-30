
<%@page import="java.util.Iterator"%>  
<%@page import="java.util.List"%> 
<%@ page language="java" contentType="text/html; charset=GBK"  
    pageEncoding="GBK"%>  

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge" charset=ISO-8859-1"  name="author" content="nekofriends">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" href="../../favicon.ico">
    <link href="../../assets/css/ie10-viewport-bug-workaround.css" rel="stylesheet">
    <link href="signin.css" rel="stylesheet">
    <!-- ×îÐÂ°æ±¾µÄ Bootstrap ºËÐÄ CSS ÎÄ¼þ -->
	<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
	<!-- ¿ÉÑ¡µÄ Bootstrap Ö÷ÌâÎÄ¼þ£¨Ò»°ã²»ÓÃÒýÈë£© -->
	<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
	<!-- ×îÐÂµÄ Bootstrap ºËÐÄ JavaScript ÎÄ¼þ -->
	<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <script src="../../assets/js/ie-emulation-modes-warning.js"></script>
    
    <style type="text/css">  
.personal-mybuluo-head {  
    height: 14px;  
    position: relative;  
}  
.personal-mybuluo-wording {  
    position: absolute;  
    top: 0;  
    z-index: 2;  
    left: 50%;  
    background-color: rgb(246,201,1);  
    color: rgb(253,2,2);  
    text-align: center;  
    -webkit-transform: translate(-50%,0);  
    transform: translate(-50%,0);  
    padding: 0 10px;  
}  
.personal-border {  
    position: absolute;  
    top: -7px;  
    left: 0;  
    width: 100%;  
    height: 14px;  
    z-index: 1;  
}  
.jmu-border-1px {  
    position: relative;  
}  
.jmu-border-1px.border-bottom:after {  
    border-bottom: 1px solid rgb(255,255,86);  
}  
@media only screen and (-webkit-min-device-pixel-ratio: 2)  
.jmu-border-1px:after {  
    right: -100%;  
    bottom: -100%;  
    -webkit-transform: scale(0.6);  
}  
.jmu-border-1px:after {  
    display: block;  
    content: '';  
    position: absolute;  
    top: 0;  
    right: 0;  
    bottom: 0;  
    left: 0;  
    -webkit-transform-origin: 0 0;  
    -webkit-transform: scale(2);  
    pointer-events: none;  
}  
              
</style> 
</head>
<body style="background-color:rgb(246,201,1)">
	<center>
		<font size="8" face="Papyrus" color="red">SHANAPAY</font>
		<br>
		<img src="title.png" />
		<br>
		<br>	

	<div class="personal-mybuluo-head">
	<div class="personal-mybuluo-wording"><font  size="6" face="Papyrus" color="red">Administrator</font></div>
	<div class="personal-border jmu-border-1px border-bottom"></div>
	</div>
	<br>	
	<br>
	<br>
		<form name="adlogin" action="adlogin" method=post onSubmit="return validate(this)">
					<p>
						<div class="input-group">
            				<input type="text" class="form-control" name="lgname"  placeholder="UserName">
            				<br>
            		
           				</div>
           			<p>
            			<div class="input-group">
            				<input type="password" class="form-control" name="lgpass"  placeholder="Password">
            				<br>
            				<br>
           				</div>
        			</p>
					<%  
						request.setCharacterEncoding("GBK");  
					%>  
					<%  	
						List<String> info=(List<String>)request.getAttribute("info");  
						if(info!=null){  
    						Iterator<String> iter=info.iterator();  
    						while(iter.hasNext()){  
					%>  
						<h4>
							<font size="2" face="Papyrus" color="red">
								<%=iter.next()%>
							</font>
						</h4>  
					<%   
												}  
									}  
					%>
						<div class="btn-group" role="group" aria-label="...">
  							<button type="submit"  class="btn btn-warning"><font size="2" face="Papyrus" color="red">Login</font></button></div>
  						<div class="btn-group" role="group" aria-label="...">
  							<button type="reset" class="btn btn-warning"><font size="2" face="Papyrus" color="red">Reset</font></button></div>
  						
		</form>
		<br>
		<div class="btn-group" role="group" aria-label="...">
  				<button id="bt2"  class="btn btn-warning" onclick="location.href='index.jsp'" ><font size="2" face="Papyrus" color="red">Return</font></button></div>
  			<br>  			
		<img src="shana.jpg" /> 
		<br>
		<a href="https://weibo.com/2651843293/profile?rightmod=1&wvr=6&mod=personnumber&is_all=1">
			<font size="1" face="Papyrus" color="red">Copyright 1997 - 2017 nekofriends. All Rights Reserved.</font>
		</a>
	</center>
		
</body>
</html>
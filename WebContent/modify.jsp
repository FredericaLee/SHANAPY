
<%@page import="Infor.User"%> 
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
<head>
<body style="background-color:rgb(246,201,1)">
	<% 
		User a=(User)request.getAttribute("User");
		request.setAttribute("User",a);
		//out.print(a.userName);
	%>

	<center>
		<font size="8" face="Papyrus" color="red">SHANAPAY</font>
		<br>
		<img src="title.png" />
		<br>
		<br>	

	<div class="personal-mybuluo-head">
	<div class="personal-mybuluo-wording"><font  size="6" face="Papyrus" color="red">MODIFY</font></div>
	<div class="personal-border jmu-border-1px border-bottom"></div>
	</div>
	<br>	
	<br>
	<br>
		<%  
						request.setCharacterEncoding("GBK");  
					%>  
					<%  	
						List<String> info=(List<String>)request.getAttribute("info");  
						if(info!=null){  
    						Iterator<String> iter=info.iterator();  
    						while(iter.hasNext()){  
					%>  	<h4>
							<font size="2" face="Papyrus" color="red">
								<%=iter.next()%>
							</font>
							</h4> 
					<%   
													}  
									}  
					%>
		<br>
		<br>
		<form name="modify" action="modify" method=post onSubmit="return validate(this)">
			<p>
				
				<div class="input-group">
            		<font size="4" face="Papyrus" color="red">UserName</font>
            		<input type="text" class="form-control" name="Name" style="border-radius:10px" size="12"  required="required" value="<%out.print(a.userName);%> ">
            		<br>
           		</div>
           		
           		<br>
           		<br>
           	<p>	
           		<div class="input-group" >
           		<font size="4" face="Papyrus" color="red" >password for defray</font>
            		<input type="text" class="form-control" name="pass_pay" style="border-radius:10px" size="3" required="required" value="<%out.print(a.pass_pay);%>">
            		<br>
            		<br>
            		<font size="4" face="Papyrus" color="red" >input again</font>
            		<input type="text" class="form-control" name="pass_pay_re" style="border-radius:10px" size="3"  required="required" value="<%out.print(a.pass_pay);%>" >
           		</div>
           		<br>
           		<br>
           	<p>	
           		<div class="input-group">
           			<font size="4" face="Papyrus" color="red" >password for login</font>
            		<input type="text" class="form-control" name="pass_log" style="border-radius:10px" size="5"  required="required" value="<%out.print(a.pass_log);%>">
            		<br>
            		<br>
            		<font size="4" face="Papyrus" color="red" >input again</font>
            		<input type="text" class="form-control" name="pass_log_re" style="border-radius:10px" size="5"  required="required" value="<%out.print(a.pass_log);%>">
           		</div>
           		<br>
           		<br>
           		
           	<p>
           		<% if (a.cardID!=null){%>
           		<div class="input-group">
           			<font size="3" face="Papyrus" color="red" >Band with BankCard</font>
           			<input type="checkbox" name="bank" checked >
           			<input type="text" class="form-control" name="bankcard" style="border-radius:10px" size="1" value="<%out.print(a.cardID);%>">
           		</div>
           		<br>
           		<br>
           	
           	<%		}
           	  else {%>
           	  		<div class="input-group">
           			<font size="3" face="Papyrus" color="red" >Band with BankCard</font>
           			<input type="checkbox" name="bank"  >
           			<input type="text" class="form-control" name="bankcard" style="border-radius:10px" size="1" >
           		</div>
           		<br>
           		<br>
           	  		
           	  <% }%>
           	  <p>
           	  	<%if(a.hbID!=null) {%>
           	  	
           		<font size="4" face="Papyrus" color="red" >Apply for HB account</font>
           		<input type="checkbox" name="hb" checked>
           		<br>
           		<font size="3" face="Courier New" color="red" >Your hbID is <%out.print(a.hbID);%></font>
           		<br>
           		<br>
      			<br>
      			<br>
 					<%}
           	  	else{%>
           	  	<font size="4" face="Papyrus" color="red" >Apply for HB account</font>
           		<input type="checkbox" name="hb">
           		<br>
           		<br>
      			<br>
      			<br>
           	  	
           	  	<%}%>
           	<p>	
           		<font size="4" face="Papyrus" color="red">default way to defray</font>
            	<br>
            	<% if(a.de_pay.equals("0")){%>
					<label class="radio-inline">
        				<input type="radio"  name="de" value="de0" checked><font size="2" face="Papyrus" color="red">balance</font>
    				</label>
    				<label class="radio-inline">
        				<input type="radio"  name="de"  value="de1"><font size="2" face="Papyrus" color="red">bankcard</font>
   					</label>
   					<label class="radio-inline">
        				<input type="radio"  name="de"  value="de2"><font size="2" face="Papyrus" color="red">hb</font>
   					</label>				
            	
           		<%}
            	else if(a.de_pay.equals("1")){%>
            	<label class="radio-inline">
        				<input type="radio"  name="de" value="de0" ><font size="2" face="Papyrus" color="red">balance</font>
    				</label>
    				<label class="radio-inline">
        				<input type="radio"  name="de"  value="de1" checked><font size="2" face="Papyrus" color="red">bankcard</font>
   					</label>
   					<label class="radio-inline">
        				<input type="radio"  name="de"  value="de2"><font size="2" face="Papyrus" color="red">hb</font>
   					</label>
            	<%
            	}else{ %>
            	<label class="radio-inline">
        				<input type="radio"  name="de" value="de0" ><font size="2" face="Papyrus" color="red">balance</font>
    				</label>
    				<label class="radio-inline">
        				<input type="radio"  name="de"  value="de1"><font size="2" face="Papyrus" color="red">bankcard</font>
   					</label>
   					<label class="radio-inline">
        				<input type="radio"  name="de"  value="de2" checked><font size="2" face="Papyrus" color="red">hb</font>
   					</label>
           		<%} %>
           		<br>
           		<br>
           	<p>
           		<div class="btn-group" >
  					<button type="submit"  class="btn btn-warning"><font size="4" face="Papyrus" color="red">Submit</font></button></div>
  				<div class="btn-group">
  						<button type="reset" class="btn btn-warning"><font size="4" face="Papyrus" color="red">Reset</font></button></div>
  				<div class="btn-group" >
  					<button class="btn btn-warning" type="button" onclick="location.href='homepage.jsp'" ><font size="4" face="Papyrus" color="red">Return</font></button></div>
		</form>
		<br>  			
		<img src="shana.jpg" />
		<br>
		<a href="https://weibo.com/2651843293/profile?rightmod=1&wvr=6&mod=personnumber&is_all=1">
			<font size="1" face="Papyrus" color="red">Copyright 1997 - 2017 nekofriends. All Rights Reserved.</font>
		</a>
	</center>
		
</body>
</html>
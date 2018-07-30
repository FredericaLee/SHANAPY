<%@page import="Infor.User"%> 
<%@page import="java.util.Iterator"%>  
<%@page import="java.util.List"%> 
<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>RePay</title>
<script src="js/bootstrap.min.js"></script>
<script src="js/bootstrap.js"></script>
<script src="../../assets/js/ie-emulation-modes-warning.js"></script>
    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
	<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
	<!-- 可选的 Bootstrap 主题文件（一般不用引入） -->
	<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
	<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
	<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
	<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body style="background-color:rgb(246,201,1)">
	<% 
		User a=(User)request.getAttribute("User");
		request.setAttribute("User",a);
	%>
	<font size="6" face="Papyrus" color="red">SHANAPAY</font>
	<img src="title.png" height="20%" width="20%" />
	<br>
	<br>
	<center>
	<% 
		if(a.refund.equals("0"))
		{
		%>
		<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<font size="8" face="Papyrus" color="red">Congratulations! Your have zero in debt. </font>	
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<button  class="btn btn-warning" onclick="location.href='homepage.jsp'" ><font size="3" face="Papyrus" color="red">Return</font></button>
	<%
	}
		else{
		%>
		
			<form name="hbrepay" action="hbrepay" method=post onSubmit="return validate(this)">
					<p>
					<br>
					<br>
						<div class="input-group">
            				<input type="text" class="form-control" style="border-radius:10px" name="sum" placeholder="Sum">
            				<br>
            				<br>
            				<br>
           				</div>
           			<p>
           			<p>	
           		<font size="5" face="Papyrus" color="red">way to defray</font>
           		<br>
            	<br>
					<label class="radio-inline">
        				<input type="radio"  name="way" value="way0"><font size="2" face="Papyrus" color="red">balance</font>
    				</label>
    				<label class="radio-inline">
        				<input type="radio"  name="way"  value="way1"><font size="2" face="Papyrus" color="red">bankcard</font>
   					</label>				
            	
  
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
							<font size="2" face="Courier New" color="red">
								<%=iter.next()%>
							</font>
							</h4> 
					<%   
													}  
									}  
					%>
					
					
							<div class="btn-group" role="group" aria-label="...">
  								<button type="submit"  class="btn btn-warning"><font size="2" face="Papyrus" color="red">Submit</font></button></div>
  								 &nbsp; &nbsp;
  							<div class="btn-group" role="group" aria-label="...">
  								<button type="reset" class="btn btn-warning"><font size="2" face="Papyrus" color="red">Reset</font></button></div>
				</form>
			<br>
			<br>
		<button  class="btn btn-warning" onclick="location.href='homepage.jsp'" ><font size="3" face="Papyrus" color="red">Return</font></button>
	
	
	<%
	}
	%>	
	
	
	<br>
	<br>
			<br>
			<br>
			<br>
	<a href="https://weibo.com/2651843293/profile?rightmod=1&wvr=6&mod=personnumber&is_all=1">
		<font size="1" face="Papyrus" color="red">Copyright 1997 - 2017 nekofriends. All Rights Reserved.</font>
	</a>
	</center>

</body>
</html>
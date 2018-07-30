
<!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- 可选的 Bootstrap 主题文件（一般不用引入） -->
<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>


<%@page import="java.util.Iterator"%>  
<%@page import="java.util.List"%> 
<%@ page language="java" contentType="text/html; charset=GBK"  
    pageEncoding="GBK"%>  

<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge" charset=ISO-8859-1"  name="author" content="nekofriends">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" href="../../favicon.ico">
    <link href="../../assets/css/ie10-viewport-bug-workaround.css" rel="stylesheet">
    <link href="signin.css" rel="stylesheet">
    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
	<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
	<!-- 可选的 Bootstrap 主题文件（一般不用引入） -->
	<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
	<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
	<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <script src="../../assets/js/ie-emulation-modes-warning.js"></script>
<head>
<body style="background-color:rgb(246,201,1)">

	<center>
		<font size="8" face="Papyrus" color="red">SHANAPAY</font>
		<br>
		<img src="title.png" />
		<br>
		<%  
				request.setCharacterEncoding("GBK");  
		%>  
		<%  	
				List<String> info=(List<String>)request.getAttribute("info"); 
				List<String> ree=(List<String>)request.getAttribute("ree");
				//int flag=(int)request.getAttribute("flag");
				//if(flag==0){
					if(info!=null){  
    					Iterator<String> iter=info.iterator();  
    					while(iter.hasNext()){  
			%>  
				<h4><%=iter.next()%></h4>  
		<%   
		}  
				//}
					if(ree!=null){  
		    			Iterator<String> iters=ree.iterator();  
		    					while(iters.hasNext()){  
				%>  
						<h4><%=iters.next()%></h4>  
				<%   
				}  
						} 
					}
				else{
					
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
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
    <!-- ×îÐÂ°æ±¾µÄ Bootstrap ºËÐÄ CSS ÎÄ¼þ -->
	<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
	<!-- ¿ÉÑ¡µÄ Bootstrap Ö÷ÌâÎÄ¼þ£¨Ò»°ã²»ÓÃÒýÈë£© -->
	<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
	<!-- ×îÐÂµÄ Bootstrap ºËÐÄ JavaScript ÎÄ¼þ -->
	<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <script src="../../assets/js/ie-emulation-modes-warning.js"></script>
<head>
<body style="background-color:rgb(246,201,1)">

	<center>
		<font size="8" face="Papyrus" color="red">SHANAPAY</font>
		<br>
		<img src="title.png" />
		<br>
		
			<form name="sqlact" action="sqlact" method=post onSubmit="return validate(this)">	
				<select class="selectpicker" name="actt">
         			<option value="qu" SELECTED>query</font></option>
         			<option value="ins">insert</option>
         			<option value="del">delete</option>
         			<option value="up">update</option>
         			<option value="pro">call</option>
         		</select>
         		<br>
 				<br>
 				<div class="input-group">        		
         			<input class="form-control" type="text" name="tablee" value="" placeholder="Table Name" style="border-radius:10px"><br>
					<br>
         			<input class="form-control" type="text" name="roww" value="" placeholder="Row Name" style="border-radius:10px"><br>
					<br>
         			<input class="form-control" type="text" name="choose" value="" placeholder="Condition" style="border-radius:10px"><br>
         			<br>
         			<br>
         		</div>
         		<div class="btn-group" role="group" aria-label="...">
  					<button class="btn btn-default"  type="submit" ><font size="4" face="Papyrus" color="black">Submit</font></button></div>
  				<div class="btn-group" role="group" aria-label="...">
  					<button class="btn btn-default" type="button" onclick="location.href='index.jsp'" ><font size="4" face="Papyrus" color="black">Return</font></button></div>
			</form>
		
		<br>  
		<br>
		<br>
		<br>			
		<img src="shana.jpg" />
		<br>
		<a href="https://weibo.com/2651843293/profile?rightmod=1&wvr=6&mod=personnumber&is_all=1">
			<font size="1" face="Papyrus" color="red">Copyright 1997 - 2017 nekofriends. All Rights Reserved.</font>
		</a>
	</center>
		
</body>
</html>
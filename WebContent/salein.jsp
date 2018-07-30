<%@page import="java.util.Iterator"%>  
<%@page import="java.util.List"%>
<%@page import="Infor.User"%>    
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">  
<html>  
<head>  

<script src="../../assets/js/ie-emulation-modes-warning.js"></script>
    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
	<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
	<!-- 可选的 Bootstrap 主题文件（一般不用引入） -->
	<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
	<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
	<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
	<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
<!-- 
    <link rel="stylesheet" type="text/css" href="styles.css"> 
    --> 
    <style type="text/css"> 
    .cl{
	background:  #FFD700;
	}
	.bg2{
	
	width: 80%;
	border-radius: 10px;
	}
	
	
	.table-bordered th,  
    .table-bordered td {  
    border: 1.5px solid #000 !important;  
      }
    .table th, .table td {  
    text-align: center;
    vertical-align: middle!important;
    font-size: 16px;
	font-face: Courier New;
	color:#F00;
     height:      40px;   
    }   
</style>
</head>  
  
<body style="background-color:rgb(246,201,1)">
	<% User us=(User)request.getAttribute("User");
		request.setAttribute("User",us); 
	%>
	<font size="6" face="Papyrus" color="red">SHANAPAY</font>
	<img src="title.png" height="10%" width="20%" />
	<br>
	<center>	
					<div class="bg2">
						<br>
						<br>
						<font size="9" face="Papyrus" color="red">Indent Management</font>
											
						<br>
						<br> 
						<div class="panel">
						<div class="cl">
							<div class="panel-body">  						
								<table class="table table-hover table-bordered row mx-0" id="sale_in">
									<colgroup>
										<col style="width:10%">
										<col style="width:30%">
										<col style="width:10%">
										<col style="width:10%">
										<col style="width:20%">
										<col style="width:10%">
									</colgroup>  
									
            							<tr>
	            							<th>Indent ID</th>
	            							<th>goods list</th>
	            							<th>sum</th>
	            							<th>buyer ID</th>
	            							<th>date</th>
	            							<th>state</th>
            							</tr>  
       			 					
    							</table> 
    					</div>  	
    					</div>
    					</div>
    				</div>
    				<button class="btn btn-warning" type="button" style="float:center" onclick="location.href='homepage.jsp'"><font size="3" face="Papyrus" color="red">Return</font></button>			
    	</center>	
    <script type="text/javascript">  
    
    window.onload=function validate1(){   
     var xmlhttp1;  
     var table1=document.getElementById('sale_in'); 
  
        if (window.XMLHttpRequest) {  
            xmlhttp1 = new XMLHttpRequest();  
        } else {  
            xmlhttp1 = new ActiveObject("Microsoft.XMLHTTP");  
        }  
        xmlhttp1.onreadystatechange = function() {  
            if (xmlhttp1.readyState == 4 && xmlhttp1.status == 200) {  
                var x1 = xmlhttp1.responseText;    
                var sd1 = eval("(" + x1 + ")");  
  
                
                for ( var a1 in sd1.indent) {//获取有几个person   
                    var trr1=document.createElement("tr");
                    for ( var item1 in sd1.indent[a1]) {   
                        var p1 = sd1.indent[a1][item1];//得到属性值的内容  '
                        var cell1=document.createElement("td");
                        cell1.innerHTML=p1;//把内容填向table表格  
                        trr1.appendChild(cell1);
                    }
                    table1.appendChild(trr1);
                }  
            }  
        }      
        var url1 = "sale_in";  
        xmlhttp1.open("POST", url1, true);  
       xmlhttp1.send();  
  
    }  
</script>	
		
				
	 
</body>    
</html> 
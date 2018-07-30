<%@page import="java.util.Iterator"%>  
<%@page import="java.util.List"%>
<%@page import="Infor.User"%> 

<%@ page language="java" contentType="text/html; charset=GBK"  
    pageEncoding="GBK"%>  

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=GBK">
    <meta http-equiv="X-UA-Compatible" content="IE=edge"   name="author" content="nekofriends">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="../../assets/js/ie-emulation-modes-warning.js"></script>
    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
	<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
	<!-- 可选的 Bootstrap 主题文件（一般不用引入） -->
	<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
	<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
	<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
	<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	   <!-- 第一步：标签式单文件引入。引入之后可以直接使用echarts对象。 -->  
    <script src="js/echarts.min.js"></script>  
	
	<style type="text/css">
	.tab .nav-tabs {
	
	background: rgb(246,201,1);
	border-radius: 7px;
	
	}
	.tab .nav-tabs li a {
	border-radius: 7px;
	font-size: 16px;
	padding: 12px 22px; 
	color:   rgb(255,0,0) ;
	}
	.tab .nav-tabs li.active a, .tab .nav-tabs li.active a i {
	border-radius: 7px;
	background:  #FFFAF0;
	color:   rgb(255,0,0) ;   <!--选中字的颜色；上面是选中按钮的颜色 -->
	}
	
	.tab .tab-content {
	padding: 5px;
	font-size: 14px;
	line-height: 20px;
	border-top: 3px solid rgb(255,255,86);
	margin-top: 0px;
	}

	
	@media only screen and (max-width: 480px) {
	.tab .nav-tabs, .tab .nav-tabs li {
	width: 100%;
	background: transparent;
	}
	
	.tab .nav-tabs li.active a {
	border-radius: 12px 12px 0 0;
	
	
	}
	.tab .nav-tabs li:first-child a {
	border-bottom-left-radius: 0;
	}
	.tab .nav-tabs li a {
	margin-bottom: 0px;
	border: 1px solid ;
	}
	.tab .nav-tabs li.active a:after {
	background:  #FFFAF0;
	border: none;
	}
	}
	.bg{
	width: 50%;
	border-radius: 10px;
	color: #F00;
	}
	.cl{
	background:  #FFD700;
	}
	.bg2{
	font-size: 16px;
	font-face: Courier New;
	color:#F00;
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
     height:      40px;   
    }   
</style>


</head>
<body style="background-color:rgb(246,201,1)">
	<% User us=(User)request.getAttribute("User");
		request.setAttribute("User",us);
	   String name=us.userName;
	   String id=us.userID;
	   String passp=us.pass_pay;
	   String passl=us.pass_log;
	   String cardID=us.cardID;
	   String hbID=us.hbID;
	   String bal=us.bal;
	   String de=us.de_pay;
	   
	   request.setAttribute("id",id);
	%>
	<font size="6" face="Papyrus" color="red">SHANAPAY</font>
	<img src="title.png" height="20%" width="20%" />
	<font size="3" face="Papyrus" color="red" style="float:right">Hello,<%out.print(name+"!");%></font>
	<br>
	<center>
		<div class="tab">
			 <ul id="myTab" class="nav nav-tabs">
			 
				<li class="active">
					<a href="#welcome" data-toggle="tab">
						<span class="glyphicon glyphicon-heart" style="color: rgb(255, 0, 0);"> 
							<font size="4" face="Papyrus" color="red">Welcome</font>
						</span>
					</a>
				</li>
		
		
				<li>
					<a href="#profile" data-toggle="tab">
						<span class="glyphicon glyphicon-user" style="color: rgb(255, 0, 0);"> 
							<font size="4" face="Papyrus" color="red">Profile</font>
						</span>
					</a>	
				</li>
				
				
				<li class="dropdown">
					<a href="#" id="myTabDrop1" class="dropdown-toggle" data-toggle="dropdown">
						<span class="glyphicon glyphicon-object-align-top" style="color: rgb(255, 0, 0);"> 
							<font size="4" face="Papyrus" color="red">sale center</font>
						</span> 
						<b class="caret"></b>
					</a>
					<ul class="dropdown-menu" role="menu" aria-labelledby="myTabDrop1">
						<li>
							<a href="#ci" tabindex="-1" data-toggle="tab">
								<span class="glyphicon glyphicon-edit" style="color: rgb(255, 0, 0);"> 
									<font size="4" face="Papyrus" color="red">create Indent</font>
								</span> 
							</a>
						</li>
						
					
						
						<li>
						<a href="#ss" tabindex="-1" data-toggle="tab">
							<span class="glyphicon glyphicon-signal" style="color: rgb(255, 0, 0);"> 
									<font size="4" face="Papyrus" color="red">statics</font>
							</span>
						</a>
						</li>
					</ul>
				</li>
			
				<li class="dropdown">
					<a href="#" id="myTabDrop1" class="dropdown-toggle" data-toggle="dropdown">
						<span class="glyphicon glyphicon-shopping-cart" style="color: rgb(255, 0, 0);"> 
								<font size="4" face="Papyrus" color="red">buy center</font>
						</span>
						<b class="caret"></b>
					</a>
					<ul class="dropdown-menu" role="menu" aria-labelledby="myTabDrop1">
						<li>
							<a href="#imb" tabindex="-1" data-toggle="tab">
								<span class="glyphicon glyphicon-list-alt" style="color: rgb(255, 0, 0);"> 
									<font size="4" face="Papyrus" color="red">Indent management</font>
								</span>
							</a>
						</li>
					
						<li>
							<a href="#sb" tabindex="-1" data-toggle="tab">
								<span class="glyphicon glyphicon-signal" style="color: rgb(255, 0, 0);"> 
									<font size="4" face="Papyrus" color="red">statics</font>
								</span>
							</a>
						</li>
						<li>
							<a href="#hm" tabindex="-1" data-toggle="tab">
								<span class="glyphicon glyphicon-signal" style="color: rgb(255, 0, 0);"> 
									<font size="4" face="Papyrus" color="red">HB management</font>
								</span>
							</a>
						</li>
					</ul>
				</li>
			</ul>
	
	
	
	
			<div id="myTabContent" class="tab-content">
				<div class="tab-pane fade in active" id="welcome"><!-- 欢迎页面 -->
					<p>
						<a href="wel.jsp" style="float:right">
		<font size="3" face="Papyrus" color="red"> Sign out</font></a>
		<br>
		<%  
						request.setCharacterEncoding("GBK");  
					%>  
					<%  	
						List<String> info=(List<String>)request.getAttribute("info");  
						if(info!=null){  
    						Iterator<String> iter=info.iterator();  
    						while(iter.hasNext()){  
					%>  	<h2>
							<font size="6" face="Papyrus" color="red">
								<%=iter.next()%>
								<br>
								<br>
							</font>
							</h2>
					<%   
													}  
									}  
					%>
						<img src="shana.jpg" />
					
					</p>
				</div>
				
				
				<div class="tab-pane fade" id="profile"> <!-- 个人空间 -->
					<div class="bg">
						<br>
						<br>
						<font size="9" face="Papyrus" color="red">Profile</font>
											
						<br>
						<br>
						<div class="panel">
							<div class="cl">
						    <div class="panel-body">
						    	
								<table class="table table-hover table-bordered row  mx-0" >
									<colgroup>
										<col style="width:30%">
										<col style="width:50%">
									</colgroup>
									<tbody>
										<tr>
									      <td><font size="3" face="Courier New">UserID</font></td>
									      <td><font size="3" face="Courier New"><%out.print(id);%></font></td>
									    </tr>
									    <tr>
									      <td><font size="3" face="Courier New">UserName</font></td>
									      <td><font size="3" face="Courier New"><%out.print(name);%></font></td>
									    </tr>
									    <tr>
									      <td><font size="3" face="Courier New">pass_pay</font></td>
									      <td><font size="3" face="Courier New"><%out.print(passp);%></font>
																      
												</td>
									    </tr>
									    <tr>
									      <td><font size="3" face="Courier New">pass_log</font></td>
									      <td><font size="3" face="Courier New"><%out.print(passl);%></font>
									      	
									      </td>
									    </tr>
									    <tr>
									      <td><font size="3" face="Courier New">cardID</font></td>
									      <td><font size="3" face="Courier New"><%
									      									  if(cardID!=null){out.print(cardID);}
									      									  else{out.print("");}
									      									  %></font>
									     </td>
									    </tr>
									    <tr>
									      <td><font size="3" face="Courier New">hbID</font></td>
									      <td><font size="3" face="Courier New"><%
									      									  if(hbID!=null)out.print(hbID);
									      									  else{out.print("");}
									      									  %></font>
									      	
									      </td>
									    </tr>
									    <tr>
									      <td><font size="3" face="Courier New">de_pay</font></td>
									      <td><font size="3" face="Courier New"><%
									      									  if(de.equals("0")){out.print("balance");}
									      									  if(de.equals("1")){out.print("BankCard");}
									      									  if(de.equals("2")){out.print("hb");}
									      									  			
									      									%></font>
									    
									     </td>
									    </tr>
									     <tr>
									     <td><font size="3" face="Courier New">bal</font></td>
									     <td><font size="3" face="Courier New"><%out.print(bal);%></font></td>
									    </tr>
									  </tbody>
									</table>
										<button class="btn btn-warning" type="button" style="float:center" onclick="location.href='modify.jsp'"><font size="3" face="Papyrus" color="red">modify</font></button>							

								</div>
							</div>
						</div>
					</div>
				</div>
				
				
				
				
				<div class="tab-pane fade" id="ci"> <!-- 创建订单-->
					<br>
					<br>
					<font size="9" face="Papyrus" color="red">Create Indent</font>				
					<br>
					<br>
					<br>
					
					<a href="salein.jsp">
						<font size="4" face="Papyrus" color="red">See your indent
						</font></a>
					<br>
					<br>
					<br>
					<p>
						<form name="icreate" action="icreate" method=post onSubmit="return validate(this)">
					<p>
						<div class="input-group">
							<font size="4" face="Courier New" color="red">1. buyer ID</font>
            				<input type="text" class="form-control" name="buyer" style="border-radius:10px" size="6">
            				<br>
            				<br>
            				<br>
            				<br>
            				<br>
            				<br>
            				
           				</div>
           			<p>
            			<div class="input-group">
            				<font size="4" face="Courier New" color="red">2. goods list</font>
            				<input type="text" class="form-control" name="goods" style="border-radius:10px" size="3">
            				<br>
            				<br>
            				<br>
            				<br>
            				<br>
            				<br>
           				</div>
           			<p>
	           			<div class="input-group">
            				<font size="4" face="Courier New" color="red">3. sum</font>
            				<input type="text" class="form-control" name="money" style="border-radius:10px" size="15" >
            				<br>
            				<br>
            				<br>
            				<br>
            				<br>
            				<br>
           				</div>
						<div class="btn-group" role="group" aria-label="...">
  							<button type="submit"  class="btn btn-warning"><font size="4" face="Papyrus" color="red">Submit</font></button></div>
  							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
  						<div class="btn-group" role="group" aria-label="...">
  							<button type="reset" class="btn btn-warning"><font size="4" face="Papyrus" color="red">Reset</font></button></div>
  						
				</form>					
				</div>
	
				
				
				
				
				<div class="tab-pane fade" id="ss"> <!-- 统计数据 -->
					<p>
					<div id="main3"  
        style="height: 400px; width: 800px; border: 1px dotted black"></div>  
	    <span id="info3"></span>    
	    <script type="text/javascript">  
	        $(document).ready(function() {  
	            // 初始化一个图表实例  
	            var myChart = echarts.init(document.getElementById('main3'));  
	  
	            // 使用jquery发送post请求，第四个参数指明如何解析服务端返回的数据。  
	            // 服务端返回的必须是标准格式的json，也就是双引号括起来的键值对  
	            $.post("ajax/sale_num", {  
	                
	            }, function(data) {  
	                option.title.text = "sale record(num) in 10days";  
	                option.xAxis[0].data = data.date;  
	                option.series[0].data = data.num;  
	                // 取得数据后显示到图表中  
	                myChart.setOption(option);  
	                myChart.on(echarts.config.EVENT.CLICK, eConsole);  
	            }, 'json');  
	  
	            // echarts把复杂的图表结构化，图表的基本结构包括以下部分：标题，x轴，y轴，数值序列。  
	            var option = {  
	                // 标题  
	                title : {  
	                    x : 'center',  
	                    y : 'top',  
	                    textStyle : {  
	                        fontSize : 26,  
	                        fontFamily : "微软雅黑",  
	                    }  
	                },  
	                //   
	                grid : {  
	                    borderWidth : 0  
	                },  
	                tooltip : {  
	                    trigger : 'axis',  
	                    axisPointer : {  
	                        type : 'line',  
	                        lineStyle : {  
	                            color : '#FFFACD',  
	                            width : 2,  
	                            type : 'solid'  
	                        }  
	                    }  
	                },  
	                // x轴  
	                xAxis : [ {  
	                    type : 'category',  
	                    axisTick : {  
	                        show : false  
	                    },  
	                    splitLine : {  
	                        lineStyle : {  
	                            type : 'dotted'  
	                        }  
	                    }  
	                } ],  
	                // y轴  
	                yAxis : [ {  
	                    type : 'value',  
	                    axisLabel : {  
	                        formatter : '{value}'  
	                    },  
	                    splitLine : {  
	                        lineStyle : {  
	                            type : 'dotted',
	                            color : '#FFFACD',
	                            	 
	                        }  
	                    }  
	                } ],  
	                // 数值序列  
	                series : [ {  
	                    name : 'num',  
	                    type : 'line',  
	                    
	                    
	                } ]  
	            };  
	  
	            // 事件的参数中包括：数据在序列中的下标dataIndex，数据的值value，x轴上的名称name  
	            function eConsole(param) {  
	                if (typeof param.seriesIndex == 'undefined') {  
	                    return;  
	                }  
	                if (param.type == 'click') {  
	                    var mes = param.name + ':' + param.value;  
	                    document.getElementById('info3').innerHTML = mes;  
	                }  
	            }  
	        });  
	    </script>  
	    <br>
	    <br>
	    <div id="main4"  
        style="height: 400px; width: 800px; border: 1px dotted black"></div>  
	    <span id="info4"></span>    
	    <script type="text/javascript">  
	        $(document).ready(function() {  
	            // 初始化一个图表实例  
	            var myChart = echarts.init(document.getElementById('main4'));  
	  
	            // 使用jquery发送post请求，第四个参数指明如何解析服务端返回的数据。  
	            // 服务端返回的必须是标准格式的json，也就是双引号括起来的键值对  
	            $.post("ajax/sale_sum", {  
	                
	            }, function(data) {  
	                option.title.text = "sale record(sum) in 10days";  
	                option.xAxis[0].data = data.date;  
	                option.series[0].data = data.sum;  
	                // 取得数据后显示到图表中  
	                myChart.setOption(option);  
	                myChart.on(echarts.config.EVENT.CLICK, eConsole);  
	            }, 'json');  
	  
	            // echarts把复杂的图表结构化，图表的基本结构包括以下部分：标题，x轴，y轴，数值序列。  
	            var option = {  
	                // 标题  
	                title : {  
	                    x : 'center',  
	                    y : 'top',  
	                    textStyle : {  
	                        fontSize : 26,  
	                        fontFamily : "微软雅黑",  
	                    }  
	                },  
	                //   
	                grid : {  
	                    borderWidth : 0  
	                },  
	                tooltip : {  
	                    trigger : 'axis',  
	                    axisPointer : {  
	                        type : 'line',  
	                        lineStyle : {  
	                            color : '#FFFACD',  
	                            width : 2,  
	                            type : 'solid'  
	                        }  
	                    }  
	                },  
	                // x轴  
	                xAxis : [ {  
	                    type : 'category',  
	                    axisTick : {  
	                        show : false  
	                    },  
	                    splitLine : {  
	                        lineStyle : {  
	                            type : 'dotted'  
	                        }  
	                    }  
	                } ],  
	                // y轴  
	                yAxis : [ {  
	                    type : 'value',  
	                    axisLabel : {  
	                        formatter : '{value}yuan'  
	                    },  
	                    splitLine : {  
	                        lineStyle : {  
	                            type : 'dotted',
	                            color : '#FFFACD',
	                        }  
	                    }  
	                } ],  
	                // 数值序列  
	                series : [ {  
	                    name : 'sum',  
	                    type : 'line',
	                    
	                    
	                } ]  
	            };  
	  
	            // 事件的参数中包括：数据在序列中的下标dataIndex，数据的值value，x轴上的名称name  
	            function eConsole(param) {  
	                if (typeof param.seriesIndex == 'undefined') {  
	                    return;  
	                }  
	                if (param.type == 'click') {  
	                    var mes = param.name + ':' + param.value;  
	                    document.getElementById('info4').innerHTML = mes;  
	                }  
	            }  
	        });  
	    </script> 
					
					
					</p>
				</div>
				
				
				
				<div class="tab-pane fade" id="imb"> <!-- 管理订单（买家） -->
					<p>
					<br>
						<br>
						<font size="7" face="Papyrus" color="red">Pay</font>
						<br>
						<form name="ipay" action="ipay" method=post onSubmit="return validate(this)">
					<p>
					<br>
					<br>
						<div class="input-group">
						<font size="2" face="Papyrus" color="red">Pay for</font>
						<br>
            				<input type="text" class="form-control" style="border-radius:10px" name="inidpay" placeholder="Indent ID">
           				</div>
           				<br>
           				<div class="input-group">
           				<input type="text" class="form-control" style="border-radius:10px" name="inpass" placeholder="password for pay">
           				</div>

           			<p>
           			<br>
           			<font size="4" face="Papyrus" color="red">way to defray</font>
           			<% if(us.de_pay.equals("0")) { %>
					<label class="radio-inline">
        				<input type="radio"  name="depay" value="de0" checked><font size="2" face="Papyrus" color="red">balance</font>
    				</label>
    				<label class="radio-inline">
        				<input type="radio"  name="depay"  value="de1"><font size="2" face="Papyrus" color="red">bankcard</font>
   					</label>
   					<label class="radio-inline">
        				<input type="radio"  name="depay"  value="de2"><font size="2" face="Papyrus" color="red">hb</font>
   					</label>				
            	
           		<%}
            	else if(us.de_pay.equals("1")){ %>
            	<label class="radio-inline">
        				<input type="radio"  name="depay" value="de0" ><font size="2" face="Papyrus" color="red">balance</font>
    				</label>
    				<label class="radio-inline">
        				<input type="radio"  name="depay"  value="de1" checked><font size="2" face="Papyrus" color="red">bankcard</font>
   					</label>
   					<label class="radio-inline">
        				<input type="radio"  name="depay"  value="de2"><font size="2" face="Papyrus" color="red">hb</font>
   					</label>
            	<%
            	}else{ %>
            	<label class="radio-inline">
        				<input type="radio"  name="depay" value="de0" ><font size="2" face="Papyrus" color="red">balance</font>
    				</label>
    				<label class="radio-inline">
        				<input type="radio"  name="depay"  value="de1"><font size="2" face="Papyrus" color="red">bankcard</font>
   					</label>
   					<label class="radio-inline">
        				<input type="radio"  name="depay"  value="de2" checked><font size="2" face="Papyrus" color="red">hb</font>
   					</label>
           		<%} %>
           		
           		
							<div class="btn-group" role="group" aria-label="...">
  								<button type="submit"  class="btn btn-warning"><font size="2" face="Papyrus" color="red">Pay</font></button></div>
  								 &nbsp; &nbsp;
							</form>
				<p>	
					<div class="bg2">
						<div class="panel">
						<div class="cl">
							<div class="panel-body">  						
								<table class="table table-hover table-bordered row mx-0" id="buy_in1">
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
	            							<th>saler ID</th>
	            							<th>date</th>
	            							<th>state</th>
            							</tr>  
       			 					
    							</table> 
    					</div>  	
    					</div>
    					</div>
    				</div>
    			
    						<script type="text/javascript">  
    
    window.onload=function validate(){   
     var xmlhttp;  
     var table=document.getElementById('buy_in1'); 
  
        if (window.XMLHttpRequest) {  
            xmlhttp = new XMLHttpRequest();  
        } else {  
            xmlhttp = new ActiveObject("Microsoft.XMLHTTP");  
        }  
        xmlhttp.onreadystatechange = function() {  
            if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {  
                var x = xmlhttp.responseText    
                var sd = eval("(" + x + ")");  
  
                
                for ( var a in sd.indent) {//获取有几个person   
                    var trr=document.createElement("tr");
                    for ( var item in sd.indent[a]) {   
                        var p = sd.indent[a][item];//得到属性值的内容  '
                        var cell=document.createElement("td");
                        cell.innerHTML=p;//把内容填向table表格  
                        trr.appendChild(cell);
                    }
                    table.appendChild(trr);
                }  
            }  
        }      
        var url = "buy_in";  
        xmlhttp.open("POST", url, true);  
       xmlhttp.send();  
  
    }  
</script>	
					
					
				</div>
				
				
				<div class="tab-pane fade" id="sb"> <!-- 数据统计（买家） --> 
    <div id="main1"  
        style="height: 400px; width: 800px; border: 1px dotted black"></div>  
	    <span id="info1"></span>    
	    <script type="text/javascript">  
	        $(document).ready(function() {  
	            // 初始化一个图表实例  
	            var myChart = echarts.init(document.getElementById('main1'));  
	  
	            // 使用jquery发送post请求，第四个参数指明如何解析服务端返回的数据。  
	            // 服务端返回的必须是标准格式的json，也就是双引号括起来的键值对  
	            $.post("ajax/test", {  
	                
	            }, function(data) {  
	                option.title.text = "buy record(num) in 10days";  
	                option.xAxis[0].data = data.date;  
	                option.series[0].data = data.num;  
	                // 取得数据后显示到图表中  
	                myChart.setOption(option);  
	                myChart.on(echarts.config.EVENT.CLICK, eConsole);  
	            }, 'json');  
	  
	            // echarts把复杂的图表结构化，图表的基本结构包括以下部分：标题，x轴，y轴，数值序列。  
	            var option = {  
	                // 标题  
	                title : {  
	                    x : 'center',  
	                    y : 'top',  
	                    textStyle : {  
	                        fontSize : 26,  
	                        fontFamily : "微软雅黑",  
	                    }  
	                },  
	                //   
	                grid : {  
	                    borderWidth : 0  
	                },  
	                tooltip : {  
	                    trigger : 'axis',  
	                    axisPointer : {  
	                        type : 'line',  
	                        lineStyle : {  
	                            color : '#FFFACD',  
	                            width : 2,  
	                            type : 'solid'  
	                        }  
	                    }  
	                },  
	                // x轴  
	                xAxis : [ {  
	                    type : 'category',  
	                    axisTick : {  
	                        show : false  
	                    },  
	                    splitLine : {  
	                        lineStyle : {  
	                            type : 'dotted'  
	                        }  
	                    }  
	                } ],  
	                // y轴  
	                yAxis : [ {  
	                    type : 'value',  
	                    axisLabel : {  
	                        formatter : '{value}'  
	                    },  
	                    splitLine : {  
	                        lineStyle : {  
	                            type : 'dotted',
	                            color : '#FFFACD',
	                            
	                        }  
	                    }  
	                } ],  
	                // 数值序列  
	                series : [ {  
	                    name : 'num',  
	                    type : 'line',
	                    
	                } ]  
	            };  
	  
	            // 事件的参数中包括：数据在序列中的下标dataIndex，数据的值value，x轴上的名称name  
	            function eConsole(param) {  
	                if (typeof param.seriesIndex == 'undefined') {  
	                    return;  
	                }  
	                if (param.type == 'click') {  
	                    var mes = param.name + ':' + param.value;  
	                    document.getElementById('info1').innerHTML = mes;  
	                }  
	            }  
	        });  
	    </script>  
	    <br>
	    <br>
	    <div id="main2"  
        style="height: 400px; width: 800px; border: 1px dotted black"></div>  
	    <span id="info2"></span>    
	    <script type="text/javascript">  
	        $(document).ready(function() {  
	            // 初始化一个图表实例  
	            var myChart = echarts.init(document.getElementById('main2'));  
	  
	            // 使用jquery发送post请求，第四个参数指明如何解析服务端返回的数据。  
	            // 服务端返回的必须是标准格式的json，也就是双引号括起来的键值对  
	            $.post("ajax/test1", {  
	                
	            }, function(data) {  
	                option.title.text = "buy record(sum) in 10days";  
	                option.xAxis[0].data = data.date;  
	                option.series[0].data = data.sum;  
	                // 取得数据后显示到图表中  
	                myChart.setOption(option);  
	                myChart.on(echarts.config.EVENT.CLICK, eConsole);  
	            }, 'json');  
	  
	            // echarts把复杂的图表结构化，图表的基本结构包括以下部分：标题，x轴，y轴，数值序列。  
	            var option = {  
	                // 标题  
	                title : {  
	                    x : 'center',  
	                    y : 'top',  
	                    textStyle : {  
	                        fontSize : 26,  
	                        fontFamily : "微软雅黑",  
	                    }  
	                },  
	                //   
	                grid : {  
	                    borderWidth : 0  
	                },  
	                tooltip : {  
	                    trigger : 'axis',  
	                    axisPointer : {  
	                        type : 'line',  
	                        lineStyle : {  
	                            color : '#FFFACD',  
	                            width : 2,  
	                            type : 'solid'  
	                        }  
	                    }  
	                },  
	                // x轴  
	                xAxis : [ {  
	                    type : 'category',  
	                    axisTick : {  
	                        show : false  
	                    },  
	                    splitLine : {  
	                        lineStyle : {  
	                            type : 'dotted'  
	                        }  
	                    }  
	                } ],  
	                // y轴  
	                yAxis : [ {  
	                    type : 'value',  
	                    axisLabel : {  
	                        formatter : '{value}yuan'  
	                    },  
	                    splitLine : {  
	                        lineStyle : {
	                        	
	                            type : 'dotted' ,
	                            color : '#FFFACD',
	                        }  
	                    }  
	                } ],  
	                // 数值序列  
	                series : [ {  
	                    name : 'sum',  
	                    type : 'line',
	                    
	                    
	                } ]  
	            };  
	  
	            // 事件的参数中包括：数据在序列中的下标dataIndex，数据的值value，x轴上的名称name  
	            function eConsole(param) {  
	                if (typeof param.seriesIndex == 'undefined') {  
	                    return;  
	                }  
	                if (param.type == 'click') {  
	                    var mes = param.name + ':' + param.value;  
	                    document.getElementById('info2').innerHTML = mes;  
	                }  
	            }  
	        });  
	    </script>  	
				</div>
				
				
				
				<div class="tab-pane fade" id="hm"> <!-- 花呗账户管理 -->
				<br>
					<br>
					<font size="9" face="Papyrus" color="red">HB Managment</font>				
					<br>
					<br>
					<br>
					<br>
					<%if (hbID==null){%>
						<font size="3" face="Courier New">You don't have a HB account</font>
						<br>
						<a href="modify.jsp">
				 <font size="4" face="Courier New" color="red">Click to apply</font></a>
					<% } 
					else{%>
					
					<p>
					<div class="bg">
					<div class="panel">
							<div class="cl">
						    <div class="panel-body">
								<table class="table table-hover table-bordered row  mx-0" >
									<colgroup>
										<col style="width:50%">
										<col style="width:20%">
									</colgroup>
									<tbody>
										<tr>
									      <td><font size="3" face="Courier New">The money you need to repay</font></td>
									      <td><font size="3" face="Courier New"><%out.print(us.refund);%></font></td>
									    </tr>
									    <tr>
									      <td><font size="3" face="Courier New">The money you could borrow</font></td>
									      <td><font size="3" face="Courier New"><%out.print(us.bo);%></font></td>
									    </tr>
									    <tr>
									      <td><font size="3" face="Courier New">Your Hb level</font></td>
									      <td><font size="3" face="Courier New"><%out.print(Integer.parseInt(us.max_m)/1000+"("+us.max_m+"yuan for most)");%></font></td>
									    </tr>
									
									  </tbody>
									</table>
									</div>
									</div>
							</div>
							</div>		
							<button id="bt2"  class="btn btn-warning" onclick="location.href='repay.jsp'" ><font size="3" face="Papyrus" color="red">RePay</font></button>
					<%}%>	
				</div>
			</div>
		</div>
	<br>
	<a href="https://weibo.com/2651843293/profile?rightmod=1&wvr=6&mod=personnumber&is_all=1">
		<font size="1" face="Papyrus" color="red">Copyright 1997 - 2017 nekofriends. All Rights Reserved.</font>
	</a>
	</center>

	<script>
		$(function () {
	    	$('#myTab a:first').tab('show')
		})
	</script>
		 
		 
		

</body>
</html>
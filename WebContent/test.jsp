    <html>  
        <head>  
            <title>test</title>  
        </head>  
          
        <style type="text/css">  
            /* main是父元素没有设置高度，我们想让其随子元素高度的变化而变化*/  
            #main{width:800px; border:5px solid red;}     
              
            #left{width:400px; height:200px; background:green; float:left;}  
            #right{width:200px; height:100px; background:blue; float:right;}  
            .clear{clear:both;} /* 清除空白盒子的所有浮动 */  
              
            #footer{width:800px; border:1px solid #ccc;}  
              
      
        </style>  
          
        <body>  
              
            <div id="main"> <!-- 父元素 -->  
                <div id="left">left</div>           <!--子元素1-->  
                <div id="right">right</div>   <!--子元素2-->  
                <div class="clear"></div>         <!-- 空白盒子 -->  
            </div>  
              
            <div id="footer">footer</div>  
        </body>  
          
          
    </html>  
package ajax;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Infor.User;
import Infor.set2json;

//卖家统计金钱
public class sale_sum extends HttpServlet{
	private static final long serialVersionUID = 1L;

	 /**
	 * 
	 */
	
	
	public sale_sum(){
		super();
	}
	
	
	
		
	public void doGet(HttpServletRequest request, HttpServletResponse response)  
	            throws ServletException, IOException {  
	        this.doPost(request, response);  
	    }  
	  
	    public void doPost(HttpServletRequest request, HttpServletResponse response)  
	            throws ServletException, IOException {  
	    		PrintWriter out = null; 
	    		out=response.getWriter();
	    		try {
	    			User us=(User) request.getAttribute("User");
	    			String ch=us.userID;
	    			String url="select date,count(*) as num,sum(money) as sum from Indent_10  where  sale_ID= "+ch+" group by date";
	    			set2json a=new set2json(url);
	    		      ResultSet re=a.sqlact(1);
	    		      String b=a.add(re, 2);
	    		      //System.out.print(b);
	    		      out.print(b);
			
					out.flush();  
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}  finally  
			    {   
			        // 即使自己不关闭，tomcat等容器也会关闭  
			        if (out != null)  
			        {  
			            out.close();  
			        }  
	    				
	    }  

}
}

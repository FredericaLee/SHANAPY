package ajax;
//���ͳ������
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonArray;

import Infor.User;
import Infor.set2json;

public class test  extends HttpServlet {
	 /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public test(){
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
	    			String url="select date,count(*) as num,sum(money) as sum from Indent  where  DATE_SUB(CURDATE(), INTERVAL 10 DAY) <=date and buy_ID= "+ch+" and sta=\"1\" group by date";
	    			set2json a=new set2json(url);
	    		    ResultSet re=a.sqlact(1);
	    		      String b=a.add(re, 1);
	    		      //System.out.print(url);
	    		      //System.out.print(b);
	    		      out.print(b);
			
					out.flush();  
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}  finally  
			    {   
			        // ��ʹ�Լ����رգ�tomcat������Ҳ��ر�  
			        if (out != null)  
			        {  
			            out.close();  
			        }  
	    				
	    }  

}
}

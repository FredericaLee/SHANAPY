package login;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class adlogin extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	public adlogin(){
		super();
					}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {  
	    String name=request.getParameter("lgname");  
	    String password=request.getParameter("lgpass");  
	    List<String> info=new ArrayList<String>();  
	    if(name==null||"".equals(name)){ //�û��������ʽ����  
	        info.add("UserName can't be null!");  
	      
	    }  
	  
	    if(password==null||"".equals(password)){//���������ʽ����  
	       info.add("Password can't be null!");  
 
	    									}  
	    else{
	       try {
			if(name.equals("root")){
				if(password.equals("375n871l")){
				request.getRequestDispatcher("admin.jsp").forward(request,response);
				}
				else{
					info.add("Wrong Password!");
					}
			}
			else{
				info.add("YOU ARE NOT ADMINISTRATOR, RIGHT?");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	    }
	    request.setAttribute("info", info);//������Ϣ       
		request.getRequestDispatcher("adlogin.jsp").forward(request,response);
	    }  
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {  
	      doGet(request, response);  
	    }  

}

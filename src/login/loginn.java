package login;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DB.sqlcon;
import Infor.User;

public class loginn extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;


	public loginn(){
		super();
					}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {  
	    String name=request.getParameter("lgname");  
	    String password=request.getParameter("lgpass");  
	    List<String> info=new ArrayList<String>();  
	    if(name==null||"".equals(name)){ //用户名输入格式问题  
	        info.add("UserName can't be null!");  
	      
	    }  
	  
	    if(password==null||"".equals(password)){//密码输入格式问题  
	       info.add("Password can't be null!");  
 
	    									}  
	    else{
	       verify a=new verify();
	       try {
			if(a.verUser(name, password)==1){
				info.add("Wrong Password!");	
				 request.setAttribute("info", info);//保存信息       
			   }
			
			else if(a.verUser(name, password)==2){
					request.setAttribute("info", info);//保存信息  
					User us=new User(name);
					request.setAttribute("User",us);
					
					request.getRequestDispatcher("homepage.jsp").forward(request,response);
			}
			else{
				info.add("User doesn't exist!");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	    }
	    request.setAttribute("info", info);//保存信息       
		request.getRequestDispatcher("index.jsp").forward(request,response);
		return; 
	    }  
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {  
	     doGet(request, response);  
	    }  
}

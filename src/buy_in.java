import java.io.IOException;  
import java.io.PrintWriter;  
  


import java.sql.ResultSet;

import javax.servlet.ServletException;  
import javax.servlet.http.HttpServlet;  
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;  





import net.sf.json.JSONObject;
import Infor.User;
import Infor.set2json;
  
  
public class buy_in extends HttpServlet {  
  
    /**  
     *   
     */  
    private static final long serialVersionUID = 1L;  
  
    /**  
     * Constructor of the object.  
     */  
    public buy_in() {  
        super();  
    }  
  
 
 
    public void doGet(HttpServletRequest request, HttpServletResponse response)  
            throws ServletException, IOException {  
    	User a=(User) request.getAttribute("User");
    	String id=a.userID;
    	
    	//System.out.print("a");
    	//System.out.print(id);
    	String json=null;
    	try {
			set2json trans=new set2json("select * from Indent where buy_ID="+id);
			ResultSet re=trans.sqlact(1);
			json=trans.tojson(re, 4).toString();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	JSONObject jb=new JSONObject();
    	jb.put("indent", json);
        PrintWriter out=response.getWriter();
       // System.out.print(jb.toString());
        out.println(jb.toString());
        out.close();
    }  
  
    public void doPost(HttpServletRequest request, HttpServletResponse response)  
            throws ServletException, IOException {  
  
       doGet(request, response);  
    }  
  
}  

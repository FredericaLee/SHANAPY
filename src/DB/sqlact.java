package DB;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class sqlact extends HttpServlet{
	private Connection con=null;
	private PreparedStatement ps=null;

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public sqlact(){
		super();
					}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		String acct=request.getParameter("actt");
		List<String> info=new ArrayList<String>();
		ArrayList<String> ree=new ArrayList<String>();
		List<Integer> abc=new ArrayList<Integer>();
		abc.add(0);
		
		try {
				con=new sqlcon().getCon();
			switch(acct){
			case "qu":{
				String table=request.getParameter("tablee");
				String row=request.getParameter("roww");
				String choose=request.getParameter("choose");
				String cccc="select "+row+" from "+table+" "+choose;
				System.out.println(cccc);
				ps=con.prepareStatement(cccc);
				ResultSet re=ps.executeQuery();
				ArrayList<String> rows=new ArrayList<String>();
				if(row.equals("*")){//查询所有信息的情况
					abc.set(0, 1);
					switch(table){
					case "user":
					case "User":{
						abc.add(8);
						break;
								}
					case "indent":
					case "Indent":{
						abc.add(6);
						break;
									}
					case "bankcard":
					case "bankCard":
					case "Bankcard":
					case "hb":
					case "HB":
					case "Hb":
					case "BankCard":{
						abc.add(3);
						break;
					}
					}
					try{						
						sqlprint s=new sqlprint(rows,re,1,table);
						ree=s.print();
						
					}catch(Exception e){
						info.add("查询失败");
					}
				}
				else{
				try{
					
					String[] temp=row.split(",");
					/*JSONArray a=new JSONArray();
					JSONObject b= new JSONObject();
					while(re.next()){
						int i=0;
						while(i<temp.length){
							b.put(temp[i],re.getString(i+1));
							i++;
						}
						
						a.add(b);
					}*/
					int i=0;
					while(i<temp.length){
							rows.add(temp[i]);
						i++;
					}
					sqlprint s=new sqlprint(rows,re,0,null);
					ree=s.print();
				}catch(Exception e){
					e.printStackTrace();
					info.add("查询失败");
				}
				}
				break;
			}
			case "ins":{
				String table=request.getParameter("tablee");
				String row=request.getParameter("roww");
				ps=con.prepareStatement("insert into "+table+" values("+row+")");
				try{
					ps.executeUpdate();
					info.add("插入成功");
				}catch(Exception e){
					e.printStackTrace();
					info.add("插入失败");
				}
				
				
				break;
			}
			case "del":{
				String table=request.getParameter("tablee");
				String choose=request.getParameter("choose");
				ps=con.prepareStatement("delete from "+table+" "+choose);
				try{
					ps.executeUpdate();
					info.add("删除成功");
				}catch(Exception e){
					e.printStackTrace();
					info.add("删除失败");
				}
				break;
			}
			case "up":{
				String table=request.getParameter("tablee");
				String row=request.getParameter("roww");
				String choose=request.getParameter("choose");
				ps=con.prepareStatement("update "+table+" set "+row+" "+choose);
				try{
					ps.executeUpdate();
					info.add("更新成功");
				}catch(Exception e){
					e.printStackTrace();
					info.add("更新失败");
				}
				
				break;
			}
			case "pro":{
				String pro=request.getParameter("tablee");
				ps=con.prepareStatement("call "+pro);
				try{ps.execute();
					info.add("操作成功");
					}
				catch(Exception e){
					info.add("操作失败");
				}
				break;
			}
		}
			
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		request.setAttribute("flag", abc);	
		request.setAttribute("info", info);
		request.setAttribute("ree",ree);
		request.getRequestDispatcher("adminre.jsp").forward(request,response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {  
	      doGet(request, response);  
	    }  
}

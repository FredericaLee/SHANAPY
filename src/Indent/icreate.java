package Indent;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Types;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DB.sqlcon;
import Infor.Dates;
import Infor.User;

public class icreate extends HttpServlet{
	private Connection con=null;
	private java.sql.CallableStatement pc=null;
	private PreparedStatement ps=null;
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String money=request.getParameter("money");
		String buy_ID=request.getParameter("buyer");
		String goods=request.getParameter("goods");
		String sale_ID=((User)request.getAttribute("User")).userID;
		String time=new Dates().get();
		ArrayList<String> info=new ArrayList<String>();
		
		try {
			con=new sqlcon().getCon();
			ps=con.prepareStatement("lock table indent write");
			ps.executeQuery();
			pc=con.prepareCall("{call inserin(?,?,?,?,?,?)}");
			pc.setString(1, goods);
			pc.setString(2, money);
			pc.setString(3, buy_ID);
			pc.setString(4, sale_ID);
			pc.setString(5, time);
			pc.registerOutParameter(6, Types.INTEGER);
			pc.execute();
			ps=con.prepareStatement("unlock tables");
			ps.executeQuery();
			String id=pc.getString(6); 
			info.add("Your indent id is "+id);
			
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			info.add("failed,buyer is not exist");
		}
		
		request.setAttribute("info", info);//±£¥Ê–≈œ¢       
		request.getRequestDispatcher("homepage.jsp").forward(request,response);
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		doGet(request, response);
	}
}

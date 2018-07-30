package Infor;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DB.sqlcon;

public class hbrepay extends HttpServlet{
	
	private Connection con=null;
	private PreparedStatement ps=null;
	

	public hbrepay(){
		super();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		ArrayList<String> info=new ArrayList<String>();
		String sum=request.getParameter("sum");
		String way=request.getParameter("way");
		User a=(User)request.getAttribute("User");
		
		if(Integer.parseInt(sum)>Integer.parseInt(a.refund)){
			info.add("You don't need to repay so much money");
		}
		else if(way.equals("way0")){//使用余额还钱
			if(Integer.parseInt(sum)>Integer.parseInt(a.bal)){
				info.add("You don't have enough money in your account");
			}
			else{
				try {
					String url1="update user set bal=bal-"+sum+" where userid= "+a.userID;
					String url2="update hb set refund=refund-"+sum+" where hbid= "+a.hbID;
					con=new sqlcon().getCon();
					ps=con.prepareStatement(url1);
					ps.execute();
					ps=con.prepareStatement(url2);
					ps.execute();
					
					info.add("success");
				} catch (Exception e) {
					// TODO Auto-generated catch block
					info.add("failed");
					e.printStackTrace();
				}
				
			}
		}
		else{//使用银行卡还钱
			if(Integer.parseInt(sum)>Integer.parseInt(a.balance)){
				info.add("You don't have enough money in your bankcard");
			}
			else{
				String url1="update bancard set balance=balance-"+sum+" where cardid= "+a.cardID;
				String url2="update hb set refund=refund-"+sum+" where hbid= "+a.hbID;
				try {
					con=new sqlcon().getCon();
					ps=con.prepareStatement(url1);
					ps.execute();
					ps=con.prepareStatement(url2);
					ps.execute();
					info.add("success");
				} catch (Exception e) {
					info.add("failed");
					// TODO Auto-generated catch block
					e.printStackTrace();
				}	
			}
		}
		User us=new User(a.userName);
		request.setAttribute("User", us);
		request.setAttribute("info", info);//保存信息       
		request.getRequestDispatcher("repay.jsp").forward(request,response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		doGet(request, response);
		
	}
	
	
	
}

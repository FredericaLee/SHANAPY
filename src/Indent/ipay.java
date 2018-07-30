package Indent;

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
import Infor.Indent;
import Infor.User;

public class ipay extends HttpServlet {
	private Connection con=null;
	private PreparedStatement ps=null;
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String way=request.getParameter("depay");
		String inid=request.getParameter("inidpay");
		User a=(User)request.getAttribute("User");
		String pass=request.getParameter("inpass");
		ArrayList<String> info =new ArrayList<String>();
		
		Indent in=null;
		try {
			in = new Indent(inid);
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		String sum=in.money;
		System.out.println(a.userName);
			if(way.equals("de0")){//使用余额还钱
				if(Integer.parseInt(sum)>Integer.parseInt(a.bal)){
					info.add("You don't have enough money in your account");
				}
				else if(!pass.equals(a.pass_pay)){
					info.add("Wrong password");
				}
				else{
					try {
						String url1="update user set bal=bal-"+sum+" where userid= "+a.userID;//扣钱
						String url2="update Indent set sta=\"1\" where inid= "+inid;//改变订单状态
						String url3="update user set bal=bal+"+sum+" where userid= "+in.sale_ID;//给商家打钱，打在余额里
						con=new sqlcon().getCon();
						System.out.println(url1);
						System.out.println(url2);
						System.out.println(url3);
						ps=con.prepareStatement(url1);
						ps.execute();
						ps=con.prepareStatement(url2);
						ps.execute();
						ps=con.prepareStatement(url3);
						ps.execute();
						
						info.add("success");
					} catch (Exception e) {
						// TODO Auto-generated catch block
						info.add("failed");
						e.printStackTrace();
					}
					
				}
		}
			else if(way.equals("de2")){//使用hb还钱
					if(Integer.parseInt(sum)>(Integer.parseInt(a.max_m)-Integer.parseInt(a.refund))){
						info.add("You don't have enough money in your account");
					}
					else if(!pass.equals(a.pass_pay)){
						info.add("Wrong password");
					}
					else{
						try {
							String url1="update hb set refund=refund+"+sum+" where hbid= "+a.hbID;//扣钱
							String url2="update Indent set sta=\"1\" where inid= "+inid;//改变订单状态
							String url3="update user set bal=bal+"+sum+" where userid= "+in.sale_ID;//给商家打钱，打在余额里
							con=new sqlcon().getCon();
							ps=con.prepareStatement(url1);
							ps.execute();
							ps=con.prepareStatement(url2);
							ps.execute();
							ps=con.prepareStatement(url3);
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
		else if(!pass.equals(a.card_pass)){
			info.add("Wrong password");
		}
		else{
			String url1="update bancard set balance=balance-"+sum+" where cardid= "+a.cardID;
			String url2="update Indent set sta=\"1\" where inid= "+inid;//改变订单状态
			String url3="update user set bal=bal+"+sum+" where userid= "+in.sale_ID;//给商家打钱，打在余额里	
			try {
				con=new sqlcon().getCon();
				ps=con.prepareStatement(url1);
				ps.execute();
				ps=con.prepareStatement(url2);
				ps.execute();
				ps=con.prepareStatement(url3);
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
			request.getRequestDispatcher("payre.jsp").forward(request,response);
			}
	
		
		
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		doGet(request, response);
	
	}
	
	
}

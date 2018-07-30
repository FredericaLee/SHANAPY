package login;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Types;
import java.util.ArrayList;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DB.sqlcon;
import Infor.User;

public class modify extends HttpServlet {
	
	private Connection con=null;
	private PreparedStatement ps=null;
	private java.sql.CallableStatement pc=null;
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	public modify(){
		super();
		
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		User us=(User)request.getAttribute("User");
		String Name=request.getParameter("Name");
		String pass_pay=request.getParameter("pass_pay");
		String pass_pay_re=request.getParameter("pass_pay_re");
		String pass_log=request.getParameter("pass_log");
		String pass_log_re=request.getParameter("pass_log_re");
		String card=request.getParameter("bank");
		String cardID=request.getParameter("bankcard");
		String hb=request.getParameter("hb");
		String depay=request.getParameter("de");
		String hbid=us.hbID;
		int flag=0;//�Ƿ�����
		int dehb=0;//ɾ��hb
		int crbank=0;//�������п�
		int cdepay=0;//Ĭ�Ϸ�ʽ�Ƿ��д�
		int crhb=0;//����hb
		int yuji=0;
		int h=0;//���������Ƿ��д�
		ArrayList<String> info=new ArrayList<String>();
		if(!pass_pay.equals(pass_pay_re)){
			h++;
			info.add("pass_pay: The two passwords differ!");
		}
		if(!pass_log.equals(pass_log_re)){
			h++;
			info.add("pass_log: The two passwords differ!");
		}
		if(h==0){
			if(card!=null){//���п����ˡ�
				if(!cardID.equals(us.cardID)){//���п��иĶ�
					crbank=1;//Ǳ�ڵĲ������п�����
				}
				//���п��޸Ķ�������Ҫ�����κβ�������ʱcardID����Ŀ��cardID
			}
			else{
				if(us.cardID!=null){//���п�û�򹳣���ԭ�������п�
					cardID=null;
									}
				//û�򹳣�Ҳ����Ҫ
			}
			if(hb==null){//���hbȡ����
				dehb=1;//Ǳ�ڵ�ɾ��hb
						}
			else{//���hb��ѡ��
				if(us.hbID==null){//��ԭ��û��hb
					crhb=1;
				}
			}
			switch(depay){
			case "de0":{
				depay="0";
				break;
			}
			case "de1":{
				if(card!=null)//��ǰ�û�ѡ��Ҫ��
				{depay="1";}
				else{
					cdepay=1;
					info.add("YOU should have a BANKCARD");
				}
				break;
			}
			case "de2":{
				if(hb!=null)//��ǰ�û�ѡ��ҪHb
				{depay="2";}
				else{
					cdepay=1;
					info.add("YOU should have a HB ACCOUNT!");
				}
				break;
			}
			
			}
			try {
				con=new sqlcon().getCon();
				ps=con.prepareStatement("select name from User where name=?");
				ps.setString(1, Name);
				ResultSet re=ps.executeQuery();
				if(re.next()&&Name.equals(us.userName)){//����
						flag=1;	
				}
				else if(cdepay!=1){//��Ĭ�Ϸ�ʽ����
					if(crbank==1){//Ǳ�ڵİ����п�
						ps=con.prepareStatement("select cardID from bankcard where cardID= ?");
						ps.setString(1, cardID);
						re=ps.executeQuery();
						if(!re.next()){
							int b=(int)new Random().nextDouble()*1000000;
							String bb=String.valueOf(b);
							System.out.println(cardID);
							pc=con.prepareCall("{call inserbk(?,?,?)}");
							pc.setString(1,cardID);
							pc.setString(2,bb);
							pc.setString(3,pass_pay);
							pc.execute();
								}
					}
					if(crhb==1){//�ط�����id
						pc=con.prepareCall("{call inserhb(?)}");
						pc.registerOutParameter(1, Types.INTEGER);
						pc.execute();
						hbid=pc.getString(1);
						info.add("Your hbID is "+hbid);
									}
					
					if(dehb==1){
						hbid=null;
					}
					 pc=con.prepareCall("{call updateus(?,?,?,?,?,?,?)}");
					 pc.setString(1, Name);
					 pc.setString(2, pass_pay);
					 pc.setString(3, pass_log);
					 pc.setString(4, cardID); 
					 pc.setString(5, hbid);
					 pc.setString(6, depay);
					 pc.setString(7, us.userID);
					 pc.execute();//ִ�в������û��Ĵ洢����
					info.add("sucess");
					info.add("please sign out and sign in again :-)");
					User news=new User(Name);
					request.setAttribute("User", news);
					yuji=1;
					System.out.println("1");
					System.out.println("Name");
					if(dehb==1){//ɾ��hb
						ps=con.prepareStatement("delete from hb where hbID= ?");
						ps.setString(1,hbid);
						ps.execute();
								}
					
								}
					
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				if(yuji==0){
					User news=new User(us.userName);
					request.setAttribute("User", news);
				}
				info.add("failed");
				
			}
			
		}
		if(flag==1){
			info.add("User is already exist!");
		}
		request.setAttribute("info", info);//������Ϣ       
		if(flag==1||cdepay==1||h==1){
			request.getRequestDispatcher("modify.jsp").forward(request,response);	
								}
		request.getRequestDispatcher("homepage.jsp").forward(request,response);
		
		
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		doGet(request, response);
	}
	
	

}
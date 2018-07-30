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

public class reg extends HttpServlet {
	private Connection con=null;
	private PreparedStatement ps=null;
	private java.sql.CallableStatement pc=null;
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	public reg(){
		super();
		
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String Name=request.getParameter("Name");
		String pass_pay=request.getParameter("pass_pay");
		String pass_pay_re=request.getParameter("pass_pay_re");
		String pass_log=request.getParameter("pass_log");
		String pass_log_re=request.getParameter("pass_log_re");
		String card=request.getParameter("bank");
		String cardID=request.getParameter("bankcard");
		String hb=request.getParameter("hb");
		String hbid=null;
		int flag=0;
		int h=0;
		ArrayList<String> info=new ArrayList<String>();
		if(!pass_pay.equals(pass_pay_re)){
			info.add("pass_pay: The two passwords differ!");
			h=1;
		}
		if(!pass_log.equals(pass_log_re)){
			info.add("pass_log: The two passwords differ!");
			h++;
		}
		if(h==0){//��������û������		
		try {
			con=new sqlcon().getCon();
			ps=con.prepareStatement("select * from user where name = ?");
			ps.setString(1, Name);
			ResultSet re=ps.executeQuery();
			if(re.next()){//����
				flag=1;
						}
			
			
			
			else{//�����������
				if(card!=null){//�����п�
					ps=con.prepareStatement("select cardID from bankcard where cardID= ?");
					ps.setString(1, cardID);
					re=ps.executeQuery();
					if(!re.next()){//�����п������ڵ����,���ò������п��Ĵ洢����
						int b=(int)new Random().nextDouble()*1000000;
						String bb=String.valueOf(b);
						pc=con.prepareCall("{call inserbk(?,?,?)}");
						pc.setString(1,cardID);
						pc.setString(2,bb);
						pc.setString(3, pass_pay);
						pc.execute();
							}
				}
				else cardID=null;
				
				if(hb!=null){//��Ҫ����hb�˻���ʱ�򣬵��ò���hb�Ĵ洢���̣��ط�hbid
					ps=con.prepareStatement("lock table HB write");
					ps.executeQuery();
					pc=con.prepareCall("{call inserhb(?)}");
					pc.registerOutParameter(1, Types.INTEGER);
					pc.execute();
					ps=con.prepareStatement("unlock tables");
					ps.executeQuery();
					hbid=pc.getString(1);
					info.add("Your hbID is "+hbid);
				}
			
				 pc=con.prepareCall("{call inserus(?,?,?,?,?,?,?)}");
				 pc.setString(1, Name);
				 pc.setString(2, pass_pay);
				 pc.setString(3, pass_log);
				 pc.setString(4, cardID); 
				 pc.setString(5, hbid);
				 pc.setString(6, "0");
				 pc.registerOutParameter(7, Types.INTEGER);
				 pc.execute();//ִ�в������û��Ĵ洢����
				 String id=pc.getString(7);
				info.add("Your userID is "+id);
				}
		
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			info.add("failed");
			
		}
		}
		if(flag==1){
			info.add("User is already exist!");
		}
		request.setAttribute("info", info);//������Ϣ       
		request.getRequestDispatcher("regre.jsp").forward(request,response);
		
		return ;
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { 
		doGet(request,response);
		return ;
		
	}
	
	}

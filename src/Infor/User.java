package Infor;

import java.sql.Connection;
import java.sql.PreparedStatement;



import java.sql.ResultSet;

import DB.sqlcon;

public class User {
	public static String userID;
	public  static String userName;
	public   static String pass_pay;
	public  static String pass_log;
	public static String cardID;
	public  static String hbID;
	public   static String bal;
	public   static String de_pay;
	public  static String balance;
	public   static String max_m;
	public static String refund;
	public  static String bo;
	public static String card_pass;
	
	public User(String userName){
		this.userName=userName;
		try {
			Connection con=null;
			con=new sqlcon().getCon();
			PreparedStatement ps=con.prepareStatement("select * from user where name = \""+userName+"\"");
			ResultSet re=ps.executeQuery();
			while(re.next()){
				userID=re.getString(1);
				pass_pay=re.getString(3);
				pass_log=re.getString(4);
				cardID=re.getString(5);
				hbID=re.getString(6);
				de_pay=re.getString(7);
				bal=re.getString(8);
				
			}
			
			if(hbID!=null){
			ps=con.prepareStatement("select * from hb where hbID ="+hbID);
			re=ps.executeQuery();
			while(re.next()){
				refund=re.getString("refund");
				max_m=re.getString("max_m");
				bo=String.valueOf(Integer.parseInt(max_m)-Integer.parseInt(refund));	
			}
			}
			if(cardID!=null){
				ps=con.prepareStatement("select * from bankcard where cardID ="+cardID);
				re=ps.executeQuery();
				while(re.next()){
					balance=re.getString("balance");
					card_pass=re.getString("password");
				}
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	public User getUser(){
		return this;
	}

}

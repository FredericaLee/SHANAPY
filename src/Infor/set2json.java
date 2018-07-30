package Infor;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import DB.sqlcon;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

public class set2json {
	public JsonArray a;
	public Connection con=null;
	public PreparedStatement ps=null;
	public List<String> date;  
    public List<String> num;
    public List<String> sum;
    public String total=null;
	
	
	public set2json(String b) throws Exception{
		a=new JsonArray();
		con=new sqlcon().getCon();	
		ps=con.prepareStatement(b);
	}
	public void sqlact() throws SQLException{
		ps.execute();
	}
	public ResultSet sqlact(int b) throws SQLException{
		return ps.executeQuery();
	}
	public void testPrint(JsonArray a){
		System.out.println(a.toString());
		
	}
	
	public String add(ResultSet re,int i) throws SQLException{
		String a=null,b=null;
		switch(i){
		case 1:{//统计时间和数量柱状图
				a="\"date\":[";
				b="\"num\":[";
				int c=0;
				while(re.next()){
					if(c==0){
		           a=a+"\""+re.getString("date")+"\"";
		           b=b+"\""+re.getString("num")+"\"";
		           c++;
							}
					
					else{
					a=a+",\""+re.getString("date")+"\"";
			         b=b+",\""+re.getString("num")+"\"";
			         }
						
												}
				a=a+"],";
				b="{"+a+b+"]}";
				break;
				}
		
		case 2:{//统计时间和金钱的柱状图
			a="\"date\":[";
			b="\"sum\":[";
			int c=0;
			while(re.next()){
				if(c==0){
	           a=a+"\""+re.getString("date")+"\"";
	           b=b+"\""+re.getString("sum")+"\"";
	           c++;
						}
				
				else{
				a=a+",\""+re.getString("date")+"\"";
		         b=b+",\""+re.getString("sum")+"\"";
		         }
					
											}
			a=a+"],";
			b="{"+a+b+"]}";
			break;
				}
		
		
		case 3:{//饼状图
			
			break;}
		}
		return b;
	}
	
	public JsonArray tojson(ResultSet re,int i){//1User,2BankCard,3Hb,4Indent买家，5Indent卖家，6Indent 管理员
		switch(i){
		case 1:{
			try {
				while(re.next()){
					 	JsonObject ob = new JsonObject();  
		                ob.addProperty("userId", re.getString("uerId"));  
		                ob.addProperty("name", re.getString("name"));  
		                ob.addProperty("pass_pay", re.getString("pass_pay"));  
		                ob.addProperty("pass_log", re.getString("pass_log"));  
		                ob.addProperty("cardID", re.getString("cardID"));  
		                ob.addProperty("hbID", re.getString("hbID"));
		                ob.addProperty("de_pay", re.getString("de_pay"));
		                ob.addProperty("bal", re.getString("bal"));
		                a.add(ob);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
			}
		case 2:{
			try {
				while(re.next()){
					 	JsonObject ob = new JsonObject();  
		                ob.addProperty("cardID", re.getString("cardID"));  
		                ob.addProperty("password", re.getString("password"));  
		                ob.addProperty("balance", re.getString("balance"));  
		                a.add(ob);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
			}
		case 3:{
			try {
				while(re.next()){
					 	JsonObject ob = new JsonObject();  
		                ob.addProperty("hbID", re.getString("hbID"));  
		                ob.addProperty("max_m", re.getString("max_m"));  
		                ob.addProperty("refund", re.getString("refund"));  
		                a.add(ob);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
			}
		case 4:{}
		case 5:{}
		case 6:{
			try {
				while(re.next()){
					 	JsonObject ob = new JsonObject();  
		                ob.addProperty("inid", re.getString("inid")); 
		                ob.addProperty("goods", re.getString("goods"));
		                ob.addProperty("money", re.getString("money"));
		                if(i==4||i==6){
		                ob.addProperty("sale_ID", re.getString("sale_ID"));
		                			  }
		                if(i==5||i==6){
		                ob.addProperty("buy_ID", re.getString("buy_ID"));  
		                			  }
		                ob.addProperty("date", re.getString("date"));
		                ob.addProperty("sta", re.getString("sta"));  
		                a.add(ob);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
			}
		case 7:{
			try {
				while(re.next()){
					 	JsonObject ob = new JsonObject();  
		                ob.addProperty("inid", re.getString("inid"));  
		                ob.addProperty("money", re.getString("money"));
		                a.add(ob);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		}
		}
		return a;
	}
	
	public String count(ResultSet re) throws SQLException{
		
		String count=re.getString("count");
		return count;
	}
	// public static void main(String args[]) throws Exception {
		//set2json a=new set2json("select data,count(*) as num,sum(money) as sum from Indent  where  DATE_SUB(CURDATE(), INTERVAL 3 DAY) <=data group by data");
	      //ResultSet re=a.sqlact(1);
	      //String b=a.add(re, 1);
	      //System.out.print(b);
	      
	      // JsonArray s=a.tojson(re, 7);
	      // a.testPrint(s);
	    //													} 

}

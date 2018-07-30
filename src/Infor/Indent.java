package Infor;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import DB.sqlcon;

public class Indent {
	public String inID;
	public String money;
	public String buy_ID;
	public String sale_ID;
	public String sta;
	public String goods;
	public String date;
	
	
	
	public Indent(String a) throws Exception{
		this.inID=a;
		Connection con=null;
		con=new sqlcon().getCon();
		PreparedStatement ps=con.prepareStatement("select * from Indent where inID ="+inID);
		ResultSet re=ps.executeQuery();
		while(re.next()){
			money=re.getString("money");
			buy_ID=re.getString("buy_ID");
			sale_ID=re.getString("sale_ID");
			sta=re.getString("sta");
			goods=re.getString("goods");
			date=re.getString("date");
		}
	}
}

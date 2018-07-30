package DB;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class sqlprint {
		private ArrayList<String> rows=new ArrayList<String>();
		private ResultSet re=null;
		private int flag=0;
		private String table=null;
		public sqlprint(ArrayList<String> rows, ResultSet re,int a,String t){
			this.flag=a;
			this.rows=rows;
			this.re=re;
			this.table=t;
		}
		
		protected ArrayList<String> print() throws SQLException{
		ArrayList<String> ree=new ArrayList<String>();	
		String tp=null;
		int i=0;
		if(flag==0){
		for(;i<rows.size();i++){
			if(i==0){
				tp=rows.get(i);
			}
			else{
			tp=tp+"| |"+rows.get(i);
			}}
		ree.add(tp);
		try {
			while(re.next()){
				tp=null;
				for(i=1;i<=rows.size();i++){
					if(i==1){
						tp=re.getString(i);
					}
					else{
					tp=tp+"| |"+re.getString(i);
					}					}
				ree.add(tp);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}}
		else{
			switch(table){
			case "user":
			case "User":{
				ree.add("userID| |name| |pass_pay| |pass_log| |cardID| |hbID| |de_pay| |bal");
				while(re.next()){
					tp=null;
					for(i=1;i<=8;i++){
						if(i==1){
							tp=re.getString(i);
						}
						else{
						tp=tp+"| |"+re.getString(i);
						}					}
					ree.add(tp);
				}
				break;
			}
			case "indent":
			case "Indent":{
				ree.add("inID| |money| |goods| |sale_ID| |buy_ID| |sta");
				while(re.next()){
					tp=null;
					for(i=1;i<=6;i++){
						if(i==1){
							tp=re.getString(i);
						}
						else{
						tp=tp+"| |"+re.getString(i);
						}					}
					ree.add(tp);
				}
				break;
				
			}
			case "bankcard":
			case "bankCard":
			case "Bankcard":
			case "BankCard":{
				ree.add("cardID| |balance| |password");
				while(re.next()){
					tp=null;
					for(i=1;i<=3;i++){
						if(i==1){
							tp=re.getString(i);
						}
						else{
						tp=tp+"| |"+re.getString(i);
						}					}
					ree.add(tp);
				}
				break;
				
			}
			case "hb":
			case "HB":
			case "Hb":{
				ree.add("hbID| |max_m| |refund");
				while(re.next()){
					tp=null;
					for(i=1;i<=3;i++){
						if(i==1){
							tp=re.getString(i);
						}
						else{
						tp=tp+"| |"+re.getString(i);
						}					}
					ree.add(tp);
				}
				break;
				
			}
			
			}
		}
		return ree;
		}
}

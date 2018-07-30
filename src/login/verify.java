package login;
import java.sql.*;

import DB.sqlcon;

public class verify {
	private Connection con=null;
	private PreparedStatement ps=null;
	
	
	public int verUser(String user,String pass) throws Exception{
		int flag=0;
		try{
			con=new sqlcon().getCon();
			String query="select name from user where name=?";
			ps=con.prepareStatement(query);
			ps.setString(1,user);
			ResultSet re=ps.executeQuery();
			if(re.next()){
				flag=1;
			}
			query="select * from user where name=? and pass_log=?";
			ps=con.prepareStatement(query);
			ps.setString(1,user);
			ps.setString(2,pass);
			re=ps.executeQuery();
			if(re.next()){
				flag=2;
			}
			
		}
		catch(Exception e){
			throw e;
		}finally{
			if(ps!=null){
				try{
					ps.close();
				}catch(Exception e){
					throw e;
				}
			}
		}
		
		return flag;
	}
	
}

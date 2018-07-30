package DB;

import java.sql.*;

//登录数据库

public class sqlcon {
	private static final String driverName="com.mysql.jdbc.Driver";  
	
	//数据库管理员
	private static final String rootName="root";  
	private static final String rootPasswd="375n871l";  
	
	//目标数据库
	private static final String dbName="ALIPAY";  

	private static final String rooturl="jdbc:mysql://localhost/"+dbName+"?autoReconnect=true";
	private Connection con=null;
	
	
	//用于验证登录者是否正确的
	public sqlcon() throws Exception{  
	        try{  
	            Class.forName(driverName);  
	            con=DriverManager.getConnection(rooturl,rootName,rootPasswd);     
	        }catch(Exception exception ){  
	            throw exception;  
	        } finally {  
	        }     
	    							}
	
	//以登录方式
	
	public static void main(String[] args) throws Exception {
    	Connection cob=new sqlcon().getCon();
        
    }
	public sqlcon(String name,String pass) throws Exception{
		try{  
            Class.forName(driverName);  
            con=DriverManager.getConnection(rooturl,name,pass);     
        }catch(Exception exception ){  
            throw exception;  
        } finally {  
        }     
	}
	
	public Connection getCon(){
		return con;
	}
	
	public void close() throws Exception{
		if(con!=null){
			try{
				con.close();
			}catch (Exception e){
				throw e;
			}
		}
		
	}
	
	}


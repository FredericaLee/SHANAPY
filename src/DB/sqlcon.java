package DB;

import java.sql.*;

//��¼���ݿ�

public class sqlcon {
	private static final String driverName="com.mysql.jdbc.Driver";  
	
	//���ݿ����Ա
	private static final String rootName="root";  
	private static final String rootPasswd="375n871l";  
	
	//Ŀ�����ݿ�
	private static final String dbName="ALIPAY";  

	private static final String rooturl="jdbc:mysql://localhost/"+dbName+"?autoReconnect=true";
	private Connection con=null;
	
	
	//������֤��¼���Ƿ���ȷ��
	public sqlcon() throws Exception{  
	        try{  
	            Class.forName(driverName);  
	            con=DriverManager.getConnection(rooturl,rootName,rootPasswd);     
	        }catch(Exception exception ){  
	            throw exception;  
	        } finally {  
	        }     
	    							}
	
	//�Ե�¼��ʽ
	
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


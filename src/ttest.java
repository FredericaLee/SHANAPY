import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Types;

import com.mysql.jdbc.CallableStatement;
import com.mysql.jdbc.PreparedStatement;

import DB.sqlcon;


public class ttest {
	public static void main(String[] args) throws Exception {
		Connection con=new sqlcon().getCon();
		PreparedStatement ps=(PreparedStatement) con.prepareStatement("lock table indent write");
		ps.executeQuery();
		ps=(PreparedStatement) con.prepareStatement("select * from indent");
		ResultSet re=ps.executeQuery();
		if(re.next())
		System.out.print(re.getString(1));
		ps=(PreparedStatement) con.prepareStatement("unlock tables");
		ps.executeQuery();
		// System.out.println(a);
		Thread.sleep(100000000);
	}

}

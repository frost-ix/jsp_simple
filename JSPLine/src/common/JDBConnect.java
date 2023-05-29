package common;

import java.sql.*;
import javax.servlet.ServletContext;

public class JDBConnect {
	public Connection con;
	public Statement stmt;
	public PreparedStatement pstmt;
	public ResultSet rs;
	public JDBConnect(ServletContext application) {
        try {
            // JDBC 드라이버 로드
            String driver = application.getInitParameter("OracleDriver");
            Class.forName(driver);

            // DB에 연결
            String url = application.getInitParameter("OracleURL"); 
            String id = application.getInitParameter("OracleID");
            String pwd = application.getInitParameter("OraclePwd");

            con = DriverManager.getConnection(url, id, pwd);

            System.out.println("DB connect Clear)");
        }
        catch (Exception e) {
			System.out.println("Exception of Connect Error. : "+e.getMessage());
            e.printStackTrace();
        }
    }

	public void close() {
		try {
			if (rs != null)
				rs.close();
			if (stmt != null)
				stmt.close();
			if (pstmt != null)
				pstmt.close();
			if (con != null)
				con.close();

			System.out.println("JDBC 자원 해제");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}

package common;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class DBConnPool {
    public Connection con;
    public Statement stmt;
    public PreparedStatement pstmt;
    public ResultSet rs;

    public DBConnPool(){
        try {
//            Class.forName("oracle.jdbc.OracleDriver");
//            String url = "jdbc:oracle:thin:@localhost:1521:XE"; String ID = "musthave"; String passwd = "1234";
//            con = DriverManager.getConnection(url, ID, passwd);
            Context initCtx = new InitialContext();
            Context ctx = (Context)initCtx.lookup("java:comp/env");
            DataSource source = (DataSource)ctx.lookup("dbcp_myoracle");
            con = source.getConnection();
            System.out.println("DB Connect clear <DB conn Pool> (first default initialize)");
        }
        catch (Exception e) {
            System.out.println("Exception [JDBCConnect] : "+ e.getMessage());
            e.printStackTrace();
        }
    }

    public void close() {
        try {
            if (rs != null) rs.close();
            if (pstmt != null) pstmt.close();
            if (stmt != null) stmt.close();
            if (con != null) con.close();

            System.out.println("JDBC disconnect");
        }
        catch (Exception e) {
            System.out.println("Exception [close] : "+e.getMessage());
        }
    }
}

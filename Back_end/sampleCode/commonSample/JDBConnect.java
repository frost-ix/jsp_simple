package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletContext;

public class JDBConnect {

    // 기본 생성자
    public JDBConnect() {
        try {
            // JDBC 드라이버 로드
            Class.forName("oracle.jdbc.OracleDriver");

            // DB에 연결
            String url = "jdbc:oracle:thin:@localhost:1521:xe";
            String id = "musthave";
            String pwd = "1234";
            con = DriverManager.getConnection(url, id, pwd);

            System.out.println("DB 연결 성공(기본 생성자)");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // 두 번째 생성자
    public JDBConnect(String driver, String url, String id, String pwd) {
        try {
            // JDBC 드라이버 로드
            Class.forName(driver);

            // DB에 연결
            con = DriverManager.getConnection(url, id, pwd);

            System.out.println("DB 연결 성공(인수 생성자 1)");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // 세 번째 생성자

    // 연결 해제(자원 반납)

}
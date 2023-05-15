package membership;

import common.JDBConnect;

import java.sql.SQLException;

public class MemberDAO extends JDBConnect {
    // 명시한 데이터베이스로의 연결이 완료된 MemberDAO 객체를 생성합니다.
    public MemberDAO(String drv, String url, String id, String pw) {
        super(drv, url, id, pw);
    }

    // 명시한 아이디/패스워드와 일치하는 회원 정보를 반환합니다.
    public MemberDTO getMemberDTO(String uid, String upass) {
        MemberDTO dto = new MemberDTO();
       String  query = "select * from member where ID=? and PASS=?";
       try {
           pstmt = con.prepareStatement(query);
           pstmt.setString(1, uid);
           pstmt.setString(2, upass);
           rs = pstmt.executeQuery();
           if (rs.next()) {
               dto.setId(rs.getString("id"));
               dto.setPass(rs.getString("pass"));
               dto.setName(rs.getString("name"));
               dto.setRegidate(rs.getString("regidate"));
           }
       }
       catch (SQLException e) {
           System.out.println("Exception [ get Member DTO ] : "+ e.getMessage());
           e.printStackTrace();
       }
        return dto;
    }
}

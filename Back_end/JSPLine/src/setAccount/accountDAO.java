package setAccount;

import common.JDBConnect;

import javax.servlet.ServletContext;

public class accountDAO extends JDBConnect {
	public accountDAO(ServletContext application) {
		super(application);
	}

//	createDTO --> 생성 할 계정의 아이디가 중복 일 경우 Denied 처리 할 영역
//	cId : 생성 할 아이디
	public accountDTO createDTO(String cId) {
		accountDTO dto = new accountDTO();
		String query = "insert into ACCNT (name, id, pw, accpw, account, money) ";
		query+="values(?, ?, ?, ?, ?, ?)";
		try {
			pstmt = con.prepareStatement(query);
		} catch (Exception e) {
			System.out.println("Exception [Get Account DTO] : " + e.getMessage());
			e.printStackTrace();
		}
		return dto;
	}

	public accountDTO getAccountDTO(String uid, String upwd) {
		accountDTO dto = new accountDTO();
		String query = "select * from ACCNT where ID=? and PW=?";
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, uid);
			pstmt.setString(2, upwd);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				dto.setId(rs.getString("ID"));
				dto.setPwd(rs.getString("PW"));
				dto.setName(rs.getString("NAME"));
				dto.setAccPwd(rs.getString("ACCPW"));
				dto.setAccount(rs.getString("Account"));
				dto.setMoney(rs.getString("MONEY"));
			}
		} catch (Exception e) {
			System.out.println("Exception [Get Account DTO] : " + e.getMessage());
			e.printStackTrace();
		}
		return dto;
	}
}

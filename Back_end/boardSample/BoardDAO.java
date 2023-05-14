package model1.board;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Vector;
import javax.servlet.ServletContext;
import common.JDBConnect;

public class BoardDAO extends JDBConnect {
    public BoardDAO(ServletContext application) {
        super(application);
    }

    // 검색 조건에 맞는 게시물의 개수를 반환합니다.
    public int selectCount(Map<String, Object> map) {return 0;
    }

    // 검색 조건에 맞는 게시물 목록을 반환합니다.
    public List<BoardDTO> selectList(Map<String, Object> map) throws SQLException {
        List<BoardDTO> bbs = new ArrayList<BoardDTO>();
        String query = "select * from board";
        try {
            System.out.println("Entry Try section");
            pstmt = con.prepareStatement(query);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                System.out.println("rs.next routine");
                BoardDTO dto = new BoardDTO();
                dto.setNum(rs.getString("NUM"));
                dto.setTitle(rs.getString("TITLE"));
                dto.setContent(rs.getString("CONTENT"));
                dto.setPostdate(rs.getDate("POSTDATE"));
                dto.setId(rs.getString("ID"));
                dto.setVisitcount(rs.getString("VISITCOUNT"));
                bbs.add(dto);
            }
        }
        catch (SQLException e) {
            System.out.println("Exception [SelectList] : "+e.getMessage());
            e.printStackTrace();
        }
        return bbs;
    }

    // 검색 조건에 맞는 게시물 목록을 반환합니다(페이징 기능 지원).
    public List<BoardDTO> selectListPage(Map<String, Object> map) {

        return null;
    }

    // 게시글 데이터를 받아 DB에 추가합니다.
    public int insertWrite(BoardDTO dto) {
        int result = 0;
        String query = "insert into board(num ,title ,content, id ,visitcount)";
        query += "values (seq_board_num, ?, ?, ?)";
        try {
            pstmt = con.prepareStatement(query);
            pstmt.setString(1, dto.getTitle());
            pstmt.setString(2, dto.getContent());
            pstmt.setString(3, dto.getId());
            pstmt.setString(4, dto.getVisitcount());
            result = pstmt.executeUpdate();
            System.out.println(pstmt);
        }
        catch (SQLException e) {
            System.out.println("Exception [insertWrite] : "+e.getMessage());
            e.printStackTrace();
        }
        return result;
    }


    // 지정한 게시물을 찾아 내용을 반환합니다.
    public BoardDTO selectView(String num) {
        BoardDTO dto = new BoardDTO();
//        String query = "select * from board where num = ?";
        String query = "select m.name, b.* from MEMBER";
        query += " m inner join BOARD b on M.id-B.id where num= ?";
        try {
            pstmt = con.prepareStatement(query);
            pstmt.setString(1, num);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                dto.setNum(rs.getString("num"));
                dto.setTitle(rs.getString("title"));
                dto.setContent(rs.getString("content"));
                dto.setPostdate(rs.getDate("postdate"));
                dto.setId(rs.getString("id"));
                dto.setVisitcount(rs.getString("visitcount"));
                dto.setName(rs.getString("name"));
            }
        }
        catch (Exception e) {
            System.out.println("Exception [SelectView] : "+e.getMessage());
            e.printStackTrace();
        }
        return dto;
    }

    // 지정한 게시물의 조회수를 1 증가시킵니다.
    public void updateVisitCount(String num) {

    }

    // 지정한 게시물을 수정합니다.
    public int updateEdit(BoardDTO dto) {
        int result = 0;
        try {
            String query = "UPDATE board SET title=?, content=?, WHERE num=?";
            pstmt = con.prepareStatement(query);
            pstmt.setString(1, dto.getTitle());
            pstmt.setString(2, dto.getContent());
            pstmt.setString(3, dto.getNum());
            result = pstmt.executeUpdate();
        }
        catch (Exception e) {
            System.out.println("Exception Update edit : "+e.getMessage());
            e.printStackTrace();
        }

        return result;
    }

    // 지정한 게시물을 삭제합니다.
    public int deletePost(BoardDTO dto) {
        int result = 0;
        try {
            String query = "DELETE board WHERE num=?";
            pstmt = con.prepareStatement(query);
            pstmt.setString(1, dto.getNum());
            result = pstmt.executeUpdate();
        }
        catch (Exception e) {
            System.out.println("Exception Update edit : "+e.getMessage());
            e.printStackTrace();
        }
        return result;
    }
}


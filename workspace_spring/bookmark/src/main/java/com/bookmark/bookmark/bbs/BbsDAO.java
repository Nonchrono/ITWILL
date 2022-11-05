package com.bookmark.bookmark.bbs;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Repository
public class BbsDAO {

    // DB 연결 객체 가져오기
    @Autowired
    private JdbcTemplate jt;

    // sql문 작성을 위해
    StringBuilder sql = null;

    // 기본 생성자 (객체 생성 확인)
    public BbsDAO() {
        System.out.println("-----BbsDAO() 객체 생성됨");
    } // end

    // 게시판 글 작성
    public int create(BbsDTO dto) {
        int cnt = 0;

        try {
            StringBuilder sql = new StringBuilder();
            sql.append(" INSERT INTO bbs (bbsno) ");

//            cnt = jt.update(sql.toString(), ~);

        } catch (Exception e) {
            System.out.println("글쓰기 실패 : "+e);
        } // end

        return cnt;
    } // create() end

    // 게시판 글 목록
    public List<BbsDTO> list() {
        List<BbsDTO> list = null;

        try {
            sql = new StringBuilder();
            sql.append(" SELECT bbsno, wname, subject, content, grpno, indent, ansnum, regdt, passwd, readcnt, ip, secretp, writer ");
            sql.append(" FROM book_bbs ");
            sql.append(" ORDER BY grpno DESC, ansnum ASC ");

            RowMapper<BbsDTO> rowMapper = new RowMapper<BbsDTO>() {
                @Override
                public BbsDTO mapRow(ResultSet rs, int rowNum) throws SQLException {
                    BbsDTO dto = new BbsDTO();
                    dto.setBbsno(rs.getInt("bbsno"));
                    dto.setWname(rs.getString("wname"));
                    dto.setSubject(rs.getString("subject"));
                    dto.setContent(rs.getString("content"));


                } // mapRow() end
            } // rowMapper end


        } catch (Exception e) {
            System.out.println("목록 조회 실패 : "+e);
        }

        return list;
    }


} // class end

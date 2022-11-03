package kr.co.itwill.mediagroup;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.*;
import java.util.List;

//@Service
@Repository
public class MediagroupDAO {

    @Autowired // 자동으로 만들어진 객체를 연결
    private JdbcTemplate jt; // DBOpen dbopen = new DBOpen()와 동일한 형태

    StringBuilder sql = null;

    public MediagroupDAO() {
        System.out.println("-----MediagroupDAO() 객체 생성됨");
    } // end

    // 비지니스 로직 구현 (insert, select 등)
    public int create(MediagroupDTO dto) {
        int cnt = 0;
        try {
            sql = new StringBuilder();
            sql.append(" INSERT INTO mediagroup( mediagroupno, title ) ");
            sql.append(" VALUES( mediagroup_seq.nextval, ? ) ");

            // DB 연결이 이미 되어있다.
            cnt = jt.update(sql.toString(), dto.getTitle());
        } catch (Exception e) {
            System.out.println("미디어 그룹 등록 실패 : " + e);
        } // end
        return cnt;
    } // create() end

    /* 1) 페이징 없는 목록
    // 9월 15일자 익명 메소드 찾아보기
    public List<MediagroupDTO> list() {
        List<MediagroupDTO> list = null;
        try {
            sql = new StringBuilder();
            sql.append(" SELECT mediagroupno, title ");
            sql.append(" FROM mediagroup ");
            sql.append(" ORDER BY mediagroupno DESC ");

            RowMapper<MediagroupDTO> rowMapper = new RowMapper<MediagroupDTO>() {
                @Override
                public MediagroupDTO mapRow(ResultSet rs, int rowNum) throws SQLException {
                    MediagroupDTO dto = new MediagroupDTO();
                    dto.setMediagroupno(rs.getInt("mediagroupno"));
                    dto.setTitle(rs.getString("title"));
                    return dto;
                } // mapRow() end
            }; // rowMapper end

            list = jt.query(sql.toString(), rowMapper);

        } catch (Exception e) {
            System.out.println("미디어 그룹 목록 실패 : "+e);
        } // end
        return list;
    } // list() end
    */

    public List<MediagroupDTO> list2(int start, int end) { // 페이징
        List<MediagroupDTO> list = null;
        try {
            sql = new StringBuilder();
            sql.append(" SELECT AA.* ");
            sql.append(" FROM ( ");
            sql.append("        SELECT ROWNUM as RNUM, BB.* ");
            sql.append("        FROM ( ");
            sql.append("                SELECT mediagroupno, title ");
            sql.append("                FROM mediagroup ");
            sql.append("                ORDER BY mediagroupno DESC ");
            sql.append("              ) BB ");
            sql.append("        ) AA ");
            sql.append(" WHERE AA.RNUM >= " + start + " AND AA.RNUM <= " + end);

            RowMapper<MediagroupDTO> rowMapper = new RowMapper<MediagroupDTO>() {
                @Override
                public MediagroupDTO mapRow(ResultSet rs, int rowNum) throws SQLException {
                    MediagroupDTO dto = new MediagroupDTO();
                    dto.setMediagroupno(rs.getInt("mediagroupno"));
                    dto.setTitle(rs.getString("title"));
                    return dto;
                } // mapRow() end
            }; // rowMapper end

            list = jt.query(sql.toString(), rowMapper);

        } catch (Exception e) {
            System.out.println("미디어 그룹 페이징 실패 : " + e);
        } // end
        return list;
    } // list2() end

    public int totalRowCount() {
        int cnt = 0;

        try {
            sql = new StringBuilder();
            sql.append(" SELECT COUNT(*) FROM mediagroup ");
            cnt = jt.queryForObject(sql.toString(), Integer.class);
        } catch (Exception e) {
            System.out.println("전체 행 갯수 : " + e);
        } // end
        return cnt;
    } // totalRowCount() end

    public int delete(int mediagroupno) {
        int cnt = 0;

        try {
            sql = new StringBuilder();
            sql.append(" DELETE FROM mediagroup ");
            sql.append(" WHERE mediagroupno = ? ");

            cnt = jt.update(sql.toString(), mediagroupno);
        } catch (Exception e) {
            System.out.println("미디어 그룹 삭제 실패 : " + e);
        } // end
        return cnt;
    } // delete() end

    public MediagroupDTO read(int mediagroupno) {
        MediagroupDTO dto = null;
        try {
            sql = new StringBuilder();
            sql.append(" SELECT mediagroupno, title ");
            sql.append(" FROM mediagroup ");
            sql.append(" WHERE mediagroupno = " + mediagroupno);

            RowMapper<MediagroupDTO> rowMapper = new RowMapper<MediagroupDTO>() {
                @Override
                public MediagroupDTO mapRow(ResultSet rs, int rowNum) throws SQLException {
                    MediagroupDTO dto = new MediagroupDTO();
                    dto.setMediagroupno(rs.getInt("mediagroupno"));
                    dto.setTitle(rs.getString("title"));
                    return dto;
                } // mapRow() end
            }; // rowMapper end

            dto = jt.queryForObject(toString(), rowMapper);

        } catch (Exception e) {
            System.out.println("미디어그룹 상세보기 실패 : "+e);
        } // try end

        return dto;
    } // read() end

    public int update(MediagroupDTO dto) {
        int cnt = 0;

        try {
            sql = new StringBuilder();
            sql.append(" UPDATE mediagroup ");
            sql.append(" SET title = ? ");
            sql.append(" WHERE mediagroupno = ? ");
            cnt = jt.update(sql.toString(), dto.getTitle(), dto.getMediagroupno());

        } catch (Exception e) {
            System.out.println("미디어그룹 수정 실패 : "+e);
        } // end
        return cnt;
    } // update() end


} // class end

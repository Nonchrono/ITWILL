package com.bookmark.bookmark.bbs;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class BbsDAO {

    private JdbcTemplate jt;

    public BbsDAO() {
        System.out.println("-----BbsDAO() 객체 생성됨");
    } // end

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
}

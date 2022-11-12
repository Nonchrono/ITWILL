package com.bookmark.bbs;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class BbsDAO {

    // MyBatis로 db 연결
    @Autowired
    private SqlSession sqlSession;

    // 기본 생성자 (객체 생성 확인)
    public BbsDAO() {
        System.out.println("-----BbsDAO() 객체 생성됨");
    } // end



} // class end

package kr.co.itwill.comment;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class CommentDAO {

    public CommentDAO() {
        System.out.println("-----CommentDAO() 객체 생성됨");
    } // end

    @Autowired
    SqlSession sqlSession;

    public int commentInsert(CommentDTO comment) {
        return sqlSession.insert("comment.insert", comment);
    } // insert() end

    public List<CommentDTO> commentlist(int pno) {
        return sqlSession.selectList("comment.list", pno);
    } // list() end

    public int commentDelete(int cno) throws Exception {
        return sqlSession.delete("comment.delete", cno);
    } // delete() end

    public int commentUpdate(CommentDTO comment) throws Exception {
        return sqlSession.update("comment.update", comment);
    } // commentUpdate() end


} // class end

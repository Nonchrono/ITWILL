package kr.co.itwill.product;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository // 스프링 컨테이너의 클래스를 객체화 시켜줌
public class ProductDAO {

    public ProductDAO() {
        System.out.println("-----ProductDAO() 객체 생성됨");
    } // end

    // 스프링 빈(객체)으로 생성된 객체를 가져와서 연결하기
    @Autowired
    SqlSession sqlSession;

    public List<Map<String, Object>> list() {
        return sqlSession.selectList("product.list");
    } // list() end

    public void insert(Map<String, Object> map) {
        sqlSession.insert("prod1uct.insert", map);
    } // insert() end

    public List<Map<String, Object>> search(String product_name) {
        
        // 영문자의 경우 대소문자 구분 없이

        return sqlSession.selectList("product.search", "%" + product_name.toUpperCase() + "%");
    } // search() end

    public Map<String, Object> detail(String product_code) {
        return sqlSession.selectOne("product.detail", product_code);
    } // detail() end

    public void update(Map<String, Object> map) {
        sqlSession.update("product.update", map);
    } // update() end

    public String filename(int product_code) {
        return sqlSession.selectOne("product.filename", product_code);
    } // filename() end

    public void delete(int product_code) {
        sqlSession.delete("product.delete", product_code);
    } // delete() end

} // class end

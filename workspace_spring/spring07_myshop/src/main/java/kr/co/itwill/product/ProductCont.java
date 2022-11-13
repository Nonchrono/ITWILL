package kr.co.itwill.product;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.Map;
import java.util.Objects;

@Controller
@RequestMapping("/product")
public class ProductCont {

    public ProductCont() {
        System.out.println("-----ProductCont() 객체 생성됨");
    } // end

    @Autowired
    ProductDAO productDAO;

    @RequestMapping("/list")
    public ModelAndView list() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("product/list");
        mav.addObject("list", productDAO.list());
        return mav;
    } // list() end

    @RequestMapping("/write")
    public String write() {
        return "product/write";
    } // write() end

    @RequestMapping("/insert")
    public String insert(@RequestParam Map<String, Object> map
            , @RequestParam MultipartFile img
            , HttpServletRequest req) {

        // 주의사항 : 파일 업로드할 때 리네임되지 않음

        // 업로드된 파일을 /storage 폴더에 저장
        String filename = "-";
        long filesize = 0;
        if (img != null && !img.isEmpty()) {
            filename = img.getOriginalFilename();
            filesize = img.getSize();
            try {
                ServletContext application = req.getSession().getServletContext();
                String path = application.getRealPath("/storage");
                // 어플리케이션이 아니라 리퀘스트여도 되지만 추천은 어플리케이션 // 실제 물리적인 경로
                // System.out.println(path);
                // d:\java202202\workspace_spring\spring07_myshop\src\main\webapp\storage
                img.transferTo(new File(path + "\\" + filename)); //  파일 저장
            } catch (Exception e) {
                e.printStackTrace(); // 에러메세지 출력하기 sout(e)랑 똑같은 명령어
            } // try end
        } // if end
        // insert() end

        map.put("filename", filename);
        map.put("filesize", filesize);
        productDAO.insert(map);
        return "redirect:/product/list";
    } // insert() end

    @RequestMapping("/search")
    public ModelAndView search(@RequestParam(defaultValue = "") String product_name) {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("product/list");
        mav.addObject("list", productDAO.search(product_name));
        mav.addObject("product_name", product_name);
        return mav;
    } // search() end

    @RequestMapping("/detail/{product_code}")
    public ModelAndView detail(@PathVariable String product_code) {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("product/detail");
        mav.addObject("product", productDAO.detail(product_code));
        return mav;
    } // detail() end



    /*
        @RequestParam
        http://192.168.0.1:9090?aaa=bbb&ccc=ddd

        @PathVariable
        http://192.168.0.1:9090/bbb/ddd
    */

    // 주의사항 상품 수정시 파일을 무조건 수정해줘야함
    @RequestMapping("/update")
    public String update(@RequestParam Map<String, Object> map
            , @RequestParam MultipartFile img
            , HttpServletRequest req) {

        String filename = "-";
        long filesize = 0;
        String original_filename = map.get("original_filename").toString();

        if (img != null && !img.isEmpty()) {
            filename = img.getOriginalFilename();
            filesize = img.getSize();
            try {
                ServletContext application = req.getSession().getServletContext();
                String path = application.getRealPath("/storage");

                File file = new File(path + "\\" +original_filename);

                if(file.exists()) {
                    file.delete();
                    System.out.println("삭제 성공");
                } // if end

                img.transferTo(new File(path + "\\" + filename));
            } catch (Exception e) {
                e.printStackTrace();
            } // try end
        } else {
            String product_code = map.get("product_code").toString();
            Map<String, Object> product = productDAO.detail(product_code);
            filename = product.get("FILENAME").toString();
            // filesize = (long)product.get("FILESIZE");
            filesize=Long.parseLong(product.get("FILESIZE").toString());

        } // if end


        map.put("filename", filename);
        map.put("filesize", filesize);
        productDAO.update(map);
        return "redirect:/product/list";
    } // update() end


    @RequestMapping("/delete")
    public String delete(int product_code, HttpServletRequest req) {
        String filename = productDAO.filename(product_code); // 파일 삭제
        if (filename != null && !filename.equals("-")) {
            ServletContext application = req.getSession().getServletContext();
            String path = application.getRealPath("/storage");
            File file = new File(path + "\\" + filename);
            if (file.exists()) {
                file.delete();
            } // if end
        } // if end

        productDAO.delete(product_code);
        return "redirect:/product/list";
    } // delete() end
} // class end

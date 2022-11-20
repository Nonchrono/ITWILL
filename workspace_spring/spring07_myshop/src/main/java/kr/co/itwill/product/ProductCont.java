package kr.co.itwill.product;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.Map;
import java.util.UUID;

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
                img.transferTo(new File(path + "/" + filename)); //  파일 저장
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

                File file = new File(path + "/" +original_filename);

                if(file.exists()) {
                    file.delete();
                    System.out.println("삭제 성공");
                } // if end

                img.transferTo(new File(path + "/" + filename));

            } catch (Exception e) {
                e.printStackTrace();
            } // try end
        } else {
            String product_code = map.get("product_code").toString();
            Map<String, Object> product = productDAO.detail(product_code);
            filename = product.get("filename").toString();
            // filesize = (long)product.get("FILESIZE");
            filesize=Long.parseLong(product.get("filesize").toString());

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
            File file = new File(path + "/" + filename);
            if (file.exists()) {
                file.delete();
            } // if end
        } // if end

        productDAO.delete(product_code);
        return "redirect:/product/list";
    } // delete() end

    // 이미지 업로드
    @RequestMapping(value="/imageUpload", method = RequestMethod.POST)
    public void imageUpload(HttpServletRequest req,
                            HttpServletResponse resp, MultipartHttpServletRequest multiFile
            , @RequestParam MultipartFile upload) throws Exception{
        // 랜덤 문자 생성
        UUID uid = UUID.randomUUID();

        // 바이트 기반 출력 스트림
        OutputStream out = null;
        PrintWriter printWriter = null;

        //인코딩
        resp.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset=utf-8");
        try{
            //파일 이름 가져오기
            String fileName = upload.getOriginalFilename();
            byte[] bytes = upload.getBytes();

            //이미지 경로 생성
            // String path = "D:\\" + "ckImage/";	// 이미지 경로 설정(폴더 자동 생성)
            ServletContext application = req.getSession().getServletContext();
            String path = application.getRealPath("/storage/");
            String ckUploadPath = path + uid + "_" + fileName;
            File folder = new File(path);
            System.out.println("path:"+path);	// 이미지 저장경로 console에 확인
            //해당 디렉토리 확인
            if(!folder.exists()){
                try{
                    folder.mkdirs(); // 폴더 생성
                }catch(Exception e){
                    e.getStackTrace();
                }
            }

            out = new FileOutputStream(new File(ckUploadPath));
            out.write(bytes);
            out.flush(); // outputStram에 저장된 데이터를 전송하고 초기화

            String callback = req.getParameter("CKEditorFuncNum");
            printWriter = resp.getWriter();
            String fileUrl = "/product/ckImgSubmit?uid=" + uid + "&fileName=" + fileName; // 작성화면

            // 업로드시 메시지 출력
            printWriter.println("{\"filename\" : \""+fileName+"\", \"uploaded\" : 1, \"url\":\""+fileUrl+"\"}");
            printWriter.flush();

        }catch(IOException e){
            e.printStackTrace();
        } finally {
            try {
                if(out != null) { out.close(); }
                if(printWriter != null) { printWriter.close(); }
            } catch(IOException e) { e.printStackTrace(); }
        }
        return;
    } // imageUpload() end

    // 서버로 전송된 이미지 뿌려주기
    @RequestMapping(value="/ckImgSubmit")
    public void ckSubmit(@RequestParam(value="uid") String uid
            , @RequestParam(value="fileName") String fileName
            , HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException{

        //서버에 저장된 이미지 경로
        // String path = "D:\\" + "ckImage/";	// 저장된 이미지 경로
        ServletContext application = req.getSession().getServletContext();
        String path = application.getRealPath("/storage/");
        System.out.println("path:"+path);
        String sDirPath = path + uid + "_" + fileName;

        File imgFile = new File(sDirPath);

        //사진 이미지 찾지 못하는 경우 예외처리로 빈 이미지 파일을 설정한다.
        if(imgFile.isFile()){
            byte[] buf = new byte[1024];
            int readByte = 0;
            int length = 0;
            byte[] imgBuf = null;

            FileInputStream fileInputStream = null;
            ByteArrayOutputStream outputStream = null;
            ServletOutputStream out = null;

            try{
                fileInputStream = new FileInputStream(imgFile);
                outputStream = new ByteArrayOutputStream();
                out = resp.getOutputStream();

                while((readByte = fileInputStream.read(buf)) != -1){
                    outputStream.write(buf, 0, readByte);
                }

                imgBuf = outputStream.toByteArray();
                length = imgBuf.length;
                out.write(imgBuf, 0, length);
                out.flush();

            }catch(IOException e){
                e.printStackTrace();
            }finally {
                outputStream.close();
                fileInputStream.close();
                out.close();
            }
        }
    }


} // class end

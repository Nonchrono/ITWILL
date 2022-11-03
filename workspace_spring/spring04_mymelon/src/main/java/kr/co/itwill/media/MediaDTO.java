package kr.co.itwill.media;

import lombok.*;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class MediaDTO {

    private int mediano; // 미디어 번호
    private String title; // 제목
    private String poster; // 포스터 이미지
    private String filename; // 음원 파일명
    private long filesize; // 파일 사이즈
    private String mview; // 출력모드. 게시판에 노출시키고 싶지 않을 때 Y가 값으로 들어간 것만 보여줄 예정
    private String rdate; // 등록일
    private int mediagroupno; // 부모테이블 PK+

} // class end

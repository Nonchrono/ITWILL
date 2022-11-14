package kr.co.itwill.comment;

import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class CommentDTO {
    private int cno;
    private int pno;
    private String content;
    private String wname;
    private String regdate;
    private Long filesize;
}
package com.bookmark.bookmark.bbs;

import lombok.*;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class BbsDTO {

    private int bbsno;
    private String wname;
    private String subject;
    private String content;
    private int grpno;
    private int indent;
    private int ansnum;
    private String regdt;
    private String passwd;
    private int readcnt;
    private String ip;
    private String secretp;
    private String writer;

}

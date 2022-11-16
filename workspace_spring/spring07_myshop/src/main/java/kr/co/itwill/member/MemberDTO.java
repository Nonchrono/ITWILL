package kr.co.itwill.member;

import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class MemberDTO {
    private String id;
    private String passwd;
    private String mname;
    private String tel;
    private String email;
    private String zipcode;
    private String address1;
    private String address2;
    private String job;
    private String mlevel;
    private String mdate;
}

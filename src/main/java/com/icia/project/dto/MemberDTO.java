package com.icia.project.dto;

import lombok.*;


@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor

public class MemberDTO {
    private Long id;
    private String memberEmail;
    private String memberPassword;
    private String memberUserName;
    private String memberName;
    private String memberMobile;
    private String memberProfile;
    private String memberIntro;

}

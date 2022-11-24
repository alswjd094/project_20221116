package com.icia.project.dto;

import lombok.*;

import java.sql.Timestamp;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
public class LikesDTO {
    private Long id;
    private Long userId;
    private Long imageId;
    private int heart;
    private Timestamp likesCreatedDate;

}

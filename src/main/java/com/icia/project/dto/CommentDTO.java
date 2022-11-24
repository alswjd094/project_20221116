package com.icia.project.dto;

import lombok.*;

import java.sql.Timestamp;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class CommentDTO {
    private Long id;
    private Long commentId;
    private String commentWriter;
    private String commentContents;
    private Timestamp commentCreatedDate;

}

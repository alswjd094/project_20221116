package com.icia.project.dto;

import lombok.*;

import java.sql.Timestamp;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class BoardDTO {
    private Long id;
    private String boardContents;
    private String boardWriter;
    private String boardFile;
    private Timestamp boardCreatedDate;
    private Long boardId;

}

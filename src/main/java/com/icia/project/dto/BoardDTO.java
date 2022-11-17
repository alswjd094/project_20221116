package com.icia.project.dto;

import lombok.*;
import org.springframework.web.multipart.MultipartFile;

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
    private String boardImage;
    private Timestamp boardCreatedDate;
    private Long boardId;

    private MultipartFile boardFile;
    private String originalFileName_board;
    private String storedFileName_board;
    private int fileAttached_board;
    private Long boardFileId;

}

package com.icia.project.repository;

import com.icia.project.dto.BoardDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardRepository {
    @Autowired
    private SqlSessionTemplate sql;
    public int writing(BoardDTO boardDTO) {
        return sql.insert("Board.writing",boardDTO);
    }
}

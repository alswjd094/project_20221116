package com.icia.project.repository;

import com.icia.project.dto.BoardDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class BoardRepository {
    @Autowired
    private SqlSessionTemplate sql;
    public BoardDTO writing(BoardDTO boardDTO) {
        sql.insert("Board.writing",boardDTO);
        return boardDTO;
    }

    public void saveFileName(BoardDTO boardDTO) {
        sql.insert("Board.saveFileName",boardDTO);
    }

    public List<BoardDTO> list() {
        return sql.selectList("Board.list");
    }

    public BoardDTO boardFindById(Long id) {
        BoardDTO boardDTO = sql.selectOne("Board.boardFindById",id);
        if(boardDTO.getFileAttached_board()==1){
            return sql.selectOne("Board.boardFindByIdFile",id);
        }else{
            return boardDTO;
        }
    }

    public void delete(Long id) {
        sql.delete("Board.delete",id);
    }

    public void update(BoardDTO boardDTO) {
        sql.update("Board.update",boardDTO);
    }

    public List<BoardDTO> search(Map<String,String> searchParams) {
        return sql.selectList("Board.search",searchParams);
    }
}

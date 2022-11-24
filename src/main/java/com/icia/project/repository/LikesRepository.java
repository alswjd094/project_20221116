package com.icia.project.repository;

import com.icia.project.dto.LikesDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.Map;

@Repository
public class LikesRepository {
    @Autowired
    private SqlSessionTemplate sql;
    public LikesDTO findHeart(LikesDTO likesDTO){
        LikesDTO likesDTO1 = sql.selectOne("Likes.findHeart",likesDTO);
    if(likesDTO.getHeart()==1){
        return sql.selectOne("Likes.findHeartJoin",likesDTO);
    }else{
        return likesDTO1;
    }
    }

    public int heart(LikesDTO likesDTO) {
        return sql.insert("Likes.heart",likesDTO);
    }

    public int deleteHeart(LikesDTO likesDTO) {
        return sql.delete("Likes.deleteHeart",likesDTO);
    }
}

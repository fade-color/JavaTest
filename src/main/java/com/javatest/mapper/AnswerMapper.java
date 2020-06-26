package com.javatest.mapper;

import com.javatest.domain.Answer;

public interface AnswerMapper {
    int deleteByPrimaryKey(Integer problemId);

    int insert(Answer record);

    int insertSelective(Answer record);

    Answer selectByPrimaryKey(Integer problemId);

    int updateByPrimaryKeySelective(Answer record);

    int updateByPrimaryKey(Answer record);
}
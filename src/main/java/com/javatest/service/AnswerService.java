package com.javatest.service;

import com.javatest.domain.Answer;

public interface AnswerService {

    String getAnswer(Integer problemId);

    int insert(Answer record);

    int updateByPrimaryKey(Answer record);


}

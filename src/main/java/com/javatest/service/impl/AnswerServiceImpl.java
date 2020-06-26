package com.javatest.service.impl;

import com.javatest.domain.Answer;
import com.javatest.mapper.AnswerMapper;
import com.javatest.service.AnswerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AnswerServiceImpl implements AnswerService {

    @Autowired
    AnswerMapper answerMapper;

    @Override
    public String getAnswer(Integer problemId) {
        Answer answer = answerMapper.selectByPrimaryKey(problemId);
        if (answer!=null)
            return answer.getProblemAnswer();
        return null;
    }

    @Override
    public int insert(Answer record) {
        return answerMapper.insert(record);
    }

    @Override
    public int updateByPrimaryKey(Answer record) {
        return answerMapper.updateByPrimaryKey(record);
    }
}

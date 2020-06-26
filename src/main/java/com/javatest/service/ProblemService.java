package com.javatest.service;

import com.javatest.domain.Answer;
import com.javatest.domain.Problem;
import com.javatest.domain.ProblemRecord;

import java.util.List;

public interface ProblemService {

    List<ProblemRecord> selectAll();

    Problem selectProblemById(Integer problemId);

    int selectProblemId();

    int insert(Problem problem, Answer answer);

    int deleteByPrimaryKey(Integer problemId);

    int updateByPrimaryKey(Problem record);

}

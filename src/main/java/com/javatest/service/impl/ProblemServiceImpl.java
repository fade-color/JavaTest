package com.javatest.service.impl;

import com.javatest.domain.Answer;
import com.javatest.domain.Problem;
import com.javatest.domain.ProblemRecord;
import com.javatest.mapper.AnswerMapper;
import com.javatest.mapper.ProblemMapper;
import com.javatest.service.ProblemService;
import com.javatest.service.RecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.LinkedList;
import java.util.List;

@Service
public class ProblemServiceImpl implements ProblemService {

    @Autowired
    ProblemMapper problemMapper;
    @Autowired
    RecordService recordService;
    @Autowired
    AnswerMapper answerMapper;

    @Override
    public List<ProblemRecord> selectAll() {
        List<Problem> problems = problemMapper.selectAll();
        List<ProblemRecord> problemRecords = new LinkedList<>();
        for (Problem problem:problems) {
            ProblemRecord problemRecord = new ProblemRecord(problem);
            problemRecord.setCorrectNum(recordService.selectCorrectNumByProblemId(problem.getProblemId()));
            problemRecord.setSubmitNum(recordService.selectSubmitNumByProblemId(problem.getProblemId()));
            problemRecords.add(problemRecord);
        }
        return problemRecords;
    }

    @Override
    public Problem selectProblemById(Integer problemId) {
        return problemMapper.selectByPrimaryKey(problemId);
    }

    @Override
    public int insert(Problem problem, Answer answer){
        problemMapper.insertSelective(problem);
        answerMapper.insertSelective(answer);
        return 1;
    }

    @Override
    public int selectProblemId(){
        return problemMapper.selectLast();
    }

    @Override
    public int updateByPrimaryKey(Problem record) {
        return problemMapper.updateByPrimaryKey(record);
    }

    @Override
    public int deleteByPrimaryKey(Integer problemId) {
        return problemMapper.deleteByPrimaryKey(problemId);
    }
}

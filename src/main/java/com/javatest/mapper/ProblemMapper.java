package com.javatest.mapper;

import com.javatest.domain.Problem;

import java.util.List;

public interface ProblemMapper {
    int deleteByPrimaryKey(Integer problemId);

    int insert(Problem record);

    int insertSelective(Problem record);

    Problem selectByPrimaryKey(Integer problemId);

    List<Problem> selectAll();//

    int updateByPrimaryKeySelective(Problem record);

    int updateByPrimaryKey(Problem record);

    int selectLast();
}
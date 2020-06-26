package com.javatest.service;

import com.javatest.domain.Record;

import java.util.List;

public interface RecordService {

    List<Record> selectAllRank();//查询排名

    List<Record> selectAllRankBySubmitNum();

    int selectSubmitNum(String userId);

    int selectCorrectNumByProblemId(Integer problemId);

    int selectSubmitNumByProblemId(Integer problemId);

    int submitCode(Record record);

    List<Record> selectAllStatus();

    List<Record> selectMyRecord();

    List<Record> selectByUserId(String userId);

}

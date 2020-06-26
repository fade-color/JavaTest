package com.javatest.mapper;

import com.javatest.domain.Record;

import java.util.List;

public interface RecordMapper {
    int deleteByPrimaryKey(Integer recordId);

    int insert(Record record);

    int insertSelective(Record record);

    Record selectByPrimaryKey(Integer recordId);

    int updateByPrimaryKeySelective(Record record);

    int updateByPrimaryKey(Record record);

    List<Record> selectAllRank();

    int selectSubmitNum(String userId);

    List<Record> selectAllRankBySubmitNum();
    int selectCorrectNumByProblemId(Integer problemId);

    int selectSubmitNumByProblemId(Integer problemId);

    List<Record> selectAllStatus();

    List<Record> selectByUserId( String userId);

    List<Record> selectMyRecord();

}
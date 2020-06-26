package com.javatest.service.impl;

import com.javatest.domain.Record;
import com.javatest.mapper.RecordMapper;
import com.javatest.service.RecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.List;

@Service
public class RecordServiceImpl implements RecordService {

    @Autowired
    RecordMapper recordMapper;

    @Override
    public List<Record> selectAllRank() {
        List<Record> records = recordMapper.selectAllRank();
        for (Record record:records) {
            record.setSubmitNum(recordMapper.selectSubmitNum(record.getUserId()));
        }
        Collections.sort(records);//实现排序
        return records;
    }

    @Override
    public List<Record> selectMyRecord() {
        List<Record> records = recordMapper.selectMyRecord();
        return records;
    }

    @Override
    public int selectSubmitNum(String userId) {
        return recordMapper.selectSubmitNum(userId);
    }

    @Override
    public int selectCorrectNumByProblemId(Integer problemId) {
        return recordMapper.selectCorrectNumByProblemId(problemId);
    }
    @Override
    public List<Record> selectAllRankBySubmitNum() {
        List<Record> records = recordMapper.selectAllRankBySubmitNum();
        return records;
    }
    @Override
    public int selectSubmitNumByProblemId(Integer problemId) {
        return recordMapper.selectSubmitNumByProblemId(problemId);
    }

    @Override
    public int submitCode(Record record) {
        return recordMapper.insertSelective(record);
    }

    @Override
    public List<Record> selectAllStatus(){
        return recordMapper.selectAllStatus();
    }

    @Override
    public List<Record> selectByUserId(String userId) {
        return recordMapper.selectByUserId(userId);
    }
}

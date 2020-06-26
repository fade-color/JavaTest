package com.javatest.service;

import com.javatest.domain.Problem;
import com.javatest.domain.ProblemRecord;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.LinkedList;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring-context.xml","classpath:spring-mybatis.xml"})
public class ProblemServiceTest {

    @Autowired
    ProblemService problemService;
    @Autowired
    RecordService recordService;

    @Test
    public void selectAll() {
        List<ProblemRecord> problemRecords = problemService.selectAll();
        for (ProblemRecord problemRecord:problemRecords) {
            System.out.println(problemRecord.getProblemId()+" "+problemRecord.getProblemContent()+" "+problemRecord.getCorrectNum()+" "+problemRecord.getSubmitNum());
        }
    }

}

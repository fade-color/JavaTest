package com.javatest;

import com.javatest.domain.Answer;
import com.javatest.service.AnswerService;
import com.javatest.service.RecordService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring-context.xml","classpath:spring-mybatis.xml"})
public class test {

    @Autowired
    AnswerService answerService;
    @Autowired
    RecordService recordService;

    @Test
    public void insertAnswer() {
//        Answer answer = new Answer();
//        answer.setProblemId(2);
//        answer.setProblemAnswer("dlroW olleH\n");
//        System.out.println(answerService.insert(answer));

    }

}

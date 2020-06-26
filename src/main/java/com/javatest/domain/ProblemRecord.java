package com.javatest.domain;

public class ProblemRecord extends Problem {

    private Integer correctNum;
    private Integer submitNum;

    public ProblemRecord() {
    }

    public ProblemRecord(Problem problem) {
        super(problem.getProblemId(),problem.getProblemContent());
    }

    public Integer getCorrectNum() {
        return correctNum;
    }

    public void setCorrectNum(Integer correctNum) {
        this.correctNum = correctNum;
    }

    public Integer getSubmitNum() {
        return submitNum;
    }

    public void setSubmitNum(Integer submitNum) {
        this.submitNum = submitNum;
    }
}

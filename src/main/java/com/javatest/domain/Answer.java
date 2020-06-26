package com.javatest.domain;

import java.io.Serializable;

public class Answer implements Serializable {
    private Integer problemId;

    private String problemAnswer;

    public Answer() {
    }

    public Answer(Integer problemId, String problemAnswer) {
        this.problemId = problemId;
        this.problemAnswer = problemAnswer;
    }

    private static final long serialVersionUID = 1L;

    public Integer getProblemId() {
        return problemId;
    }

    public void setProblemId(Integer problemId) {
        this.problemId = problemId;
    }

    public String getProblemAnswer() {
        return problemAnswer;
    }

    public void setProblemAnswer(String problemAnswer) {
        this.problemAnswer = problemAnswer == null ? null : problemAnswer.trim();
    }
}
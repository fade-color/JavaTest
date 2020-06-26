package com.javatest.domain;

import java.io.Serializable;

public class Problem implements Serializable {
    private Integer problemId;

    private String problemContent;

    private static final long serialVersionUID = 1L;

    public Integer getProblemId() {
        return problemId;
    }

    public void setProblemId(Integer problemId) {
        this.problemId = problemId;
    }

    public String getProblemContent() {
        return problemContent;
    }

    public void setProblemContent(String problemContent) {
        this.problemContent = problemContent == null ? null : problemContent.trim();
    }

    public Problem() {
    }

    public Problem(Integer problemId, String problemContent) {
        this.problemId = problemId;
        this.problemContent = problemContent;
    }

}
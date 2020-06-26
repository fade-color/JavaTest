package com.javatest.domain;

import java.io.Serializable;
import java.util.Date;


public class Record implements Serializable,Comparable<Record> {

    private Integer recordId;
    private String userId;
    private Integer problemId;
    private Integer result;
    private Integer runTime;
    private Date submitTime;
    private String userName;
    private Integer submitNum;
    private Integer correctNum;
    private String problemContent;

    public Record() {
    }

    public Record(String userId, Integer result, Integer runTime, Date submitTime, String problemContent) {
        this.userId = userId;
        this.result = result;
        this.runTime = runTime;
        this.submitTime = submitTime;
        this.problemContent = problemContent;
    }

    public Record(String userId, Integer problemId, Integer result, Integer runTime, Date submitTime) {
        this.userId = userId;
        this.problemId = problemId;
        this.result = result;
        this.runTime = runTime;
        this.submitTime = submitTime;
    }

    public Record(Integer recordId, String userId, Integer problemId, Integer result, Integer runTime, Date submitTime, String userName, Integer submitNum, Integer correctNum, String problemContent) {
        this.recordId = recordId;
        this.userId = userId;
        this.problemId = problemId;
        this.result = result;
        this.runTime = runTime;
        this.submitTime = submitTime;
        this.userName = userName;
        this.submitNum = submitNum;
        this.correctNum = correctNum;
        this.problemContent = problemContent;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getProblemContent() {
        return problemContent;
    }

    public void setProblemContent(String problemContent) {
        this.problemContent = problemContent;
    }

    public Integer getSubmitNum() {
        return submitNum;
    }

    public void setSubmitNum(Integer submitNum) {
        this.submitNum = submitNum;
    }

    public Integer getCorrectNum() {
        return correctNum;
    }

    public void setCorrectNum(Integer correctNum) {
        this.correctNum = correctNum;
    }

    private static final long serialVersionUID = 1L;

    public Integer getRecordId() {
        return recordId;
    }

    public void setRecordId(Integer recordId) {
        this.recordId = recordId;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId == null ? null : userId.trim();
    }

    public Integer getProblemId() {
        return problemId;
    }

    public void setProblemId(Integer problemId) {
        this.problemId = problemId;
    }

    public Integer getResult() {
        return result;
    }

    public void setResult(Integer result) {
        this.result = result;
    }

    public Integer getRunTime() {
        return runTime;
    }

    public void setRunTime(Integer runTime) {
        this.runTime = runTime;
    }

    public Date getSubmitTime() {
        return submitTime;
    }

    public void setSubmitTime(Date submitTime) {
        this.submitTime = submitTime;
    }

    @Override
    public int compareTo(Record record) { // 重写compareTo方法，以实现排名的排序
        int i = record.getCorrectNum().compareTo(this.correctNum);
        if (i==0) {
            return this.getSubmitNum().compareTo(record.getSubmitNum());
        }
        return i;
    }
}
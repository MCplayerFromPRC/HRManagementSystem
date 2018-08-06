package com.cc.model;

import java.io.Serializable;
import java.sql.Timestamp;

public class Train implements Serializable {
    private int id;
    private String subject;
    private String content;
    private String object;
    private String startTime;
    private String endTime;
    private String place;
    private int state;
    private Timestamp releaseTime;

    public Train() {
    }

    public Train(int id, String subject, String content, String object, String startTime, String endTime, String place, int state, Timestamp releaseTime) {
        this.id = id;
        this.subject = subject;
        this.content = content;
        this.object = object;
        this.startTime = startTime;
        this.endTime = endTime;
        this.place = place;
        this.state = state;
        this.releaseTime = releaseTime;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getObject() {
        return object;
    }

    public void setObject(String object) {
        this.object = object;
    }

    public String getStartTime() {
        return startTime;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }

    public String getPlace() {
        return place;
    }

    public void setPlace(String place) {
        this.place = place;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    public Timestamp getReleaseTime() {
        return releaseTime;
    }

    public void setReleaseTime(Timestamp releaseTime) {
        this.releaseTime = releaseTime;
    }

    @Override
    public String toString() {
        return "Train{" +
                "id=" + id +
                ", subject='" + subject + '\'' +
                ", content='" + content + '\'' +
                ", object='" + object + '\'' +
                ", startTime='" + startTime + '\'' +
                ", endTime='" + endTime + '\'' +
                ", place='" + place + '\'' +
                ", state=" + state +
                '}';
    }
}

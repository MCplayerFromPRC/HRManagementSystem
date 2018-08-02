package com.cc.model;

import java.io.Serializable;
import java.util.Date;

public class Interview implements Serializable {
    private int id;
    private int reid;
    private int riid;
    private int state;
    private String ivtime;
    private Date inviteTime;
    private Resume resume;
    private RecruitInfo recruitInfo;

    public Interview() {
    }

    public Interview(int id, int reid, int riid, int state, String ivtime, Date inviteTime, Resume resume, RecruitInfo recruitInfo) {
        this.id = id;
        this.reid = reid;
        this.riid = riid;
        this.state = state;
        this.ivtime = ivtime;
        this.inviteTime = inviteTime;
        this.resume = resume;
        this.recruitInfo = recruitInfo;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getReid() {
        return reid;
    }

    public void setReid(int reid) {
        this.reid = reid;
    }

    public int getRiid() {
        return riid;
    }

    public void setRiid(int riid) {
        this.riid = riid;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    public String getIvtime() {
        return ivtime;
    }

    public void setIvtime(String ivtime) {
        this.ivtime = ivtime;
    }

    public Date getInviteTime() {
        return inviteTime;
    }

    public void setInviteTime(Date inviteTime) {
        this.inviteTime = inviteTime;
    }

    public Resume getResume() {
        return resume;
    }

    public void setResume(Resume resume) {
        this.resume = resume;
    }

    public RecruitInfo getRecruitInfo() {
        return recruitInfo;
    }

    public void setRecruitInfo(RecruitInfo recruitInfo) {
        this.recruitInfo = recruitInfo;
    }

    @Override
    public String toString() {
        return "Interview{" +
                "id=" + id +
                ", reid=" + reid +
                ", riid=" + riid +
                ", state=" + state +
                ", ivtime='" + ivtime + '\'' +
                ", inviteTime=" + inviteTime +
                ", resume=" + resume +
                ", recruitInfo=" + recruitInfo +
                '}';
    }
}

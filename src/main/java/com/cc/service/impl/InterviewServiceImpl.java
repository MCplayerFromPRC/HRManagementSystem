package com.cc.service.impl;

import com.cc.dao.InterviewDao;
import com.cc.model.Interview;
import com.cc.service.InterviewService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class InterviewServiceImpl implements InterviewService {
    @Resource
    private InterviewDao ivd;
    @Override
    public List<Interview> getInterviewByState(int state) {
        return ivd.getInterviewByState(state);
    }

    @Override
    public List<Interview> getInterviewByReidAndState(Interview interview) {
        return ivd.getInterviewByReidAndState(interview);
    }

    @Override
    public List<Interview> getInterviewByRiidAndState(Interview interview) {
        return ivd.getInterviewByRiidAndState(interview);
    }

    @Override
    public Interview getInterviewById(int id) {
        return ivd.getInterviewById(id);
    }

    @Override
    public boolean insert(Interview interview) {
        return ivd.insert(interview);
    }

    @Override
    public boolean update(Interview interview) {
        return ivd.update(interview);
    }

    @Override
    public boolean delete(Interview interview) {
        return ivd.delete(interview);
    }
}

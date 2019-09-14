package cn.hf.sportmeeting.service;

import cn.hf.sportmeeting.domain.Project;

import java.util.List;

/**
 * @author 韩锋
 */
public interface IProjectService {

    /**
     * 查询所有的比赛项目
     * @return
     */
    public List<Project> findAll();
}

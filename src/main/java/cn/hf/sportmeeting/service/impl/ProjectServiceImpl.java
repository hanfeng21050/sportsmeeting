package cn.hf.sportmeeting.service.impl;

import cn.hf.sportmeeting.dao.ProjectMapper;
import cn.hf.sportmeeting.domain.Project;
import cn.hf.sportmeeting.domain.ProjectExample;
import cn.hf.sportmeeting.service.IProjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import java.util.List;

/**
 * @author 韩锋
 */
@Service
@Transactional(rollbackFor = Exception.class)
public class ProjectServiceImpl implements IProjectService {
    @Autowired
    private ProjectMapper projectMapper;

    @Override
    public List<Project> findAll() {
        ProjectExample example = new ProjectExample();
        example.createCriteria().andActiveEqualTo(true);
        List<Project> projects = projectMapper.selectByExample(example);
        return projects;
    }
}

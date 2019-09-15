package cn.hf.sportmeeting.service.impl;

import cn.hf.sportmeeting.dao.AthleteMapper;
import cn.hf.sportmeeting.dao.GradeMapper;
import cn.hf.sportmeeting.dao.ProjectMapper;
import cn.hf.sportmeeting.domain.*;
import cn.hf.sportmeeting.service.IProjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import java.util.ArrayList;
import java.util.List;

/**
 * @author 韩锋
 */
@Service
@Transactional(rollbackFor = Exception.class)
public class ProjectServiceImpl implements IProjectService {
    @Autowired
    private ProjectMapper projectMapper;

    @Autowired
    private AthleteMapper athleteMapper;

    @Autowired
    private GradeMapper gradeMapper;

    @Override
    public List<Project> findAll() {
        ProjectExample example = new ProjectExample();
        example.createCriteria().andActiveEqualTo(true);
        List<Project> projects = projectMapper.selectByExample(example);
        return projects;
    }

    @Override
    public Project findById(Integer projectId) {
        return projectMapper.selectByPrimaryKey(projectId);
    }

    @Override
    public List<Athlete> findAthleteById(Integer projectId) {
        //先通过project_id去grade表查询athleteId
        GradeExample gradeExample = new GradeExample();
        gradeExample.createCriteria().andProjectIdEqualTo(projectId);
        List<Grade> gradeList = gradeMapper.selectByExample(gradeExample);

        //通过grade.getAthleteId()去查找运动员
        List<Athlete> athleteList = new ArrayList<Athlete>();
        if(gradeList != null && gradeList.size() !=0)
        {
            for (Grade grade : gradeList) {
                Athlete athlete = athleteMapper.selectByPrimaryKey(grade.getAthleteId());
                athleteList.add(athlete);
            }
        }

        return athleteList;
    }

    @Override
    public Integer save(Project project) {
        project.setActive(true);
        return projectMapper.insertSelective(project);
    }

    @Override
    public void deleteByIds(Integer[] ids) {
        if(ids != null && ids.length != 0){
            for (Integer id : ids) {
                projectMapper.deleteByPrimaryKey(id);
            }
        }
    }
}

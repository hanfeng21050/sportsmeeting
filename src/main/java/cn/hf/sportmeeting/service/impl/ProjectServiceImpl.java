package cn.hf.sportmeeting.service.impl;

import cn.hf.sportmeeting.dao.AthleteMapper;
import cn.hf.sportmeeting.dao.GradeMapper;
import cn.hf.sportmeeting.dao.ProjectMapper;
import cn.hf.sportmeeting.dao.TeamMapper;
import cn.hf.sportmeeting.domain.*;
import cn.hf.sportmeeting.service.IProjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;


import java.util.*;

/**
 * @author 韩锋
 */

@Service
@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, timeout = 30,rollbackFor = Exception.class)
public class ProjectServiceImpl implements IProjectService {
    @Autowired
    private ProjectMapper projectMapper;

    @Autowired
    private AthleteMapper athleteMapper;

    @Autowired
    private GradeMapper gradeMapper;

    @Autowired
    private TeamMapper teamMapper;

    @Override
    public List<Project> findAll() {
        ProjectExample example = new ProjectExample();
        List<Project> projects = projectMapper.selectByExample(example);
        return projects;
    }



    @Override
    public Map<String, Object> findProjectDetailsById(Integer projectId,Boolean type,Boolean sort) {
        Map<String,Object> map = new HashMap<String, Object>(16);

        Project project = projectMapper.selectByPrimaryKey(projectId);
        map.put("project",project);

        if(type == false)
        {
            //个人比赛，查询运动员
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
                    athlete.setScore(grade.getScore());
                    athlete.setRank(grade.getRank());
                    athleteList.add(athlete);
                }
            }

            //如果数据库已经有排名的，就不需要再排序了

            if(sort){
                //根据getScore升序排序
                athleteList.sort(Comparator.comparing(Athlete::getScore));
            }else {
                //根据getScore降序排序
                athleteList.sort(Comparator.comparing(Athlete::getScore).reversed());
            }
            Grade grade = new Grade();
            GradeExample example = new GradeExample();
            for (int i = 0; i < athleteList.size(); i++) {
                example.clear();
                example.createCriteria().andAthleteIdEqualTo(athleteList.get(i).getId());

                Athlete athlete = athleteList.get(i);
                athlete.setRank(i+1);
                //将排名保存到数据库
                grade.setRank(i+1);
                gradeMapper.updateByExampleSelective(grade,example);

            }

            map.put("athleteList",athleteList);
        }else
        {
            //团体比赛
            //根据项目id去查询Team表
            TeamExample example = new TeamExample();
            example.createCriteria().andProjectIdEqualTo(projectId);
            List<Team> teamList = teamMapper.selectByExample(example);

            if(teamList != null && teamList.size() != 0)
            {

                if(sort){
                    //根据getScore升序排序
                    teamList.sort(Comparator.comparing(Team::getScore));
                }else {
                    //根据getScore降序排序
                    teamList.sort(Comparator.comparing(Team::getScore).reversed());
                }

                for (int i = 0; i < teamList.size(); i++) {
                    teamList.get(i).setRank(i+1);
                    //将排名保存到数据库
                    teamMapper.updateByPrimaryKey(teamList.get(i));
                }

            }

            map.put("teamList",teamList);
        }

        return map;
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

    @Override
    public Integer update(Project project) {
        return projectMapper.updateByPrimaryKeySelective(project);
    }

    @Override
    public Project findById(Integer id) {
        return projectMapper.selectByPrimaryKey(id);
    }


    /**
     * 计算排名
     * @return
     */
    public Object calculateRank(Boolean type,Object o)
    {
        List<Athlete> list = null;
        if(!type)
        {
            list = (List<Athlete>) o;

            //调用Collections.sort()方法;
            Collections.sort(list, new Comparator<Athlete>() {

                @Override
                public int compare(Athlete o1, Athlete o2) {
                    double score1 = o1.getScore();
                    double score2 = o2.getScore();

                    if(score1 < score2)
                    {
                        return 1;
                    }else {
                        return -1;
                    }
                }
            });
        }
        return list;
    }
}

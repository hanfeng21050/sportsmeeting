package cn.hf.sportmeeting.service.impl;

import cn.hf.sportmeeting.dao.*;
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

    @Autowired
    private AthleteTeamMapper athleteTeamMapper;

    @Override
    public List<Project> findAll() {
        ProjectExample example = new ProjectExample();
        example.createCriteria().andActiveEqualTo(true);
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
            gradeExample.createCriteria().andProjectIdEqualTo(projectId).andActiveEqualTo(true);
            List<Grade> gradeList = gradeMapper.selectByExample(gradeExample);

            //通过grade.getAthleteId()去查找运动员
            List<AthleteExt> athleteList = new ArrayList<AthleteExt>();
            if(gradeList != null && gradeList.size() !=0)
            {
                for (Grade grade : gradeList) {
                    Athlete athlete = athleteMapper.selectByPrimaryKey(grade.getAthleteId());
                    AthleteExt athleteExt = new AthleteExt(athlete);
                    athleteExt.setScore(grade.getScore());
                    athleteExt.setRank(grade.getRank());
                    athleteList.add(athleteExt);
                }

                if(sort){
                    //根据getScore升序排序
                    athleteList.sort(Comparator.comparing(AthleteExt::getScore));
                }else {
                    //根据getScore降序排序
                    athleteList.sort(Comparator.comparing(AthleteExt::getScore).reversed());
                }

                Grade grade = new Grade();
                GradeExample example = new GradeExample();
                for (int i = 0; i < athleteList.size(); i++) {
                    example.clear();
                    example.createCriteria().andAthleteIdEqualTo(athleteList.get(i).getId()).andActiveEqualTo(true);

                    AthleteExt athlete = athleteList.get(i);
                    athlete.setRank(i+1);
                    //将排名保存到数据库
                    grade.setRank(i+1);
                    gradeMapper.updateByExampleSelective(grade,example);

                }
            }


            map.put("athleteList",athleteList);
        }else
        {
            //团体比赛
            //根据项目id去查询Team表
            TeamExample example = new TeamExample();
            example.createCriteria().andProjectIdEqualTo(projectId).andActiveEqualTo(true);
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
                Project project = projectMapper.selectByPrimaryKey(id);
                if (project == null) {
                    return;
                }

                if(project.getType() == false)
                {
                    //个人比赛
                    //去grade表中删除相关记录
                    GradeExample gradeExample = new GradeExample();
                    gradeExample.createCriteria().andProjectIdEqualTo(id).andActiveEqualTo(true);
                    gradeMapper.deleteByExample(gradeExample);
                }else
                {
                    //团体比赛
                    TeamExample teamExample = new TeamExample();
                    teamExample.createCriteria().andProjectIdEqualTo(id).andActiveEqualTo(true);

                    List<Team> teamList = teamMapper.selectByExample(teamExample);
                    if(teamList != null && teamList.size() != 0)
                    {
                        for (Team team : teamList) {
                            AthleteTeamExample athleteTeamExample = new AthleteTeamExample();
                            athleteTeamExample.createCriteria().andTeamIdEqualTo(team.getId()).andActiveEqualTo(true);
                            athleteTeamMapper.deleteByExample(athleteTeamExample);
                        }
                    }

                    teamMapper.deleteByExample(teamExample);
                }

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

    @Override
    public Map<String, Object> findMemberById(Integer id, Boolean type) {
        Map<String,Object> map = new HashMap<>(4);

        Project project = projectMapper.selectByPrimaryKey(id);
        map.put("project",project);

        if(type)
        {
            //团体赛
            TeamExample teamExample = new TeamExample();
            teamExample.createCriteria().andProjectIdEqualTo(id).andActiveEqualTo(true);
            List<Team> teamList = teamMapper.selectByExample(teamExample);
            map.put("teamList",teamList);
        }else
        {
            //个人赛
            GradeExample gradeExample = new GradeExample();
            gradeExample.createCriteria().andProjectIdEqualTo(id).andActiveEqualTo(true);
            List<Grade> gradeList = gradeMapper.selectByExample(gradeExample);
            List<Athlete> athleteList = new ArrayList<>();
            if(gradeList != null && gradeList.size() != 0)
            {
                for (Grade grade : gradeList) {
                    Athlete athlete = athleteMapper.selectByPrimaryKey(grade.getAthleteId());
                    athleteList.add(athlete);
                }
            }

            map.put("athleteList",athleteList);
        }

        return map;
    }


    @Override
    public void scoreEntry(List<ScoreExt> exts, Boolean type) {
        if(type)
        {
            //团体赛
            Team team = new Team();
            for (ScoreExt ext : exts) {
                team.setId(ext.getTeamId());
                team.setScore(ext.getScore());
                teamMapper.updateByPrimaryKeySelective(team);
            }
        }else
        {
            //个人赛
            GradeExample gradeExample = new GradeExample();
            Grade grade = new Grade();
            for (ScoreExt ext : exts) {
                gradeExample.clear();
                gradeExample.createCriteria().andProjectIdEqualTo(ext.getProjectId()).andAthleteIdEqualTo(ext.getAthleteId());
                grade.setScore(ext.getScore());
                gradeMapper.updateByExampleSelective(grade,gradeExample);
            }
        }
    }
}

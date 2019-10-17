package cn.hf.sportmeeting.service.impl;

import cn.hf.sportmeeting.dao.AthleteMapper;
import cn.hf.sportmeeting.dao.AthleteTeamMapper;
import cn.hf.sportmeeting.dao.ProjectMapper;
import cn.hf.sportmeeting.dao.TeamMapper;
import cn.hf.sportmeeting.domain.*;
import cn.hf.sportmeeting.service.TeamService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, timeout = 30,rollbackFor = Exception.class)
public class TeamServiceImpl implements TeamService {
    @Autowired
    private TeamMapper teamMapper;
    @Autowired
    private AthleteTeamMapper athleteTeamMapper;
    @Autowired
    private AthleteMapper athleteMapper;
    @Autowired
    private ProjectMapper projectMapper;

    @Override
    public List<TeamExt> findAll() {
        List<TeamExt> teamExts = new ArrayList<>();

        TeamExample teamExample = new TeamExample();
        teamExample.createCriteria().andActiveEqualTo(true);
        List<Team> teamList = teamMapper.selectByExample(teamExample);
        if(teamList != null && teamList.size() != 0)
        {
            for (Team team : teamList) {
                TeamExt ext= new TeamExt();
                ext.setTeam(team);
                ext.setMemberNum(athleteTeamMapper.selectCountByTeamId(team.getId()));
                ext.setProject(projectMapper.selectByPrimaryKey(team.getProjectId()));
                teamExts.add(ext);
            }
        }
        return teamExts;
    }

    @Override
    public Map<String, Object> findDetailsById(Integer id) {
        Map<String,Object> map = new HashMap<>();

        TeamExt ext = new TeamExt();
        //查询team信息
        Team team = teamMapper.selectByPrimaryKey(id);
        //查询成员数量
        int count = athleteTeamMapper.selectCountByTeamId(id);
        //查询参加的比赛
        Project project = projectMapper.selectByPrimaryKey(team.getProjectId());

        ext.setTeam(team);
        ext.setProject(project);
        ext.setMemberNum(count);
        map.put("ext",ext);

        //查询成员
        AthleteTeamExample example = new AthleteTeamExample();
        example.createCriteria().andTeamIdEqualTo(id).andActiveEqualTo(true);
        List<AthleteTeam> athleteTeamList = athleteTeamMapper.selectByExample(example);
        if(athleteTeamList != null && athleteTeamList.size() != 0)
        {
            List<Athlete> athleteList = new ArrayList<>();
            for (AthleteTeam athleteTeam : athleteTeamList) {
                athleteList.add(athleteMapper.selectByPrimaryKey(athleteTeam.getAthleteId()));
            }
            map.put("athleteList",athleteList);
        }

        return map;
    }

    @Override
    public TeamExt findById(Integer id) {
        TeamExt ext = new TeamExt();

        //查询team
        Team team = teamMapper.selectByPrimaryKey(id);

        //查询所有可参加的比赛
        ProjectExample projectExample = new ProjectExample();
        projectExample.createCriteria().andTypeEqualTo(true).andActiveEqualTo(true);
        List<Project> projectList = projectMapper.selectByExample(projectExample);

        //查询所有未加入团队的运动员
        AthleteTeamExample athleteTeamExample = new AthleteTeamExample();
        athleteTeamExample.createCriteria().andTeamIdEqualTo(team.getId()).andActiveEqualTo(true);
        List<AthleteTeam> athleteTeamList = athleteTeamMapper.selectByExample(athleteTeamExample);

        List<Athlete> athleteList = new ArrayList<>();
        AthleteExample athleteExample = new AthleteExample();
        if(athleteTeamList != null && athleteTeamList.size() != 0)
        {
            List<Integer> ids = getIds(athleteTeamList, "getAthleteId");
            athleteExample.createCriteria().andIdNotIn(ids).andActiveEqualTo(true);
            athleteList = athleteMapper.selectByExample(athleteExample);
        }else {
            //如果中间表查询不到数据，说明该队伍没有运动员加入，此时查询所有运动员
            athleteList = athleteMapper.selectByExample(athleteExample);
        }

        ext.setTeam(team);
        ext.setAthleteList(athleteList);
        ext.setProjectList(projectList);

        return ext;

    }

    @Override
    public void update(TeamVO vo) {
        //更新team
        Team team = new Team();
        team.setId(vo.getTeamId());
        team.setName(vo.getTeamName());
        team.setProjectId(vo.getProjectId());
        team.setTeamNum(vo.getTeamNum());
        teamMapper.updateByPrimaryKeySelective(team);

        //更新athlete_team中间表
        if(vo.getAthleteIdList() !=null && vo.getAthleteIdList().size() != 0){
            AthleteTeam athleteTeam = new AthleteTeam();
            athleteTeam.setTeamId(vo.getTeamId());
            for (Integer id : vo.getAthleteIdList()) {
                athleteTeam.setAthleteId(id);
                athleteTeamMapper.insertSelective(athleteTeam);
            }
        }

    }

    @Override
    public void deleteAthleteById(Integer id) {
        AthleteTeamExample athleteTeamExample = new AthleteTeamExample();
        athleteTeamExample.createCriteria().andAthleteIdEqualTo(id).andActiveEqualTo(true);
        athleteTeamMapper.deleteByExample(athleteTeamExample);
    }

    /**
     * 通过反射获取对象中的id
     * @param list
     * @param method
     * @param <T>
     * @return
     */
    public<T> List<Integer> getIds(List<T> list,String method){
        List<Integer> ids = new ArrayList<>();
        for (T t : list) {
            try {
                ids.add((Integer) t.getClass().getMethod(method).invoke(t));
            } catch (IllegalAccessException e) {
                e.printStackTrace();
            } catch (InvocationTargetException e) {
                e.printStackTrace();
            } catch (NoSuchMethodException e) {
                e.printStackTrace();
            }
        }
        return ids;
    }
}

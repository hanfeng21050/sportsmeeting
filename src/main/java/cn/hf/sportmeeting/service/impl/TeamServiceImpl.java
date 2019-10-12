package cn.hf.sportmeeting.service.impl;

import cn.hf.sportmeeting.dao.AthleteTeamMapper;
import cn.hf.sportmeeting.dao.ProjectMapper;
import cn.hf.sportmeeting.dao.TeamMapper;
import cn.hf.sportmeeting.domain.AthleteExample;
import cn.hf.sportmeeting.domain.Team;
import cn.hf.sportmeeting.domain.TeamExample;
import cn.hf.sportmeeting.domain.TeamExt;
import cn.hf.sportmeeting.service.TeamService;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

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
}

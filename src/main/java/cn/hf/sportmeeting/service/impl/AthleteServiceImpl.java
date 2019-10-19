package cn.hf.sportmeeting.service.impl;

import cn.hf.sportmeeting.dao.*;
import cn.hf.sportmeeting.domain.*;
import cn.hf.sportmeeting.service.IAthleteService;
import cn.hf.sportmeeting.utils.Utils;
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

/**
 * @author 韩锋
 */
@Service
@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, timeout = 30,rollbackFor = Exception.class)
public class AthleteServiceImpl implements IAthleteService {
    @Autowired
    private AthleteMapper athleteMapper;
    @Autowired
    private GradeMapper gradeMapper;
    @Autowired
    private ProjectMapper projectMapper;
    @Autowired
    private TeamMapper teamMapper;
    @Autowired
    private AthleteTeamMapper athleteTeamMapper;
    @Autowired
    private NationMapper nationMapper;
    @Autowired
    private UserMapper userMapper;


    @Override
    public List<Athlete> findByPage(Integer page, Integer size) {
        AthleteExample example = new AthleteExample();
        example.createCriteria().andActiveEqualTo(true);

        PageHelper.startPage(page,size);
        return athleteMapper.selectByExample(example);
    }

    @Override
    public Map<String, Object> findDetailsById(Integer id) {
        Map<String, Object> map = new HashMap<>(3);

        //运动员的基本信息
        Athlete athlete = athleteMapper.selectByPrimaryKey(id);
        map.put("athlete",athlete);

        //运动员参加的项目
        GradeExample gradeExample = new GradeExample();
        gradeExample.createCriteria().andAthleteIdEqualTo(id).andActiveEqualTo(true);
        List<Grade> gradeList = gradeMapper.selectByExample(gradeExample);
        List<Project> projectList = new ArrayList<>();
        if(gradeList != null && gradeList.size() != 0)
        {
            for (Grade grade : gradeList) {
                Project project = projectMapper.selectByPrimaryKey(grade.getProjectId());
                projectList.add(project);
            }
        }
        map.put("projectList",projectList);

        //运动员所属团队
        AthleteTeamExample athleteTeamExample = new AthleteTeamExample();
        athleteTeamExample.createCriteria().andAthleteIdEqualTo(id).andActiveEqualTo(true);
        List<AthleteTeam> athleteTeamList = athleteTeamMapper.selectByExample(athleteTeamExample);
        List<Team> teamList = new ArrayList<>();
        if(athleteTeamList != null && athleteTeamList.size() != 0)
        {
            for (AthleteTeam athleteTeam : athleteTeamList) {
                Team team = teamMapper.selectByPrimaryKey(athleteTeam.getTeamId());
                teamList.add(team);
            }
        }
        map.put("teamList",teamList);

        return map;
    }

    @Override
    public void deleteByIds(Integer[] ids) {

        if(ids!= null && ids.length != 0)
        {
            for (Integer id : ids) {
                //1.删除grade表中相关数据
                GradeExample gradeExample = new GradeExample();
                gradeExample.createCriteria().andAthleteIdEqualTo(id).andActiveEqualTo(true);
                gradeMapper.deleteByExample(gradeExample);

                //2.删除athlete_team中相关数据
                AthleteTeamExample athleteTeamExample = new AthleteTeamExample();
                athleteTeamExample.createCriteria().andAthleteIdEqualTo(id).andActiveEqualTo(true);
                athleteTeamMapper.deleteByExample(athleteTeamExample);

                //3.删除运动员
                athleteMapper.deleteByPrimaryKey(id);
            }
        }
    }

    @Override
    public Map<String, Object> getMessage(Integer type, Map<String, String> requestParam) {
        Map<String,Object> map = new HashMap<>(4);
        if(type == 0)
        {
            //获取民族一栏的下拉框
            NationExample nationExample = new NationExample();
            nationExample.createCriteria().andActiveEqualTo(true);
            List<Nation> nationList = nationMapper.selectByExample(nationExample);

            //获取所有未注册运动员的用户
            List<UserInfo> userInfoList = userMapper.selectUserNotInAthlete();

            //返回
            map.put("nationList",nationList);
            map.put("userList",userInfoList);
            return map;

        }else if(type == 1)
        {
            String athleteId = requestParam.get("id");

            //获取民族一栏的下拉框
            NationExample nationExample = new NationExample();
            nationExample.createCriteria().andActiveEqualTo(true);
            List<Nation> nationList = nationMapper.selectByExample(nationExample);

            //获取所有未注册运动员的用户
            List<UserInfo> userInfoList = userMapper.selectUserNotInAthlete();


            //运动员
            Athlete athlete = athleteMapper.selectByPrimaryKey(Integer.valueOf(athleteId));

            //找到和运动员相对应的用户
            UserInfo userInfo = userMapper.selectByPrimaryKey(athlete.getUserId());
            if(userInfo != null)
            {
                userInfoList.add(userInfo);
            }

            //返回
            map.put("nationList",nationList);
            map.put("userList",userInfoList);
            map.put("athlete",athlete);
            return map;
        }
        return null;
    }

    @Override
    public void save(Athlete athlete) {
        athleteMapper.insertSelective(athlete);
    }

    @Override
    public void update(Athlete athlete) {
        athleteMapper.updateByPrimaryKeySelective(athlete);
    }
}

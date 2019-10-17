package cn.hf.sportmeeting.service;

import cn.hf.sportmeeting.domain.Team;
import cn.hf.sportmeeting.domain.TeamExt;
import cn.hf.sportmeeting.domain.TeamVO;

import java.util.List;
import java.util.Map;

/**
 * @author 韩锋
 */
public interface TeamService {
    /**
     * 查询
     * @return
     */
    public List<TeamExt> findAll();


    /**
     * 查询团队详情
     * @param id teamID
     * @return 返回的是包括团队和成员的一个集合
     */
    public Map<String,Object> findDetailsById(Integer id);

    /**
     * 团队详情页，点击修改，返回相对应数据
     * @param id
     * @return
     */
    public TeamExt findById(Integer id);

    /**
     * 更新团队
     * @param vo
     */
    public void update(TeamVO vo);

    /**
     * 删除团队中的运动员
     * @param id
     */
    public void deleteAthleteById(Integer id);
}

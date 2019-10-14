package cn.hf.sportmeeting.service;

import cn.hf.sportmeeting.domain.Team;
import cn.hf.sportmeeting.domain.TeamExt;

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
}

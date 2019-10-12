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
}

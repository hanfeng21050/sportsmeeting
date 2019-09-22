package cn.hf.sportmeeting.service;

import cn.hf.sportmeeting.domain.Role;

import java.util.List;

/**
 * @author 韩锋
 */
public interface IRoleService {

    /**
     * 查询所有的角色信息
     * @return
     */
    public List<Role> findAll();
}

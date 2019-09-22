package cn.hf.sportmeeting.service.impl;

import cn.hf.sportmeeting.dao.RoleMapper;
import cn.hf.sportmeeting.domain.Role;
import cn.hf.sportmeeting.domain.RoleExample;
import cn.hf.sportmeeting.service.IRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author 韩锋
 */

@Service
@Transactional(rollbackFor = Exception.class)
public class RoleServiceImpl implements IRoleService {
    @Autowired
    private RoleMapper roleMapper;

    @Override
    public List<Role> findAll() {
        RoleExample example = new RoleExample();
        example.createCriteria().andActiveEqualTo(true);
        return roleMapper.selectByExample(example);
    }
}

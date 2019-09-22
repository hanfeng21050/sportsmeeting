package cn.hf.sportmeeting.service;

import cn.hf.sportmeeting.domain.UserInfo;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetailsService;

import java.util.List;

/**
 * @author 韩锋
 */
public interface IUserService extends UserDetailsService {

    /**
     * 查询用户
     * @param page 当前页
     * @param size 显示数目
     * @return
     */
    public List<UserInfo> findByPage(Integer page, Integer size);


    /**
     * 删除选中的用户
     * @param ids
     * @return
     */
    public Integer deleteByIds(Integer[] ids);


    /**
     * 新增用户
     * @param user
     * @param roleIds 在中间表保存
     * @return 保存成功
     */
    public void save(UserInfo user,Integer[] roleIds);
}

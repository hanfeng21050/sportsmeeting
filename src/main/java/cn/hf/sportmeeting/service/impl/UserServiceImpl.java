package cn.hf.sportmeeting.service.impl;

import cn.hf.sportmeeting.dao.RoleMapper;
import cn.hf.sportmeeting.dao.UserMapper;
import cn.hf.sportmeeting.dao.UserRoleMapper;
import cn.hf.sportmeeting.domain.*;
import cn.hf.sportmeeting.service.IUserService;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
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
@Service("userService")
@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, timeout = 30,rollbackFor = Exception.class)
public class UserServiceImpl implements IUserService {
    @Autowired
    private UserMapper userMapper;

    @Autowired
    private UserRoleMapper userRoleMapper;

    @Autowired
    private RoleMapper roleMapper;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Override
    public UserDetails loadUserByUsername(String s) throws UsernameNotFoundException {
        UserInfo u = null;
        try {
            UserExample example = new UserExample();
            example.createCriteria().andUsernameEqualTo(s).andActiveEqualTo(true);
            List<UserInfo> userInfos = userMapper.selectByExample(example);
            if(userInfos!= null && userInfos.size()!=0)
            {
                u = userInfos.get(0);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        User user=new User(u.getUsername(),u.getPassword(),u.getActive() == false ? false :true,true,true,true,getAuthority(u.getId()));

        return user;
    }


    public List<SimpleGrantedAuthority> getAuthority(Integer userId)
    {
        List<SimpleGrantedAuthority> list = new ArrayList<SimpleGrantedAuthority>();
        //查询中间表
        UserRoleExample example = new UserRoleExample();
        example.createCriteria().andUserIdEqualTo(userId).andActiveEqualTo(true);
        List<UserRole> userRoles = userRoleMapper.selectByExample(example);

        if(userRoles!= null && userRoles.size() != 0)
        {
            //查询role表
            for (UserRole userRole : userRoles) {
                Role role = roleMapper.selectByPrimaryKey(userRole.getRoleId());
                list.add(new SimpleGrantedAuthority("ROLE_"+role.getName()));
            }
       }

        return list;
    }

    @Override
    public List<UserInfo> findByPage(Integer page, Integer size) {
        UserExample example = new UserExample();
        example.createCriteria().andActiveEqualTo(true);

        PageHelper.startPage(page,size);
        return userMapper.selectByExample(example);
    }

    @Override
    public Integer deleteByIds(Integer[] ids) {
        int count = 0;
        if(ids != null && ids.length!=0)
        {
            for (Integer id : ids) {
            //先删除中间表
                UserRoleExample example = new UserRoleExample();
                example.createCriteria().andUserIdEqualTo(id).andActiveEqualTo(true);
                userRoleMapper.deleteByExample(example);
               // int i = 10/0;
            //删除用户
                count += userMapper.deleteByPrimaryKey(id);
            }
        }
        return count;
    }

    @Override
    public void save(UserInfo user,Integer[] roleIds) {
        //将密码加密
        user.setPassword(passwordEncoder.encode(user.getPassword()));

        //保存用户
        userMapper.insert(user);
        //返回保存成功的主键
        UserRole userRole = new UserRole();

        //在中间表保存
        if(roleIds != null && roleIds .length !=0) {
            userRole.setUserId(user.getId());
            userRole.setActive(true);
            for (Integer roleId : roleIds) {
                userRole.setRoleId(roleId);
                userRoleMapper.insert(userRole);
            }
        }
    }

}

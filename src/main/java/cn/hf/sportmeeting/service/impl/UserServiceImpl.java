package cn.hf.sportmeeting.service.impl;

import cn.hf.sportmeeting.dao.RoleMapper;
import cn.hf.sportmeeting.dao.UserMapper;
import cn.hf.sportmeeting.domain.Role;
import cn.hf.sportmeeting.domain.RoleExample;
import cn.hf.sportmeeting.domain.UserExample;
import cn.hf.sportmeeting.domain.UserInfo;
import cn.hf.sportmeeting.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service("userService")
@Transactional(rollbackFor = Exception.class)
public class UserServiceImpl implements IUserService {
    @Autowired
    private UserMapper userMapper;

    @Autowired
    private RoleMapper roleMapper;

    @Override
    public UserDetails loadUserByUsername(String s) throws UsernameNotFoundException {
        UserInfo u = null;
        try {
            UserExample example = new UserExample();
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
        RoleExample example = new RoleExample();
        example.createCriteria().andUserIdEqualTo(userId);
        List<Role> roles = roleMapper.selectByExample(example);
        if(roles != null && roles.size()!=0)
        {
            for (Role role : roles) {
                list.add( new SimpleGrantedAuthority("ROLE_"+role.getName()));
            }
        }
        return list;
    }
}

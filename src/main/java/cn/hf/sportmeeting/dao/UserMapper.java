package cn.hf.sportmeeting.dao;

import cn.hf.sportmeeting.domain.UserInfo;
import cn.hf.sportmeeting.domain.UserExample;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface UserMapper {
    long countByExample(UserExample example);

    int deleteByExample(UserExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(UserInfo record);

    int insertSelective(UserInfo record);

    List<UserInfo> selectByExample(UserExample example);

    UserInfo selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") UserInfo record, @Param("example") UserExample example);

    int updateByExample(@Param("record") UserInfo record, @Param("example") UserExample example);

    int updateByPrimaryKeySelective(UserInfo record);

    int updateByPrimaryKey(UserInfo record);


    @Select("select * from user where id not in (select user_id from athlete where user_id is not null)")
    List<UserInfo> selectUserNotInAthlete();
}
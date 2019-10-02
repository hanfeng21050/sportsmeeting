package cn.hf.sportmeeting.dao;

import cn.hf.sportmeeting.domain.LendDetails;
import cn.hf.sportmeeting.domain.LendDetailsExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface LendDetailsMapper {
    long countByExample(LendDetailsExample example);

    int deleteByExample(LendDetailsExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(LendDetails record);

    int insertSelective(LendDetails record);

    List<LendDetails> selectByExample(LendDetailsExample example);

    LendDetails selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") LendDetails record, @Param("example") LendDetailsExample example);

    int updateByExample(@Param("record") LendDetails record, @Param("example") LendDetailsExample example);

    int updateByPrimaryKeySelective(LendDetails record);

    int updateByPrimaryKey(LendDetails record);
}
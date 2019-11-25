package cn.hf.sportmeeting.dao;

import cn.hf.sportmeeting.domain.Athlete;
import cn.hf.sportmeeting.domain.AthleteExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * athlete
 */
public interface AthleteMapper {
    long countByExample(AthleteExample example);

    int deleteByExample(AthleteExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Athlete record);

    int insertSelective(Athlete record);

    List<Athlete> selectByExample(AthleteExample example);

    Athlete selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Athlete record, @Param("example") AthleteExample example);

    int updateByExample(@Param("record") Athlete record, @Param("example") AthleteExample example);

    int updateByPrimaryKeySelective(Athlete record);

    int updateByPrimaryKey(Athlete record);
}
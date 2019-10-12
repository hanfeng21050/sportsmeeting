package cn.hf.sportmeeting.dao;

import cn.hf.sportmeeting.domain.AthleteTeam;
import cn.hf.sportmeeting.domain.AthleteTeamExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface AthleteTeamMapper {
    long countByExample(AthleteTeamExample example);

    int deleteByExample(AthleteTeamExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(AthleteTeam record);

    int insertSelective(AthleteTeam record);

    List<AthleteTeam> selectByExample(AthleteTeamExample example);

    AthleteTeam selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") AthleteTeam record, @Param("example") AthleteTeamExample example);

    int updateByExample(@Param("record") AthleteTeam record, @Param("example") AthleteTeamExample example);

    int updateByPrimaryKeySelective(AthleteTeam record);

    int updateByPrimaryKey(AthleteTeam record);

    int selectCountByTeamId(Integer teamId);
}
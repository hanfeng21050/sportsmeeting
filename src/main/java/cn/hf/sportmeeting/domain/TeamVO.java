package cn.hf.sportmeeting.domain;

import cn.hf.sportmeeting.utils.Utils;

import java.security.PrivateKey;
import java.util.ArrayList;
import java.util.List;

/**
 * 该类主要接受前面页面传来的 修改团队信息
 * @author 韩锋
 */
public class TeamVO {
    private Integer teamId;
    private String teamName;
    private String teamNum;
    private String athleteIds;
    private Integer projectId;
    private List<Integer> athleteIdList;

    public void setAthleteIds(String athleteIds) {
        this.athleteIds = athleteIds;
    }

    public List<Integer> getAthleteIdList() {
        if(athleteIds != null)
        {
            athleteIdList = Utils.str2Int(athleteIds);
        }
        return athleteIdList;
    }

    public void setAthleteIdList(List<Integer> athleteIdList) {
        this.athleteIdList = athleteIdList;
    }

    @Override
    public String toString() {
        return "TeamVO{" +
                "teamId=" + teamId +
                ", teamName='" + teamName + '\'' +
                ", teamNum='" + teamNum + '\'' +
                ", athleteIds=" + athleteIds +
                ", projectId=" + projectId +
                '}';
    }

    public Integer getTeamId() {
        return teamId;
    }

    public void setTeamId(Integer teamId) {
        this.teamId = teamId;
    }

    public String getTeamName() {
        return teamName;
    }

    public void setTeamName(String teamName) {
        this.teamName = teamName;
    }

    public String getTeamNum() {
        return teamNum;
    }

    public void setTeamNum(String teamNum) {
        this.teamNum = teamNum;
    }

    public String getAthleteIds() {
        return athleteIds;
    }

    public Integer getProjectId() {
        return projectId;
    }

    public void setProjectId(Integer projectId) {
        this.projectId = projectId;
    }

}

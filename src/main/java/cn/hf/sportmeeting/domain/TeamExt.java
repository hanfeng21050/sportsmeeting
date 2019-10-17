package cn.hf.sportmeeting.domain;

import java.util.List;

/**
 * @author 韩锋
 */
public class TeamExt {

    private Team team;
    private Integer memberNum;
    private Project project;
    private List<Project> projectList;
    private List<Athlete> athleteList;

    public List<Project> getProjectList() {
        return projectList;
    }

    public void setProjectList(List<Project> projectList) {
        this.projectList = projectList;
    }

    public List<Athlete> getAthleteList() {
        return athleteList;
    }

    public void setAthleteList(List<Athlete> athleteList) {
        this.athleteList = athleteList;
    }

    public Team getTeam() {
        return team;
    }

    public void setTeam(Team team) {
        this.team = team;
    }

    public Integer getMemberNum() {
        return memberNum;
    }

    public void setMemberNum(Integer memberNum) {
        this.memberNum = memberNum;
    }

    public Project getProject() {
        return project;
    }

    public void setProject(Project project) {
        this.project = project;
    }
}

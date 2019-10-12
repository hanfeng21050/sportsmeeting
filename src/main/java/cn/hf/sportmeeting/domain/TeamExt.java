package cn.hf.sportmeeting.domain;

/**
 * @author 韩锋
 */
public class TeamExt {

    private Team team;
    private Integer memberNum;
    private Project project;

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

package cn.hf.sportmeeting.domain;

/**
 * 该对象用于保存前台提交的成绩
 */
public class ScoreExt {
    private Integer teamId;
    private Integer projectId;
    private Integer athleteId;
    private double score;

    public ScoreExt() {
    }

    public ScoreExt(Integer teamId, Integer projectId, Integer athleteId, double score) {
        this.teamId = teamId;
        this.projectId = projectId;
        this.athleteId = athleteId;
        this.score = score;
    }

    public Integer getTeamId() {
        return teamId;
    }

    public void setTeamId(Integer teamId) {
        this.teamId = teamId;
    }

    public Integer getProjectId() {
        return projectId;
    }

    public void setProjectId(Integer projectId) {
        this.projectId = projectId;
    }

    public Integer getAthleteId() {
        return athleteId;
    }

    public void setAthleteId(Integer athleteId) {
        this.athleteId = athleteId;
    }

    public double getScore() {
        return score;
    }

    public void setScore(double score) {
        this.score = score;
    }

    @Override
    public String toString() {
        return "ScoreExt{" +
                "teamId=" + teamId +
                ", projectId=" + projectId +
                ", athleteId=" + athleteId +
                ", score=" + score +
                '}';
    }
}

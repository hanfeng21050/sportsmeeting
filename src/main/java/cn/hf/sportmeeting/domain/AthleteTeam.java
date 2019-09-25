package cn.hf.sportmeeting.domain;

import java.io.Serializable;

public class AthleteTeam implements Serializable {
    private Integer id;

    private Integer athleteId;

    private Integer teamId;

    private Boolean active;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getAthleteId() {
        return athleteId;
    }

    public void setAthleteId(Integer athleteId) {
        this.athleteId = athleteId;
    }

    public Integer getTeamId() {
        return teamId;
    }

    public void setTeamId(Integer teamId) {
        this.teamId = teamId;
    }

    public Boolean getActive() {
        return active;
    }

    public void setActive(Boolean active) {
        this.active = active;
    }
}
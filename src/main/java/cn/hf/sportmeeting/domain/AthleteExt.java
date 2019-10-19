package cn.hf.sportmeeting.domain;

/**
 * 扩展athlete
 */
public class AthleteExt extends Athlete {
    private Double score;
    private Integer rank;

    public AthleteExt() {
    }

    public AthleteExt(Athlete athlete) {
        this.setId(athlete.getId());
        this.setName(athlete.getName());
        this.setPlayerNum(athlete.getPlayerNum());
        this.setGender(athlete.getGender());
        this.setAge(athlete.getAge());
        this.setWeight(athlete.getWeight());
        this.setHeight(athlete.getHeight());
        this.setNationId(athlete.getNationId());
        this.setIdNum(athlete.getIdNum());
        this.setMax(athlete.getMax());
        this.setActive(athlete.getActive());
    }

    public Double getScore() {
        return score;
    }

    public void setScore(Double score) {
        this.score = score;
    }

    public Integer getRank() {
        return rank;
    }

    public void setRank(Integer rank) {
        this.rank = rank;
    }
}

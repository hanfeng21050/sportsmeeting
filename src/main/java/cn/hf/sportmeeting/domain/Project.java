package cn.hf.sportmeeting.domain;

import cn.hf.sportmeeting.utils.DateUtil;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class Project {
    private Integer id;

    private String name;

    private String unit;

    private Boolean sort;

    private String sortStr;

    private Boolean gender;

    private String genderStr;

    private String place;

    @DateTimeFormat(pattern = "dd/MM/yyyy")
    private Date date;

    private String dateStr;

    private Double duration;

    private Integer num;

    private Boolean type;

    private String typeStr;

    private String description;

    private Boolean active;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit == null ? null : unit.trim();
    }

    public Boolean getSort() {
        return sort;
    }

    public void setSort(Boolean sort) {
        this.sort = sort;
    }

    public Boolean getGender() {
        return gender;
    }

    public void setGender(Boolean gender) {
        this.gender = gender;
    }

    public String getPlace() {
        return place;
    }

    public void setPlace(String place) {
        this.place = place == null ? null : place.trim();
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Double getDuration() {
        return duration;
    }

    public void setDuration(Double duration) {
        this.duration = duration;
    }

    public Integer getNum() {
        return num;
    }

    public void setNum(Integer num) {
        this.num = num;
    }

    public Boolean getType() {
        return type;
    }

    public void setType(Boolean type) {
        this.type = type;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description == null ? null : description.trim();
    }

    public Boolean getActive() {
        return active;
    }

    public void setActive(Boolean active) {
        this.active = active;
    }

    public String getGenderStr() {
        if(gender != null)
        {
            if(gender == false)
            {
                genderStr = "男";
            }else
            {
                genderStr = "女";
            }
        }

        return genderStr;
    }

    public void setGenderStr(String genderStr) {
        this.genderStr = genderStr;
    }

    public String getDateStr() {
        if(date != null)
        {
            dateStr = DateUtil.date2String(date,"yyyy-MM-dd");
        }

        return dateStr;
    }

    public void setDateStr(String dateStr) {
        this.dateStr = dateStr;
    }

    public String getTypeStr() {
        if(type != null)
        {
            if(type == false)
            {
                typeStr = "个人比赛";
            }else {
                typeStr = "团体比赛";
            }
        }

        return typeStr;
    }

    public void setTypeStr(String typeStr) {
        this.typeStr = typeStr;
    }

    public String getSortStr() {
        if(sort != null)
        {
            if(sort == false)
            {
                sortStr = "正序";
            }else {
                sortStr = "倒序";
            }
        }
        return sortStr;
    }

    public void setSortStr(String sortStr) {
        this.sortStr = sortStr;
    }
}
package cn.hf.sportmeeting.domain;

import cn.hf.sportmeeting.utils.Utils;
import com.alibaba.fastjson.annotation.JSONField;

import java.io.Serializable;
import java.util.Date;

public class Project implements Serializable {
    private Integer id;

    private String name;

    private Boolean unit;
    private String unitStr;

    private Boolean sort;
    private String sortStr;

    private Boolean gender;
    private String genderStr;

    private String place;

    @JSONField(format = "yyyy-MM-dd HH:mm")
    private Date startTime;
    private String startTimeStr;

    @JSONField(format = "yyyy-MM-dd HH:mm")
    private Date endTime;
    private String endTimeStr;

    private Integer num;

    private Boolean type;
    private String typeStr;

    private String description;

    private Boolean active;

    @Override
    public String toString() {
        return "Project{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", unit=" + unit +
                ", unitStr='" + unitStr + '\'' +
                ", sort=" + sort +
                ", sortStr='" + sortStr + '\'' +
                ", gender=" + gender +
                ", genderStr='" + genderStr + '\'' +
                ", place='" + place + '\'' +
                ", startTime=" + startTime +
                ", startTimeStr='" + startTimeStr + '\'' +
                ", endTime=" + endTime +
                ", endTimeStr='" + endTimeStr + '\'' +
                ", num=" + num +
                ", type=" + type +
                ", typeStr='" + typeStr + '\'' +
                ", description='" + description + '\'' +
                ", active=" + active +
                '}';
    }

    public Boolean getUnit() {
        return unit;
    }

    public void setUnit(Boolean unit) {
        this.unit = unit;
    }

    public String getUnitStr() {
        if(unit != null)
        {
            if(unit == true)
            {
                unitStr = "米";
            }else
            {
                unitStr = "秒";
            }
        }
        return unitStr;
    }

    public void setUnitStr(String unitStr) {
        this.unitStr = unitStr;
    }

    public String getSortStr() {
        if(sort != null)
        {
            if(sort == false)
            {
                sortStr = "降序";
            }else {
                sortStr = "升序";
            }
        }
        return sortStr;
    }

    public void setSortStr(String sortStr) {
        this.sortStr = sortStr;
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

    public String getStartTimeStr() {
        if(startTime != null)
        {
            startTimeStr = Utils.date2String(startTime,"yyyy-MM-dd HH:mm");
        }
        return startTimeStr;
    }

    public void setStartTimeStr(String startTimeStr) {
        this.startTimeStr = startTimeStr;
    }

    public String getEndTimeStr() {
        if(endTime != null)
        {
            endTimeStr = Utils.date2String(endTime,"yyyy-MM-dd HH:mm");
        }
        return endTimeStr;
    }

    public void setEndTimeStr(String endTimeStr) {
        this.endTimeStr = endTimeStr;
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

    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
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

}
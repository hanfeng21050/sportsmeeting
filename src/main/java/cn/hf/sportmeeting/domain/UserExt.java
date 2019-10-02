package cn.hf.sportmeeting.domain;

import java.util.ArrayList;
import java.util.List;

/**
 * 修改用户角色时所用到的类，主要用用于接受前端传来的数据
 * @author 韩锋
 */
public class UserExt {
    private String roleIds;
    private Integer userId;
    private List<Integer> roleIdList;
    private boolean gender;
    private String password;
    private String tel;
    private String email;

    @Override
    public String toString() {
        return "UserExt{" +
                "roleIds='" + roleIds + '\'' +
                ", userId=" + userId +
                ", roleIdList=" + roleIdList +
                ", gender=" + gender +
                ", password='" + password + '\'' +
                ", tel='" + tel + '\'' +
                ", email='" + email + '\'' +
                '}';
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public boolean isGender() {
        return gender;
    }

    public void setGender(boolean gender) {
        this.gender = gender;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getRoleIds() {
        return roleIds;
    }

    public void setRoleIds(String roleIds) {
        this.roleIds = roleIds;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public List<Integer> getRoleIdList() {
        if(roleIds != null)
        {
            roleIdList = str2Int(roleIds);
        }

        return roleIdList;
    }

    public void setRoleIdList(List<Integer> roleIdList) {
        this.roleIdList = roleIdList;
    }

    /**
     * "1,2,3" -->  [1,2,3]
     * 将字符串转换成int数组
     * @param str
     * @return
     */
    public List<Integer> str2Int(String str)
    {
        List<Integer> list = new ArrayList<>();
        String[] split = str.split(",");
        for (String s : split) {
            list.add(Integer.parseInt(s));
        }
        return list;
    }
}

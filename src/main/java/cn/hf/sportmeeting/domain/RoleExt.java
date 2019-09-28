package cn.hf.sportmeeting.domain;

import java.util.ArrayList;
import java.util.List;

/**
 * 修改用户角色时所用到的类，主要用用于接受前端传来的数据
 * @author 韩锋
 */
public class RoleExt {
    private String roleIds;
    private Integer userId;
    private List<Integer> roleIdList;

    @Override
    public String toString() {
        return "RoleExt{" +
                "roleIds='" + roleIds + '\'' +
                ", userIds=" + userId +
                ", roleIdList=" + roleIdList +
                '}';
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

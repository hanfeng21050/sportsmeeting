package cn.hf.sportmeeting.service;

import cn.hf.sportmeeting.domain.Athlete;
import cn.hf.sportmeeting.domain.Project;

import java.util.List;
import java.util.Map;

/**
 * @author 韩锋
 */
public interface IProjectService {

    /**
     * 查询所有的比赛项目
     * @return
     */
    public List<Project> findAll();




    /**
     * 通过项目id来查询详情
     * @param projectId
     * @param type
     * @param sort 成绩排序 false 降序   true 升序
     * @return map集合包含项目具体信息、运动员列表、成绩
     */
    public Map<String,Object> findProjectDetailsById(Integer projectId,Boolean type, Boolean sort);


    /**
     * 新建项目
     * @param project
     */
    public Integer save(Project project);

    /**
     * 删除选中，一个或者多个
     * @param ids
     */
    public void deleteByIds(Integer[] ids);

    /**
     * 修改项目
     * @param project
     */
    public Integer update(Project project);

    /**
     * 根据查询项目
     * @param id
     * @return
     */
    public Project findById(Integer id);
}

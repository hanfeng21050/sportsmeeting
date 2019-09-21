package cn.hf.sportmeeting.service;

import cn.hf.sportmeeting.domain.Athlete;
import cn.hf.sportmeeting.domain.Project;

import java.util.List;

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
     * 通过id查询项目
     * @param projectId
     * @return
     */
    public Project findById(Integer projectId);


    /**
     * 通过项目id来查询运动员
     * @param id
     * @return
     */
    public List<Athlete> findAthleteById(Integer id);

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
}

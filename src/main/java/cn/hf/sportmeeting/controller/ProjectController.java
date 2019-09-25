package cn.hf.sportmeeting.controller;

import cn.hf.sportmeeting.annotation.FormToken;
import cn.hf.sportmeeting.domain.Athlete;
import cn.hf.sportmeeting.domain.Project;
import cn.hf.sportmeeting.domain.Team;
import cn.hf.sportmeeting.service.IProjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.security.RolesAllowed;
import java.util.List;
import java.util.Map;

/**
 * @author 韩锋
 */

@RequestMapping("/project")
@RolesAllowed("ADMIN")
@Controller
public class ProjectController {
    @Autowired
    private IProjectService projectService;

    /**
     * 查询所有项目
     * @return
     */
    @FormToken(save = true)//添加session 防止表单重复提交，在进入列表的时候添加session，在保存项目的时候通过识别session就能防止表单重复提交
    @RequestMapping(value = "/findAll")
    public ModelAndView findAll()
    {
        ModelAndView mv = new ModelAndView();
        List<Project> projectList = projectService.findAll();
        mv.addObject("projectList",projectList);
        mv.setViewName("project-list");
        return mv;
    }

    /**
     * 通过id查询项目详情
     * @param projectId id
     * @param type 比赛类型 false 个人   true 团体
     * @param sort 成绩排序 false 降序   true 升序
     * @return
     */
    @RequestMapping("/findDetailsById")
    public ModelAndView findDetailsById(
            @RequestParam(name = "id",required = true) Integer projectId,
            @RequestParam(name = "type",required = true) Boolean type,
            @RequestParam(name = "sort",required = true) Boolean sort)
    {
        ModelAndView mv = new ModelAndView();
        Map<String, Object> map = projectService.findProjectDetailsById(projectId, type,sort);
        Project project = (Project) map.get("project");
        mv.addObject("project",project);
        if(type == false)
        {
            //运动员列表
            List<Athlete> athleteList = (List<Athlete>) map.get("athleteList");
            mv.addObject("athleteList",athleteList);
        }else{
            //团队列表
            List<Team> teamList = (List<Team>) map.get("teamList");
            mv.addObject("teamList",teamList);
        }
        mv.setViewName("project-details");
        return mv;
    }

    /**
     * 新建项目
     *
     * @FormToken(remove = true) 检验表单是否重复提交
     * @param project
     * @return
     */
    @RequestMapping("/save")
    @FormToken(remove = true)
    public String save(Project project) {
        Integer rtn = projectService.save(project);
        if(rtn == 1)
        {
            return "redirect:findAll";
        }
        return null;
    }

    /**
     * 根据ids 来删除项目
     * @param ids
     * @return
     */
    @RequestMapping(value = "/deleteByIds")
    public String deleteByIds(Integer[] ids)
    {
        projectService.deleteByIds(ids);
        return "redirect:findAll";
    }

    /**
     * 去数据库查询相关信息，跳转到修改页面
     * @param id
     * @return
     */
    @RequestMapping(value = "/toUpdate")
    public ModelAndView toUpdate(Integer id)
    {
        ModelAndView mv = new ModelAndView();
        Project project = projectService.findById(id);
        mv.addObject("project",project);
        mv.setViewName("project-update");
        return mv;
    }


    /**
     * 修改项目
     * @param project
     * @return
     */
    @RequestMapping("/update")
    public String update(Project project)
    {
        System.out.println(project);
        Integer rtn = projectService.update(project);
        if(rtn == 1)
        {
            return "redirect:findAll";
        }
        return null;
    }

}


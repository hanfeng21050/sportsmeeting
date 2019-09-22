package cn.hf.sportmeeting.controller;

import cn.hf.sportmeeting.domain.Athlete;
import cn.hf.sportmeeting.domain.Project;
import cn.hf.sportmeeting.service.IProjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.security.RolesAllowed;
import java.util.List;

/**
 * @author 韩锋
 */

@RequestMapping("/project")
@RolesAllowed("ADMIN")
@Controller
public class ProjectController {
    @Autowired
    private IProjectService projectService;

    @ResponseBody
    @RequestMapping(value = "/findAll",produces = "application/json; charset=utf-8")
    public List<Project> findAll()
    {
        List<Project> projectList = projectService.findAll();
        return projectList;
    }

    /**
     * 通过项目id来查询项目详情
     * @param projectId
     * @return
     */
    @RequestMapping("/findDetailsById")
    public ModelAndView findDetailsById(@RequestParam(name = "id",required = true) Integer projectId)
    {
        ModelAndView mv = new ModelAndView();
        Project project = projectService.findById(projectId);

        List<Athlete> athleteList = projectService.findAthleteById(projectId);

        mv.addObject("project",project);
        mv.addObject("athleteList",athleteList);

        mv.setViewName("project-details");
        return mv;
    }

    /**
     * 新建项目
     * @param project
     * @return
     */
    @RequestMapping("/save")
    public String save(Project project) {
        Integer rtn = projectService.save(project);
        if(rtn == 1)
        {
            return "project-list";
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
        return "project-list";
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
            return "project-list";
        }
        return null;
    }

}


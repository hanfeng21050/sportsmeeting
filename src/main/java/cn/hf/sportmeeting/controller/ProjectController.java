package cn.hf.sportmeeting.controller;

import cn.hf.sportmeeting.domain.Project;
import cn.hf.sportmeeting.service.IProjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * @author 韩锋
 */

@RequestMapping("/project")
@Controller
public class ProjectController {
    @Autowired
    private IProjectService projectService;

    @RequestMapping("/findAll.do")
    public ModelAndView findAll()
    {
        ModelAndView mv = new ModelAndView();
        List<Project> projectList = projectService.findAll();
        mv.addObject("projectList",projectList);
        mv.setViewName("project-list");
        return mv;
    }
}

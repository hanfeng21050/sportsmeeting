package cn.hf.sportmeeting.controller;

import cn.hf.sportmeeting.domain.Athlete;
import cn.hf.sportmeeting.domain.Project;
import cn.hf.sportmeeting.service.IProjectService;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.parameters.P;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.jws.WebParam;
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

    @RequestMapping("/findDetailsById.do")
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

    @RequestMapping("/save.do")
    public String save(Project project){
        Integer save = projectService.save(project);
        if(save == 1)
        {
            return "redirect:findAll.do";
        }
        return null;
    }

    @RequestMapping("/deleteByIds.do")
    public String deleteByIds(Integer[] ids)
    {
        projectService.deleteByIds(ids);
        System.out.println(ids.length);
        return "redirect:findAll.do";
    }

}


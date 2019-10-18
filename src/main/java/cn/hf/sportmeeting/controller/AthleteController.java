package cn.hf.sportmeeting.controller;

import cn.hf.sportmeeting.domain.Athlete;
import cn.hf.sportmeeting.domain.Project;
import cn.hf.sportmeeting.domain.Team;
import cn.hf.sportmeeting.service.IAthleteService;
import com.github.pagehelper.PageInfo;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Map;

/**
 * @author 韩锋
 */
@Controller
@RequestMapping("/athlete")
public class AthleteController {
    @Autowired
    private IAthleteService athleteService;


    @RequestMapping("/findByPage")
    public ModelAndView findByPage(@RequestParam(name = "page",required = true,defaultValue = "1") Integer page, @RequestParam(name = "size",required = true,defaultValue = "15")Integer size)
    {
        ModelAndView mv = new ModelAndView();

        List<Athlete> athleteList = athleteService.findByPage(page, size);

        //使用pageHelper
        PageInfo pageInfo = new PageInfo(athleteList);
        mv.addObject("pageInfo",pageInfo);
        mv.setViewName("athlete-list");

        return mv;
    }

    /**
     * 通过id查询项目详情
     * @param id
     * @return
     */
    @RequestMapping("/findDetailsById")
    public ModelAndView findDetailsById(Integer id)
    {
        ModelAndView mv = new ModelAndView();
        Map<String, Object> map = athleteService.findDetailsById(id);
        Athlete athlete = (Athlete) map.get("athlete");
        List<Project> projectList = (List<Project>) map.get("projectList");
        List<Team> teamList = (List<Team>) map.get("teamList");

        mv.addObject("athlete",athlete);
        mv.addObject("projectList",projectList);
        mv.addObject("teamList", teamList);

        mv.setViewName("athlete-details");

        return mv;
    }

    @RequestMapping("/deleteByIds")
    public String deleteByIds(Integer[] ids)
    {
        athleteService.deleteByIds(ids);
        return "redirect:findByPage";
    }

}

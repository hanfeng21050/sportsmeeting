package cn.hf.sportmeeting.controller;

import cn.hf.sportmeeting.domain.Team;
import cn.hf.sportmeeting.domain.TeamExt;
import cn.hf.sportmeeting.service.TeamService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Map;

/**
 * @author 韩锋
 */
@Controller
@RequestMapping("/team")
public class TeamController {
    @Autowired
    private TeamService teamService;

    @RequestMapping(value = "/findAll")
    public ModelAndView findAll(){
        ModelAndView mv = new ModelAndView();

        List<TeamExt> teamExts = teamService.findAll();

        mv.addObject("teamExts",teamExts);
        mv.setViewName("team-list");
        return mv;
    }
    @RequestMapping("/findDetailsById")
    public ModelAndView findDetailsById(Integer id)
    {
        ModelAndView mv = new ModelAndView();
        Map<String, Object> map = teamService.findDetailsById(id);

        mv.addObject("ext",map.get("ext"));
        mv.addObject("athleteList",map.get("athleteList"));
        mv.setViewName("team-details");
        return mv;
    }
}

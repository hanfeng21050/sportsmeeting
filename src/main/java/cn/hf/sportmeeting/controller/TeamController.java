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
}

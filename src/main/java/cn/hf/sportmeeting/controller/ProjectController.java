package cn.hf.sportmeeting.controller;

import cn.hf.sportmeeting.annotation.FormToken;
import cn.hf.sportmeeting.domain.Athlete;
import cn.hf.sportmeeting.domain.Project;
import cn.hf.sportmeeting.domain.ScoreExt;
import cn.hf.sportmeeting.domain.Team;
import cn.hf.sportmeeting.service.IProjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.security.RolesAllowed;
import java.util.ArrayList;
import java.util.HashMap;
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
     * 给比赛添加团队或者运动员
     * @param map
     * projectId:比赛id
     * type：比赛类型
     * memberId:添加的运动员或者团队id
     * @return
     */
    @RequestMapping(value = "/addMember",method = RequestMethod.POST,produces = "application/json; charset=utf-8")
    @ResponseBody
    public String addMember(@RequestBody Map<String,Object> map)
    {
        String idStr = (String) map.get("id");
        Integer projectId = Integer.valueOf(idStr);
        String typeStr = (String) map.get("type");
        Boolean type = null;
        if("true".equals(typeStr))
        {
            type = true;
        }else
        {
            type = false;
        }
        String memberIdStr = (String) map.get("member");
        Integer memberId = Integer.valueOf(memberIdStr);

        projectService.addMember(projectId,type,memberId);
        return "200";
    }


    /**
     * 获取非当前比赛下的运动员或者团队
     * @param map
     * @return
     */
    @RequestMapping(value = "/findAthlete",method = RequestMethod.POST,produces = "application/json; charset=utf-8")
    @ResponseBody
    public Map<String,Object> findAthlete(@RequestBody Map<String,Object> map)
    {
        String idStr = (String) map.get("id");
        Integer id = Integer.valueOf(idStr);
        String typeStr = (String) map.get("type");

        Boolean type = null;
        if("true".equals(typeStr))
        {
            type = true;
        }else
        {
            type = false;
        }
        Map<String,Object> res = new HashMap<>(4);
        if(type)
        {
            List<Team> teamList = (List<Team>) projectService.findAthlete(id,type);
            res.put("teamList",teamList);
        }else
        {
            List<Athlete> athleteList = (List<Athlete>) projectService.findAthlete(id,type);
            res.put("athleteList",athleteList);
        }
        return res;
    }

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
     * 根据id查询项目
    * @param id
     * @return
     */
    @RequestMapping(value = "/findProjectById",method = RequestMethod.GET,produces = "application/json; charset=utf-8")
    @ResponseBody
    public Project findProjectById(@RequestParam(name = "id") Integer id){
        return projectService.findById(id);
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
    //@FormToken(remove = true)
    @RequestMapping(value = "/save",method = RequestMethod.POST,produces="application/json;charset=UTF-8")
    @ResponseBody
    public String save(@RequestBody Project project) {
        try {
            System.out.println(project);
            projectService.save(project);
        }catch (Exception e){
            return "新增失败";
        }
        return "200";
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
     * 修改项目
     * @param project
     * @return
     */
    @RequestMapping(value = "/update" ,method = RequestMethod.POST,produces="application/json;charset=UTF-8")
    @ResponseBody
    public String update(@RequestBody Project project)
    {
        System.out.println(project);
        try {
            projectService.update(project);
        }catch (Exception e){
            return "修改失败";
        }
        return "200";
    }

    /**
     * 通过项目id查找该比赛的成员，运动员或者团队
     * @param id
     * @param type 比赛的类型  个人  团队
     * @return
     */
    @RequestMapping("/findMemberById")
    public ModelAndView findMemberById(Integer id,Boolean type)
    {
        ModelAndView mv = new ModelAndView();
        Map<String,Object> map = projectService.findMemberById(id,type);
        Project project = (Project) map.get("project");
        if(type)
        {
            //团体项目
            List<Team> teamList = (List<Team>) map.get("teamList");
            mv.addObject("teamList",teamList);
        }else
        {
            //个人项目
            List<Athlete> athleteList = (List<Athlete>) map.get("athleteList");
            mv.addObject("athlete",athleteList);
        }

        mv.addObject("project",project);
        mv.addObject("type",type);
        mv.setViewName("score-entry");
        return mv;
    }

    @RequestMapping("/scoreEntry")
    public String scoreEntry(@RequestParam("type")Boolean type,
                             @RequestParam("sort")Boolean sort,
                             @RequestParam("projectId")Integer projectId,
                             @RequestParam("teamId") Integer[] teamIds,
                             @RequestParam("athleteId") Integer[] athleteIds,
                             @RequestParam("score") Double[] scores
        ){

        List<ScoreExt> exts = new ArrayList<>();
        if(type)
        {
            for (int i = 0; i < teamIds.length; i++) {
                ScoreExt ext = new ScoreExt();
                ext.setTeamId(teamIds[i]);
                ext.setScore(scores[i]);
                exts.add(ext);
            }
        }else
        {
            for (int i = 0; i < athleteIds.length; i++) {
                ScoreExt ext = new ScoreExt();
                ext.setAthleteId(athleteIds[i]);
                ext.setProjectId(projectId);
                ext.setScore(scores[i]);
                exts.add(ext);
            }
        }

        /**
         * 返回值为录入成绩的比赛项目的排序,
         * 目的是能够使页面返回到详情页，需要三个参数 id sort type
         */
        projectService.scoreEntry(exts,type);
        return "redirect:findDetailsById?id="+projectId+"&type="+type+"&sort="+sort;
    }

}


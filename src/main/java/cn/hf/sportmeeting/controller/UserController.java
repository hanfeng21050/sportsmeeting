package cn.hf.sportmeeting.controller;

import cn.hf.sportmeeting.domain.Athlete;
import cn.hf.sportmeeting.domain.Role;
import cn.hf.sportmeeting.domain.RoleExt;
import cn.hf.sportmeeting.domain.UserInfo;
import cn.hf.sportmeeting.service.IUserService;
import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.ListResourceBundle;
import java.util.Map;

/**
 * @author 韩锋
 */
@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private IUserService userService;

    /**
     * 分页查询
     * @param page
     * @param size
     * @return
     */
    @RequestMapping("/findByPage")
    public ModelAndView findByPage(@RequestParam(name = "page",required = true,defaultValue = "1") Integer page,@RequestParam(name = "size",required = true,defaultValue = "15")Integer size)
    {
        ModelAndView mv = new ModelAndView();
        List<UserInfo> userInfos = userService.findByPage(page, size);

        //使用pageHelper
        PageInfo pageInfo = new PageInfo(userInfos);

        mv.addObject("pageInfo",pageInfo);
        mv.setViewName("user-list");

        return mv;
    }

    @RequestMapping("/deleteByIds")
    public String deleteByIds(Integer[] ids){
        int rtn = userService.deleteByIds(ids);
        return "redirect:findByPage";
    }

    /**
     *  保存用户
     * @param roleIds 用户的角色信息
     * @param user 用户
     * @return
     */
    @RequestMapping("/save")
    public String save(@RequestParam(name="roleIds",required = true) Integer[] roleIds,UserInfo user){
        //保存用户
        user.setActive(true);
        userService.save(user,roleIds);

        return "redirect:findByPage";
    }

    @RequestMapping("/findDetailById")
    public ModelAndView findDetailById(Integer id)
    {
        ModelAndView mv = new ModelAndView();
        Map<String,Object> map = userService.findDetailsById(id);
        UserInfo userInfo = (UserInfo) map.get("userInfo");
        List<Role> roleList = (List<Role>) map.get("roleList");
        Athlete athlete = (Athlete) map.get("athlete");

        mv.addObject("userInfo", userInfo);
        mv.addObject("roleList", roleList);
        mv.addObject("athlete", athlete);

        mv.setViewName("user-details");
        return mv;
    }

    @RequestMapping(value="/updateRole",method = RequestMethod.POST,produces="application/json;charset=UTF-8")
    @ResponseBody
    public String updateRole(@RequestBody RoleExt roleExt){
        try {
            userService.updateRole(roleExt);
        }catch (Exception e)
        {
            return "修改失败";
        }
        return "200";
    }
}

package cn.hf.sportmeeting.controller;

import cn.hf.sportmeeting.domain.UserInfo;
import cn.hf.sportmeeting.service.IUserService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
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

        mv.setViewName("user-details");
        return mv;
    }
}

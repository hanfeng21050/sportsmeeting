package cn.hf.sportmeeting.controller;

import cn.hf.sportmeeting.domain.Role;
import cn.hf.sportmeeting.service.IRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @author 韩锋
 */
@Controller
@RequestMapping("/role")
public class RoleController {
    @Autowired
    private IRoleService roleService;

    @RequestMapping(value = "/findAll",produces = "application/json; charset=utf-8")
    @ResponseBody
    public List<Role> findAll()
    {
        return roleService.findAll();
    }
}

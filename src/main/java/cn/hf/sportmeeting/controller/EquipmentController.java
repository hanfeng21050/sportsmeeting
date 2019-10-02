package cn.hf.sportmeeting.controller;

import cn.hf.sportmeeting.domain.Equipment;
import cn.hf.sportmeeting.service.IEquipmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * @author 韩锋
 */
@Controller
@RequestMapping("/equipment")
public class EquipmentController {
    @Autowired
    private IEquipmentService equipmentService;

    @RequestMapping("/findAll")
    public ModelAndView findAll(){
        ModelAndView mv = new ModelAndView();
        List<Equipment> equipmentList = equipmentService.findAll();

        mv.addObject("equipmentList",equipmentList);
        mv.setViewName("equipment-list");
        return mv;
    }

    /**
     * 根据ids 来删除项目
     * @param ids
     * @return
     */
    @RequestMapping(value = "/deleteByIds")
    public String deleteByIds(Integer[] ids)
    {
        equipmentService.deleteByIds(ids);
        return "redirect:findAll";
    }

    @RequestMapping(value="/save",method = RequestMethod.POST,produces="application/json;charset=UTF-8")
    @ResponseBody
    public String save(@RequestBody Equipment equipment){
        try {
            equipmentService.save(equipment);
        }catch (Exception e){
            return "添加失败";
        }
        return "200";
    }
}

package cn.hf.sportmeeting.controller;

import cn.hf.sportmeeting.domain.Equipment;
import cn.hf.sportmeeting.domain.LendDetails;
import cn.hf.sportmeeting.service.IEquipmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Map;

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

    /**
     * 根据id查询器材
     * @param id
     * @return
     */
    @RequestMapping(value = "/findById",method = RequestMethod.GET,produces = "application/json; charset=utf-8")
    @ResponseBody
    public Equipment findById(@RequestParam(name = "id",required = true) Integer id){
        return equipmentService.findById(id);
    }

    /**
     * 更新
     * @param equipment
     * @return
     */
    @RequestMapping(value = "/update",method = RequestMethod.POST,produces = "application/json; charset=utf-8")
    @ResponseBody
    public String update(@RequestBody Equipment equipment){
        //System.out.println(equipment);
        try {
            equipmentService.update(equipment);
        }catch (Exception e)
        {
            return "执行失败";
        }
        return "200";
    }


    /**
     * 查询详情
     * @param id
     * @return
     */
    @RequestMapping("/findDetailsById")
    public ModelAndView findDetailsById(Integer id){
        ModelAndView mv = new ModelAndView();
        Map<String, Object> map = equipmentService.findDetailsById(id);
        Equipment equipment = (Equipment) map.get("equipment");
        List<LendDetails> lendList = (List<LendDetails>) map.get("lendList");
        List<LendDetails> rtnList = (List<LendDetails>) map.get("returnList");

        mv.addObject("equipment",equipment);
        mv.addObject("lendList",lendList);
        mv.addObject( "rtnList",rtnList);
        mv.setViewName("equipment-details");
        return mv;
    }


}

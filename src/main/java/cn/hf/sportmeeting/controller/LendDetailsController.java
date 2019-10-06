package cn.hf.sportmeeting.controller;

import cn.hf.sportmeeting.domain.LendDetails;
import cn.hf.sportmeeting.service.ILendDetailsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


/**
 * @author 韩锋
 */
@Controller
@RequestMapping("/lendDetails")
public class LendDetailsController {
   @Autowired
   private ILendDetailsService lendDetailsService;

    @RequestMapping(value="/save",method = RequestMethod.POST,produces="application/json;charset=UTF-8")
    @ResponseBody
    public String save(@RequestBody LendDetails lendDetails){
        try {
            lendDetailsService.save(lendDetails);
        }catch (Exception e){
            return "添加失败";
        }
        return "200";
    }

    /**
     * 根据ids 来删除项目
     * @param ids
     * @return
     */
    @RequestMapping(value = "/deleteByIds")
    @ResponseBody
    public String deleteByIds(Integer[] ids)
    {
        try {
            lendDetailsService.deleteByIds(ids);
        }catch (Exception e){
            return "删除失败";
        }
        return "200";
    }

    /**
     * 归还器材
     * @param
     * @return
     */
    @ResponseBody
    @RequestMapping(value="/rtnEquipment",method = RequestMethod.POST,produces="application/json;charset=UTF-8")
    public String rtnEquipment(@RequestBody LendDetails lendDetails){
        try{
            System.out.println(lendDetails);
           lendDetailsService.rtnEquipment(lendDetails);
        }catch (Exception e)
        {
            return "归还失败！";
        }
        return "200";
    }
}

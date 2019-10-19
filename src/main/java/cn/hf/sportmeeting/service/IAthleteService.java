package cn.hf.sportmeeting.service;

import cn.hf.sportmeeting.domain.Athlete;
import java.util.List;
import java.util.Map;

/**
 * @author 韩锋
 */
public interface IAthleteService {

    /**
     * 查询用户
     * @param page 当前页
     * @param size 显示数目
     * @return
     */
    public List<Athlete> findByPage(Integer page, Integer size);


    /**
     * 根据id查询运动员的详细信息
     * @param id
     * @return
     */
    public Map<String,Object> findDetailsById(Integer id);

    /**
     * 删除运动员
     * @param ids
     */
    public void deleteByIds(Integer[] ids);

    /**
     * 获取输入框 、下拉框信息
     * @param type
     * @param requestParam
     * @return
     */
    public Map<String,Object> getMessage(Integer type, Map<String, String> requestParam);

    /**
     * 保存
     * @param athlete
     */
    public void save(Athlete athlete);
}

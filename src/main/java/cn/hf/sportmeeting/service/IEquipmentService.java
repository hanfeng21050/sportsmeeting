package cn.hf.sportmeeting.service;

import cn.hf.sportmeeting.domain.Equipment;
import cn.hf.sportmeeting.domain.LendDetails;

import java.util.List;
import java.util.Map;

/**
 * @author 韩锋
 */
public interface IEquipmentService {

    /**
     * 查询所有器材
     * @return
     */
    public List<Equipment> findAll();

    /**
     * 删除选定器材
     * @param ids
     */
    public void deleteByIds(Integer[] ids);

    /**
     * 新建
     * @param equipment
     */
    public void save(Equipment equipment);

    /**
     * 根据id查询项目
     * @param id
     * @return
     */
    public Equipment findById(Integer id);

    /**
     * 修改
     * @param equipment
     */
    public void update(Equipment equipment);

    /**
     * 查询器材详细，已借、已还
     * @param id
     * @return
     */
    public Map<String,Object> findDetailsById(Integer id);



}

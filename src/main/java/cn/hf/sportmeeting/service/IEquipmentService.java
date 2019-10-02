package cn.hf.sportmeeting.service;

import cn.hf.sportmeeting.domain.Equipment;

import java.util.List;

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
}

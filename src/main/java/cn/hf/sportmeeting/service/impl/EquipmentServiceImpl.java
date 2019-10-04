package cn.hf.sportmeeting.service.impl;

import cn.hf.sportmeeting.dao.EquipmentMapper;
import cn.hf.sportmeeting.dao.LendDetailsMapper;
import cn.hf.sportmeeting.domain.Equipment;
import cn.hf.sportmeeting.domain.EquipmentExample;
import cn.hf.sportmeeting.domain.LendDetails;
import cn.hf.sportmeeting.domain.LendDetailsExample;
import cn.hf.sportmeeting.service.IEquipmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author 韩锋
 */
@Service
@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, timeout = 30,rollbackFor = Exception.class)
public class EquipmentServiceImpl implements IEquipmentService {
    @Autowired
    private EquipmentMapper equipmentMapper;
    @Autowired
    private LendDetailsMapper lendDetailsMapper;

    @Override
    public List<Equipment> findAll() {
        EquipmentExample equipmentExample = new EquipmentExample();
        equipmentExample.createCriteria().andActiveEqualTo(true);

        return equipmentMapper.selectByExample(equipmentExample);
    }

    @Override
    public void deleteByIds(Integer[] ids) {

        if(ids != null && ids.length != 0)
        {
            for (Integer id : ids) {
                //删除lend_details相关数据
                LendDetailsExample lendDetailsExample = new LendDetailsExample();
                lendDetailsExample.createCriteria().andEquipmentIdEqualTo(id);
                lendDetailsMapper.deleteByExample(lendDetailsExample);
                //删除equipment表中的数据
                equipmentMapper.deleteByPrimaryKey(id);
            }
        }
    }

    @Override
    public void save(Equipment equipment) {
        equipmentMapper.insertSelective(equipment);
    }

    @Override
    public Equipment findById(Integer id) {
        return equipmentMapper.selectByPrimaryKey(id);
    }

    @Override
    public void update(Equipment equipment) {
        equipmentMapper.updateByPrimaryKeySelective(equipment);
    }

    @Override
    public Map<String, Object> findDetailsById(Integer id) {
        Map<String,Object> map = new HashMap<>();

        //1.查询详细
        Equipment equipment = equipmentMapper.selectByPrimaryKey(id);
        map.put("equipment", equipment);

        //2.查询已借
        LendDetailsExample example = new LendDetailsExample();
        example.createCriteria().andEquipmentIdEqualTo(id).andIsReturnEqualTo(false).andActiveEqualTo(true);
        List<LendDetails> lendList = lendDetailsMapper.selectByExample(example);
        map.put("lendList",lendList);

        //3.查询已还
        example.clear();
        example.createCriteria().andEquipmentIdEqualTo(id).andIsReturnEqualTo(true).andActiveEqualTo(true);
        List<LendDetails> returnList = lendDetailsMapper.selectByExample(example);
        map.put("returnList",returnList);

        return map;
    }
}

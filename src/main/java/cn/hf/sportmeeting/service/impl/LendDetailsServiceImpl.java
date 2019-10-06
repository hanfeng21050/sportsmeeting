package cn.hf.sportmeeting.service.impl;

import cn.hf.sportmeeting.dao.EquipmentMapper;
import cn.hf.sportmeeting.dao.LendDetailsMapper;
import cn.hf.sportmeeting.domain.Equipment;
import cn.hf.sportmeeting.domain.LendDetails;
import cn.hf.sportmeeting.service.ILendDetailsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;

/**
 * @author 韩锋
 */
@Service
@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED, timeout = 30,rollbackFor = Exception.class)
public class LendDetailsServiceImpl implements ILendDetailsService {
    @Autowired
    LendDetailsMapper lendDetailsMapper;
    @Autowired
    private EquipmentMapper equipmentMapper;

    @Override
    public void save(LendDetails lendDetails) {
        //从总数量中减去借的数量
        Equipment equipment = equipmentMapper.selectByPrimaryKey(lendDetails.getEquipmentId());
        if(equipment.getNum() >= lendDetails.getBorrowNum()){
            equipment.setNum(equipment.getNum() - lendDetails.getBorrowNum());
            equipmentMapper.updateByPrimaryKey(equipment);
        }

        lendDetails.setBorrowTime(new Date());
        lendDetailsMapper.insertSelective(lendDetails);
    }

    @Override
    public void deleteByIds(Integer[] ids) {
        for (Integer id : ids) {
            lendDetailsMapper.deleteByPrimaryKey(id);
        }
    }

    @Override
    public void rtnEquipment(LendDetails lendDetails) {
        //可借数量 = 可借数量+归还数量
        Equipment equipment = equipmentMapper.selectByPrimaryKey(lendDetails.getEquipmentId());
        equipment.setNum(equipment.getNum() + lendDetails.getBorrowNum());
        equipmentMapper.updateByPrimaryKey(equipment);

        //将记录变成已归还
        lendDetails.setReturnTime(new Date());
        lendDetails.setIsReturn(true);

        lendDetailsMapper.updateByPrimaryKeySelective(lendDetails);
    }
}

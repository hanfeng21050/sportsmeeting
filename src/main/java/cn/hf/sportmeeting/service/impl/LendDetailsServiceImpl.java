package cn.hf.sportmeeting.service.impl;

import cn.hf.sportmeeting.dao.LendDetailsMapper;
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

    @Override
    public void save(LendDetails lendDetails) {
        lendDetails.setBorrowTime(new Date());
        lendDetailsMapper.insertSelective(lendDetails);
    }

    @Override
    public void deleteByIds(Integer[] ids) {
        for (Integer id : ids) {
            lendDetailsMapper.deleteByPrimaryKey(id);
        }
    }
}

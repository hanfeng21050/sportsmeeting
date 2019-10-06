package cn.hf.sportmeeting.service;

import cn.hf.sportmeeting.domain.LendDetails;

/**
 * @author 韩锋
 */
public interface ILendDetailsService {

    /**
     * 器材的借出
     * @param lendDetails
     */
    public void save(LendDetails lendDetails);

    /**
     * 删除
     * @param ids
     */
    public void deleteByIds(Integer[] ids);


    /**
     * 归还
     * @param lendDetails
     */
    public void rtnEquipment(LendDetails lendDetails);
}

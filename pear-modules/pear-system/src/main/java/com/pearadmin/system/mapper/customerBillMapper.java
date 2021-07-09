package com.pearadmin.system.mapper;

import org.apache.ibatis.annotations.Mapper;
import java.util.List;
import com.pearadmin.system.domain.customerBill;

/**
 * 顾客买单Mapper接口
 * 
 * @author wzh
 * @date 2021-07-06
 */
@Mapper
public interface customerBillMapper 
{
    /**
     * 查询顾客买单
     * 
     * @param orderId 订单ID
     * @return 顾客买单
     */
    List<customerBill> selectcustomerBillById(Long orderId);

    /**
     * 查询顾客买单
     *
     * @param orderId 订单ID
     * @return 顾客买单
     */
    Double countPriceById(Long orderId);

    /**
     * 查询顾客买单列表
     * 
     * @param customerBill 顾客买单
     * @return 顾客买单集合
     */
    List<customerBill> selectcustomerBillList(customerBill customerBill);

    /**
     * 新增顾客买单
     * 
     * @param customerBill 顾客买单
     * @return 结果
     */
    int insertcustomerBill(customerBill customerBill);

    /**
     * 修改顾客买单
     * 
     * @param customerBill 顾客买单
     * @return 结果
     */
    int updatecustomerBill(customerBill customerBill);

    /**
     * 删除顾客买单
     * 
     * @param orderId 顾客买单ID
     * @return 结果
     */
    int deletecustomerBillById(Long orderId);

    /**
     * 批量删除顾客买单
     * 
     * @param orderIds 需要删除的数据ID
     * @return 结果
     */
    int deletecustomerBillByIds(String[] orderIds);

}

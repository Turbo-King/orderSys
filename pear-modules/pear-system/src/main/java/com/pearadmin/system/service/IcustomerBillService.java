package com.pearadmin.system.service;

import java.util.List;
import com.github.pagehelper.PageInfo;
import com.pearadmin.common.web.domain.request.PageDomain;
import com.pearadmin.system.domain.customerBill;

/**
 * 顾客买单Service接口
 * 
 * @author wzh
 * @date 2021-07-06
 */
public interface IcustomerBillService 
{
    /**
     * 查询顾客买单
     * 
     * @param orderId 顾客买单ID
     * @return 顾客买单
     */
    List<customerBill> selectcustomerBillById(Long orderId);

    /**
     * 查询订单总价
     *
     * @param orderId 顾客买单ID
     * @return 顾客买单
     */
    Double countPriceById(Long orderId);


    /**
    * 查询顾客买单
     * @param ${classsName} 顾客买单
     * @param pageDomain
     * @return 顾客买单 分页集合
     * */
    PageInfo<customerBill> selectcustomerBillPage(customerBill customerBill, PageDomain pageDomain);

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
     * 批量删除顾客买单
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    int deletecustomerBillByIds(String[] ids);

    /**
     * 删除顾客买单信息
     * 
     * @param orderId 顾客买单ID
     * @return 结果
     */
    int deletecustomerBillById(Long orderId);

}

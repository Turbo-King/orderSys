package com.pearadmin.system.service;

import java.util.List;

import com.github.pagehelper.PageInfo;
import com.pearadmin.common.web.domain.request.PageDomain;
import com.pearadmin.system.domain.CustomerBill;

/**
 * 顾客买单Service接口
 *
 * @author wzh
 * @date 2021-07-06
 */
public interface ICustomerBillService {
    /**
     * 查询顾客买单
     *
     * @param orderId 顾客买单ID
     * @return 顾客买单
     */
    List<CustomerBill> selectcustomerBillById(Long orderId);

    /**
     * 查询顾客订单
     *
     * @param orderId 顾客买单ID
     * @return 顾客订单
     */
    CustomerBill selectOrderById(Long orderId);

    /**
     * 查询订单总价
     *
     * @param orderId 顾客买单ID
     * @return 顾客买单
     */
    Double countPriceById(Long orderId);


    /**
     * 查询顾客买单
     *
     * @param ${classsName} 顾客买单
     * @param pageDomain
     * @return 顾客买单 分页集合
     */
    PageInfo<CustomerBill> selectcustomerBillPage(CustomerBill customerBill, PageDomain pageDomain);

    /**
     * 查询顾客买单列表
     *
     * @param customerBill 顾客买单
     * @return 顾客买单集合
     */
    List<CustomerBill> selectcustomerBillList(CustomerBill customerBill);

    /**
     * 新增顾客买单
     *
     * @param customerBill 顾客买单
     * @return 结果
     */
    int insertcustomerBill(CustomerBill customerBill);

    /**
     * 修改顾客买单
     *
     * @param customerBill 顾客买单
     * @return 结果
     */
    int updatecustomerBill(CustomerBill customerBill);

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

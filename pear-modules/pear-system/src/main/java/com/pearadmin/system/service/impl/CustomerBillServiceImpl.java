package com.pearadmin.system.service.impl;

import java.util.List;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.pearadmin.common.web.domain.request.PageDomain;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.pearadmin.system.mapper.CustomerBillMapper;
import com.pearadmin.system.domain.CustomerBill;
import com.pearadmin.system.service.ICustomerBillService;

/**
 * 顾客买单Service业务层处理
 *
 * @author wzh
 * @date 2021-07-06
 */
@Service
public class CustomerBillServiceImpl implements ICustomerBillService {
    @Autowired
    private CustomerBillMapper customerBillMapper;

    /**
     * 查询顾客买单
     *
     * @param orderId 订单ID
     * @return 顾客买单
     */
    @Override
    public List<CustomerBill> selectcustomerBillById(Long orderId) {
        return customerBillMapper.selectcustomerBillById(orderId);
    }

    /**
     * 查询顾客订单
     *
     * @param orderId 订单ID
     * @return 顾客买单
     */
    @Override
    public CustomerBill selectOrderById(Long orderId) {
        return customerBillMapper.selectOrderById(orderId);
    }

    /**
     * 查询订单总价
     *
     * @param orderId 订单ID
     * @return 顾客买单
     */
    @Override
    public Double countPriceById(Long orderId) {
        return customerBillMapper.countPriceById(orderId);
    }

    /**
     * 查询顾客买单列表
     *
     * @param customerBill 顾客买单
     * @return 顾客买单
     */
    @Override
    public List<CustomerBill> selectcustomerBillList(CustomerBill customerBill) {
        return customerBillMapper.selectcustomerBillList(customerBill);
    }

    /**
     * 查询顾客买单
     *
     * @param customerBill 顾客买单
     * @param pageDomain
     * @return 顾客买单 分页集合
     */
    @Override
    public PageInfo<CustomerBill> selectcustomerBillPage(CustomerBill customerBill, PageDomain pageDomain) {
        PageHelper.startPage(pageDomain.getPage(), pageDomain.getLimit());
        List<CustomerBill> data = customerBillMapper.selectcustomerBillList(customerBill);
        return new PageInfo<>(data);
    }

    /**
     * 新增顾客买单
     *
     * @param customerBill 顾客买单
     * @return 结果
     */

    @Override
    public int insertcustomerBill(CustomerBill customerBill) {
        return customerBillMapper.insertcustomerBill(customerBill);
    }

    /**
     * 修改顾客买单
     *
     * @param customerBill 顾客买单
     * @return 结果
     */
    @Override
    public int updatecustomerBill(CustomerBill customerBill) {
        return customerBillMapper.updatecustomerBill(customerBill);
    }

    /**
     * 删除顾客买单对象
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deletecustomerBillByIds(String[] ids) {
        return customerBillMapper.deletecustomerBillByIds(ids);
    }

    /**
     * 删除顾客买单信息
     *
     * @param orderId 顾客买单ID
     * @return 结果
     */
    @Override
    public int deletecustomerBillById(Long orderId) {
        return customerBillMapper.deletecustomerBillById(orderId);
    }
}

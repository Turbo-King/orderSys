package com.pearadmin.system.service.impl;

import java.util.List;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.pearadmin.common.web.domain.request.PageDomain;
import com.pearadmin.system.domain.DishesTable;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.pearadmin.system.mapper.OrderMapper;
import com.pearadmin.system.domain.Order;
import com.pearadmin.system.service.IOrderService;

/**
 * 点餐订单Service业务层处理
 *
 * @author wzh
 * @date 2021-07-07
 */
@Service
public class OrderServiceImpl implements IOrderService {
    @Autowired
    private OrderMapper orderMapper;

    /**
     * 查询点餐订单
     *
     * @param orderId 点餐订单ID
     * @return 点餐订单
     */
    @Override
    public Order selectorderById(Long orderId) {
        return orderMapper.selectorderById(orderId);
    }

    /**
     * 查询点餐订单列表
     *
     * @param order 点餐订单
     * @return 点餐订单
     */
    @Override
    public List<Order> selectorderList(Order order) {
        return orderMapper.selectorderList(order);
    }


    /**
     * 查询点餐订单
     *
     * @param order      点餐订单
     * @param pageDomain
     * @return 点餐订单 分页集合
     */
    @Override
    public PageInfo<Order> selectorderPage(Order order, PageDomain pageDomain) {
        PageHelper.startPage(pageDomain.getPage(), pageDomain.getLimit());
        List<Order> data = orderMapper.selectorderList(order);
        return new PageInfo<>(data);
    }

    /**
     * 新增点餐订单
     *
     * @param order 点餐订单
     * @return 结果
     */

    @Override
    public int insertorder(Order order) {
        return orderMapper.insertorder(order);
    }

    /**
     * 修改点餐订单
     *
     * @param order 点餐订单
     * @return 结果
     */
    @Override
    public int updateorder(Order order) {
        return orderMapper.updateorder(order);
    }

    /**
     * 删除点餐订单对象
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteorderByIds(String[] ids) {
        return orderMapper.deleteorderByIds(ids);
    }

    /**
     * 删除点餐订单信息
     *
     * @param orderId 点餐订单ID
     * @return 结果
     */
    @Override
    public int deleteorderById(Long orderId) {
        return orderMapper.deleteorderById(orderId);
    }
}

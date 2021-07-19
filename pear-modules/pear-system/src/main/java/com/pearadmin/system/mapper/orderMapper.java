package com.pearadmin.system.mapper;

import org.apache.ibatis.annotations.Mapper;
import java.util.List;
import com.pearadmin.system.domain.Order;

/**
 * 点餐订单Mapper接口
 * 
 * @author wzh
 * @date 2021-07-07
 */
@Mapper
public interface OrderMapper
{
    /**
     * 查询点餐订单
     * 
     * @param orderId 点餐订单ID
     * @return 点餐订单
     */
    public Order selectorderById(Long orderId);

    /**
     * 查询点餐订单列表
     * 
     * @param order 点餐订单
     * @return 点餐订单集合
     */
    List<Order> selectorderList(Order order);

    /**
     * 新增点餐订单
     * 
     * @param order 点餐订单
     * @return 结果
     */
    int insertorder(Order order);

    /**
     * 修改点餐订单
     * 
     * @param order 点餐订单
     * @return 结果
     */
    int updateorder(Order order);

    /**
     * 删除点餐订单
     * 
     * @param orderId 点餐订单ID
     * @return 结果
     */
    int deleteorderById(Long orderId);

    /**
     * 批量删除点餐订单
     * 
     * @param orderIds 需要删除的数据ID
     * @return 结果
     */
    int deleteorderByIds(String[] orderIds);

}

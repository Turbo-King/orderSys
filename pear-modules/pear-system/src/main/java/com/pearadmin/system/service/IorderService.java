package com.pearadmin.system.service;

import java.util.List;
import com.github.pagehelper.PageInfo;
import com.pearadmin.common.web.domain.request.PageDomain;
import com.pearadmin.system.domain.order;

/**
 * 点餐订单Service接口
 * 
 * @author wzh
 * @date 2021-07-07
 */
public interface IorderService 
{
    /**
     * 查询点餐订单
     * 
     * @param orderId 点餐订单ID
     * @return 点餐订单
     */
    order selectorderById(Long orderId);


    /**
    * 查询点餐订单
     * @param ${classsName} 点餐订单
     * @param pageDomain
     * @return 点餐订单 分页集合
     * */
    PageInfo<order> selectorderPage(order order, PageDomain pageDomain);

    /**
     * 查询点餐订单列表
     * 
     * @param order 点餐订单
     * @return 点餐订单集合
     */
    List<order> selectorderList(order order);

    /**
     * 新增点餐订单
     * 
     * @param order 点餐订单
     * @return 结果
     */
    int insertorder(order order);

    /**
     * 修改点餐订单
     * 
     * @param order 点餐订单
     * @return 结果
     */
    int updateorder(order order);

    /**
     * 批量删除点餐订单
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    int deleteorderByIds(String[] ids);

    /**
     * 删除点餐订单信息
     * 
     * @param orderId 点餐订单ID
     * @return 结果
     */
    int deleteorderById(Long orderId);

}

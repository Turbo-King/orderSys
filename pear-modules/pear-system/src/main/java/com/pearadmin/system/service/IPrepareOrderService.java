package com.pearadmin.system.service;

import java.util.List;
import com.github.pagehelper.PageInfo;
import com.pearadmin.common.web.domain.request.PageDomain;
import com.pearadmin.system.domain.PrepareOrder;

/**
 * 后厨备餐表Service接口
 * 
 * @author wzh
 * @date 2021-07-05
 */
public interface IPrepareOrderService
{
    /**
     * 查询后厨备餐表
     * 
     * @param odId 后厨备餐表ID
     * @return 后厨备餐表
     */
    PrepareOrder selectprepareOrderById(Long odId);


    /**
    * 查询后厨备餐表
     * @param ${classsName} 后厨备餐表
     * @param pageDomain
     * @return 后厨备餐表 分页集合
     * */
    PageInfo<PrepareOrder> selectprepareOrderPage(PrepareOrder prepareOrder, PageDomain pageDomain);

    /**
     * 查询后厨备餐表列表
     * 
     * @param prepareOrder 后厨备餐表
     * @return 后厨备餐表集合
     */
    List<PrepareOrder> selectprepareOrderList(PrepareOrder prepareOrder);

    /**
     * 新增后厨备餐表
     * 
     * @param prepareOrder 后厨备餐表
     * @return 结果
     */
    int insertprepareOrder(PrepareOrder prepareOrder);

    /**
     * 修改后厨备餐表
     * 
     * @param prepareOrder 后厨备餐表
     * @return 结果
     */
    int updateprepareOrder(PrepareOrder prepareOrder);

    /**
     * 批量删除后厨备餐表
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    int deleteprepareOrderByIds(String[] ids);

    /**
     * 删除后厨备餐表信息
     * 
     * @param odId 后厨备餐表ID
     * @return 结果
     */
    int deleteprepareOrderById(Long odId);

}

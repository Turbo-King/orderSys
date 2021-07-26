package com.pearadmin.system.service.impl;

import java.util.List;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.pearadmin.common.web.domain.request.PageDomain;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.pearadmin.system.mapper.PrepareOrderMapper;
import com.pearadmin.system.domain.PrepareOrder;
import com.pearadmin.system.service.IPrepareOrderService;

/**
 * 后厨备餐表Service业务层处理
 * 
 * @author wzh
 * @date 2021-07-05
 */
@Service
public class PrepareOrderServiceImpl implements IPrepareOrderService
{
    @Autowired
    private PrepareOrderMapper prepareOrderMapper;

    /**
     * 查询后厨备餐表
     * 
     * @param odId 后厨备餐表ID
     * @return 后厨备餐表
     */
    @Override
    public PrepareOrder selectprepareOrderById(Long odId)
    {
        return prepareOrderMapper.selectprepareOrderById(odId);
    }

    /**
     * 查询后厨备餐表列表
     * 
     * @param prepareOrder 后厨备餐表
     * @return 后厨备餐表
     */
    @Override
    public List<PrepareOrder> selectprepareOrderList(PrepareOrder prepareOrder)
    {
        return prepareOrderMapper.selectprepareOrderList(prepareOrder);
    }

    /**
     * 查询后厨备餐表
     * @param prepareOrder 后厨备餐表
     * @param pageDomain
     * @return 后厨备餐表 分页集合
     * */
    @Override
    public PageInfo<PrepareOrder> selectprepareOrderPage(PrepareOrder prepareOrder, PageDomain pageDomain)
    {
        PageHelper.startPage(pageDomain.getPage(),pageDomain.getLimit());
        List<PrepareOrder> data = prepareOrderMapper.selectprepareOrderList(prepareOrder);
        return new PageInfo<>(data);
    }

    /**
     * 新增后厨备餐表
     * 
     * @param prepareOrder 后厨备餐表
     * @return 结果
     */

    @Override
    public int insertprepareOrder(PrepareOrder prepareOrder)
    {
        return prepareOrderMapper.insertprepareOrder(prepareOrder);
    }

    /**
     * 修改后厨备餐表
     * 
     * @param prepareOrder 后厨备餐表
     * @return 结果
     */
    @Override
    public int updateprepareOrder(PrepareOrder prepareOrder)
    {
        return prepareOrderMapper.updateprepareOrder(prepareOrder);
    }

    /**
     * 删除后厨备餐表对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteprepareOrderByIds(String[] ids)
    {
        return prepareOrderMapper.deleteprepareOrderByIds(ids);
    }

    /**
     * 删除后厨备餐表信息
     * 
     * @param odId 后厨备餐表ID
     * @return 结果
     */
    @Override
    public int deleteprepareOrderById(Long odId)
    {
        return prepareOrderMapper.deleteprepareOrderById(odId);
    }
}

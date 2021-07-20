package com.pearadmin.system.service.impl;

import java.util.List;
import java.util.ArrayList;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.pearadmin.common.web.domain.request.PageDomain;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.pearadmin.system.mapper.DishesTableMapper;
import com.pearadmin.system.domain.DishesTable;
import com.pearadmin.system.service.IDishesTableService;

/**
 * 点餐餐桌Service业务层处理
 * 
 * @author wzh
 * @date 2021-07-20
 */
@Service
public class DishesTableServiceImpl implements IDishesTableService 
{
    @Autowired
    private DishesTableMapper dishesTableMapper;

    /**
     * 查询点餐餐桌
     * 
     * @param id 点餐餐桌ID
     * @return 点餐餐桌
     */
    @Override
    public DishesTable selectDishesTableById(Long id)
    {
        return dishesTableMapper.selectDishesTableById(id);
    }

    /**
     * 查询点餐餐桌列表
     * 
     * @param dishesTable 点餐餐桌
     * @return 点餐餐桌
     */
    @Override
    public List<DishesTable> selectDishesTableList(DishesTable dishesTable)
    {
        return dishesTableMapper.selectDishesTableList(dishesTable);
    }

    /**
     * 查询可用餐桌列表
     *
     * @return 可用餐桌
     */
    @Override
    public List<DishesTable> selectTableList()
    {
        return dishesTableMapper.selectTableList();
    }

    /**
     * 查询点餐餐桌
     * @param dishesTable 点餐餐桌
     * @param pageDomain
     * @return 点餐餐桌 分页集合
     * */
    @Override
    public PageInfo<DishesTable> selectDishesTablePage(DishesTable dishesTable, PageDomain pageDomain)
    {
        PageHelper.startPage(pageDomain.getPage(),pageDomain.getLimit());
        List<DishesTable> data = dishesTableMapper.selectDishesTableList(dishesTable);
        return new PageInfo<>(data);
    }

    /**
     * 新增点餐餐桌
     * 
     * @param dishesTable 点餐餐桌
     * @return 结果
     */

    @Override
    public int insertDishesTable(DishesTable dishesTable)
    {
        return dishesTableMapper.insertDishesTable(dishesTable);
    }

    /**
     * 修改点餐餐桌
     * 
     * @param dishesTable 点餐餐桌
     * @return 结果
     */
    @Override
    public int updateDishesTable(DishesTable dishesTable)
    {
        return dishesTableMapper.updateDishesTable(dishesTable);
    }

    /**
     * 删除点餐餐桌对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteDishesTableByIds(String[] ids)
    {
        return dishesTableMapper.deleteDishesTableByIds(ids);
    }

    /**
     * 删除点餐餐桌信息
     * 
     * @param id 点餐餐桌ID
     * @return 结果
     */
    @Override
    public int deleteDishesTableById(Long id)
    {
        return dishesTableMapper.deleteDishesTableById(id);
    }
}

package com.pearadmin.system.service.impl;

import java.util.List;
import java.util.ArrayList;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.pearadmin.common.web.domain.request.PageDomain;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.pearadmin.system.mapper.DishesFoodMapper;
import com.pearadmin.system.domain.DishesFood;
import com.pearadmin.system.service.IDishesFoodService;

/**
 * 菜品详情Service业务层处理
 * 
 * @author wzh
 * @date 2021-07-03
 */
@Service
public class DishesFoodServiceImpl implements IDishesFoodService 
{
    @Autowired
    private DishesFoodMapper dishesFoodMapper;

    /**
     * 查询菜品详情
     * 
     * @param id 菜品详情ID
     * @return 菜品详情
     */
    @Override
    public DishesFood selectDishesFoodById(Long id)
    {
        return dishesFoodMapper.selectDishesFoodById(id);
    }

    /**
     * 查询菜品详情列表
     * 
     * @param dishesFood 菜品详情
     * @return 菜品详情
     */
    @Override
    public List<DishesFood> selectDishesFoodList(DishesFood dishesFood)
    {
        return dishesFoodMapper.selectDishesFoodList(dishesFood);
    }

    /**
     * 查询菜品详情
     * @param dishesFood 菜品详情
     * @param pageDomain
     * @return 菜品详情 分页集合
     * */
    @Override
    public PageInfo<DishesFood> selectDishesFoodPage(DishesFood dishesFood, PageDomain pageDomain)
    {
        PageHelper.startPage(pageDomain.getPage(),pageDomain.getLimit());
        List<DishesFood> data = dishesFoodMapper.selectDishesFoodList(dishesFood);
        return new PageInfo<>(data);
    }

    /**
     * 新增菜品详情
     * 
     * @param dishesFood 菜品详情
     * @return 结果
     */

    @Override
    public int insertDishesFood(DishesFood dishesFood)
    {
        return dishesFoodMapper.insertDishesFood(dishesFood);
    }

    /**
     * 修改菜品详情
     * 
     * @param dishesFood 菜品详情
     * @return 结果
     */
    @Override
    public int updateDishesFood(DishesFood dishesFood)
    {
        return dishesFoodMapper.updateDishesFood(dishesFood);
    }

    /**
     * 删除菜品详情对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteDishesFoodByIds(String[] ids)
    {
        return dishesFoodMapper.deleteDishesFoodByIds(ids);
    }

    /**
     * 删除菜品详情信息
     * 
     * @param id 菜品详情ID
     * @return 结果
     */
    @Override
    public int deleteDishesFoodById(Long id)
    {
        return dishesFoodMapper.deleteDishesFoodById(id);
    }
}

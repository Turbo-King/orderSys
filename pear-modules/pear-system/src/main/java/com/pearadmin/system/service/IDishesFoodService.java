package com.pearadmin.system.service;

import java.util.List;
import com.github.pagehelper.PageInfo;
import com.pearadmin.common.web.domain.request.PageDomain;
import com.pearadmin.system.domain.DishesFood;

/**
 * 菜品详情Service接口
 * 
 * @author wzh
 * @date 2021-07-03
 */
public interface IDishesFoodService 
{
    /**
     * 查询菜品详情
     * 
     * @param id 菜品详情ID
     * @return 菜品详情
     */
    DishesFood selectDishesFoodById(Long id);


    /**
    * 查询菜品详情
     * @param ${classsName} 菜品详情
     * @param pageDomain
     * @return 菜品详情 分页集合
     * */
    PageInfo<DishesFood> selectDishesFoodPage(DishesFood dishesFood, PageDomain pageDomain);

    /**
     * 查询菜品详情列表
     * 
     * @param dishesFood 菜品详情
     * @return 菜品详情集合
     */
    List<DishesFood> selectDishesFoodList(DishesFood dishesFood);

    /**
     * 新增菜品详情
     * 
     * @param dishesFood 菜品详情
     * @return 结果
     */
    int insertDishesFood(DishesFood dishesFood);

    /**
     * 修改菜品详情
     * 
     * @param dishesFood 菜品详情
     * @return 结果
     */
    int updateDishesFood(DishesFood dishesFood);

    /**
     * 批量删除菜品详情
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    int deleteDishesFoodByIds(String[] ids);

    /**
     * 删除菜品详情信息
     * 
     * @param id 菜品详情ID
     * @return 结果
     */
    int deleteDishesFoodById(Long id);

}

package com.pearadmin.system.mapper;

import org.apache.ibatis.annotations.Mapper;
import java.util.List;
import com.pearadmin.system.domain.DishesFood;

/**
 * 菜品详情Mapper接口
 * 
 * @author wzh
 * @date 2021-07-03
 */
@Mapper
public interface DishesFoodMapper 
{
    /**
     * 查询菜品详情
     * 
     * @param id 菜品详情ID
     * @return 菜品详情
     */
    public DishesFood selectDishesFoodById(Long id);

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
     * 删除菜品详情
     * 
     * @param id 菜品详情ID
     * @return 结果
     */
    int deleteDishesFoodById(Long id);

    /**
     * 批量删除菜品详情
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    int deleteDishesFoodByIds(String[] ids);

}

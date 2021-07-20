package com.pearadmin.system.mapper;

import org.apache.ibatis.annotations.Mapper;
import java.util.List;
import com.pearadmin.system.domain.DishesTable;

/**
 * 点餐餐桌Mapper接口
 * 
 * @author wzh
 * @date 2021-07-20
 */
@Mapper
public interface DishesTableMapper 
{
    /**
     * 查询点餐餐桌
     * 
     * @param id 点餐餐桌ID
     * @return 点餐餐桌
     */
    public DishesTable selectDishesTableById(Long id);

    /**
     * 查询点餐餐桌列表
     * 
     * @param dishesTable 点餐餐桌
     * @return 点餐餐桌集合
     */
    List<DishesTable> selectDishesTableList(DishesTable dishesTable);

    /**
     * 查询点可用餐桌列表
     *
     * @return 可用餐桌集合
     */
    List<DishesTable> selectTableList();

    /**
     * 新增点餐餐桌
     * 
     * @param dishesTable 点餐餐桌
     * @return 结果
     */
    int insertDishesTable(DishesTable dishesTable);

    /**
     * 修改点餐餐桌
     * 
     * @param dishesTable 点餐餐桌
     * @return 结果
     */
    int updateDishesTable(DishesTable dishesTable);

    /**
     * 删除点餐餐桌
     * 
     * @param id 点餐餐桌ID
     * @return 结果
     */
    int deleteDishesTableById(Long id);

    /**
     * 批量删除点餐餐桌
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    int deleteDishesTableByIds(String[] ids);

}

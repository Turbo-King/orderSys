package com.pearadmin.system.service;

import java.util.List;
import com.github.pagehelper.PageInfo;
import com.pearadmin.common.web.domain.request.PageDomain;
import com.pearadmin.system.domain.DishesTable;

/**
 * 点餐餐桌Service接口
 * 
 * @author wzh
 * @date 2021-07-20
 */
public interface IDishesTableService 
{
    /**
     * 查询点餐餐桌
     * 
     * @param id 点餐餐桌ID
     * @return 点餐餐桌
     */
    DishesTable selectDishesTableById(Long id);


    /**
    * 查询点餐餐桌
     * @param ${classsName} 点餐餐桌
     * @param pageDomain
     * @return 点餐餐桌 分页集合
     * */
    PageInfo<DishesTable> selectDishesTablePage(DishesTable dishesTable, PageDomain pageDomain);

    /**
     * 查询点餐餐桌列表
     * 
     * @param dishesTable 点餐餐桌
     * @return 点餐餐桌集合
     */
    List<DishesTable> selectDishesTableList(DishesTable dishesTable);

    /**
     * 查询可用餐桌列表
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
     * 批量删除点餐餐桌
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    int deleteDishesTableByIds(String[] ids);

    /**
     * 删除点餐餐桌信息
     * 
     * @param id 点餐餐桌ID
     * @return 结果
     */
    int deleteDishesTableById(Long id);

}

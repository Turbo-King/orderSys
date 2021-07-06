package com.pearadmin.system.mapper;

import org.apache.ibatis.annotations.Mapper;
import java.util.List;
import com.pearadmin.system.domain.prepareOrder;

/**
 * 后厨备餐表Mapper接口
 * 
 * @author wzh
 * @date 2021-07-05
 */
@Mapper
public interface prepareOrderMapper 
{
    /**
     * 查询后厨备餐表
     * 
     * @param odId 后厨备餐表ID
     * @return 后厨备餐表
     */
    public prepareOrder selectprepareOrderById(Long odId);

    /**
     * 查询后厨备餐表列表
     * 
     * @param prepareOrder 后厨备餐表
     * @return 后厨备餐表集合
     */
    List<prepareOrder> selectprepareOrderList(prepareOrder prepareOrder);

    /**
     * 新增后厨备餐表
     * 
     * @param prepareOrder 后厨备餐表
     * @return 结果
     */
    int insertprepareOrder(prepareOrder prepareOrder);

    /**
     * 修改后厨备餐表
     * 
     * @param prepareOrder 后厨备餐表
     * @return 结果
     */
    int updateprepareOrder(prepareOrder prepareOrder);

    /**
     * 删除后厨备餐表
     * 
     * @param odId 后厨备餐表ID
     * @return 结果
     */
    int deleteprepareOrderById(Long odId);

    /**
     * 批量删除后厨备餐表
     * 
     * @param odIds 需要删除的数据ID
     * @return 结果
     */
    int deleteprepareOrderByIds(String[] odIds);

}

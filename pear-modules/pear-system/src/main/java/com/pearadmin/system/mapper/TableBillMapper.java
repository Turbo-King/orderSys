package com.pearadmin.system.mapper;

import org.apache.ibatis.annotations.Mapper;
import java.util.List;
import com.pearadmin.system.domain.TableBill;

/**
 * 点餐订单Mapper接口
 * 
 * @author wzh
 * @date 2021-07-04
 */
@Mapper
public interface TableBillMapper 
{
    /**
     * 查询点餐订单
     * 
     * @param orderId 点餐订单ID
     * @return 点餐订单
     */
    public TableBill selectTableBillById(Long orderId);

    /**
     * 查询点餐订单列表
     * 
     * @param tableBill 点餐订单
     * @return 点餐订单集合
     */
    List<TableBill> selectTableBillList(TableBill tableBill);

    /**
     * 新增点餐订单
     * 
     * @param tableBill 点餐订单
     * @return 结果
     */
    int insertTableBill(TableBill tableBill);

    /**
     * 修改点餐订单
     * 
     * @param tableBill 点餐订单
     * @return 结果
     */
    int updateTableBill(TableBill tableBill);

    /**
     * 删除点餐订单
     * 
     * @param orderId 点餐订单ID
     * @return 结果
     */
    int deleteTableBillById(Long orderId);

    /**
     * 批量删除点餐订单
     * 
     * @param orderIds 需要删除的数据ID
     * @return 结果
     */
    int deleteTableBillByIds(String[] orderIds);

}

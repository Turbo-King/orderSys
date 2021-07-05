package com.pearadmin.system.service;

import java.util.List;
import com.github.pagehelper.PageInfo;
import com.pearadmin.common.web.domain.request.PageDomain;
import com.pearadmin.system.domain.TableBill;

/**
 * 点餐订单Service接口
 * 
 * @author wzh
 * @date 2021-07-04
 */
public interface ITableBillService 
{
    /**
     * 查询点餐订单
     * 
     * @param orderId 点餐订单ID
     * @return 点餐订单
     */
    TableBill selectTableBillById(Long orderId);


    /**
    * 查询点餐订单
     * @param ${classsName} 点餐订单
     * @param pageDomain
     * @return 点餐订单 分页集合
     * */
    PageInfo<TableBill> selectTableBillPage(TableBill tableBill, PageDomain pageDomain);

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
     * 批量删除点餐订单
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    int deleteTableBillByIds(String[] ids);

    /**
     * 删除点餐订单信息
     * 
     * @param orderId 点餐订单ID
     * @return 结果
     */
    int deleteTableBillById(Long orderId);

}

package com.pearadmin.system.service.impl;

import java.util.List;
import java.util.ArrayList;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.pearadmin.common.web.domain.request.PageDomain;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.pearadmin.system.mapper.TableBillMapper;
import com.pearadmin.system.domain.TableBill;
import com.pearadmin.system.service.ITableBillService;

/**
 * 点餐订单Service业务层处理
 * 
 * @author wzh
 * @date 2021-07-04
 */
@Service
public class TableBillServiceImpl implements ITableBillService 
{
    @Autowired
    private TableBillMapper tableBillMapper;

    /**
     * 查询点餐订单
     * 
     * @param orderId 点餐订单ID
     * @return 点餐订单
     */
    @Override
    public TableBill selectTableBillById(Long orderId)
    {
        return tableBillMapper.selectTableBillById(orderId);
    }

    /**
     * 查询点餐订单列表
     * 
     * @param tableBill 点餐订单
     * @return 点餐订单
     */
    @Override
    public List<TableBill> selectTableBillList(TableBill tableBill)
    {
        return tableBillMapper.selectTableBillList(tableBill);
    }

    /**
     * 查询点餐订单
     * @param tableBill 点餐订单
     * @param pageDomain
     * @return 点餐订单 分页集合
     * */
    @Override
    public PageInfo<TableBill> selectTableBillPage(TableBill tableBill, PageDomain pageDomain)
    {
        PageHelper.startPage(pageDomain.getPage(),pageDomain.getLimit());
        List<TableBill> data = tableBillMapper.selectTableBillList(tableBill);
        return new PageInfo<>(data);
    }

    /**
     * 新增点餐订单
     * 
     * @param tableBill 点餐订单
     * @return 结果
     */

    @Override
    public int insertTableBill(TableBill tableBill)
    {
        return tableBillMapper.insertTableBill(tableBill);
    }

    /**
     * 修改点餐订单
     * 
     * @param tableBill 点餐订单
     * @return 结果
     */
    @Override
    public int updateTableBill(TableBill tableBill)
    {
        return tableBillMapper.updateTableBill(tableBill);
    }

    /**
     * 删除点餐订单对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteTableBillByIds(String[] ids)
    {
        return tableBillMapper.deleteTableBillByIds(ids);
    }

    /**
     * 删除点餐订单信息
     * 
     * @param orderId 点餐订单ID
     * @return 结果
     */
    @Override
    public int deleteTableBillById(Long orderId)
    {
        return tableBillMapper.deleteTableBillById(orderId);
    }
}

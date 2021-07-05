package com.pearadmin.system.controller;

import com.github.pagehelper.PageInfo;
import com.pearadmin.system.domain.TableBill;
import com.pearadmin.common.tools.string.Convert;
import com.pearadmin.common.web.base.BaseController;
import com.pearadmin.common.web.domain.request.PageDomain;
import com.pearadmin.common.web.domain.response.Result;
import com.pearadmin.common.web.domain.response.module.ResultTable;
import com.pearadmin.common.tools.secure.SecurityUtil;
import com.pearadmin.system.domain.SysUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import com.pearadmin.system.service.ITableBillService;

import java.time.LocalDateTime;

/**
 * 点餐订单Controller
 *
 * @author wzh
 * @date 2021-07-04
 */
@RestController
@RequestMapping("/dishes/tableBill")
public class TableBillController extends BaseController
{
    private String prefix = "dishes/tableBill";

    @Autowired
    private ITableBillService tableBillService;

    @GetMapping("/main")
    @PreAuthorize("hasPermission('/dishes/tableBill/main','dishes:tableBill:main')")
    public ModelAndView main()
    {
        return jumpPage(prefix + "/main");
    }

    /**
     * 查询点餐订单列表
     */
    @ResponseBody
    @GetMapping("/data")
    @PreAuthorize("hasPermission('/dishes/tableBill/data','dishes:tableBill:data')")
    public ResultTable list(@ModelAttribute TableBill tableBill, PageDomain pageDomain)
    {
        PageInfo<TableBill> pageInfo = tableBillService.selectTableBillPage(tableBill,pageDomain);
        return pageTable(pageInfo.getList(),pageInfo.getTotal());
    }

    /**
     * 新增点餐订单
     */
    @GetMapping("/add")
    @PreAuthorize("hasPermission('/dishes/tableBill/add','dishes:tableBill:add')")
    public ModelAndView add()
    {
        return jumpPage(prefix + "/add");
    }

    /**
     * 新增保存点餐订单
     */
    @ResponseBody
    @PostMapping("/save")
    @PreAuthorize("hasPermission('/dishes/tableBill/add','dishes:tableBill:add')")
    public Result save(@RequestBody TableBill tableBill)
    {
        SysUser sysUser = (SysUser)SecurityUtil.currentUserObj();
        tableBill.setCreateTime(LocalDateTime.now());
        tableBill.setCreateBy(sysUser.getUserId());
        tableBill.setCreateName(sysUser.getUsername());
        return decide(tableBillService.insertTableBill(tableBill));
    }

    /**
     * 修改点餐订单
     */
    @GetMapping("/edit")
    @PreAuthorize("hasPermission('/dishes/tableBill/edit','dishes:tableBill:edit')")
    public ModelAndView edit(Long orderId, ModelMap mmap)
    {
        TableBill tableBill = tableBillService.selectTableBillById(orderId);
        mmap.put("tableBill", tableBill);
        return jumpPage(prefix + "/edit");
    }

    /**
     * 修改保存点餐订单
     */
    @ResponseBody
    @PutMapping("/update")
    @PreAuthorize("hasPermission('/dishes/tableBill/edit','dishes:tableBill:edit')")
    public Result update(@RequestBody TableBill tableBill)
    {
        SysUser sysUser = (SysUser)SecurityUtil.currentUserObj();
        tableBill.setUpdateTime(LocalDateTime.now());
        tableBill.setUpdateBy(sysUser.getUserId());
        tableBill.setUpdateName(sysUser.getUsername());
        return decide(tableBillService.updateTableBill(tableBill));
    }

    /**
     * 删除点餐订单
     */
    @ResponseBody
    @DeleteMapping( "/batchRemove")
    @PreAuthorize("hasPermission('/dishes/tableBill/remove','dishes:tableBill:remove')")
    public Result batchRemove(String ids)
    {
        return decide(tableBillService.deleteTableBillByIds(Convert.toStrArray(ids)));
    }

    /**
     * 删除
     */
    @ResponseBody
    @DeleteMapping("/remove/{orderId}")
    @PreAuthorize("hasPermission('/dishes/tableBill/remove','dishes:tableBill:remove')")
    public Result remove(@PathVariable("orderId") Long orderId)
    {
        return decide(tableBillService.deleteTableBillById(orderId));
    }
}

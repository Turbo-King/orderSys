package com.pearadmin.system.controller;

import com.github.pagehelper.PageInfo;
import com.pearadmin.system.domain.customerBill;
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
import com.pearadmin.system.service.IcustomerBillService;

import java.time.LocalDateTime;
import java.util.Arrays;
import java.util.List;

/**
 * 顾客买单Controller
 *
 * @author wzh
 * @date 2021-07-06
 */
@RestController
@RequestMapping("/dishes/customerBill")
public class customerBillController extends BaseController {
    private String prefix = "dishes/customerBill";

    @Autowired
    private IcustomerBillService customerBillService;

    @GetMapping("/main")
    @PreAuthorize("hasPermission('/dishes/customerBill/main','dishes:customerBill:main')")
    public ModelAndView main() {
        return jumpPage(prefix + "/main");
    }

    /**
     * 查询顾客买单列表
     */
    @ResponseBody
    @GetMapping("/data")
    @PreAuthorize("hasPermission('/dishes/customerBill/data','dishes:customerBill:data')")
    public ResultTable list(@ModelAttribute customerBill customerBill, PageDomain pageDomain) {
        PageInfo<customerBill> pageInfo = customerBillService.selectcustomerBillPage(customerBill, pageDomain);
        return pageTable(pageInfo.getList(), pageInfo.getTotal());
    }

    /**
     * 新增顾客买单
     */
    @GetMapping("/add")
    @PreAuthorize("hasPermission('/dishes/customerBill/add','dishes:customerBill:add')")
    public ModelAndView add() {
        return jumpPage(prefix + "/add");
    }

    /**
     * 新增保存顾客买单
     */
    @ResponseBody
    @PostMapping("/save")
    @PreAuthorize("hasPermission('/dishes/customerBill/add','dishes:customerBill:add')")
    public Result save(@RequestBody customerBill customerBill) {
        SysUser sysUser = (SysUser) SecurityUtil.currentUserObj();
        customerBill.setCreateTime(LocalDateTime.now());
        customerBill.setCreateBy(sysUser.getUserId());
        customerBill.setCreateName(sysUser.getUsername());
        return decide(customerBillService.insertcustomerBill(customerBill));
    }

//    /**
//     * 修改顾客买单
//     */
//    @GetMapping("/edit")
//    @PreAuthorize("hasPermission('/dishes/customerBill/edit','dishes:customerBill:edit')")
//    public ModelAndView edit(Long orderId, ModelMap mmap) {
//        customerBill customerBill = customerBillService.selectcustomerBillById(orderId);
//        mmap.put("customerBill", customerBill);
//        return jumpPage(prefix + "/edit");
//    }

    /**
     * 顾客买单详情
     */
    @GetMapping("/edit")
    @PreAuthorize("hasPermission('/dishes/customerBill/edit','dishes:customerBill:edit')")
    public ModelAndView edit(Long orderId, ModelMap mmap) {
//        customerBill customerBill = customerBillService.selectcustomerBillById(orderId);
        List<customerBill> customerBillList = customerBillService.selectcustomerBillById(orderId);
        Double countPrice = customerBillService.countPriceById(orderId);
        System.out.println(countPrice);
        System.out.println(Arrays.asList(customerBillList));
        mmap.put("customerBillList", customerBillList);
        mmap.put("countPrice", countPrice);
        return jumpPage(prefix + "/edit");
    }

    /**
     * 修改保存顾客买单
     */
    @ResponseBody
    @PutMapping("/update")
    @PreAuthorize("hasPermission('/dishes/customerBill/edit','dishes:customerBill:edit')")
    public Result update(@RequestBody customerBill customerBill) {
        SysUser sysUser = (SysUser) SecurityUtil.currentUserObj();
        customerBill.setUpdateTime(LocalDateTime.now());
        customerBill.setUpdateBy(sysUser.getUserId());
        customerBill.setUpdateName(sysUser.getUsername());
        return decide(customerBillService.updatecustomerBill(customerBill));
    }

    /**
     * 删除顾客买单
     */
    @ResponseBody
    @DeleteMapping("/batchRemove")
    @PreAuthorize("hasPermission('/dishes/customerBill/remove','dishes:customerBill:remove')")
    public Result batchRemove(String ids) {
        return decide(customerBillService.deletecustomerBillByIds(Convert.toStrArray(ids)));
    }

    /**
     * 删除
     */
    @ResponseBody
    @DeleteMapping("/remove/{orderId}")
    @PreAuthorize("hasPermission('/dishes/customerBill/remove','dishes:customerBill:remove')")
    public Result remove(@PathVariable("orderId") Long orderId) {
        return decide(customerBillService.deletecustomerBillById(orderId));
    }
}

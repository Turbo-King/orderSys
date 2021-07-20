package com.pearadmin.system.controller;

import com.github.pagehelper.PageInfo;
import com.pearadmin.system.domain.CustomerBill;
import com.pearadmin.common.tools.string.Convert;
import com.pearadmin.common.web.base.BaseController;
import com.pearadmin.common.web.domain.request.PageDomain;
import com.pearadmin.common.web.domain.response.Result;
import com.pearadmin.common.web.domain.response.module.ResultTable;
import com.pearadmin.common.tools.secure.SecurityUtil;
import com.pearadmin.system.domain.DishesTable;
import com.pearadmin.system.domain.SysUser;
import com.pearadmin.system.service.IDishesTableService;
import com.pearadmin.system.service.IPayService;
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
public class CustomerBillController extends BaseController {
    private String prefix = "dishes/customerBill";

    @Autowired
    private IcustomerBillService customerBillService;
    @Autowired
    private IDishesTableService iDishesTableService;

    @GetMapping("/main")
    @PreAuthorize("hasPermission('/dishes/customerBill/main','dishes:customerBill:main')")
    public ModelAndView main() {
        return jumpPage(prefix + "/main");
    }


    @GetMapping("/paySuccess")
    public ModelAndView paySuccess() {
        return jumpPage(prefix + "/paySuccess");
    }

    /**
     * 查询顾客买单列表
     */
    @ResponseBody
    @GetMapping("/data")
    @PreAuthorize("hasPermission('/dishes/customerBill/data','dishes:customerBill:data')")
    public ResultTable list(@ModelAttribute CustomerBill customerBill, PageDomain pageDomain) {
        PageInfo<CustomerBill> pageInfo = customerBillService.selectcustomerBillPage(customerBill, pageDomain);
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
    public Result save(@RequestBody CustomerBill customerBill) {
        SysUser sysUser = (SysUser) SecurityUtil.currentUserObj();
        customerBill.setCreateTime(LocalDateTime.now());
        customerBill.setCreateBy(sysUser.getUserId());
        customerBill.setCreateName(sysUser.getUsername());
        return decide(customerBillService.insertcustomerBill(customerBill));
    }


    /**
     * 顾客结账详情
     */
    @GetMapping("/edit")
    @PreAuthorize("hasPermission('/dishes/customerBill/edit','dishes:customerBill:edit')")
    public ModelAndView edit(Long orderId, ModelMap mmap) {
        List<CustomerBill> customerBillList = null;
        Double countPrice = null;
        try {
            customerBillList = customerBillService.selectcustomerBillById(orderId);
            countPrice = customerBillService.countPriceById(orderId);
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println(countPrice);
        System.out.println(Arrays.asList(customerBillList));
        if (customerBillList != null && !customerBillList.isEmpty()) {
            mmap.put("customerBillList", customerBillList);
            mmap.put("countPrice", countPrice);
        }
        return jumpPage(prefix + "/edit");
    }

    /**
     * 顾客结账或免单
     */
    @ResponseBody
    @PutMapping("/update")
    public Result update(@RequestBody CustomerBill customerBill) {
        SysUser sysUser = (SysUser) SecurityUtil.currentUserObj();
        customerBill.setUpdateTime(LocalDateTime.now());
        customerBill.setUpdateBy(sysUser.getUserId());
        customerBill.setUpdateName(sysUser.getUsername());
        //将餐桌定位空位
        DishesTable dishesTable = new DishesTable();
        dishesTable.setId(customerBill.getTableId());
        dishesTable.setStatus(0);
        iDishesTableService.updateDishesTable(dishesTable);
        return decide(customerBillService.updatecustomerBill(customerBill));
    }


    /**
     * 顾客账单支付
     */
    @ResponseBody
    @GetMapping("/pay")
    public ModelAndView pay(Long orderId, ModelMap mmap) {
        //更新订单为结账订单
        CustomerBill customerBill = new CustomerBill();
        customerBill = customerBillService.selectOrderById(orderId);
        customerBill.setOrderState(2);
        update(customerBill);

        //订单详情
        List<CustomerBill> customerBillList = null;
        //订单总价
        Double countPrice = null;
        try {
            customerBillList = customerBillService.selectcustomerBillById(orderId);
            countPrice = customerBillService.countPriceById(orderId);
        } catch (Exception e) {
            e.printStackTrace();
        }


        mmap.put("customerBillList", customerBillList);
        mmap.put("countPrice", countPrice);
        return jumpPage(prefix + "/alipayFrom");
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

package com.pearadmin.system.controller;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageInfo;
import com.pearadmin.system.domain.*;
import com.pearadmin.common.tools.string.Convert;
import com.pearadmin.common.web.base.BaseController;
import com.pearadmin.common.web.domain.request.PageDomain;
import com.pearadmin.common.web.domain.response.Result;
import com.pearadmin.common.web.domain.response.module.ResultTable;
import com.pearadmin.common.tools.secure.SecurityUtil;
import com.pearadmin.system.service.IDishesFoodService;
import com.pearadmin.system.service.IprepareOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import com.pearadmin.system.service.IorderService;

import java.time.LocalDateTime;
import java.util.*;

/**
 * 点餐订单Controller
 *
 * @author wzh
 * @date 2021-07-07
 */
@RestController
@RequestMapping("/dishes/order")
public class orderController extends BaseController {
    private String prefix = "dishes/order";

    @Autowired
    private IorderService orderService;
    @Autowired
    private IDishesFoodService iDishesFoodService;
    @Autowired
    private IprepareOrderService iprepareOrderService;

    @GetMapping("/main")
    @PreAuthorize("hasPermission('/dishes/order/main','dishes:order:main')")
    public ModelAndView main(ModelMap mmap) {
        List<DishesFood> dishesFoodList = iDishesFoodService.selectDishesFoodList(new DishesFood());
        mmap.put("dishesFoodList", dishesFoodList);
        return jumpPage(prefix + "/main");
    }


    /**
     * 查询点餐订单列表
     */
    @ResponseBody
    @GetMapping("/data")
    @PreAuthorize("hasPermission('/dishes/order/data','dishes:order:data')")
    public ResultTable list(@ModelAttribute order order, PageDomain pageDomain) {
        PageInfo<order> pageInfo = orderService.selectorderPage(order, pageDomain);
        return pageTable(pageInfo.getList(), pageInfo.getTotal());
    }

    /**
     * 新增点餐订单
     */
    @GetMapping("/add")
    @PreAuthorize("hasPermission('/dishes/order/add','dishes:order:add')")
    public ModelAndView add() {
        return jumpPage(prefix + "/add");
    }

    /**
     * 新增保存点餐订单
     */
    @ResponseBody
    @PostMapping("/save")
    @PreAuthorize("hasPermission('/dishes/order/add','dishes:order:add')")
    public Result save(@RequestBody order order) {
        SysUser sysUser = (SysUser) SecurityUtil.currentUserObj();
        order.setCreateTime(LocalDateTime.now());
        order.setCreateBy(sysUser.getUserId());
        order.setCreateName(sysUser.getUsername());
        return decide(orderService.insertorder(order));
    }

    /**
     * 修改点餐订单
     */
    @GetMapping("/edit")
    @PreAuthorize("hasPermission('/dishes/order/edit','dishes:order:edit')")
    public ModelAndView edit(Long orderId, ModelMap mmap) {
        DishesFood dishesFood = iDishesFoodService.selectDishesFoodById(orderId);
        mmap.put("dishesFood", dishesFood);
        return jumpPage(prefix + "/edit");
    }

    /**
     * 修改保存点餐订单
     */
    @ResponseBody
    @PutMapping("/update")
    @PreAuthorize("hasPermission('/dishes/order/edit','dishes:order:edit')")
    public Result update(@RequestBody order order) {
        SysUser sysUser = (SysUser) SecurityUtil.currentUserObj();
        order.setUpdateTime(LocalDateTime.now());
        order.setUpdateBy(sysUser.getUserId());
        order.setUpdateName(sysUser.getUsername());
        return decide(orderService.updateorder(order));
    }

    /**
     * 用户购物车展示
     */
    @ResponseBody
    @PostMapping("/orderDishes")
    public ModelAndView orderDetails(@RequestParam String[][] orderDishesList, ModelMap mmap) {
        System.out.println(Arrays.asList(orderDishesList));
        mmap.put("orderDishesList", orderDishesList);
        return jumpPage(prefix + "/orderDetails");
    }

    /**
     * 用户订单下单
     */
    @ResponseBody
    @PostMapping("/placeOrder")
    public Result placeOrder(@RequestParam String[][] DishesOrderDetail, String orderReference) {
        int sucess = 0;
        prepareOrder prepareOrder = new prepareOrder();
        for (String[] str : DishesOrderDetail) {
            prepareOrder.setDishes(Long.valueOf(str[0]));
            prepareOrder.setNum(Long.valueOf(str[1]));
            prepareOrder.setOrderReference(Long.valueOf(orderReference));
            prepareOrder.setStatus(0);
            sucess = iprepareOrderService.insertprepareOrder(prepareOrder);
        }
        return decide(sucess);
    }

    /**
     * 用户开桌
     */
    @ResponseBody
    @PostMapping("/createOrder")
    public Result createOrder(@RequestParam Integer tableId) {
        int sucess = 0;
        order order = new order();
        order.setOrderBeginTime(new Date());
        order.setWaiterId("1309861917694623744");
        order.setOrderState(0);
        order.setTableId(tableId);
        sucess = orderService.insertorder(order);
        return success(sucess, "操作成功", String.valueOf(order.getOrderId()));
    }

    /**
     * 删除点餐订单
     */
    @ResponseBody
    @DeleteMapping("/batchRemove")
    @PreAuthorize("hasPermission('/dishes/order/remove','dishes:order:remove')")
    public Result batchRemove(String ids) {
        return decide(orderService.deleteorderByIds(Convert.toStrArray(ids)));
    }

    /**
     * 删除
     */
    @ResponseBody
    @DeleteMapping("/remove/{orderId}")
    @PreAuthorize("hasPermission('/dishes/order/remove','dishes:order:remove')")
    public Result remove(@PathVariable("orderId") Long orderId) {
        return decide(orderService.deleteorderById(orderId));
    }
}

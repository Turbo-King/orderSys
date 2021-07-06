package com.pearadmin.system.controller;

import com.github.pagehelper.PageInfo;
import com.pearadmin.system.domain.prepareOrder;
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
import com.pearadmin.system.service.IprepareOrderService;

import java.time.LocalDateTime;

/**
 * 后厨备餐表Controller
 *
 * @author wzh
 * @date 2021-07-05
 */
@RestController
@RequestMapping("/dishes/prepareOrder")
public class prepareOrderController extends BaseController
{
    private String prefix = "dishes/prepareOrder";

    @Autowired
    private IprepareOrderService prepareOrderService;

    @GetMapping("/main")
    @PreAuthorize("hasPermission('/dishes/prepareOrder/main','dishes:prepareOrder:main')")
    public ModelAndView main()
    {
        return jumpPage(prefix + "/main");
    }

    /**
     * 查询后厨备餐表列表
     */
    @ResponseBody
    @GetMapping("/data")
    @PreAuthorize("hasPermission('/dishes/prepareOrder/data','dishes:prepareOrder:data')")
    public ResultTable list(@ModelAttribute prepareOrder prepareOrder, PageDomain pageDomain)
    {
        PageInfo<prepareOrder> pageInfo = prepareOrderService.selectprepareOrderPage(prepareOrder,pageDomain);
        return pageTable(pageInfo.getList(),pageInfo.getTotal());
    }

    /**
     * 新增后厨备餐表
     */
    @GetMapping("/add")
    @PreAuthorize("hasPermission('/dishes/prepareOrder/add','dishes:prepareOrder:add')")
    public ModelAndView add()
    {
        return jumpPage(prefix + "/add");
    }

    /**
     * 新增保存后厨备餐表
     */
    @ResponseBody
    @PostMapping("/save")
    @PreAuthorize("hasPermission('/dishes/prepareOrder/add','dishes:prepareOrder:add')")
    public Result save(@RequestBody prepareOrder prepareOrder)
    {
        SysUser sysUser = (SysUser)SecurityUtil.currentUserObj();
        prepareOrder.setCreateTime(LocalDateTime.now());
        prepareOrder.setCreateBy(sysUser.getUserId());
        prepareOrder.setCreateName(sysUser.getUsername());
        return decide(prepareOrderService.insertprepareOrder(prepareOrder));
    }

    /**
     * 修改后厨备餐表
     */
    @GetMapping("/edit")
    @PreAuthorize("hasPermission('/dishes/prepareOrder/edit','dishes:prepareOrder:edit')")
    public ModelAndView edit(Long odId, ModelMap mmap)
    {
        prepareOrder prepareOrder = prepareOrderService.selectprepareOrderById(odId);
        mmap.put("prepareOrder", prepareOrder);
        return jumpPage(prefix + "/edit");
    }

    /**
     * 修改保存后厨备餐表
     */
    @ResponseBody
    @PutMapping("/update")
    @PreAuthorize("hasPermission('/dishes/prepareOrder/edit','dishes:prepareOrder:edit')")
    public Result update(@RequestBody prepareOrder prepareOrder)
    {
        SysUser sysUser = (SysUser)SecurityUtil.currentUserObj();
        prepareOrder.setUpdateTime(LocalDateTime.now());
        prepareOrder.setUpdateBy(sysUser.getUserId());
        prepareOrder.setUpdateName(sysUser.getUsername());
        return decide(prepareOrderService.updateprepareOrder(prepareOrder));
    }

    /**
     * 删除后厨备餐表
     */
    @ResponseBody
    @DeleteMapping( "/batchRemove")
    @PreAuthorize("hasPermission('/dishes/prepareOrder/remove','dishes:prepareOrder:remove')")
    public Result batchRemove(String ids)
    {
        return decide(prepareOrderService.deleteprepareOrderByIds(Convert.toStrArray(ids)));
    }

    /**
     * 删除
     */
    @ResponseBody
    @DeleteMapping("/remove/{odId}")
    @PreAuthorize("hasPermission('/dishes/prepareOrder/remove','dishes:prepareOrder:remove')")
    public Result remove(@PathVariable("odId") Long odId)
    {
        return decide(prepareOrderService.deleteprepareOrderById(odId));
    }
}

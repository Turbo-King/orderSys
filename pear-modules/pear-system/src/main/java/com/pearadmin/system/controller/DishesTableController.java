package com.pearadmin.system.controller;

import com.github.pagehelper.PageInfo;
import com.pearadmin.system.domain.DishesTable;
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
import com.pearadmin.system.service.IDishesTableService;

import java.time.LocalDateTime;

/**
 * 点餐餐桌Controller
 *
 * @author wzh
 * @date 2021-07-20
 */
@RestController
@RequestMapping("/dishes/table")
public class DishesTableController extends BaseController {
    private String prefix = "dishes/table";

    @Autowired
    private IDishesTableService dishesTableService;

    @GetMapping("/main")
    public ModelAndView main() {
        return jumpPage(prefix + "/main");
    }

    /**
     * 查询点餐餐桌列表
     */
    @ResponseBody
    @GetMapping("/data")
    public ResultTable list(@ModelAttribute DishesTable dishesTable, PageDomain pageDomain) {
        PageInfo<DishesTable> pageInfo = dishesTableService.selectDishesTablePage(dishesTable, pageDomain);
        return pageTable(pageInfo.getList(), pageInfo.getTotal());
    }

    /**
     * 新增点餐餐桌
     */
    @GetMapping("/add")
    public ModelAndView add() {
        return jumpPage(prefix + "/add");
    }

    /**
     * 新增保存点餐餐桌
     */
    @ResponseBody
    @PostMapping("/save")
    public Result save(@RequestBody DishesTable dishesTable) {
        SysUser sysUser = (SysUser) SecurityUtil.currentUserObj();
        dishesTable.setCreateTime(LocalDateTime.now());
        dishesTable.setCreateBy(sysUser.getUserId());
        dishesTable.setCreateName(sysUser.getUsername());
        return decide(dishesTableService.insertDishesTable(dishesTable));
    }

    /**
     * 修改点餐餐桌
     */
    @GetMapping("/edit")
    public ModelAndView edit(Long id, ModelMap mmap) {
        DishesTable dishesTable = dishesTableService.selectDishesTableById(id);
        mmap.put("dishesTable", dishesTable);
        return jumpPage(prefix + "/edit");
    }

    /**
     * 修改保存点餐餐桌
     */
    @ResponseBody
    @PutMapping("/update")
    public Result update(@RequestBody DishesTable dishesTable) {
        SysUser sysUser = (SysUser) SecurityUtil.currentUserObj();
        dishesTable.setUpdateTime(LocalDateTime.now());
        dishesTable.setUpdateBy(sysUser.getUserId());
        dishesTable.setUpdateName(sysUser.getUsername());
        return decide(dishesTableService.updateDishesTable(dishesTable));
    }

    /**
     * 删除点餐餐桌
     */
    @ResponseBody
    @DeleteMapping("/batchRemove")
    public Result batchRemove(String ids) {
        return decide(dishesTableService.deleteDishesTableByIds(Convert.toStrArray(ids)));
    }

    /**
     * 删除
     */
    @ResponseBody
    @DeleteMapping("/remove/{id}")
    public Result remove(@PathVariable("id") Long id) {
        return decide(dishesTableService.deleteDishesTableById(id));
    }
}

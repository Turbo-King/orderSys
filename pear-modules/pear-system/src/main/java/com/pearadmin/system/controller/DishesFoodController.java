package com.pearadmin.system.controller;

import com.github.pagehelper.PageInfo;
import com.pearadmin.system.domain.DishesFood;
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
import com.pearadmin.system.service.IDishesFoodService;

import java.time.LocalDateTime;

/**
 * 菜品详情Controller
 *
 * @author wzh
 * @date 2021-07-03
 */
@RestController
@RequestMapping("/dishes/food")
public class DishesFoodController extends BaseController
{
    private String prefix = "dishes/food";

    @Autowired
    private IDishesFoodService dishesFoodService;

    @GetMapping("/main")
    @PreAuthorize("hasPermission('/dishes/food/main','dishes:food:main')")
    public ModelAndView main()
    {
        return jumpPage(prefix + "/main");
    }

    /**
     * 查询菜品详情列表
     */
    @ResponseBody
    @GetMapping("/data")
    @PreAuthorize("hasPermission('/dishes/food/data','dishes:food:data')")
    public ResultTable list(@ModelAttribute DishesFood dishesFood, PageDomain pageDomain)
    {
        PageInfo<DishesFood> pageInfo = dishesFoodService.selectDishesFoodPage(dishesFood,pageDomain);
        return pageTable(pageInfo.getList(),pageInfo.getTotal());
    }

    /**
     * 新增菜品详情
     */
    @GetMapping("/add")
    @PreAuthorize("hasPermission('/dishes/food/add','dishes:food:add')")
    public ModelAndView add()
    {
        return jumpPage(prefix + "/add");
    }

    /**
     * 新增保存菜品详情
     */
    @ResponseBody
    @PostMapping("/save")
    @PreAuthorize("hasPermission('/dishes/food/add','dishes:food:add')")
    public Result save(@RequestBody DishesFood dishesFood)
    {
        SysUser sysUser = (SysUser)SecurityUtil.currentUserObj();
        dishesFood.setCreateTime(LocalDateTime.now());
        dishesFood.setCreateBy(sysUser.getUserId());
        dishesFood.setCreateName(sysUser.getUsername());
        return decide(dishesFoodService.insertDishesFood(dishesFood));
    }

    /**
     * 修改菜品详情
     */
    @GetMapping("/edit")
    @PreAuthorize("hasPermission('/dishes/food/edit','dishes:food:edit')")
    public ModelAndView edit(Long id, ModelMap mmap)
    {
        DishesFood dishesFood = dishesFoodService.selectDishesFoodById(id);
        mmap.put("dishesFood", dishesFood);
        return jumpPage(prefix + "/edit");
    }

    /**
     * 修改保存菜品详情
     */
    @ResponseBody
    @PutMapping("/update")
    @PreAuthorize("hasPermission('/dishes/food/edit','dishes:food:edit')")
    public Result update(@RequestBody DishesFood dishesFood)
    {
        SysUser sysUser = (SysUser)SecurityUtil.currentUserObj();
        dishesFood.setUpdateTime(LocalDateTime.now());
        dishesFood.setUpdateBy(sysUser.getUserId());
        dishesFood.setUpdateName(sysUser.getUsername());
        return decide(dishesFoodService.updateDishesFood(dishesFood));
    }

    /**
     * 删除菜品详情
     */
    @ResponseBody
    @DeleteMapping( "/batchRemove")
    @PreAuthorize("hasPermission('/dishes/food/remove','dishes:food:remove')")
    public Result batchRemove(String ids)
    {
        return decide(dishesFoodService.deleteDishesFoodByIds(Convert.toStrArray(ids)));
    }

    /**
     * 删除
     */
    @ResponseBody
    @DeleteMapping("/remove/{id}")
    @PreAuthorize("hasPermission('/dishes/food/remove','dishes:food:remove')")
    public Result remove(@PathVariable("id") Long id)
    {
        return decide(dishesFoodService.deleteDishesFoodById(id));
    }
}

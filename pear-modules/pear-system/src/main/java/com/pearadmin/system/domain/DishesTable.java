package com.pearadmin.system.domain;

import io.swagger.models.auth.In;
import lombok.Data;
import com.pearadmin.common.web.base.BaseDomain;

/**
 * 点餐餐桌对象 dishes_table
 *
 * @author wzh
 * @date 2021-07-20
 */
@Data
public class DishesTable extends BaseDomain {
    private static final long serialVersionUID = 1L;

    /**
     * 餐桌编号
     */
    private Integer id;

    /**
     * 餐桌名字
     */
    private String name;


    /**
     * 餐桌状态（0-无人1-有人）
     */
    private Integer status;

}
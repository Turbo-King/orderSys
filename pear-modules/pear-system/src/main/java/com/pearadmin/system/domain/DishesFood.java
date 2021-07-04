package com.pearadmin.system.domain;

import lombok.Data;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.pearadmin.common.web.base.BaseDomain;

/**
 * 菜品详情对象 dishes_food
 * 
 * @author wzh
 * @date 2021-07-03
 */
@Data
public class DishesFood extends BaseDomain
{
    private static final long serialVersionUID = 1L;

    /** 菜品编号 */
    private Long id;

    /** 菜品名称 */
    private String name;

    /** 菜品简介 */
    private String introduction;

    /** 菜品详情 */
    private String details;

    /** 推荐菜品（0非推荐1推荐） */
    private Boolean recommend;

    /** 菜品图像地址 */
    private String pictureUrl;

    /** 餐品价格 */
    private Double price;

}

package com.pearadmin.system.domain;

import com.pearadmin.common.web.base.BaseDomain;
import lombok.Data;

import java.util.Date;

/**
 * \* Created with IntelliJ IDEA.
 * \* Author: wzh
 * \* Date: 2021/7/9
 * \* TODO
 * \* Description:
 * \
 */
@Data
public class OrderDetails extends BaseDomain {
    private static final long serialVersionUID = 1L;

    /**
     * 点餐菜品编号
     */
    private Long dishes;

    /**
     * 点餐数量
     */
    private Integer num;

    /**
     * 菜品名称
     */
    private String name;

    /**
     * 菜品价格
     */
    private Double price;

}

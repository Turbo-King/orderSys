package com.pearadmin.system.domain;

import lombok.Data;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.pearadmin.common.web.base.BaseDomain;

/**
 * 后厨备餐表对象 order_details
 * 
 * @author wzh
 * @date 2021-07-05
 */
@Data
public class PrepareOrder extends BaseDomain
{
    private static final long serialVersionUID = 1L;

    /** 详单编号 */
    private Long odId;

    /** 对应订单编号 */
    private Long orderReference;

    /** 对应餐桌编号 */
    private Integer tableId;

    /** 对应菜品编号 */
    private Long dishes;

    /** 对应菜品名称 */
    private String dishesName;

    /** 菜品数量 */
    private Long num;

    /** 订单菜品烹饪状态（0-未烹饪 1-正在烹饪 2-烹饪完成） */
    private Integer status;

}

package com.pearadmin.system.domain;

import java.util.Date;

import cn.hutool.core.date.DateTime;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.pearadmin.common.web.base.BaseDomain;
import org.springframework.format.annotation.DateTimeFormat;

/**
 * 顾客买单对象 dishes_order
 *
 * @author wzh
 * @date 2021-07-06
 */
@Data
public class CustomerBill extends BaseDomain {
    private static final long serialVersionUID = 1L;

    /**
     * 订单编号
     */
    private Long orderId;

    /**
     * 订单开始时间
     */
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date orderBeginTime;

    /**
     * 订单结束时间
     */
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date orderEndTime;

    /**
     * 订单点餐员编号
     */
    private String waiterId;

    /**
     * 订单点餐员名称
     */
    private String waiterRealName;

    /**
     * 订单状态（0正在用餐，1准备结账，2已经结账，3免单订单）
     */
    private Integer orderState;

    /**
     * 订单的桌号
     */
    private Integer tableId;

    /**
     * 订单备注
     */
    private String remark;

    /**
     * 订单菜品名称
     */
    private String dishesName;

    /**
     * 订单菜品单价
     */
    private Double price;

    /**
     * 订单点菜单品数量
     */
    private Integer num;

    /**
     * 订单单菜总价
     */
    private Double lineCountPrice;

}

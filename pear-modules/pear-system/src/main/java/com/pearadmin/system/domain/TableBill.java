package com.pearadmin.system.domain;

import java.util.Date;
import lombok.Data;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.pearadmin.common.web.base.BaseDomain;

/**
 * 点餐订单对象 dishes_order
 * 
 * @author wzh
 * @date 2021-07-04
 */
@Data
public class TableBill extends BaseDomain
{
    private static final long serialVersionUID = 1L;

    /** 订单编号 */
    private Long orderId;

    /** 订单开始时间 */
    private Date orderBeginTime;

    /** 订单结束时间 */
    private Date orderEndTime;

    /** 订单点餐员编号 */
    private String waiterId;

    /** 订单点餐员姓名 */
    private String waiterRealName;

    /** 订单状态（0正在用餐，1准备结账，2已经结账，3免单订单） */
    private Integer orderState;

    /** 订单的桌号 */
    private Integer tableId;

}

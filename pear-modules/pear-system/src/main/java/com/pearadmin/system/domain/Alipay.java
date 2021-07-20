package com.pearadmin.system.domain;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.Date;

import lombok.Data;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.pearadmin.common.web.base.BaseDomain;

/**
 * 支付宝支付对象 dishes_alipay
 *
 * @author wzh
 * @date 2021-07-14
 */
@Data
public class Alipay extends BaseDomain {
    private static final long serialVersionUID = 1L;

    /**
     * 支付订单号
     */
    private String payId;

    /**
     * 订单编号
     */
    private String orderId;

    /**
     * 支付价格
     */
    private BigDecimal payPrice;

    /**
     * 支付时间
     */
    private LocalDateTime payTime;

    /**
     * 支付描述
     */
    private String payDesc;

}
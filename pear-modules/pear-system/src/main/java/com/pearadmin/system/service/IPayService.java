package com.pearadmin.system.service;

import com.alipay.easysdk.factory.Factory;
import com.alipay.easysdk.kernel.util.ResponseChecker;
import com.alipay.easysdk.payment.page.models.AlipayTradePagePayResponse;
import com.pearadmin.system.domain.Alipay;

import java.math.BigDecimal;

/**
 * \* Created with IntelliJ IDEA.
 * \* Author: wzh
 * \* Date: 2021/7/14
 * \* TODO
 * \* Description:
 * \
 */
public interface IPayService {

    public String toPay(BigDecimal countPrice, String orderId);

    public int insertAlipay(Alipay alipay);
}

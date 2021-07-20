package com.pearadmin.system.service.impl;

import com.alipay.easysdk.factory.Factory;
import com.alipay.easysdk.kernel.util.ResponseChecker;
import com.alipay.easysdk.payment.page.models.AlipayTradePagePayResponse;
import com.pearadmin.system.domain.Alipay;
import com.pearadmin.system.mapper.IPayMapper;
import com.pearadmin.system.service.IPayService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.UUID;

/**
 * \* Created with IntelliJ IDEA.
 * \* Author: wzh
 * \* Date: 2021/7/14
 * \* TODO
 * \* Description:
 * \
 */
@Service
public class PayServiceImpl implements IPayService {
    @Autowired
    private IPayMapper payMapper;

    /**
     * 生成支付表单
     *
     * @param countPrice
     * @param orderId
     * @return
     * @throws Exception
     */
    @Override
    public String toPay(BigDecimal countPrice, String orderId) {
        AlipayTradePagePayResponse pay = null;
        String payId = UUID.randomUUID().toString();
        try {
            pay = Factory.Payment.Page().pay("菜品结账", payId,
                    String.valueOf(countPrice), "http://localhost:9999/dishes/customerBill/paySuccess");
        } catch (Exception e) {
            e.printStackTrace();
        }
        String payForm = null;
        if (ResponseChecker.success(pay)) {
            payForm = pay.getBody();

            //保存支付记录
            Alipay alipay = new Alipay();
            alipay.setPayId(payId);
            alipay.setPayPrice(countPrice);
            alipay.setPayTime(LocalDateTime.now());
            alipay.setPayDesc("支付宝支付");
            alipay.setOrderId(orderId);
            payMapper.insertAlipay(alipay);
        }
        return payForm;
    }

    @Override
    public int insertAlipay(Alipay alipay) {
        return 0;
    }
}

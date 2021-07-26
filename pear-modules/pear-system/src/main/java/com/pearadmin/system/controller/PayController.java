package com.pearadmin.system.controller;

import com.pearadmin.common.web.base.BaseController;
import com.pearadmin.system.service.IPayService;
import com.pearadmin.system.service.ICustomerBillService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.math.BigDecimal;

/**
 * \* Created with IntelliJ IDEA.
 * \* Author: wzh
 * \* Date: 2021/7/14
 * \* TODO
 * \* Description:
 * \
 */
@RestController
@RequestMapping("/dishes/alipay")
public class PayController extends BaseController {
    @Autowired
    private IPayService payService;
    @Autowired
    private ICustomerBillService customerBillService;
    private String prefix = "dishes/alipay";

    @GetMapping("/pay")
    public String pay(Long orderId, BigDecimal countPrice) throws IOException {
        //调用支付宝进行支付
        String form = payService.toPay(countPrice, String.valueOf(orderId));

        return form;
    }


}

package com.pearadmin.system.controller;

import com.pearadmin.common.web.base.BaseController;
import com.pearadmin.system.domain.CustomerBill;
import com.pearadmin.system.service.IPayService;
import com.pearadmin.system.service.IcustomerBillService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.List;

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
    private IcustomerBillService customerBillService;
    private String prefix = "dishes/alipay";

    @GetMapping("/pay")
    public String pay(Long orderId, BigDecimal countPrice) throws IOException {
        //订单详情
        List<CustomerBill> customerBillList = null;
        //订单总价
        try {
            customerBillList = customerBillService.selectcustomerBillById(orderId);
        } catch (Exception e) {
            e.printStackTrace();
        }
        String form = payService.toPay(countPrice, String.valueOf(customerBillList));

        return form;
    }


}

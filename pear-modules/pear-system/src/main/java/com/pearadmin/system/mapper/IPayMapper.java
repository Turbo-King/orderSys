package com.pearadmin.system.mapper;

import com.pearadmin.system.domain.Alipay;
import org.apache.ibatis.annotations.Mapper;

import java.math.BigDecimal;

/**
 * \* Created with IntelliJ IDEA.
 * \* Author: wzh
 * \* Date: 2021/7/14
 * \* TODO
 * \* Description:
 * \
 */
@Mapper
public interface IPayMapper {
    public int insertAlipay(Alipay alipay);
}

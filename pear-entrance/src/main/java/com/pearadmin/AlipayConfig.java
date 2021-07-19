package com.pearadmin;

import com.alipay.easysdk.factory.Factory;
import com.alipay.easysdk.kernel.Config;
import org.springframework.stereotype.Component;

/**
 * @author: wzh
 * @create: 2021-07-14
 */
@Component
public class AlipayConfig {

    // 1. 设置参数（全局只需设置一次）
    static {
        Factory.setOptions(getOptions());
    }

    private static Config getOptions() {
        Config config = new Config();

        config.protocol = "https";

        // 沙箱环境修改为 openapi.alipaydev.com
        config.gatewayHost = "openapi.alipaydev.com";

        config.signType = "RSA2";

        config.appId = "2021000117687952";


        // 为避免私钥随源码泄露，推荐从文件中读取私钥字符串而不是写入源码中
        config.merchantPrivateKey = "MIIEvwIBADANBgkqhkiG9w0BAQEFAASCBKkwggSlAgEAAoIBAQCr7hRM6d4kKFfvsgECRyTPL6lmdNYSiwz5Af8MpuBC7u+3sM8e8LVALuc6cbC7xUV7FJ7grixaXWNcT64nEE6lCAUakVTI+t8Iva7gV+qg5JEegrgKh6NVvgY6zD6kn5TGi5Jnb/r1JJ+FA9ECbyF8IdBRPSqVDrjrTuh8uUpQ5zU76tdicXZGV9rzDwAyCTiD2Pe2kS0HcoLN4doxPHz/I/y1KcT31LFAxBmKetWObZ1rCgPodJa9qUtJF7Pkc0U5W0uY0IbO9ja1ro9hWo2rIU+kGqY88gALoGuGlveCk8BCWoAKjP2FEldLe4XucEHeGaAg7ht9N+COJKY7YB0PAgMBAAECggEBAJebQu9nsmjz4kcNEfKuRXklMB2WnUaQswnIhtzjMhITm/LAyIMiAtHsCh3xLsUE+XXFAyxgqd+tRfaalJkBujewUL/Ss47eGVod2V0eaVki9AyRfDRc0tzCyb+DZyHHTmudm6X2ircsajXi3aVl1YMeVhGs/CWga9OjK0MAKNYY9doDfhfWCEwP7rBLZvx/OMxsyJrmaBQ3aLsvZW7Ep+Y2t8B58jvqbcvXaQhFcgS8FdEcqO6h4gMGCQ/K83wAOyy0mCCkM/TGoBqw/P6GqH4jVz8njjDhZDIYllVH65mHk81wxOuHc0lH4wodZbZdqG5fwFxyqVmPla2r7AWN9ZECgYEA8GzQgeaF+uF8csBX6IsG0IdNF8atw7HAGAKOiGPY15YB7IpXwo09DdRgj2oZhA+hQVYCs3nUD281y+BkJBUB/ogY4Nhkka0b6x0tbqowyZkFm/E0gVrw/cMWESD/da3vJGkQD7rwaeS4B16gYG4YiYOdgw8qaANx5huDEjF/TysCgYEAtxFZd6ikk9iiVq55t0A1tO8rjokuv+0ldKlJPAiLeeor3LI5U+P1O68z/GHTCipUbInApjkw2YCdR4ywds3bnQ1iHPndxmbriomtZqNavxjQ0qJzsGBV81tquydgzb4gGQXBQQsZI9KyclzbpLWeXRJ7RMTHPu9GYoIBI9VQV60CgYAF8lsR63bC5tLiL7m86btoawBQJzzjC0F6Fo4Z94ZEhtRTWnSjPkUVU3xz76bj6lMNv6ffcpL5MsH84fb4IYDkH8+luBR8ufBn11fpVdJRGjTWT5gB3xL449tm3w8ShRPWLbcU/IW3yM14eTG0UOTQee3qcPSWkAdALswGJi1E8wKBgQCx4tfu4B5b04ubcxquqGQHlsfaTw7wTD2zKLQS87KkGpnYcA4oqD+paUu4mE37eLpkZU6ftr7y+njaB6mJJ+uYpmKKCXooyeVizvmB3IXXXwO7SUPlRRb/y/rgNRlpkq+Z4O+yhlg9aQUg/34mhJyHj+fcIOIDE3pvSihVa3gQWQKBgQC6NGSr985iYNIs+TcCLeRfG7ritjLMqqfp27SPxuU9bLenatJ10G8mludXoFl4/0UFyNnsZXJJOUlHsQvem2ULrApPPAAi5JNgkWA+OxB3Yt4nt5BfkKIYMhli0AYtBAJTCsgJ0XWfN90IDEzqms985FGsCYIVUTjO6N9k8pSGRw==";

        //注：如果采用非证书模式，则无需赋值上面的三个证书路径，改为赋值如下的支付宝公钥字符串即可
        config.alipayPublicKey = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAiw5hK9rMYEulJ3S3tBcAu6zPBzeDUahXm+3RkBxllmqWbSFeOv64Tn+UrILeD0PfjvWi7wjksK/lvaEy4ZrEzZkrVPceqkHjIkt7Ql0cHlH3qTtPWWbk8fQiHSfrTcvSwxuTCoG2cOSHhhqW2dIcrjPDg9tOS8uSHQNCSk1hjQwPydN/zpQVt95uIfC41EHQCpTv7S6C5+d8en7RRSZWB43dX8EKuWoOCm/YyhgqWFtGOViVdRTz8P3sFVsZlociGR5n1shqIfo5mDOk6W+M+pvwoakDJZiS6Ilm/pDcounTZyrGb576ps0logO7CxgwKRuzqp3rBVAaszmSp0WEVwIDAQAB";

        //可设置异步通知接收服务地址（可选）
        config.notifyUrl = "";

        return config;
    }
}

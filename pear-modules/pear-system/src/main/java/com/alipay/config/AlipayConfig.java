package com.alipay.config;

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
        config.merchantPrivateKey = "MIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQCdOt81Qp4dDHTpJbIUv6tLVaI2CaO6fOI5pBj+idcHsimjOx/+BcJ0Trxsr4mauEcYTzX0vewt/SMzt8K/hHFJ3zfvR90MLkdLLVf6Vns7dJLQPOeJQoKiybYemgfN/csOgI418UJ7lOVuX/nRVFuUDxY1RZqbzBNXB+8lJ1jSt4XkvXiUpQLJjjp586CKUexxBzKxyGPjjFKgRWVpcGLLHDShx55zRyEBZacBPKXEQIBvNYOWr8N8/YjJaaDlgJWTv6ip8QWoimIFJ6iBdmwnM5pKdm6iUdzmAdmwF45kebG6epbhIyF8SkBorq+JP6TmOOSy9GcaRg3NFkKwbUPPAgMBAAECggEAE7m1Ext+dqp/aFigVNYPCW5+4USoU9cjEpQxxo1IeuCxNJdQVjAmyyytmv0SyGRiFvypCkFhhguCBRUCy8Az7k6g19YuNz7/FsFjjjaXU0g2uwVJDwFXHlEsFf7BB+jVNsaOENpputNdTVGhJ8/rhVG3OYu379/UdVC7ge/Dxvuo4URnybNxZrm5fy1mz2wUKN8SQnShFvhF1/sjV3frJpgXk/mpMdLNNPY7Gn/EBvY0xahIewqMDlKHIZX75utXrr70NneNhIuGqW/2BWATaNTUVhrP27KD7W6DD5gxOyrxupcT6jJh+MNjZo3syzH05swWIY0AqYSdccWoxuvRAQKBgQDQytOMnjvwockgqx3ojX67m5ziBOv1L0kgF9K0Vz+AGuoIUFwEr4/TsCAhITvk85EbXWf0AfXbgK3q4l/HNwtM47PwxsuySsB8W06mMygRoi2dyYfJFmN2uqpAI/07COlCuGofiPhNc36fjc3B6wgJy5o4scYK6bPz9+LrmxZqDwKBgQDAx4zaxazpvFDVCBjZJyRoCg8dIPh4DrOCuzs6fIMgogWEzez3IFCFbo6Q39nw/bNTg1qqMS8BbYDUI0hzF2jvcv/bVosEJ0So6xbcpuqB2OVxq51x+DXmI8spRINqOz1VvXpQEsl98FesQKbpOWAkU/EHXm3e8dK1kBtJPaxKQQKBgQC0xcdfymiPMSRYeo9Ml6WQfWzZa/V3tVcUyEuQBLJgEe1rAViKXg6i86z9wi5/TjrmfHrSkxfw0nrCEPloHEpWaheTcitO1NXPVabE0ynwCoCASsqb2hyH4ZoiKobHpDGBqPWJFCgXttV9A2OQcBPnlzaRu6mCLVG2+3qnDwHbFQKBgGJJ27D3NE//qZ7UAAdHg7Jf3pDVbJmZtUCkQXByZ1DOCs5JR9Y/7Y36bknDOBU85J9hy2oWpYau1A5U5u13NBNRqM2l9D7r3n/ZTNC3cb0+Xs1z2FRxXtm1yjGCMxaImZ8Lej81NPI3BhxW4kLq8+/RtIQzSwVueiYEEUVoYl2BAoGBAIWMX+ZAEZte9hIwqjqXpywpi3PZ7WbJp5IuXI5yr1hRU5p9FOL0XXA3Bw40lImZ7mMUzQQ8rfiK9o4bEENKK9ZW2nTUVj28PBK0PR3BigTHHwF83/TPTJfB7InoZXtOd7qi6CeHlQ/hZrw/sj9feGOlO7WVSe2cXT67hGfPEu07";

        //注：如果采用非证书模式，则无需赋值上面的三个证书路径，改为赋值如下的支付宝公钥字符串即可
        config.alipayPublicKey = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAiw5hK9rMYEulJ3S3tBcAu6zPBzeDUahXm+3RkBxllmqWbSFeOv64Tn+UrILeD0PfjvWi7wjksK/lvaEy4ZrEzZkrVPceqkHjIkt7Ql0cHlH3qTtPWWbk8fQiHSfrTcvSwxuTCoG2cOSHhhqW2dIcrjPDg9tOS8uSHQNCSk1hjQwPydN/zpQVt95uIfC41EHQCpTv7S6C5+d8en7RRSZWB43dX8EKuWoOCm/YyhgqWFtGOViVdRTz8P3sFVsZlociGR5n1shqIfo5mDOk6W+M+pvwoakDJZiS6Ilm/pDcounTZyrGb576ps0logO7CxgwKRuzqp3rBVAaszmSp0WEVwIDAQAB";

        //可设置异步通知接收服务地址（可选）
        config.notifyUrl = "";

        return config;
    }
}

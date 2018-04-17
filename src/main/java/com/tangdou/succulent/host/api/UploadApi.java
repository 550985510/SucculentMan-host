package com.tangdou.succulent.host.api;

import com.tangdou.succulent.host.common.ResponseCode;
import com.tangdou.succulent.host.common.ResponseData;
import com.tangdou.succulent.manager.api.common.ResponseResult;
import io.swagger.annotations.Api;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletException;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

/**
 * 上传接口
 * @author 木叶丸
 * @date 2018/4/17
 */
@RestController
@RequestMapping("/api/upload")
@Api(description = "文件上传相关接口")
public class UploadApi {

    @Value("${img.location}")
    private String location;

    @Value("${app.manager.host}")
    private String APP_PATH;

    @PostMapping("/img")
    public ResponseData uploadImg(@RequestParam("myFileName") MultipartFile file) throws ServletException, IOException {
        ResponseData result = ResponseData.success(ResponseCode.SUCCESS);
        String fileName = UUID.randomUUID().toString() + "-" + (new SimpleDateFormat("yyyyMMddHHmm")).format(new Date()) + ".jpg";
        File dir = new File(location);
        if (!dir.exists()) {
            dir.mkdirs();
        }
        File save = new File(dir,fileName);
        file.transferTo(save);
        result.setData(APP_PATH + "/" + fileName);
        return result;
    }
}

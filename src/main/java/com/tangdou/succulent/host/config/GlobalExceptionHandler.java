package com.tangdou.succulent.host.config;

import com.tangdou.succulent.host.common.ResponseCode;
import com.tangdou.succulent.host.common.ResponseData;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;


/**
 * 全局异常拦截器
 *
 * @author 木叶丸
 */
@Slf4j
@ControllerAdvice
@RestController
public class GlobalExceptionHandler {

    private final Logger logger = LoggerFactory.getLogger(getClass());

    /**
     * 未登录异常处理
     *
     * @param ex 异常信息
     * @return 处理结果
     */
    @ResponseStatus(HttpStatus.UNAUTHORIZED)
    @ExceptionHandler(value = AuthorizationException.class)
    public ResponseData handlerAuthorizationException(AuthorizationException ex) {
        logger.error("未登录异常处理", ex);
        ResponseData result = ResponseData.error(ResponseCode.ERROR_ACCESS_FORBIDDEN);
        result.setMessage(ex.getMessage());
        return result;
    }

    /**
     * 自定义异常处理
     *
     * @param ex 异常信息
     * @return 处理结果
     */
    @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
    @ExceptionHandler(value = CustomException.class)
    public ResponseData handleCupidException(CustomException ex) {
        logger.error("自定义异常处理", ex);
        ResponseData result = ResponseData.error(ResponseCode.ERROR);
        result.setMessage(ex.getMessage());
        return result;
    }

    /**
     * 未知异常处理
     *
     * @param ex 异常信息
     * @return 处理结果
     */
    @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
    @ExceptionHandler(value = Exception.class)
    public ResponseData handleException(Exception ex) {
        logger.error("自定义异常处理", ex);
        ResponseData result = ResponseData.error(ResponseCode.ERROR);
        result.setMessage(ex.getMessage());
        return result;
    }

}

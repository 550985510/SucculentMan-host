package com.tangdou.succulent.host.common;

import com.fasterxml.jackson.annotation.JsonProperty;
import org.apache.commons.lang3.StringUtils;

import java.io.Serializable;
import java.util.LinkedHashMap;
import java.util.Map;

/**
 * 用户ajax提交之后的相应结果
 * @author 木叶丸
 */
public class ResponseData implements Serializable {

    /**
     * 结果Code
     */
    private Integer retcode;

    /**
     * 结果message
     */
    @JsonProperty("msg")
    private String message;

    /**
     * 结果数据
     * 如果返回对象或数组直接用setData
     * 如果返回简单的键值对用addData
     */
    private Object data;


    private Map<String, Object> dataShadow;

    /**
     * 初始化一个新创建的 Message 对象，使其表示一个空消息。
     */
    public ResponseData() {

    }

    /**
     * 初始化一个新创建的 Message 对象
     *
     * @param retcode 内容
     */
    public ResponseData(ResponseCode retcode) {
        this.retcode = retcode.getKey();
        this.message = retcode.getRemark();
    }

    /**
     * 返回成功消息
     *
     * @param retcode 内容
     * @return 成功消息
     */
    public static ResponseData success(ResponseCode retcode) {
        return new ResponseData(retcode);
    }

    public static ResponseData success(ResponseCode retcode, String message) {
        ResponseData result = new ResponseData(retcode);
        if (StringUtils.isNotEmpty(message)) {
            result.setMessage(message);
        } else {
            result.setMessage(retcode.getRemark());
        }
        return result;
    }

    /**
     * 返回错误消息
     *
     * @param retcode 内容
     * @return 错误消息
     */
    public static ResponseData error(ResponseCode retcode) {
        return new ResponseData(retcode);
    }

    public static ResponseData error(ResponseCode code, String message) {
        ResponseData result = new ResponseData(code);
        if (StringUtils.isNotEmpty(message)) {
            result.setMessage(message);
        } else {
            result.setMessage(code.getRemark());
        }
        return result;
    }

    public Integer getRetcode() {
        return retcode;
    }

    public void setRetcode(Integer retcode) {
        this.retcode = retcode;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    /**
     * 添加返回的数据
     *
     * @param key
     * @param value
     */
    public void addData(String key, Object value) {
        if (this.dataShadow == null) {
            this.dataShadow = new LinkedHashMap<String, Object>();
            this.data = this.dataShadow;
        }
        this.dataShadow.put(key, value);
    }

    /**
     * @param key
     * @return
     */
    public Object removeData(String key) {
        return this.dataShadow != null ? this.dataShadow.remove(key) : null;
    }
}

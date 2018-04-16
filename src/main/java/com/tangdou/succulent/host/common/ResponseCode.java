package com.tangdou.succulent.host.common;

import lombok.Getter;

/**
 * rest 返回CODE定义
 * @author 木叶丸
 */
@Getter
public enum ResponseCode {

    /***********************************************************************
     * ERROR
     ***********************************************************************/
    ERROR(1000000, "未知错误"),

    //登录错误
    ERROR_USERNAME_NOT_EXIST(1000001, "用户名不存在"),
    ERROR_USERNAME_LENGTH_OUT(1000002, "用户名过长"),
    ERROR_USERNAME_EXIST(1000003, "用户名已存在"),
    ERROR_USERNAME_EMPTY(1000004, "用户名空"),
    ERROR_CAPTCHA_NOT_MATCH(1000005, "验证码错误"),
    ERROR_ACCESS_FORBIDDEN(1000006, "未授权,禁止访问"),
    ERROR_BUSINESS_NOT_EXIST(1000007, "商务不存在"),
    ERROR_NICKNAME_FORMAT(1000008, "请输入2-32位字符作为昵称"),
    ERROR_NICKNAME_EXIST(1000008, "昵称已存在"),

    //注册错误提示
    ERROR_EMAIL_EXIST(1001000, "该邮箱已注册"),
    ERROR_EMAIL_EMPTY(1001001, "邮箱输入为空"),
    ERROR_EMAIL_FORMAT(1001002, "邮箱地址格式错误"),
    ERROR_EMAIL_NOT_REGISTER(1001003, "邮箱未注册"),
    ERROR_EMAIL_RESET_PASSWORD_SEND(1001004, "密码重置邮件发送失败"),

    ERROR_PASSWORD_EMPTY(1002000, "请输入密码"),
    ERROR_PASSWORD_NOT_MATCH(1002001, "密码不匹配错误"),
    ERROR_PWD_SHORT(1002002, "密码太短"),
    ERROR_PWD_LONG(1002003, "密码太长"),
    ERROR_PWD_RESET_NOT_ALLOWED(1002004, "不允许重置密码"),
    ERROR_PWD_RESET(1002005, "重置密码错误"),
    ERROR_PWD_NOTAGREE(1002006, "修改密码时输入的旧密码与原始密码不符"),

    ERROR_CFMPWD_EMPTY(1003000, "请输入确认密码"),
    ERROR_CFMPWD_NOTAGREE(1003001, "密码输入不一致"),
    ERROR_CFMPWD_SAME(1003002, "新旧密码相同"),

    ERROR_ACCOUNT_ACTIVATION(1004000, "机构邀请码不存在或者已过期"),
    ERROR_ACCOUNT_ACTIVATION_EXPIRED(1004001, "激活链接过期"),
    ERROR_ACCOUNT_ACTIVATION_NOTEXIST(1004002, "激活账户不存在"),
    ERROR_ACCOUNT_INACTIVE(1004003, "账户待激活"),
    ERROR_ACCOUNT_LOCK(1004004, "账户已锁定"),
    ERROR_ACCOUNT_CANCELLED(1004005, "账户已注销"),
    ERROR_ACCOUNT_EXIST(1004006, "账户已存在(已激活)"),
    ERROR_ACCOUNT_NOT_LOGIN(1004007, "账户没有登录"),
    ERROR_ACCOUNT_NOT_EXIST(1004008, "账户不存在"),
    ERROR_OPENID_NOT_EXIST(1004009, "OPENID不存在"),

    ERROR_MOBILE_EXIST(1005000, "该手机已注册"),
    ERROR_MOBILE_EMPTY(1005001, "手机输入为空"),
    ERROR_MOBILE_FORMAT(1005002, "手机号格式错误"),
    ERROR_MOBILE_NOT_BIND(1005003, "未绑定手机号"),

    ERROR_POST_EMPTY(1006000, "post相关字段空"),
    ERROR_POST_STATUS(1006001, "post状态异常"),


    ERROR_WALLPAPER_UPLOAD(1007000, "图片上传错误"),
    ERROR_WALLPAPER_EMPTY(1007001, "上传图片为空"),
    ERROR_WALLPAPER_UPDDESC(1007002, "上传图片描述为空"),


    ERROR_IDENTITY(1008000, "身份认证失败"),
    ERROR_SCHOOL(1008001, "学历认证失败，请前往学信网查询学籍"),
    ERROR_BANKINFO(1008002, "银行卡要素验证失败"),
    ERROR_ADULT(1008003, "年龄未满十八周岁"),
    ERROR_CONTACT(1008004, "存在重复的关系或者电话号码"),


    /***********************************************************************
     * SUCCESS
     ***********************************************************************/
    SUCCESS(2000000, "操作成功"),

    SUCCESS_EMAIL_RESETPWD_SEND(2001000, "密码重置邮件发送成功"),
    SUCCESS_PWD_FORMAT(2002000, "密码格式正确"),
    SUCCESS_PWD_RESET_ALLOWED(2002001, "密码允许重置"),
    SUCCESS_PWD_RESET(2002002, "密码重置成功"),
    SUCCESS_PWD_CHANGE(2002003, "密码修改成功"),

    SUCCESS_ACCOUNT_REGISTER(2004000, "注册成功"),
    SUCCESS_ACCOUNT_LOGIN(2004001, "登陆成功"),
    SUCCESS_ACCOUNT_ACTIVATION(2004002, "账户激活成功"),
    SUCCESS_ACCOUNT_ACTIVATION_EMAIL_RESEND(2004003, "账户激活邮件重新发送成功"),
    SUCCESS_ACCOUNT_ACTIVATION_KEY_UPD(2004004, "账户激活key更新成功"),
    SUCCESS_ACCOUNT_LOGOUT(2004005, "账户退出系统成功"),

    SUCCESS_PHOTO_CREATE(2007000, "图片上传成功"),
    SUCCESS_PHOTO_UPDATE(2007001, "图片修改成功"),
    SUCCESS_PHOTO_DELETE(2007002, "图片删除成功"),

    OTHER(0000000, "默认");


    private Integer key;

    private String remark;

    ResponseCode(Integer key, String remark) {
        this.key = key;
        this.remark = remark;
    }
}

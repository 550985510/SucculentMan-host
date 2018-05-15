<#import "/spring.ftl" as s>
<!DOCTYPE html>
<html lang="en">
<script src="<@s.url '/js/lib.bundle.a6ecd17d.js'/>"></script>
<link rel="stylesheet" type="text/css" href="<@s.url '/css/theme.css'/>">
<link rel="stylesheet" type="text/css" href="<@s.url '/css/header.css'/>">
<link rel="stylesheet" type="text/css" href="<@s.url '/plugins/sweetAlert/sweetalert.css'/>">
<style>
    .logo {
        float: left;
        width: 80px;
        height: 64px;
        background: url(/img/logo.png) no-repeat left center;
        background-size: 80px 64px;
    }

    .wenzi {
        float: left;
        margin-top: 8px;
        width: 158px;
        height: 56px;
        background: url(/img/wenzi.png) no-repeat left center;
    }
</style>
<body>
<div id="main_header">
    <div style="width: 100%; height: 65px;">
        <div class="pnav-header SG-posfollow"
             style="position: fixed; bottom: auto; z-index: 998; width: 100%; height: 65px; left: 0px; right: auto; top: 0px;">
            <div class="SG-sidecont">
                <div id="header-wrap">
                    <div id="dt-header">
                        <div class="dt-wrap">
                            <a href="/" class="logo"></a>
                            <div><a href="/" class="wenzi"></a></div>
                            <div id="dt-nav">
                                <div id="dt-nav-btn-cover"></div>
                                <div id="dt-nav-btn">
                                    分类
                                    <i></i>
                                </div>
                                <div id="dt-nav-content-cover"></div>
                                <div id="dt-nav-content" class="clr">
                                    <div id="dt-nav-left">
                                        <div class="dt-nav-group">
                                            <p><a href="/post/list">论坛</a></p>
                                            <p><a id="dt-nav-hot-link" href="/article/list">文章</a></p>
                                        </div>
                                        <div class="dt-nav-group" style="margin-top: -30px;">
                                            <p><a href="/goods/list">糖豆家</a></p>
                                        </div>
                                    </div>
                                    <div id="dt-nav-right">
                                        <div id="dt-nav-right-inner">
                                            <div class="dt-nav-group">
                                                <a href="/search?info=姬玉露">姬玉露</a>
                                                <div class="dt-nav-vline"></div>
                                                <a href="/search?info=桃美人">桃美人</a>
                                                <div class="dt-nav-vline"></div>
                                                <a href="/search?info=熊童子">熊童子</a>
                                            </div>
                                            <div class="dt-nav-group">
                                                <a href="/search?info=姬胧月">姬胧月</a>
                                                <div class="dt-nav-vline"></div>
                                                <a href="/search?info=姬秋丽">姬秋丽</a>
                                                <div class="dt-nav-vline"></div>
                                                <a href="/search?info=黑法师">黑法师</a>
                                            </div>
                                            <div class="dt-nav-group">
                                                <a href="/search?info=雪莲">雪莲</a>
                                                <div class="dt-nav-vline"></div>
                                                <a href="/search?info=梦露">梦露</a>
                                                <div class="dt-nav-vline"></div>
                                                <a href="/search?info=华丽风车">华丽风车</a>
                                            </div>
                                            <div class="dt-nav-group">
                                                <a href="/search?info=静夜">静夜</a>
                                                <div class="dt-nav-vline"></div>
                                                <a href="/search?info=玉蝶">玉蝶</a>
                                                <div class="dt-nav-vline"></div>
                                                <a href="/search?info=日本小松">日本小松</a>
                                            </div>
                                            <div class="dt-nav-group">
                                                <a href="/search?info=白牡丹">白牡丹</a>
                                                <div class="dt-nav-vline"></div>
                                                <a href="/search?info=大和锦">大和锦</a>
                                                <div class="dt-nav-vline"></div>
                                                <a href="/search?info=黑王子">黑王子</a>
                                            </div>
                                            <div class="dt-nav-group">
                                                <a href="/search?info=乙女心">乙女心</a>
                                                <div class="dt-nav-vline"></div>
                                                <a href="/search?info=虹之玉">虹之玉</a>
                                                <div class="dt-nav-vline"></div>
                                                <a href="/search?info=新玉缀">新玉缀</a>
                                            </div>
                                            <div class="dt-nav-group">
                                                <a href="/search?info=蛛丝圈绢">蛛丝圈绢</a>
                                                <div class="dt-nav-vline"></div>
                                                <a href="/search?info=山地玫瑰">山地玫瑰</a>
                                                <div class="dt-nav-vline"></div>
                                                <a href="/search?info=子持莲华">子持莲华</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div id="dt-nav-neck"></div>
                            </div>
                            <div id="dt-search">
                                <div>
                                    <input class="ipt" placeholder="搜索感兴趣的内容" type="text" v-model="searchInfo"/>
                                    <button v-on:click="search">搜索</button>
                                </div>
                            </div>
                            <div id="dt-header-right">
                            <#if Session.user?exists>
                                <div id="dt-account" class="dt-has-menu dt-head-cat">
                                    <a class="dt-account-btn" href="#">
                                        <img class="dt-avatar" src="${Session.user.avatar}"/>
                                        <span>我的堆糖</span> <i></i>
                                    </a>
                                    <div class="dt-menu">
                                        <div class="dt-menu-inner dt-menu-mini">
                                            <a id="mynavtools-home" href="/user/personalCenter/${Session.user.id}">
                                                <i></i> 个人主页 </a>
                                            <a id="mynavtools-setting" href="/user/accountEdit"> <i></i> 账号设置 </a>
                                            <div class="dt-menu-bottom">
                                                <a id="mynavtools-logout" href="#" v-on:click="logout"> <i></i> 退出 </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            <#else >
                                <div class="dt-has-menu dt-head-cat">
                                    <a href="#" style="text-decoration: none" data-toggle='modal'
                                       data-target="#loginModule">
                                        <div style="color: black; margin-top: 1px">
                                            <span>登录</span>
                                        </div>
                                    </a>
                                </div>
                                <div class="dt-has-menu dt-head-cat">
                                    <a href="#" style="text-decoration: none" data-toggle='modal'
                                       data-target="#registerModule">
                                        <div style="margin-top: 21px; background-color: #ff557c; color: #fff; width: 50px; height: 25px; border-radius: 5px; font-size: small; line-height: 25px">
                                            <span>注册</span>
                                        </div>
                                    </a>
                                </div>
                            </#if>
                                <div class="dt-has-menu dt-head-cat">
                                    <a class="dt-dreamer-a" id="dt-lifer" href="#" target="_blank"
                                       style="text-decoration: none">
                                        糖豆家萌店 <label class="dt-dreamer">new</label>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="dt-header-btm"></div>
                </div>
            </div>
        </div>
    </div>

    <footer id="footer" class="footer navbar-fixed-bottom" :style="{'z-index': zIndex}"
            style="background-color: #f5f5f5">
        <div class="container" style="text-align: center; margin-bottom: 10px; margin-top: 10px;">
            <h5>Copyright © 2016-2018</h5>
            <h5>豫ICP备17017969号-1 多肉达人信息技术有限责任公司版权所有</h5>
        </div>
    </footer>

    <!-- 用户注册 -->
    <div id="registerModule" class="modal fade" tabindex="-1" role="dialog">
        <div class="modal-dialog modal-sm" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"></button>
                    <h4 class="modal-title">注册</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label class="control-label">手&nbsp;机&nbsp;号</label>
                        <input type="text" class="form-control" v-model="user.mobile">
                    </div>
                    <div class="form-group">
                        <label class="control-label">密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码</label>
                        <input type="password" class="form-control" v-model="user.passWord">
                    </div>
                    <div class="form-group">
                        <label class="control-label">确认密码</label>
                        <input type="password" class="form-control" v-model="user.passWord2">
                    </div>
                    <div class="form-group">
                        <label class="control-label">昵&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;称</label>
                        <input type="text" class="form-control" v-model="user.nickName">
                    </div>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-default" data-dismiss="modal">取消</button>
                    <button class="btn btn-primary" v-on:click="register">注册</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->

    <!-- 用户登陆 -->
    <div id="loginModule" class="modal fade" tabindex="-1" role="dialog">
        <div class="modal-dialog modal-sm" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"></button>
                    <h4 class="modal-title">登陆</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label class="control-label">手&nbsp;机&nbsp;号</label>
                        <input type="text" class="form-control" v-model="user.mobile">
                    </div>
                    <div class="form-group">
                        <label class="control-label">密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码</label>
                        <input type="password" class="form-control" v-model="user.passWord">
                    </div>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-default" data-dismiss="modal">取消</button>
                    <button class="btn btn-primary" v-on:click="login">登陆</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->

</div>
<#include 'include/footer.ftl'/>
<script src="<@s.url '/js/layer/layer.js'/>"></script>
<script>
    var headerApp = new Vue({
        el: '#main_header',
        data: {
            user: {},
            regMobile: {},
            regNickName: {},
            zIndex: -1,
            searchInfo: ''
        },
        created: function () {

        },
        mounted: function () {
            window.addEventListener('scroll', this.handleScroll);
        },
        methods: {
            handleScroll: function () {
                //监听滚动高度
                var scrollTop = document.documentElement.scrollTop;
                if (scrollTop > document.documentElement.scrollHeight - document.documentElement.offsetHeight) {
                    this.zIndex = 1030;
                    $("#footer").show();
                } else {
                    this.zIndex = -1;
                    $("#footer").hide();
                }
            },
            register: function () {
                if (this.user.mobile == null) {
                    swal("请输入手机号!", "", "error");
                } else if (this.user.passWord == null) {
                    swal("请输入密码!", "", "error");
                } else if (this.user.passWord != this.user.passWord2) {
                    swal("两次密码输入不一致!", "", "error")
                } else if (this.user.nickName == null) {
                    swal("请输入昵称!", "", "error")
                } else {
                    this.checkMobile();
                    if (this.regMobile.retcode != 2000000 && this.regMobile.msg != null) {
                        swal(this.regMobile.msg, "", "error");
                    } else {
                        this.checkNickName();
                        if (this.regNickName.retcode != 2000000 && this.regNickName.msg != null) {
                            swal(this.regNickName.msg, "", "error");
                        } else {
                            var index = layer.load(0, {shade: false});
                            var url = "/api/user/register";
                            this.$http.post(url, this.user).then(function (response) {
                                if (response.data.retcode != 2000000) {
                                    layer.close(index);
                                    swal(response.data.msg, "", "error");
                                } else {
                                    layer.close(index);
                                    $("#registerModule").modal('hide');
                                    swal({
                                        title: "注册成功!",
                                        text: "",
                                        type: "success"
                                    }, function () {
                                        location.reload();
                                    });
                                }
                            }, function (error) {
                                swal(error.body.msg);
                            });
                        }
                    }
                }
            },
            login: function () {
                if (this.user.mobile == null) {
                    swal("请输入手机号!", "", "error");
                } else if (this.user.passWord == null) {
                    swal("请输入密码!", "", "error");
                } else {
                    this.checkMobile();
                    if (this.regMobile.retcode != 2000000 && this.regMobile.msg != null) {
                        swal(this.regMobile.msg, "", "error");
                    } else {
                        var index = layer.load(0, {shade: false});
                        var url = "/api/user/login";
                        this.$http.post(url, this.user).then(function (response) {
                            if (response.data.retcode != 2000000) {
                                layer.close(index);
                                swal(response.data.msg, "", "error");
                            } else {
                                layer.close(index);
                                $("#loginModule").modal('hide');
                                swal({
                                    title: "登陆成功!",
                                    text: "",
                                    type: "success"
                                }, function () {
                                    location.reload();
                                });
                            }
                        }, function (error) {
                            swal(error.body.msg);
                        });
                    }
                }
            },
            logout: function () {
                var that = this;
                swal({
                    title: "确定退出当前账户吗？",
                    type: "warning",
                    showCancelButton: true,
                    confirmButtonColor: "#DD6B55",
                    confirmButtonText: "确定！",
                    cancelButtonText: "取消！",
                    closeOnConfirm: false,
                    closeOnCancel: false
                }, function (isConfirm) {
                    if (isConfirm) {
                        var url = "/api/user/logout";
                        that.$http.post(url).then(function (response) {
                            swal({
                                title: "操作成功!",
                                text: "",
                                type: "success"
                            }, function () {
                                location.reload();
                            });
                        }, function (error) {
                            swal(error.body.msg);
                        });
                    } else {
                        swal("取消！", "", "error");
                    }
                });
            },
            checkMobile: function () {
                var url = "/api/check/mobile?mobile=" + this.user.mobile;
                this.$http.post(url).then(function (response) {
                    this.regMobile = response.data;
                }, function (error) {
                    swal(error.body.msg);
                });
            },
            checkNickName: function () {
                var url = "/api/check/nickName?nickName=" + this.user.nickName;
                this.$http.post(url).then(function (response) {
                    this.regNickName = response.data;
                }, function (error) {
                    swal(error.body.msg);
                });
            },
            search: function () {
                window.location.href = "/search?info=" + encodeURI(this.searchInfo);
            }
        }
    });
</script>
</body>
</html>

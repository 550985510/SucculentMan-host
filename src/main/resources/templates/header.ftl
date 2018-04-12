<#import "/spring.ftl" as s>
<script src="<@s.url '/js/lib.bundle.a6ecd17d.js'/>"></script>
<link rel="stylesheet" type="text/css" href="<@s.url '/css/theme.css'/>">
<link rel="stylesheet" type="text/css" href="<@s.url '/css/header.css'/>">
<link rel="stylesheet" type="text/css" href="<@s.url '/plugins/sweetAlert/sweetalert.css'/>">
<style>
    .logo {
        float: left;
        width: 80px;
        height: 64px;
        background: url(../img/logo.png) no-repeat left center;
        background-size: 80px 64px;
    }

    .wenzi {
        float: left;
        margin-top: 8px;
        width: 158px;
        height: 56px;
        background: url(../img/wenzi.png) no-repeat left center;
    }
</style>
<div id="main_header">
    <div style="width: 100%; height: 65px;">
        <div class="pnav-header SG-posfollow"
             style="position: fixed; bottom: auto; z-index: 998; width: 100%; height: 65px; left: 0px; right: auto; top: 0px;">
            <div class="SG-sidecont">
                <div id="header-wrap">
                    <div id="dt-header">
                        <div class="dt-wrap">
                            <a href="#" class="logo"></a>
                            <div><a href="#" class="wenzi"></a></div>
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
                                            <p><a href="index.html">首页</a></p>
                                            <p><a id="dt-nav-hot-link" href="cats.html">热门</a></p>
                                        </div>
                                        <div class="dt-nav-group" style="margin-top: -30px;">
                                            <p><a href="shopping.html">良品购</a></p>
                                        </div>
                                    </div>
                                    <div id="dt-nav-right">
                                        <div id="dt-nav-right-inner">
                                            <div class="dt-nav-group">
                                                <a href="cats.html??cat=home">家居生活</a>
                                                <div class="dt-nav-vline"></div>
                                                <a href="cats.html??cat=food">美食菜谱</a>
                                                <div class="dt-nav-vline"></div>
                                                <a href="cats.html??cat=diy">手工DIY</a>
                                            </div>
                                            <div class="dt-nav-group">
                                                <a href="cats.html??cat=fashion">时尚搭配</a>
                                                <div class="dt-nav-vline"></div>
                                                <a href="cats.html??cat=beauty">美妆造型</a>
                                                <div class="dt-nav-vline"></div>
                                                <a href="cats.html??cat=wedding">婚纱婚礼</a>
                                            </div>
                                            <div class="dt-nav-group">
                                                <a href="cats.html??cat=design">设计</a>
                                                <div class="dt-nav-vline"></div>
                                                <a href="cats.html??cat=chinoiserie">古风</a>
                                                <div class="dt-nav-vline"></div>
                                                <a href="cats.html??cat=painting">插画绘画</a>
                                            </div>
                                            <div class="dt-nav-group">
                                                <a href="cats.html??cat=wallpaper">壁纸</a>
                                                <div class="dt-nav-vline"></div>
                                                <a href="cats.html??cat=avatar">头像</a>
                                                <div class="dt-nav-vline"></div>
                                                <a href="cats.html??cat=quotes">文字句子</a>
                                            </div>
                                            <div class="dt-nav-group">
                                                <a href="cats.html??cat=travel">旅行</a>
                                                <div class="dt-nav-vline"></div>
                                                <a href="cats.html??cat=photography">摄影</a>
                                                <div class="dt-nav-vline"></div>
                                                <a href="cats.html??cat=art">人文艺术</a>
                                            </div>
                                            <div class="dt-nav-group">
                                                <a href="cats.html??cat=movie_music_books">影音书</a>
                                                <div class="dt-nav-vline"></div>
                                                <a href="cats.html??cat=celebrity">人物明星</a>
                                                <div class="dt-nav-vline"></div>
                                                <a href="cats.html??cat=comic">动画漫画</a>
                                            </div>
                                            <div class="dt-nav-group">
                                                <a href="cats.html??cat=plant">植物多肉</a>
                                                <div class="dt-nav-vline"></div>
                                                <a href="cats.html??cat=tips">生活百科</a>
                                                <div class="dt-nav-vline"></div>
                                                <a href="cats.html??cat=moe">搞笑萌宠</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div id="dt-nav-neck"></div>
                            </div>
                            <div id="dt-search">
                                <form>
                                    <input class="ipt" placeholder="搜索感兴趣的内容" type="text"/>
                                    <button>搜索</button>
                                </form>
                            </div>
                            <div id="dt-header-right">
                            <#if Session.user?exists>
                                <div id="dt-account" class="dt-has-menu dt-head-cat">
                                    <a class="dt-account-btn" href="member_index.html">
                                        <img class="dt-avatar" src="images/20131219205435_r3Lkv.thumb.48_48_c.jpeg"/>
                                        <span>我的堆糖</span> <i></i>
                                    </a>
                                    <div class="dt-menu">
                                        <div class="dt-menu-inner dt-menu-mini">
                                            <a id="mynavtools-home" href="member_index.html"> <i></i> 个人主页 </a>
                                            <a id="mynavtools-setting" href="member_info.html"> <i></i> 账号设置 </a>
                                            <div class="dt-menu-bottom">
                                                <a id="mynavtools-logout" href="/logout/?next=/404/"> <i></i> 退出 </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            <#else >
                                <div class="dt-has-menu dt-head-cat">
                                    <a href="#" style="text-decoration: none">
                                        <div style="color: black; margin-top: 1px">
                                            <span>登录</span>
                                        </div>
                                    </a>
                                </div>
                                <div class="dt-has-menu dt-head-cat">
                                    <a href="#" style="text-decoration: none" data-toggle='modal' data-target="#registerModule">
                                        <div style="margin-top: 21px; background-color: #ff557c; color: #fff; width: 50px; height: 25px; border-radius: 5px; font-size: small; line-height: 25px">
                                            <span>注册</span>
                                        </div>
                                    </a>
                                </div>
                            </#if>
                                <div class="dt-has-menu dt-head-cat">
                                    <a class="dt-dreamer-a" id="dt-lifer" href="#" target="_blank" style="text-decoration: none">
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

    <!-- 添加文章 -->
    <div id="registerModule" class="modal fade" tabindex="-1" role="dialog">
        <div class="modal-dialog modal-sm" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">注册</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label class="control-label">手&nbsp;机&nbsp;号</label>
                        <input type="tel" class="form-control" v-model="user.mobile">
                    </div>
                    <div class="form-group">
                        <label class="control-label">密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码</label>
                        <input type="password" class="form-control" v-model="user.passWord">
                    </div>
                    <div class="form-group">
                        <label class="control-label">确认密码</label>
                        <input type="password" class="form-control" v-model="user.passWord2">
                    </div>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-default" data-dismiss="modal">取消</button>
                    <button class="btn btn-primary" v-on:click="register">确认</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->

</div>
<#include 'include/footer.ftl'/>
<script>
    var app = new Vue({
        el: '#main_header',
        data: {
            user: {}
        },
        created: function () {

        },
        methods: {
            register:function () {
                if (this.user.mobile == null) {
                    swal("请输入手机号！");
                } else if (this.user.passWord == null) {
                    swal("请输入密码！");
                } else if (this.user.passWord != this.user.passWord2) {
                    swal("两次输入的密码不一致！")
                } else {

                }
            }
        }
    });
</script>
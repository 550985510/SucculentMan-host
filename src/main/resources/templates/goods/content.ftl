<#import "/spring.ftl" as s>
<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/html">
<head>
    <meta charset="UTF-8">
    <title>多肉达人一站式服务平台 </title>
    <link rel="stylesheet" type="text/css" href="<@s.url '/css/theme.css'/>">
    <link rel="stylesheet" type="text/css" href="<@s.url '/plugins/sweetAlert/sweetalert.css'/>">
    <link rel="stylesheet" type="text/css" href="<@s.url '/css/jquery.pagination.css'/>">
</head>
<body>
<#include '../header.ftl'/>
<div id="app" style="background: #fff">
    <section id="content" class="table-layout">
        <div class="tray tray-center row">
            <div class="panel" style="width:920px; text-align: -webkit-center">
                <div class="panel-body" style="text-align: -webkit-center;">
                    <div class="panel-body" style="text-align: -webkit-center; width: 444px">
                        <#if Session.user?exists>
                            <div style="width: 440px">
                                <button class="btn btn-sm btn-info" style="float: left; margin: 10px 10px 10px 0"
                                        v-if="isCollectedFlag" v-on:click="unCollection">
                                    取消收藏 {{goods.collectedNum}}
                                </button>
                                <button class="btn btn-sm btn-info" style="float: left; margin: 10px 10px 10px 0"
                                        v-else="" v-on:click="collection">
                                    <i class="fa fa-heart"></i> 收藏 {{collectedNum}}
                                </button>
                                <button class="btn btn-sm btn-default" style="float: left; margin: 10px 10px 10px 0">
                                    <i class="fa fa-shopping-cart"></i> 购买
                                </button>
                            </div>
                        <#else>
                            <div style="width: 440px">
                                <button class="btn btn-sm btn-info" style="float: left; margin: 10px 10px 10px 0" v-on:click="alertLogin">
                                    <i class="fa fa-heart"></i> 收藏 {{collectedNum}}
                                </button>
                                <button class="btn btn-sm btn-default" style="float: left; margin: 10px 10px 10px 0" v-on:click="alertLogin">
                                    <i class="fa fa-shopping-cart"></i> 购买
                                </button>
                            </div>
                        </#if>
                        <div style="width: 440px">
                            <img :src="goods.img" width="430px" class="img-thumbnail">
                        </div>
                        <div style="width: 440px;">
                            <h4>
                                <span style="float: left; margin: 10px">{{goods.name}}</span>
                                <span style="float: right; color: #f14382; margin: 10px">￥{{goods.price}}</span>
                            </h4>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 评论 -->
            <div class="panel">
                <div class="panel-heading">
                    <span class="panel-icon">
                        <i class="fa fa-bar-chart-o"></i>
                    </span>
                    <span class="panel-title"> 发表评论</span>
                </div>
                <div class="panel-body">
                    <div class="row">
                        <span class="col-md-1" style="margin-top: 2px">
                            <h1>
                                <#if Session.user?exists>
                                    <i v-if="isCollectedFlag" style="color: #f14382" class="fa fa-heart"
                                       v-on:click="unCollection"></i>
                                    <i v-else="" class="fa fa-heart" v-on:click="collection"></i>
                                <#else>
                                    <i class="fa fa-heart" v-on:click="alertLogin"></i>
                                </#if>
                                    <i style="font-size: 14px">{{collectedNum}}</i>
                            </h1>
                        </span>
                        <div class="col-md-10">
                        <#if Session.user?exists>
                            <textarea class="form-control" style="overflow-y:hidden;"
                                      onpropertychange="this.style.height=this.scrollHeight + 'px'"
                                      oninput="this.style.height=this.scrollHeight + 'px'"
                                      v-on:focus="onFocus" v-model="comment.content">
                                </textarea>
                            <button class="btn btn-sm btn-info" style="margin-top: 5px" v-if="focusFlag"
                                    v-on:click="addComment">评论
                            </button>
                            <button class="btn btn-sm btn-default" style="margin-top: 5px" v-if="focusFlag"
                                    v-on:click="cancel">取消
                            </button>
                        <#else>
                            <textarea class="form-control" v-on:focus="alertLogin"></textarea>
                        </#if>
                        </div>
                    </div>
                    <hr style="margin: 20px 0 20px 0">
                    <div v-for="item in comments">
                        <div class="row">
                            <a :href="'/user/personalCenter/' + item.userId" class="col-md-1">
                                <img :src="item.userAvatar"
                                     style="width: 64px; height: 64px; border-radius: 50%; border: 3px solid #fff">
                            </a>
                            <span style="font-size: 14px" class="col-md-9">
                                <a :href="'/user/personalCenter/' + item.userId" style="color: #666">{{item.userNickName}}</a>
                                <i style="font-size: 9px">{{item.createdTime}}</i>
                                <br>
                                <span v-html="item.content"></span>
                            </span>
                        </div>
                        <hr>
                    </div>
                    <br>
                    <div>
                        <div id="pageMenu"></div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>
<#include '../include/footer.ftl'/>
<script src="<@s.url '/js/jquery.pagination-1.2.7.js'/>"></script>
<script>
    var app = new Vue({
        el: '#app',
        data: {
            id: getQueryString("goodsId"),
            goods: {},
            collectedNum: 0,
            isCollectedFlag: false,
            focusFlag: false,
            comment: {
                goodsId: getQueryString("goodsId")
            },
            comments: [],
            commentInfo: {
                page: 1,
                pageSize: 10,
                deleted: 0,
                goodsId: getQueryString("goodsId")
            }
        },
        created: function () {
            this.query();
            this.isCollected();
            this.findCollectedNum();
            this.findComment();
        },
        mounted: function () {

        },
        watch: {
            "commentInfo.page": function () {
                this.findComment();
            }
        },
        methods: {
            query: function () {
                var url = "/api/goods/detail?goodsId=" + this.id;
                this.$http.post(url).then(function (response) {
                    this.goods = response.data.data;
                    if (this.goods == null) {
                        window.location.href = "/error_404";
                    }
                }, function (error) {
                    swal(error.body.msg);
                });
            },
            findCollectedNum: function () {
                var url = "/api/goodsCollect/collectedNum?goodsId=" + this.id;
                this.$http.post(url).then(function (response) {
                    this.collectedNum = response.data.data;
                }, function (error) {
                    swal(error.body.msg);
                });
            },
            alertLogin: function () {
                swal("请先登录!");
            },
            isCollected: function () {
                var url = "/api/goodsCollect/isCollected?goodsId=" + this.id;
                this.$http.post(url, this.id).then(function (response) {
                    this.isCollectedFlag = response.data.data;
                }, function (error) {
                    swal(error.body.msg);
                });
            },
            collection: function () {
                var url = "/api/goodsCollect/collection?goodsId=" + this.id;
                this.$http.post(url, this.id).then(function (response) {
                    this.isCollectedFlag = true;
                    this.findCollectedNum();
                }, function (error) {
                    swal(error.body.msg);
                });
            },
            unCollection: function () {
                var url = "/api/goodsCollect/unCollection?goodsId=" + this.id;
                this.$http.post(url, this.id).then(function (response) {
                    this.isCollectedFlag = false;
                    this.findCollectedNum();
                }, function (error) {
                    swal(error.body.msg);
                });
            },
            onFocus: function () {
                this.focusFlag = true;
            },
            cancel: function () {
                this.focusFlag = false;
            },
            addComment: function () {
                var url = "/api/goodsComment/add";
                this.$http.post(url, this.comment).then(function (response) {
                    this.focusFlag = false;
                    swal("评论成功！", "", "success");
                    this.findComment();
                }, function (error) {
                    swal(error.body.msg);
                });
            },
            findComment: function () {
                var url = "/api/goodsComment/list";
                this.$http.post(url, this.commentInfo).then(function (response) {
                    this.comments = response.data.data.list;
                    var temp = this;
                    $("#pageMenu").page({//加载分页
                        total: response.data.data.total,
                        pageSize: response.data.data.pageSize,
                        firstBtnText: '首页',
                        lastBtnText: '尾页',
                        prevBtnText: '上一页',
                        nextBtnText: '下一页',
                        showInfo: true,
                        showJump: true,
                        jumpBtnText: '跳转',
                        infoFormat: '{start} ~ {end}条，共{total}条'
                    }, response.data.data.page)//传入请求参数
                            .on("pageClicked", function (event, pageIndex) {
                                temp.commentInfo.page = pageIndex + 1;
                            }).on('jumpClicked', function (event, pageIndex) {
                        temp.commentInfo.page = pageIndex + 1;
                    });
                }, function (error) {
                    swal(error.body.msg);
                });
            }
        }
    });

</script>
</body>
</html>
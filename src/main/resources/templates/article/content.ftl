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
            <div class="panel">
                <div class="panel-body" style="text-align: center">
                    <div class="well">
                        <h2>{{article.title}}
                            <span style="float: right; margin-top: 2px">
                                <#if Session.user?exists>
                                    <i v-if="isCollectedFlag" style="color: #f14382" class="fa fa-heart" v-on:click="unCollection"></i>
                                    <i v-else="" class="fa fa-heart" v-on:click="collection"></i>
                                <#else>
                                    <i class="fa fa-heart" v-on:click="alertLogin"></i>
                                </#if>
                                <i style="font-size: 14px">{{collectedNum}}</i>
                            </span>
                        </h2>
                    </div>
                    <div v-html="article.content"></div>
                </div>
                <div class="panel-footer">
                    <span>标签:
                        <label class="label label-success" v-for="keyword in article.keywordList"
                                     style="margin-right: 5px">{{keyword}}
                        </label>
                    </span>
                    <br>
                    <div class="panel-body" style="background: #fff; margin-top: 5px">
                        <div class="row">
                            <h5 class="col-md-2">作者: {{article.author}}</h5>
                            <span style="float: right">最后编辑于: {{article.modifiedTime}}</span>
                        </div>
                    </div>
                    <div class="panel-footer">
                        <img :src="article.authorAvatar" style="width: 64px; height: 64px; border-radius: 50%; border: 3px solid #fff">
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
                                <button class="btn btn-sm btn-info" style="margin-top: 5px" v-if="focusFlag" v-on:click="addComment">评论</button>
                                <button class="btn btn-sm btn-default" style="margin-top: 5px" v-if="focusFlag" v-on:click="cancel">取消</button>
                            <#else>
                                <textarea class="form-control" v-on:focus="alertLogin"></textarea>
                            </#if>
                        </div>
                    </div>
                    <hr style="margin: 20px 0 20px 0">
                    <div v-for="item in comments">
                        <div class="row">
                            <a :href="'/user/personalCenter/' + item.userId" class="col-md-1">
                                <img :src="item.userAvatar" style="width: 64px; height: 64px; border-radius: 50%; border: 3px solid #fff">
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
            id: getQueryString("articleId"),
            article: {},
            collectedNum: 0,
            isCollectedFlag: false,
            focusFlag: false,
            comment: {
                articleId: getQueryString("articleId")
            },
            comments: [],
            commentInfo: {
                page: 1,
                pageSize: 10,
                deleted:0,
                articleId: getQueryString("articleId")
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

        },
        methods: {
            query: function () {
                var url = "/api/article/detail?articleId=" + this.id;
                this.$http.post(url).then(function (response) {
                    this.article = response.data.data;
                    if (this.article == null) {
                        window.location.href = "/error_404";
                    }
                }, function (error) {
                    swal(error.body.msg);
                });
            },
            findCollectedNum: function () {
                var url = "/api/articleCollect/collectedNum?articleId=" + this.id;
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
                var url = "/api/articleCollect/isCollected?articleId=" + this.id;
                this.$http.post(url, this.id).then(function (response) {
                    this.isCollectedFlag = response.data.data;
                }, function (error) {
                    swal(error.body.msg);
                });
            },
            collection: function () {
                var url = "/api/articleCollect/collection?articleId=" + this.id;
                this.$http.post(url, this.id).then(function (response) {
                    this.isCollectedFlag = true;
                    this.findCollectedNum();
                }, function (error) {
                    swal(error.body.msg);
                });
            },
            unCollection: function () {
                var url = "/api/articleCollect/unCollection?articleId=" + this.id;
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
                var url = "/api/articleComment/add";
                this.$http.post(url, this.comment).then(function (response) {
                    this.focusFlag = false;
                    this.comment = null;
                    swal("评论成功！", "", "success");
                    this.findComment();
                }, function (error) {
                    swal(error.body.msg);
                });
            },
            findComment: function () {
                var url = "/api/articleComment/list";
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
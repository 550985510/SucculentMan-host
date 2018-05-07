<#import "/spring.ftl" as s>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>多肉达人一站式服务品牌</title>
    <link rel="stylesheet" href="<@s.url '/css/reset.css'/>">
    <link rel="stylesheet" href="<@s.url '/css/index.css'/>">
    <link rel="stylesheet" type="text/css" href="<@s.url '/css/jquery.pagination.css'/>">
    <style>
        /*瀑布流层*/
        .waterfall{
            -moz-column-count:4; /* Firefox */
            -webkit-column-count:4; /* Safari 和 Chrome */
            column-count:5;
            -moz-column-gap: 1em;
            -webkit-column-gap: 1em;
            column-gap: 1em;
        }
        /*一个内容层*/
        .waterfallItem{
            margin: 0 0 1em 0;
            -moz-page-break-inside: avoid;
            -webkit-column-break-inside: avoid;
            break-inside: avoid;
        }
        a.ex{
            color: #666;
            text-decoration: none;
            cursor:pointer
        }
        a.ex:link, a.ex:visited{
            color: #666 !important;
            text-decoration: none;
        }
        a.ex:hover {
            color: #f14382 !important;
            text-decoration: none;
        }
    </style>
</head>
<body>
<#include '../header.ftl'/>
<div id="app" style="background: #fff">
    <div class="main">
        <div class="main-inner body-width">
            <ul id="myTab" class="nav nav-tabs">
                <li class="active">
                    <a href="#article" data-toggle="tab" style="border-radius: 8px 8px 0 0">文章</a>
                </li>
                <li>
                    <a href="#post" data-toggle="tab" style="border-radius: 8px 8px 0 0">帖子</a>
                </li>
                <li>
                    <a href="#goods" data-toggle="tab" style="border-radius: 8px 8px 0 0">商品</a>
                </li>
                <li>
                    <a href="#user" data-toggle="tab" style="border-radius: 8px 8px 0 0">达人</a>
                </li>
            </ul>
            <div id="myTabContent" class="tab-content">
                <div id="article" class="tab-pane fade in active">
                    <div class="main-cont main-waterfall" v-if="articles.length != 0">
                        <ul class="main-cont__list clearfix waterfall">
                            <li class="item waterfallItem" v-for="item in articles" style="float: left">
                                <a :href="'/article/content?articleId=' + item.id" class="pic">
                                    <img :src="item.img">
                                </a>
                                <div class="waterfall-info">
                                    <p class="title">{{item.title}}</p>
                                    <p style="color: #bbb">
                                        <span class="fa fa-star" style="margin-right: 10px"> {{item.collectedNum}}</span>
                                        <span class="fa fa-comment"> {{item.commentNum}}</span>
                                    </p>
                                </div>
                                <div class="collect-info">
                                    <a class="headImg"><img :src="item.authorAvatar"></a>
                                    <p class="title"><i class="fa fa-pencil"></i> 作者: {{item.author}}</p>
                                    <p class="to"><label class="label label-success" v-for="keyword in item.keywordList"
                                                         style="margin-right: 5px">{{keyword}}</label></p>
                                </div>
                            </li>
                        </ul>
                    </div>
                    <div v-else="" style="text-align: center">
                        <h4>没有找到该分类下的文章</h4>
                    </div>
                    <div class="panel" style="padding-bottom: 100px; text-align: center">
                        <div id="pageMenuArticle" style="margin-left: 45%"></div>
                    </div>
                </div>
                <div id="post" class="tab-pane fade">
                    <div class="panel-body" style="margin-bottom: 20px">
                        <h4 v-if="posts.length == 0">没有找到该分类下的帖子</h4>
                        <div v-else="" v-for="item in posts">
                            <h4 class="row">
                                <div style="width: 50px; height: 25px; border: 1px solid #ddd; text-align: center; line-height: 25px; margin-left: 25px" class="col-md-1">
                                    <span title="回复"><i class="fa fa-comment"></i> {{item.commentNum}}</span>
                                </div>
                                <div class="col-md-8" style="line-height: 25px">
                                    <a class="ex" :href="'/post/content?postId=' + item.id">{{item.title}}</a>
                                </div>
                                <div class="col-md-2" style="line-height: 25px">
                                    <span :title="'主题作者:' + item.userNickName" style="font-size: 12px"><i class="fa fa-user"></i> {{item.userNickName}}</span>
                                    <span title="发帖时间" style="font-size: 10px">{{item.createdTime}}</span>
                                </div>
                            </h4>
                            <hr style="margin: 15px">
                        </div>
                        <div id="pageMenuPost" style="margin-left: 20px"></div>
                    </div>
                </div>
                <div id="goods" class="tab-pane fade">
                    <div class="main-cont main-waterfall" v-if="goods.length != 0">
                        <ul class="main-cont__list clearfix waterfall">
                            <li class="item waterfallItem" v-for="item in goods" style="float: left">
                                <a :href="'/goods/content?goodsId=' + item.id" class="pic">
                                    <img :src="item.img">
                                </a>
                                <div class="waterfall-info">
                                    <div style="height: 40px">{{item.name}}</div>
                                    <p style="color: #bbb">
                                        <span class="fa fa-star" style="margin-right: 10px"> {{item.collectedNum}}</span>
                                        <span class="fa fa-comment"> {{item.commentNum}}</span>
                                        <span style="float: right; margin-right: 10px; color: #f14382">￥{{item.price}}</span>
                                    </p>
                                </div>
                            </li>
                        </ul>
                    </div>
                    <div v-else="" style="text-align: center">
                        <h4>没有找到该分类下的商品</h4>
                    </div>
                    <div class="panel" style="padding-bottom: 100px; text-align: center">
                        <div id="pageMenuGoods" style="margin-left: 45%"></div>
                    </div>
                </div>
                <div id="user" class="tab-pane fade">
                    <div class="panel row">
                        <div class="panel-body" style="width: 42%; float: left; margin: 0 20px 20px 0; border-bottom: 2px solid #e5e5e5" v-for="item in users">
                            <div class="col-md-3">
                                <a :href="'/user/personalCenter/' + item.id">
                                    <img :src="item.avatar" style="width: 80px; height: 80px; border-radius: 80px; border: 1px solid #e5e5e5">
                                </a>
                            </div>
                            <div class="col-md-4">
                                <a :href="'/user/personalCenter/' + item.id" style="color: #666">
                                    <h4 style="margin-top: 10px">{{item.nickName}}</h4>
                                </a>
                                <br>
                                <span>关注: {{item.followedNum}}</span>
                                <br>
                                <span>粉丝: {{item.followerNum}}</span>
                            </div>
                        </div>
                    </div>
                    <div class="panel">
                        <div id="pageMenuUser"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<#include '../include/footer.ftl'/>
<script src="<@s.url '/js/jquery.pagination-1.2.7.js'/>"></script>
<script>
    var app = new Vue({
        el: '#app',
        data: {
            info: decodeURI(getQueryString("info")),
            articleInfo: {
                title: decodeURI(getQueryString("info")),
                status: 2,
                page: 1,
                pageSize: 20
            },
            articles: [],
            postInfo: {
                title: decodeURI(getQueryString("info")),
                deleted: 0,
                page: 1,
                pageSize: 20
            },
            posts: [],
            goodsInfo: {
                name: decodeURI(getQueryString("info")),
                status: 1,
                page: 1,
                pageSize: 20
            },
            goods: [],
            pageInfo: {
                nickName: decodeURI(getQueryString("info")),
                page: 1,
                pageSize: 20
            },
            users: []
        },
        created: function () {
            this.queryArticles();
            this.queryPosts();
            this.queryGoods();
            this.queryUser();
        },
        watch: {
            "articleInfo.page": function () {
                this.queryArticles();
            }
        },
        methods: {
            queryArticles: function () {
                var url = "/api/article/list";
                this.$http.post(url, this.articleInfo).then(function (response) {
                    this.articles = response.data.data.list;
                    var temp = this;
                    $("#pageMenuArticle").page({//加载分页
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
                                temp.articleInfo.page = pageIndex + 1;
                            }).on('jumpClicked', function (event, pageIndex) {
                        temp.articleInfo.page = pageIndex + 1;
                    });
                }, function (error) {
                    swal(error.body.msg);
                });
            },
            queryPosts: function () {
                var url = "/api/post/list";
                this.$http.post(url, this.postInfo).then(function (response) {
                    this.posts = response.data.data.list;
                    var temp = this;
                    $("#pageMenuPost").page({//加载分页
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
                                temp.postInfo.page = pageIndex + 1;
                            }).on('jumpClicked', function (event, pageIndex) {
                        temp.postInfo.page = pageIndex + 1;
                    });
                }, function (error) {
                    swal(error.body.msg);
                });
            },
            queryGoods: function () {
                var url = "/api/goods/list";
                this.$http.post(url, this.goodsInfo).then(function (response) {
                    this.goods = response.data.data.list;
                    var temp = this;
                    $("#pageMenuGoods").page({//加载分页
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
                                temp.goodsInfo.page = pageIndex + 1;
                            }).on('jumpClicked', function (event, pageIndex) {
                        temp.goodsInfo.page = pageIndex + 1;
                    });
                }, function (error) {
                    swal(error.body.msg);
                });
            },
            queryUser: function () {
                var url = "/api/user/findAll";
                this.$http.post(url, this.pageInfo).then(function (response) {
                    this.users = response.data.data.list;
                    var temp = this;
                    $("#pageMenuUser").page({//加载分页
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
                                temp.pageInfo.page = pageIndex + 1;
                            }).on('jumpClicked', function (event, pageIndex) {
                        temp.pageInfo.page = pageIndex + 1;
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
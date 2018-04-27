<#import "/spring.ftl" as s>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>多肉达人一站式服务品牌</title>
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/index.css">
    <style>
        .carousel-title {
            padding: 0px !important;
            left: 7% !important;
            width: 600px;
            border-radius: 5px;
            height: 64px;
            position: absolute;
            color: #fff;
            font-size: 28px;
            background-color: rgba(0, 0, 0, 0.65);
        }
        a.ex:link, a.ex:visited{
            color: #666 !important;
        }
        a.ex:hover {
            color: #f14382 !important;
        }
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
    </style>
</head>
<body>
<#include 'header.ftl'/>
<div id="app">
    <div class="main">
        <div class="main-inner body-width">
            <div class="banner clearfix">
                <div id="Carousel" data-ride="carousel" class="carousel slide carousel-fade"
                     style="width: 712px; height: 445px; float: left">
                    <!-- 圆点 -->
                    <ol class="carousel-indicators" style="margin-bottom: 3px">
                        <li data-target="#Carousel" data-slide-to="0" class="active"></li>
                        <li data-target="#Carousel" data-slide-to="1"></li>
                        <li data-target="#Carousel" data-slide-to="2"></li>
                        <li data-target="#Carousel" data-slide-to="3"></li>
                        <li data-target="#Carousel" data-slide-to="4"></li>
                    </ol>
                    <!-- 图片 -->
                    <div class="carousel-inner" v-if="bannerArticles.length != 0">
                        <div class="item active">
                            <a href="#"><img class="img-responsive" :src="bannerArticles[0].img" alt=""
                                             style="width: 712px; height: 445px"></a>
                            <div class="carousel-caption carousel-title">{{bannerArticles[0].title}}</div>
                        </div>
                        <div class="item">
                            <a href="#"><img class="img-responsive" :src="bannerArticles[1].img" alt=""
                                             style="width: 712px; height: 445px"></a>
                            <div class="carousel-caption carousel-title">{{bannerArticles[1].title}}</div>
                        </div>
                        <div class="item">
                            <a href="#"><img class="img-responsive" :src="bannerArticles[2].img" alt=""
                                             style="width: 712px; height: 445px"></a>
                            <div class="carousel-caption carousel-title">{{bannerArticles[2].title}}</div>
                        </div>
                        <div class="item">
                            <a href="#"><img class="img-responsive" :src="bannerArticles[3].img" alt=""
                                             style="width: 712px; height: 445px"></a>
                            <div class="carousel-caption carousel-title">{{bannerArticles[3].title}}</div>
                        </div>
                        <div class="item">
                            <a href="#"><img class="img-responsive" :src="bannerArticles[4].img" alt=""
                                             style="width: 712px; height: 445px"></a>
                            <div class="carousel-caption carousel-title">{{bannerArticles[4].title}}</div>
                        </div>
                    </div>
                    <a href="#Carousel" class="left carousel-control" data-slide="prev">
                        <!-- 箭头图片 -->
                        <span class="glyphicon glyphicon-chevron-left"></span>
                    </a>
                    <a href="#Carousel" class="right carousel-control" data-slide="next">
                        <!-- 箭头图片 -->
                        <span class="glyphicon glyphicon-chevron-right"></span>
                    </a>
                </div>
                <div class="banner-info">
                    <div class="news body-border" style="height: 445px">
                        <ul>
                            <li class="title">社区热点</li>
                            <li class="link">
                                <a href="#" class="ex">玉露</a>
                                <span></span>
                                <a href="#" class="ex">桃美人</a>
                                <span></span>
                                <a href="#" class="ex">熊童子</a>
                                <span></span>
                                <a href="#" class="ex">山地玫瑰</a>
                                <span></span>
                                <a href="#" class="ex">韩国多肉</a>
                                <span></span>
                                <a href="#" class="ex">养护技巧</a>
                                <span></span>
                                <a href="#" class="ex">度夏秘籍</a>
                                <span></span>
                            </li>

                            <li class="title">文章分类</li>
                            <li class="link">
                                <a href="#" class="ex">国内资讯</a>
                                <span></span>
                                <a href="#" class="ex">国外咨询</a>
                                <span></span>
                                <a href="#" class="ex">萌肉赏析</a>
                                <span></span>
                                <a href="#" class="ex">创意工坊</a>
                                <span></span>
                                <a href="#" class="ex">多肉养护</a>
                            <#--<span></span>-->
                            </li>

                            <li class="title">论坛板块</li>
                            <li class="link">
                                <a href="#" class="ex">问答社区</a>
                                <span></span>
                                <a href="#" class="ex">达人日志</a>
                                <span></span>
                                <a href="#" class="ex">美图分享</a>
                                <span></span>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <#--<div class="main-cont main-album">-->
                <#--<div class="main-cont__title">-->
                    <#--<h3>专辑精选</h3>-->
                    <#--<a href="#" class="more">往期回顾 ></a>-->
                <#--</div>-->
                <#--<ul class="main-cont__list clearfix">-->
                    <#--<li class="item">-->
                        <#--<a href="#" class="pic"><img src="img/cont/main_img1.jpg" alt="#"></a>-->
                        <#--<div class="info">-->
                            <#--<a href="#" class="title">你的书写工具需要一个庇护所</a>-->
                            <#--<p>68张图片 · 2255人收藏</p>-->
                            <#--<p>by <a href="#" class="author">Moollly</a></p>-->
                        <#--</div>-->
                    <#--</li>-->
                    <#--<li class="item">-->
                        <#--<a href="#" class="pic"><img src="img/cont/main_img2.jpg" alt="#"></a>-->
                        <#--<div class="info">-->
                            <#--<a href="#" class="title">你的书写工具需要一个庇护所</a>-->
                            <#--<p>68张图片 · 2255人收藏</p>-->
                            <#--<p>by <a href="#" class="author">Moollly</a></p>-->
                        <#--</div>-->
                    <#--</li>-->
                    <#--<li class="item">-->
                        <#--<a href="#" class="pic"><img src="img/cont/main_img3.jpg" alt="#"></a>-->
                        <#--<div class="info">-->
                            <#--<a href="#" class="title">你的书写工具需要一个庇护所</a>-->
                            <#--<p>68张图片 · 2255人收藏</p>-->
                            <#--<p>by <a href="#" class="author">Moollly</a></p>-->
                        <#--</div>-->
                    <#--</li>-->
                    <#--<li class="item">-->
                        <#--<a href="#" class="pic"><img src="img/cont/main_img4.jpg" alt="#"></a>-->
                        <#--<div class="info">-->
                            <#--<a href="#" class="title">你的书写工具需要一个庇护所</a>-->
                            <#--<p>68张图片 · 2255人收藏</p>-->
                            <#--<p>by <a href="#" class="author">Moollly</a></p>-->
                        <#--</div>-->
                    <#--</li>-->
                    <#--<li class="item">-->
                        <#--<a href="#" class="pic"><img src="img/cont/main_img5.jpg" alt="#"></a>-->
                        <#--<div class="info">-->
                            <#--<a href="#" class="title">你的书写工具需要一个庇护所</a>-->
                            <#--<p>68张图片 · 2255人收藏</p>-->
                            <#--<p>by <a href="#" class="author">Moollly</a></p>-->
                        <#--</div>-->
                    <#--</li>-->
                <#--</ul>-->
            <#--</div>-->
            <div class="main-cont main-recommend">
                <div class="main-cont__title">
                    <h3>单品推荐</h3>
                    <p class="list">
                        <em>良品购：</em>
                        <a href="#">全部</a>
                        <span>|</span>
                        <a href="#">上衣</a>
                        <span>|</span>
                        <a href="#">裙裤</a>
                        <span>|</span>
                        <a href="#">配饰</a>
                        <span>|</span>
                        <a href="#">鞋子</a>
                        <span>|</span>
                        <a href="#">包袋</a>
                        <span>|</span>
                        <a href="#">日杂</a>
                    </p>
                </div>
                <ul class="main-cont__list clearfix">
                    <li class="item">
                        <a href="#" class="pic"><img src="img/cont/main_img6.jpg" alt="#"></a>
                        <div class="info">
                            <a href="#" class="title">夹克</a>
                            <span>18739人在逛</span>
                            <a href="#" class="icon-text__pink purchase">良品购</a>
                        </div>
                    </li>
                    <li class="item">
                        <a href="#" class="pic"><img src="img/cont/main_img7.jpg" alt="#"></a>
                        <div class="info">
                            <a href="#" class="title">夹克</a>
                            <span>18739人在逛</span>
                            <a href="#" class="icon-text__pink purchase">良品购</a>
                        </div>
                    </li>
                    <li class="item">
                        <a href="#" class="pic"><img src="img/cont/main_img8.jpg" alt="#"></a>
                        <div class="info">
                            <a href="#" class="title">夹克</a>
                            <span>18739人在逛</span>
                            <a href="#" class="icon-text__pink purchase">良品购</a>
                        </div>
                    </li>
                    <li class="item">
                        <a href="#" class="pic"><img src="img/cont/main_img9.jpg" alt="#"></a>
                        <div class="info">
                            <a href="#" class="title">夹克</a>
                            <span>18739人在逛</span>
                            <a href="#" class="icon-text__pink purchase">良品购</a>
                        </div>
                    </li>
                    <li class="item">
                        <a href="#" class="pic"><img src="img/cont/main_img10.jpg" alt="#"></a>
                        <div class="info">
                            <a href="#" class="title">夹克</a>
                            <span>18739人在逛</span>
                            <a href="#" class="icon-text__pink purchase">良品购</a>
                        </div>
                    </li>
                </ul>
            </div>
            <div class="main-cont main-user" v-if="showUsers.length != 0">
                <div class="main-cont__title">
                    <h3>达人推荐</h3>
                    <a href="/user/list" class="more" style="color: #fff !important;">更多达人 ></a>
                </div>
                <ul class="main-cont__list clearfix">
                    <li class="item" v-for="item in showUsers">
                        <a :href="'/user/personalCenter/' + item.id" class="pic ex" :style="{ backgroundImage : 'url(' + item.background + ')'}"
                           style="background: no-repeat; background-size: cover"></a>
                        <a :href="'/user/personalCenter/' + item.id" class="headImg ex"><img :src="item.avatar" alt="#"></a>
                        <div class="info">
                            <a :href="'/user/personalCenter/' + item.id" class="info-title ex"><h4 style="padding-top: 10px">{{item.nickName}}</h4></a>
                            <span class="col-md-5" style="margin-top: 20px">关注 {{item.followedNum}}</span>
                            <span class="col-md-4" style="margin-top: 20px">粉丝 {{item.followerNum}}</span>
                        </div>
                    </li>
                </ul>
            </div>
            <div class="main-cont main-waterfall" v-if="articles.length != 0">
                <div class="main-cont__title">
                    <h3>大家正在逛</h3>
                </div>
                <ul class="main-cont__list clearfix waterfall">
                    <li class="item waterfallItem" v-for="item in articles" style="float: left">
                        <a :href="'/article/content?articleId=' + item.id" class="pic">
                            <img :src="item.img">
                        </a>
                        <div class="waterfall-info">
                            <p class="title">{{item.title}}</p>
                            <p class="icon"><span class="icon-star">89</span><span class="icon-like">10</span></p>
                        </div>
                        <div class="collect-info">
                            <a class="headImg"><img :src="item.authorAvatar"></a>
                            <p class="title"><i class="fa fa-pencil"></i> 作者: {{item.author}}</p>
                            <p class="to"><label class="label label-success" v-for="keyword in item.keywordList"
                                                 style="margin-right: 5px">{{keyword}}</label></p>
                        </div>
                    </li>
                </ul>
                <a href="/article/list" id="readMore">浏览更多 ></a>
            </div>
        </div>
    </div>
</div>
<#include 'include/footer.ftl'/>
<script src="<@s.url '/js/jquery.pagination-1.2.7.js'/>"></script>
<script>
    var app = new Vue({
        el: '#app',
        data: {
            bannerInfo: {
                bannerStatus: 1,
                page: 1,
                pageSize: 5
            },
            articleInfo: {
                status: 2,
                page: 1,
                pageSize: 20
            },
            bannerArticles: [],
            showUsers: [],
            articles: []
        },
        created: function () {
            this.queryBannerArticles();
            this.queryShowUsers();
            this.queryArticles();
        },
        watch: {},
        methods: {
            queryBannerArticles: function () {
                var url = "/api/article/list";
                this.$http.post(url, this.bannerInfo).then(function (response) {
                    this.bannerArticles = response.data.data.list;
                }, function (error) {
                    swal(error.body.msg);
                });
            },
            queryShowUsers: function () {
                var url = "/api/user/show";
                this.$http.post(url).then(function (response) {
                    this.showUsers = response.data.data;
                }, function (error) {
                    swal(error.body.msg);
                });
            },
            queryArticles: function () {
                var url = "/api/article/list";
                this.$http.post(url, this.articleInfo).then(function (response) {
                    this.articles = response.data.data.list;
                    console.log(this.articles);
                }, function (error) {
                    swal(error.body.msg);
                });
            }
        }
    });
</script>
</body>
</html>
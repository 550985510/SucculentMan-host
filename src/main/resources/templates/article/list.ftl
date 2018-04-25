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
    </style>
</head>
<body>
<#include '../header.ftl'/>
<div id="app">
    <div class="main">
        <div class="main-inner body-width">
            <div class="main-cont main-waterfall" v-if="articles.length != 0">
                <ul class="main-cont__list clearfix waterfall">
                    <li class="item waterfallItem" v-for="item in articles" style="float: left">
                        <a href="#" class="pic">
                            <img :src="item.img" alt="#">
                        </a>
                        <div class="waterfall-hover">
                            <span class="mask"></span>
                            <a href="#" class="btn-collect">收藏 45</a>
                            <a href="#" class="btn-white btn-like"></a>
                            <a href="#" class="btn-white btn-comment"></a>
                        </div>
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
            </div>
            <div class="table-responsive" style="padding-bottom: 100px; text-align: center">
                <div id="pageMenu" style="margin-left: 45%"></div>
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
            articleInfo: {
                status: 2,
                page: 1,
                pageSize: 20
            },
            articles: []
        },
        created: function () {
            this.queryArticles();
        },
        watch: {
            "articleInfo.page": function () {
                this.query();
            }
        },
        methods: {
            queryArticles: function () {
                var url = "/api/article/list";
                this.$http.post(url, this.articleInfo).then(function (response) {
                    this.articles = response.data.data.list;
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
                                temp.articleInfo.page = pageIndex + 1;
                            }).on('jumpClicked', function (event, pageIndex) {
                        temp.articleInfo.page = pageIndex + 1;
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
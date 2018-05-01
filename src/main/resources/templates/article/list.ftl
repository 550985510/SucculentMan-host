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
            <div class="panel-body" style="margin-bottom: 20px; width: 1178px; padding-top: 20px; padding-bottom: 25px">
                <div style="width: 195px; text-align: center; float: left">
                    <a class="ex" v-on:click="setModule(0)"><h3>全部文章</h3></a>
                </div>
                <div style="width: 195px; text-align: center; float: left">
                    <a class="ex" v-on:click="setModule(1)"><h3>国内资讯</h3></a>
                </div>
                <div style="width: 195px; text-align: center; float: left">
                    <a class="ex" v-on:click="setModule(2)"><h3>国外资讯</h3></a>
                </div>
                <div style="width: 195px; text-align: center; float: left">
                    <a class="ex" v-on:click="setModule(3)"><h3>萌肉赏析</h3></a>
                </div>
                <div style="width: 195px; text-align: center; float: left">
                    <a class="ex" v-on:click="setModule(4)"><h3>创意工坊</h3></a>
                </div>
                <div style="width: 195px; text-align: center; float: left">
                    <a class="ex" v-on:click="setModule(5)"><h3>多肉养护</h3></a>
                </div>
            </div>
            <div class="main-cont main-waterfall" v-if="articles.length != 0">
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
            </div>
            <div v-else="" style="text-align: center">
                <h4>没有找到该分类下的文章</h4>
            </div>
            <div class="panel" style="padding-bottom: 100px; text-align: center">
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
            var moduleId = getQueryString("moduleId");
            if (moduleId != null && moduleId != '') {
                this.articleInfo.moduleId = moduleId;
            }
            this.queryArticles();
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
            },
            setModule: function (i) {
                if (i == 0) {
                    this.articleInfo.moduleId = null;
                    this.articleInfo.page = 1;
                    $('#pageMenu').page('destroy');
                    this.queryArticles();
                } else {
                    this.articleInfo.moduleId = i;
                    this.articleInfo.page = 1;
                    $('#pageMenu').page('destroy');
                    this.queryArticles();
                }
            }
        }
    });
</script>
</body>
</html>
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
                <div style="width: 165px; text-align: center; float: left">
                    <a class="ex" v-on:click="setType(0)"><h3>全部商品</h3></a>
                </div>
                <div style="width: 165px; text-align: center; float: left">
                    <a class="ex" v-on:click="setType(1)"><h3>多肉植物</h3></a>
                </div>
                <div style="width: 165px; text-align: center; float: left">
                    <a class="ex" v-on:click="setType(2)"><h3>多肉花器</h3></a>
                </div>
                <div style="width: 165px; text-align: center; float: left">
                    <a class="ex" v-on:click="setType(3)"><h3>多肉盆器</h3></a>
                </div>
                <div style="width: 165px; text-align: center; float: left">
                    <a class="ex" v-on:click="setType(4)"><h3>多肉配土</h3></a>
                </div>
                <div style="width: 165px; text-align: center; float: left">
                    <a class="ex" v-on:click="setType(5)"><h3>多肉资材</h3></a>
                </div>
                <div style="width: 165px; text-align: center; float: left">
                    <a class="ex" v-on:click="setType(6)"><h3>周边服务</h3></a>
                </div>
            </div>
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
            goodsInfo: {
                status: 1,
                page: 1,
                pageSize: 20
            },
            goods: []
        },
        created: function () {
            var type = getQueryString("type");
            if (type != null && type != '') {
                this.goodsInfo.type = type;
            }
            this.querygoods();
        },
        watch: {
            "goodsInfo.page": function () {
                this.querygoods();
            }
        },
        methods: {
            querygoods: function () {
                var url = "/api/goods/list";
                this.$http.post(url, this.goodsInfo).then(function (response) {
                    this.goods = response.data.data.list;
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
                                temp.goodsInfo.page = pageIndex + 1;
                            }).on('jumpClicked', function (event, pageIndex) {
                        temp.goodsInfo.page = pageIndex + 1;
                    });
                }, function (error) {
                    swal(error.body.msg);
                });
            },
            setType: function (i) {
                if (i == 0) {
                    this.goodsInfo.type = null;
                    this.goodsInfo.page = 1;
                    $('#pageMenu').page('destroy');
                    this.querygoods();
                } else {
                    this.goodsInfo.type = i;
                    this.goodsInfo.page = 1;
                    $('#pageMenu').page('destroy');
                    this.querygoods();
                }
            }
        }
    });
</script>
</body>
</html>
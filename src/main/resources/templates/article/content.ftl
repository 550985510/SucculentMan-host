<#import "/spring.ftl" as s>
<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/html">
<head>
    <meta charset="UTF-8">
    <title>个人中心 </title>
    <link rel="stylesheet" type="text/css" href="<@s.url '/css/theme.css'/>">
    <link rel="stylesheet" type="text/css" href="<@s.url '/plugins/sweetAlert/sweetalert.css'/>">
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
        </div>
    </section>
</div>
<#include '../include/footer.ftl'/>
<script>
    var app = new Vue({
        el: '#app',
        data: {
            id: getQueryString("articleId"),
            article: {},
            collectedNum: 0,
            isCollectedFlag: false
        },
        created: function () {
            this.query();
            this.isCollected();
            this.findCollectedNum();
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
            }
        }
    });

</script>
</body>
</html>
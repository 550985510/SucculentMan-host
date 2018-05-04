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
                        <h2>{{post.title}}
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
                    <table class="table table-bordered">
                        <tr v-if="commentInfo.page == 1">
                            <th width="20%" style="text-align: center">
                                <img class="img-thumbnail" :src="post.userAvatar" width="100px" height="100px">
                                <br>
                                <label class="label label-success">楼 主</label>
                                <span style="font-size: 14px;">{{post.userNickName}}</span>
                            </th>
                            <th style="vertical-align: top; position:relative">
                                <div v-html="post.content"></div>
                                <span style="position: absolute; right: 5%; bottom: 20px; color: #bbb">{{post.createdTime}}</span>
                            </th>
                        </tr>
                        <tr v-for="item in comments">
                            <th width="20%" style="text-align: center">
                                <img class="img-thumbnail" :src="item.userAvatar" width="100px" height="100px">
                                <br>
                                <label class="label label-success" v-if="item.userId == post.userId">楼 主</label>
                                <span style="font-size: 14px;">{{item.userNickName}}</span>
                            </th>
                            <th style="vertical-align: top; position:relative">
                                <div v-html="item.content"></div>
                                <span style="position: absolute; right: 5%; bottom: 20px; color: #bbb">{{item.createdTime}}</span>
                            </th>
                        </tr>
                    </table>
                </div>
            </div>
            <div class="panel">
                <div class="panel-heading">
                    <span class="panel-icon">
                        <i class="fa fa-bar-chart-o"></i>
                    </span>
                    <span class="panel-title"> 发表回复</span>
                </div>
                <div class="panel-body">
                    <div style="width:100%; height: 340px">
                        <div id="add_editor" v-on:focus="alertLogin"></div>
                    </div>
                <#if Session.user?exists>
                    <button class="btn btn-sm btn-info" style="margin: 10px 0 10px 0" v-on:click="addComment">发 表</button>
                <#else >
                    <button class="btn btn-sm btn-info" style="margin: 10px 0 10px 0" v-on:click="alertLogin">发 表</button>
                </#if>
                </div>
            </div>
    </section>
</div>
<#include '../include/footer.ftl'/>
<script src="<@s.url '/js/jquery.pagination-1.2.7.js'/>"></script>
<script src="<@s.url '/js/wangEditor/wangEditor.min.js'/>"></script>
<script>
    var app = new Vue({
        el: '#app',
        data: {
            id: getQueryString("postId"),
            post: {},
            collectedNum: 0,
            isCollectedFlag: false,
            comment: {
                postId: getQueryString("postId")
            },
            comments: [],
            commentInfo: {
                page: 1,
                pageSize: 10,
                deleted:0,
                postId: getQueryString("postId")
            }
        },
        created: function () {
            this.query();
            this.isCollected();
            this.findCollectedNum();
            this.findComment();
        },
        mounted: function () {
            this.init();
        },
        watch: {
            "commentInfo.page":function () {
                this.findComment();
            }
        },
        methods: {
            init: function () {
                //富文本编辑器
                var E = window.wangEditor;
                this.editor = new wangEditor('#add_editor');
                this.editor.customConfig.menus = [
                    'head',  // 标题
                    'bold',  // 粗体
                    'fontSize',  // 字号
                    'fontName',  // 字体
                    'italic',  // 斜体
                    'underline',  // 下划线
                    'strikeThrough',  // 删除线
                    'foreColor',  // 文字颜色
                    'backColor',  // 背景颜色
                    'link',  // 插入链接
                    'list',  // 列表
                    'justify',  // 对齐方式
                    'image',  // 插入图片
                    'table',  // 表格
                    'undo'  // 撤销
                ];
                // 配置服务器端地址
                this.editor.customConfig.uploadImgServer = contentPath + '/api/upload/img';
                // 定义文件名
                this.editor.customConfig.uploadFileName = 'myFileName';
                this.editor.customConfig.uploadImgHooks = {
                    success: function (xhr, editor, result) {
                        // 图片上传并返回结果，图片插入成功之后触发
                        // xhr 是 XMLHttpRequst 对象，editor 是编辑器对象，result 是服务器端返回的结果
                        swal("上传成功！", "", "success");
                    },
                    customInsert: function (insertImg, result, editor) {
                        // 图片上传并返回结果，自定义插入图片的事件（而不是编辑器自动插入图片！！！）
                        // insertImg 是插入图片的函数，editor 是编辑器对象，result 是服务器端返回的结果
                        // 举例：假如上传图片成功后，服务器端返回的是 {url:'....'} 这种格式，即可这样插入图片：
                        var url = result.msg;
                        insertImg(url);

                        // result 必须是一个 JSON 格式字符串！！！否则报错
                    }
                };
                this.editor.create();
            },
            query: function () {
                var url = "/api/post/detail?postId=" + this.id;
                this.$http.post(url).then(function (response) {
                    this.post = response.data.data;
                    if (this.post == null) {
                        window.location.href = "/error_404";
                    }
                }, function (error) {
                    swal(error.body.msg);
                });
            },
            findCollectedNum: function () {
                var url = "/api/postCollect/collectedNum?postId=" + this.id;
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
                var url = "/api/postCollect/isCollected?postId=" + this.id;
                this.$http.post(url, this.id).then(function (response) {
                    this.isCollectedFlag = response.data.data;
                }, function (error) {
                    swal(error.body.msg);
                });
            },
            collection: function () {
                var url = "/api/postCollect/collection?postId=" + this.id;
                this.$http.post(url, this.id).then(function (response) {
                    this.isCollectedFlag = true;
                    this.findCollectedNum();
                }, function (error) {
                    swal(error.body.msg);
                });
            },
            unCollection: function () {
                var url = "/api/postCollect/unCollection?postId=" + this.id;
                this.$http.post(url, this.id).then(function (response) {
                    this.isCollectedFlag = false;
                    this.findCollectedNum();
                }, function (error) {
                    swal(error.body.msg);
                });
            },
            addComment: function () {
                this.comment.content = this.editor.txt.html();
                if (this.comment.content.length < 26) {
                    swal("请输入十五字以上");
                } else {
                    var url = "/api/postComment/add";
                    this.$http.post(url, this.comment).then(function (response) {
                        swal("评论成功！", "", "success");
                        this.findComment();
                    }, function (error) {
                        swal(error.body.msg);
                    });
                }
            },
            findComment: function () {
                var url = "/api/postComment/list";
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
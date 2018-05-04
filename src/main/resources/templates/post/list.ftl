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
            <div class="panel-body" style="margin-bottom: 20px; padding-top: 20px; padding-bottom: 25px">
                <div style="width: 16%; text-align: center; float: left">
                    <a class="ex" v-on:click="setModule(0)"><h3>全部帖子</h3></a>
                </div>
                <div style="width: 16%; text-align: center; float: left">
                    <a class="ex" v-on:click="setModule(6)"><h3>问答社区</h3></a>
                </div>
                <div style="width: 16%; text-align: center; float: left">
                    <a class="ex" v-on:click="setModule(7)"><h3>达人日志</h3></a>
                </div>
                <div style="width: 16%; text-align: center; float: left">
                    <a class="ex" v-on:click="setModule(8)"><h3>美图分享</h3></a>
                </div>
                <div style="width: 16%; text-align: center; float: left">
                    <a class="ex" v-on:click="setModule(9)"><h3>本地寄养</h3></a>
                </div>
                <div style="width: 16%; text-align: center; float: left">
                    <a class="ex" v-on:click="setModule(10)"><h3>同城交易</h3></a>
                </div>
            </div>
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
                <div id="pageMenu" style="margin-left: 20px"></div>
            </div>


            <div class="panel">
                <div class="panel-heading">
                    <span class="panel-icon">
                        <i class="fa fa-bar-chart-o"></i>
                    </span>
                    <span class="panel-title"> 发表新帖</span>
                </div>
                <div class="panel-body">
                    <input class="form-control" style="width: 1157px; margin-bottom: 20px" placeholder="贴子主题" v-model="addPost.title">
                    <select class="form-control" style="width: 1168px; margin-bottom: 20px; padding-left: 7px"
                            v-if="addPost.moduleId == null" v-model="addPost.moduleId">
                        <option value="6">问答社区</option>
                        <option value="7">达人日志</option>
                        <option value="8">美图分享</option>
                        <option value="9">本地寄养</option>
                        <option value="10">同城交易</option>
                    </select>
                    <div style="width:100%; height: 340px">
                        <div id="add_editor" v-on:focus="alertLogin"></div>
                    </div>
                    <#if Session.user?exists>
                        <button class="btn btn-sm btn-info" style="margin: 10px 0 10px 0" v-on:click="add">发 表</button>
                    <#else >
                        <button class="btn btn-sm btn-info" style="margin: 10px 0 10px 0" v-on:click="alertLogin">发 表</button>
                    </#if>
                </div>
            </div>
            <div class="panel" style="height: 100px"></div>
        </div>
    </div>
</div>
<#include '../include/footer.ftl'/>
<script src="<@s.url '/js/jquery.pagination-1.2.7.js'/>"></script>
<script src="<@s.url '/js/wangEditor/wangEditor.min.js'/>"></script>
<script>
    var app = new Vue({
        el: '#app',
        data: {
            editor: {},
            postInfo: {
                deleted: 0,
                page: 1,
                pageSize: 20
            },
            posts: [],
            addPost: {}
        },
        created: function () {
            var moduleId = getQueryString("moduleId");
            if (moduleId != null && moduleId != '') {
                this.postInfo.moduleId = moduleId;
                this.addPost.moduleId = moduleId;
            }
            this.queryPosts();
        },
        watch: {
            "postInfo.page": function () {
                this.queryPosts();
            }
        },
        mounted: function () {
            this.init();
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
            queryPosts: function () {
                var url = "/api/post/list";
                this.$http.post(url, this.postInfo).then(function (response) {
                    this.posts = response.data.data.list;
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
                                temp.postInfo.page = pageIndex + 1;
                            }).on('jumpClicked', function (event, pageIndex) {
                        temp.postInfo.page = pageIndex + 1;
                    });
                }, function (error) {
                    swal(error.body.msg);
                });
            },
            alertLogin: function () {
                swal("请先登录!");
            },
            setModule: function (i) {
                if (i == 0) {
                    this.postInfo.moduleId = null;
                    this.addPost.moduleId = null;
                    this.postInfo.page = 1;
                    $('#pageMenu').page('destroy');
                    this.queryPosts();
                } else {
                    this.postInfo.moduleId = i;
                    this.addPost.moduleId = i;
                    this.postInfo.page = 1;
                    $('#pageMenu').page('destroy');
                    this.queryPosts();
                }
            },
            add:function () {
                this.addPost.content = this.editor.txt.html();
                if (this.addPost.title == null) {
                    swal("请输入贴子主题");
                } else if (this.addPost.content.length < 26) {
                    swal("请输入十五字以上");
                } else {
                    var url = "/api/post/add";
                    this.$http.post(url, this.addPost).then(function (response) {
                        swal("发表成功！", "", "success");
                        this.queryPosts();
                    }, function (error) {
                        swal(error.body.msg);
                    });
                }
            }
        }
    });
</script>
</body>
</html>
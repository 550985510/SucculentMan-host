<#import "/spring.ftl" as s>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>个人中心 </title>
    <link rel="stylesheet" type="text/css" href="<@s.url '/css/theme.css'/>">
    <link rel="stylesheet" type="text/css" href="<@s.url '/plugins/sweetAlert/sweetalert.css'/>">
    <link rel="stylesheet" type="text/css" href="<@s.url '/css/jquery.pagination.css'/>">
</head>
<body>
<#include '../header.ftl'/>
<div id="app" class="main">
    <section id="content" class="table-layout">
        <div class="tray tray-center">
            <div class="row">
                <div class="panel col-md-3">
                    <div v-if="userInfo.background != null" class="panel-body" align="center" v-bind:style="{ backgroundImage: 'url(' + userInfo.background + ')'}"
                         style="height:270px;  background-size: 100% 50%; background-repeat: no-repeat">
                        <img v-bind:src="userInfo.avatar" class="img-circle"
                             style="width: 150px; height: 150px; border: 5px solid rgba(250,250,250)">
                        <h3 style="margin: 10px">{{userInfo.nickName}}</h3>
                        <span class="col-md-5">关注 {{followedNum}}</span>
                        <span class="col-md-4">粉丝 {{followerNum}}</span>
                    <#if Session.user?exists>
                        <button v-if="id === ${Session.user.id}" class="btn btn-info" v-on:click="accountEdit"
                                style="margin: 10px; width: 45%; height: 30px; line-height: 10px; border-radius: 5px">
                            <i class="fa fa-pencil"></i> 编辑
                        </button>
                        <button v-else-if="isFollowedFlag" class="btn btn-success" v-on:click="unFollow"
                                style="margin: 10px; width: 45%; height: 30px; line-height: 10px; border-radius: 5px">
                            <i class="fa fa-check"></i> 已关注
                        </button>
                        <button v-else="" class="btn btn-success" v-on:click="follow"
                                style="margin: 10px; width: 45%; height: 30px; line-height: 10px; border-radius: 5px">
                            <i class="fa fa-plus"></i> 关注
                        </button>
                    <#else>
                        <button class="btn btn-success" v-on:click="alertLogin"
                                style="margin: 10px; width: 45%; height: 30px; line-height: 10px; border-radius: 5px">
                            <i class="fa fa-plus"></i> 关注
                        </button>
                    </#if>
                    </div>
                </div>
                <div class="panel col-md-8">
                    <div class="panel-body" v-on:mouseenter="showEditBtn" v-on:mouseleave="hideEditBtn" align="center"
                         style="width:100%; height:270px; background-size: 100% 100%; background-repeat: no-repeat;"
                         v-bind:style="{ backgroundImage: 'url(' + userInfo.background + ')'}" v-if="userInfo.background != null">
                        <#if Session.user?exists>
                            <div v-if="id === ${Session.user.id}">
                                <input type="file" id="uploadInput" name="myFileName" style="display:none" v-on:change="uploadImg"/>
                                <button v-if="showBtn && !showSaveBtn" class="btn btn-default" style="float: right; background: rgba(75,75,75,0.4); color: #fff" v-on:click="editBackGround">修改封面</button>
                                <button v-if="showSaveBtn" class="btn btn-default" style="float: right; background: rgba(75,75,75,0.4); color: white" v-on:click="saveBackGround">保存封面</button>
                            </div>
                        </#if>
                    </div>
                </div>
            </div>
            <div class="panel">
                <div class="panel-body">
                    <ul id="myTab" class="nav nav-tabs">
                        <li class="active">
                            <a href="#followed" data-toggle="tab" style="border-radius: 8px 8px 0 0">关注的用户</a>
                        </li>
                        <li>
                            <a href="#follower" data-toggle="tab" style="border-radius: 8px 8px 0 0">达人的粉丝</a>
                        </li>
                    </ul>
                    <div id="myTabContent" class="tab-content">
                        <div id="followed" class="tab-pane fade in active">
                            <div class="panel-body" style="border-top: 0">
                                <div class="panel row" v-if="followedList.length != 0">
                                    <div class="panel-body" style="width: 28%; float: left; margin: 0 7px 14px 7px; border-bottom: 1px solid #e5e5e5" v-for="item in followedList">
                                        <div class="col-md-3">
                                            <a :href="'/user/personalCenter/' + item.followedId">
                                                <img :src="item.avatar" style="width: 60px; height: 60px; border-radius: 60px; border: 1px solid #e5e5e5">
                                            </a>
                                        </div>
                                        <div class="col-md-6">
                                            <a :href="'/user/personalCenter/' + item.followedId" style="color: #666">
                                                <h4 style="margin-top: 10px">{{item.nickName}}</h4>
                                            </a>
                                            <br>
                                            <span>关注: {{item.followedNum}}</span>&nbsp;&nbsp;&nbsp;
                                            <span>粉丝: {{item.followerNum}}</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="panel" v-else="">
                                    <h4>暂时没有关注的人</h4>
                                </div>
                                <div class="panel row">
                                    <div id="followedPageMenu"  style="margin: 14px"></div>
                                </div>
                            </div>
                        </div>
                        <div id="follower" class="tab-pane fade">
                            <div class="panel-body" style="border-top: 0">
                                <div class="panel row" v-if="followerList.length != 0">
                                    <div class="panel-body" style="width: 28%; float: left; margin:0 7px 14px 7px; border-bottom: 1px solid #e5e5e5" v-for="item in followerList">
                                        <div class="col-md-3">
                                            <a :href="'/user/personalCenter/' + item.userId">
                                                <img :src="item.avatar" style="width: 60px; height: 60px; border-radius: 60px; border: 1px solid #e5e5e5">
                                            </a>
                                        </div>
                                        <div class="col-md-6">
                                            <a :href="'/user/personalCenter/' + item.userId" style="color: #666">
                                                <h4 style="margin-top: 10px">{{item.nickName}}</h4>
                                            </a>
                                            <br>
                                            <span>关注: {{item.followedNum}}</span>&nbsp;&nbsp;&nbsp;
                                            <span>粉丝: {{item.followerNum}}</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="panel" v-else="">
                                    <h4>暂时没有粉丝</h4>
                                </div>
                                <div class="panel row">
                                    <div id="followerPageMenu" style="margin-left: 14px"></div>
                                </div>
                            </div>
                        </div>
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
            id: ${userId},
            userInfo: {},
            isFollowedFlag: false,
            followedNum: 0,
            followerNum: 0,
            showBtn: false,
            showSaveBtn: false,
            followedList: [],
            followerList: [],
            followedPageInfo: {
                page: 1,
                pageSize: 18,
                userId: ${userId}
            },
            followerPageInfo: {
                page: 1,
                pageSize: 18,
                userId: ${userId}
            }
        },
        created: function () {
            this.query();
            this.isFollowed();
            this.findFollowedNum();
            this.findFollowerNum();
            this.findFollowedList();
            this.findFollowerList();
        },
        mounted: function () {
        },
        watch: {
            "followedPageInfo.page": function () {
                this.findFollowedList();
            },
            "followerPageInfo.page": function () {
                this.findFollowerList();
            }
        },
        methods: {
            query: function () {
                var url = "/api/user/findById?id=" + this.id;
                this.$http.get(url, this.id).then(function (response) {
                    this.userInfo = response.data.data;
                    if (this.userInfo == null) {
                        window.location.href = "/error_404";
                    }
                }, function (error) {
                    swal(error.body.msg);
                });
            },
            alertLogin: function () {
                swal("请先登录!");
            },
            isFollowed: function () {
                var url = "/api/follow/isFollowed?followedId=" + this.id;
                this.$http.get(url, this.id).then(function (response) {
                    this.isFollowedFlag = response.data.data;
                }, function (error) {
                    swal(error.body.msg);
                });
            },
            follow: function () {
                var url = "/api/follow/follow?followedId=" + this.id;
                this.$http.get(url, this.id).then(function (response) {
                    this.isFollowedFlag = true;
                    this.findFollowedNum();
                    this.findFollowerNum();
                }, function (error) {
                    swal(error.body.msg);
                });
            },
            unFollow: function () {
                var url = "/api/follow/unFollow?followedId=" + this.id;
                this.$http.get(url, this.id).then(function (response) {
                    this.isFollowedFlag = false;
                    this.findFollowedNum();
                    this.findFollowerNum();
                }, function (error) {
                    swal(error.body.msg);
                });
            },
            findFollowedNum: function () {
                var url = "/api/follow/followedNum?userId=" + this.id;
                this.$http.get(url, this.id).then(function (response) {
                    this.followedNum = response.data.data;
                }, function (error) {
                    swal(error.body.msg);
                });
            },
            findFollowerNum: function () {
                var url = "/api/follow/followerNum?followedId=" + this.id;
                this.$http.get(url, this.id).then(function (response) {
                    this.followerNum = response.data.data;
                }, function (error) {
                    swal(error.body.msg);
                });
            },
            accountEdit: function () {
                window.location.href = "/user/accountEdit";
            },
            showEditBtn: function () {
                this.showBtn = true;
            },
            hideEditBtn: function () {
                this.showBtn = false;
            },
            editBackGround: function () {
                this.showBtn = false;
                this.showSaveBtn = true;
                $("#uploadInput").click();
            },
            saveBackGround: function () {
                var that = this;
                var url = "/api/user/edit/background";
                this.$http.post(url, this.userInfo).then(function (response) {
                    if (response.data.retcode != 2000000) {
                        swal(response.data.msg, "", "error");
                    } else {
                        swal({
                            title: "修改成功!",
                            text: "",
                            type: "success"
                        }, function () {
                            that.showBtn = true;
                            that.showSaveBtn = false;
                        });
                    }
                }, function (error) {
                    swal(error.body.msg);
                });
            },
            uploadImg: function (e) {
                var logoFile = e.target.files[0];
                var form = new FormData();
                form.append("myFileName",logoFile);
                var that = this;
                $.ajax({
                    url: "/api/upload/img",
                    type:"post",
                    data: form,
                    processData:false,
                    contentType:false,
                    success:function(response){
                        if(response.retcode !== 2000000){
                            sweetAlert(response.msg)
                        } else {
                            that.userInfo.background = response.data;
                        }
                    },
                    error:function(e){
                        sweetAlert(e.toString());
                    }
                });
            },
            findFollowedList: function () {
                var url = "/api/follow/followedList";
                this.$http.post(url, this.followedPageInfo).then(function (response) {
                    this.followedList = response.data.data.list;
                    var temp = this;
                    $("#followedPageMenu").page({//加载分页
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
                                temp.followedPageInfo.page = pageIndex + 1;
                            }).on('jumpClicked', function (event, pageIndex) {
                        temp.followedPageInfo.page = pageIndex + 1;
                    });
                }, function (error) {
                    swal(error.body.msg);
                });
            },
            findFollowerList: function () {
                var url = "/api/follow/followerList";
                this.$http.post(url, this.followerPageInfo).then(function (response) {
                    this.followerList = response.data.data.list;
                    var temp = this;
                    $("#followerPageMenu").page({//加载分页
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
                                temp.followerPageInfo.page = pageIndex + 1;
                            }).on('jumpClicked', function (event, pageIndex) {
                        temp.followerPageInfo.page = pageIndex + 1;
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
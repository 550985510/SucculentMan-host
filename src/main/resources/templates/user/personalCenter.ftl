<#import "/spring.ftl" as s>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>个人中心 </title>
    <link rel="stylesheet" type="text/css" href="<@s.url '/css/theme.css'/>">
    <link rel="stylesheet" type="text/css" href="<@s.url '/plugins/sweetAlert/sweetalert.css'/>">
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
                            <a href="#home" data-toggle="tab" style="border-radius: 8px 8px 0 0">关注的用户</a>
                        </li>
                        <li>
                            <a href="#ios" data-toggle="tab" style="border-radius: 8px 8px 0 0">达人的粉丝</a>
                        </li>
                    </ul>
                    <div id="myTabContent" class="tab-content">
                        <div id="home" class="tab-pane fade in active">
                            <div class="panel-body" style="border-top: 0">
                                <p>
                                    菜鸟教程是一个提供最新的web技术站点，本站免费提供了建站相关的技术文档，帮助广大web技术爱好者快速入门并建立自己的网站。菜鸟先飞早入行——学的不仅是技术，更是梦想。</p>
                            </div>
                        </div>
                        <div id="ios" class="tab-pane fade">
                            <div class="panel-body" style="border-top: 0">
                                <p>iOS 是一个由苹果公司开发和发布的手机操作系统。最初是于 2007 年首次发布 iPhone、iPod Touch 和 Apple
                                    TV。iOS 派生自 OS X，它们共享 Darwin 基础。OS X 操作系统是用在苹果电脑上，iOS 是苹果的移动版本。
                                </p>
                            </div>
                        </div>
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
            id: ${userId},
            userInfo: {},
            isFollowedFlag: false,
            followedNum: 0,
            followerNum: 0,
            showBtn: false,
            showSaveBtn: false
        },
        created: function () {
            this.query();
            this.isFollowed();
            this.findFollowedNum();
            this.findFollowerNum();
        },
        mounted: function () {
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
            }
        }
    });
</script>
</body>
</html>
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
        <div class="tray tray-center row">
            <div class="panel col-md-3">
                <div class="panel-body" align="center">
                    <img v-bind:src="userInfo.avatar" class="img-circle img-responsive"
                         style="width: 150px; height: 150px; border: 3px solid #f8f8f8">
                    <h3 style="margin: 10px">{{userInfo.nickName}}</h3>
                    <span class="col-md-5">关注 {{followedNum}}</span>
                    <span class="col-md-4">粉丝 {{followerNum}}</span>
                    <#if Session.user?exists>
                        <button v-if="id === ${Session.user.id}" class="btn btn-info"
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
                        <button class="btn btn-success"  v-on:click="alertLogin"
                                style="margin: 10px; width: 45%; height: 30px; line-height: 10px; border-radius: 5px">
                            <i class="fa fa-plus"></i> 关注
                        </button>
                    </#if>
                </div>
            </div>
            <div class="panel col-md-8">
                <div class="panel-body"></div>
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
            followerNum: 0
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
            }
        }
    });
</script>
</body>
</html>
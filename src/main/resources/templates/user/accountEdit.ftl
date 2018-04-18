<#import "/spring.ftl" as s>
<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/html">
<head>
    <meta charset="UTF-8">
    <title>个人中心 </title>
    <link rel="stylesheet" type="text/css" href="<@s.url '/css/theme.css'/>">
    <link rel="stylesheet" type="text/css" href="<@s.url '/plugins/sweetAlert/sweetalert.css'/>">
    <link href="<@s.url '/css/fileinput.css'/>" rel="stylesheet" type="text/css">
</head>
<body>
<#include '../header.ftl'/>
<div id="app">
    <section id="content" class="table-layout">
        <div class="tray tray-center row">
            <div class="panel">
                <ul id="myTab" class="nav nav-tabs">
                    <li class="active">
                        <a href="#baseInfo" data-toggle="tab" style="border-radius: 8px 8px 0 0">基本信息</a>
                    </li>
                    <li>
                        <a href="#editPassWord" data-toggle="tab" style="border-radius: 8px 8px 0 0">修改密码</a>
                    </li>
                </ul>
                <div id="myTabContent" class="tab-content">
                    <div id="baseInfo" class="tab-pane fade in active">
                        <div class="panel-body" style="border-top: 0">
                            <div class="section row mbn">
                                <div class="col-md-2">
                                    <div class="form-group">
                                        <input type="file" id="input-file" name="myFileName" class="file-loading"/>
                                    </div>
                                </div>
                                <div class="col-md-9">
                                    <p style="font-size: 12px; color: #b6b6b6; margin: 5px">作为多肉达人，大家都是“有头有脸”的朋友，上传头像让大家更快认识您。</p>
                                    <p style="font-size: 12px; color: #b6b6b6; margin: 5px">选择喜欢的图片作为您的头像。</p>
                                    <button class="btn btn-info" style="margin: 5px" v-on:click="uploadBtn"><i class="fa fa-arrow-up"></i> 上传头像</button>
                                    <p style="font-size: 12px; color: #b6b6b6; margin: 15px 5px 5px 5px">上传成功后点击保存按钮才会生效喔！</p>
                                </div>
                            </div>
                            <hr style="margin: 10px 0 20px 0; border: 0.5px solid #d5f6ff"/>
                            <div>
                                <div class="row" style="margin: 10px">
                                    <div class="col-md-2">
                                        <label class="form-control" style="text-align: right; line-height: 39px; border: 0">昵 称：</label>
                                    </div>
                                    <div class="col-md-9">
                                        <input type="text" class="form-control" v-model="userInfo.nickName" style="width: 40%" readonly="readonly">
                                    </div>
                                </div>
                                <div class="row" style="margin: 10px">
                                    <div class="col-md-2">
                                        <label class="form-control" style="text-align: right; line-height: 39px; border: 0">真实姓名：</label>
                                    </div>
                                    <div class="col-md-9">
                                        <input type="text" class="form-control" v-model="userInfo.name" style="width: 40%">
                                    </div>
                                </div>
                                <div class="row" style="margin: 10px">
                                    <div class="col-md-2">
                                        <label class="form-control"
                                               style="text-align: right; line-height: 39px; border: 0">性 别：
                                        </label>
                                    </div>
                                    <div class="col-md-9">
                                        <div class="form-control" style="line-height: 39px; border: 0">
                                            <input type="radio" name="gender" value="0" v-model="userInfo.gender">
                                            <label class="label label-success">
                                                <i class="fa fa-mars"></i> 男
                                            </label>
                                            <input type="radio" name="gender" value="1" v-model="userInfo.gender"
                                                   style="margin: 0 0 0 10px">
                                            <label class="label label-success">
                                                <i class="fa fa-venus"></i> 女
                                            </label>
                                        </div>
                                    </div>
                                </div>
                                <div class="row" style="margin: 10px">
                                    <div class="col-md-2">
                                        <label class="form-control"
                                               style="text-align: right; line-height: 39px; border: 0">邮 箱：
                                        </label>
                                    </div>
                                    <div class="col-md-9">
                                        <input type="email" class="form-control" v-model="userInfo.email" style="width: 40%">
                                    </div>
                                </div>
                            </div>
                            <hr style="margin: 20px 0 20px 0; border: 0.5px solid #d5f6ff"/>
                            <button class="btn btn-info" v-on:click="saveInfo" style="float: right">
                                <i class="fa fa-pencil"></i> 保存修改
                            </button>
                        </div>
                    </div>
                    <div id="editPassWord" class="tab-pane fade">
                        <div class="panel-body" style="border-top: 0">

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>
<#include '../include/footer.ftl'/>
<script src="<@s.url '/js/fileinput.js'/>"></script>
<script src="<@s.url '/js/zh.js'/>"></script>
<script>
    var app = new Vue({
        el: '#app',
        data: {
            id: ${Session.user.id},
            userInfo: {},
            regName: {},
            regEmail: {}
        },
        created: function () {
            this.query();
        },
        mounted: function () {
        },
        watch: {
            "userInfo.name": function () {
                if (this.userInfo.name != null && this.userInfo.name != '') {
                    this.checkName();
                } else {
                    this.regName = {};
                }
            },
            "userInfo.email": function () {
                if (this.userInfo.email != null && this.userInfo.email != '') {
                    this.checkEmail();
                } else {
                    this.regEmail = {};
                }
            }
        },
        methods: {
            query: function () {
                var url = "/api/user/findById?id=" + this.id;
                this.$http.get(url, this.id).then(function (response) {
                    this.userInfo = response.data.data;
                    var _self = this;
                    var imageAvatar = response.data.data.avatar;
                    this.$nextTick(function () {
                        $("#input-file").fileinput({
                            uploadUrl: "/api/upload/img", //上传的地址
                            overwriteInitial: true,
                            language: 'zh', //设置语言
                            showClose: false,
                            showCaption: false,
                            showBrowse: false,
                            browseOnZoneClick: true,
                            removeLabel: '',
                            removeIcon: '<i class="glyphicon glyphicon-remove"></i>',
                            removeTitle: 'Cancel or reset changes',
                            msgErrorClass: 'alert alert-block alert-danger',
                            defaultPreviewContent: '<img src="' + imageAvatar + '" class="thumb" width="100px">'
                        }).on("fileuploaded", function (e, result) {
                            _self.userInfo.avatar = result.response.data;
                        });
                    });
                }, function (error) {
                    swal(error.body.msg);
                });
            },
            uploadBtn: function () {
                $("#input-file").click();
            },
            saveInfo: function () {
                if (this.regName.retcode != 2000000 && this.regName.msg != null) {
                    swal(this.regName.msg, "", "error");
                } else if (this.regEmail.retcode != 2000000 && this.regEmail.msg != null) {
                    swal(this.regEmail.msg, "", "error");
                } else {
                    var url = "/api/user/edit/baseInfo";
                    this.$http.post(url, this.userInfo).then(function (response) {
                        if (response.data.retcode != 2000000) {
                            swal(response.data.msg, "", "error");
                        } else {
                            swal({
                                title: "修改成功!",
                                text: "",
                                type: "success"
                            }, function () {
                                location.reload();
                            });
                        }
                    }, function (error) {
                        swal(error.body.msg);
                    });
                }
            },
            checkName: function () {
                var url = "/api/check/name?name=" + this.userInfo.name;
                this.$http.post(url).then(function (response) {
                    this.regName = response.data;
                }, function (error) {
                    swal(error.body.msg);
                });
            },
            checkEmail: function () {
                var url = "/api/check/email?email=" + this.userInfo.email;
                this.$http.post(url).then(function (response) {
                    this.regEmail = response.data;
                }, function (error) {
                    swal(error.body.msg);
                });
            }
        }
    });

</script>
</body>
</html>
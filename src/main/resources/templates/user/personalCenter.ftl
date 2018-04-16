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
                    <img v-bind:src="userInfo.avatar" class="img-circle img-responsive" style="width: 150px; height: 150px; border: 3px solid #f8f8f8">
                    <h3 style="margin: 10px">{{userInfo.nickName}}</h3>
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
            userInfo: {}
        },
        created: function () {
            this.query();
        },
        mounted: function () {
        },
        methods: {
            query: function () {
                var url = "/api/user/findById?id=" + this.id;
                this.$http.get(url, this.id).then(function (response) {
                    this.userInfo = response.data.data;
                    console.log(this.userInfo)
                }, function (error) {
                    swal(error.body.msg);
                });
            }
        }
    });
</script>
</body>
</html>
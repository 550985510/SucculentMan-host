<#import "/spring.ftl" as s>
<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/html">
<head>
    <meta charset="UTF-8">
    <title>达人推荐 </title>
    <link rel="stylesheet" type="text/css" href="<@s.url '/css/theme.css'/>">
    <link rel="stylesheet" type="text/css" href="<@s.url '/plugins/sweetAlert/sweetalert.css'/>">
    <link rel="stylesheet" type="text/css" href="<@s.url '/css/jquery.pagination.css'/>">
</head>
<body>
<#include '../header.ftl'/>
<div id="app" style="background: #fff">
    <section id="content" class="table-layout">
        <div class="tray tray-center">
            <div class="panel row">
                <div class="panel-body" style="width: 42%; float: left; margin: 0 20px 20px 0; border-bottom: 2px solid #e5e5e5" v-for="item in users">
                    <div class="col-md-3">
                        <a :href="'/user/personalCenter/' + item.id">
                            <img :src="item.avatar" style="width: 80px; height: 80px; border-radius: 80px; border: 1px solid #e5e5e5">
                        </a>
                    </div>
                    <div class="col-md-4">
                        <a :href="'/user/personalCenter/' + item.id" style="color: #666">
                            <h4 style="margin-top: 10px">{{item.nickName}}</h4>
                        </a>
                        <br>
                        <span>关注: {{item.followedNum}}</span>
                        <br>
                        <span>粉丝: {{item.followerNum}}</span>
                    </div>
                </div>
            </div>
            <div class="panel">
                <div id="pageMenu"></div>
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
            users: [],
            pageInfo: {
                page: 1,
                pageSize: 20
            }
        },
        created: function () {
            this.query();
        },
        mounted: function () {

        },
        watch: {
            "pageInfo.page": function () {
                this.query();
            }
        },
        methods: {
            query: function () {
                var url = "/api/user/findAll";
                this.$http.post(url, this.pageInfo).then(function (response) {
                    this.users = response.data.data.list;
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
                                temp.pageInfo.page = pageIndex + 1;
                            }).on('jumpClicked', function (event, pageIndex) {
                        temp.pageInfo.page = pageIndex + 1;
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
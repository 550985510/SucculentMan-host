<#import "/spring.ftl" as s>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>个人中心</title>
    <link rel="stylesheet" type="text/css" href="<@s.url '/css/theme.css'/>">
    <link rel="stylesheet" type="text/css" href="<@s.url '/plugins/sweetAlert/sweetalert.css'/>">
</head>
<body>
<#include '../header.ftl'/>
<div class="main">
    <section id="content" class="table-layout">
        <div class="tray tray-center row">
            <div class="panel col-md-3">
                <div class="panel-body" align="center">
                    <img src="${Session.user.avatar}" class="img-responsive img-circle">
                    <img src="http://manager.tangdoudou.club/manager/02057561-318a-4e0a-b46d-38b8496ed1db-201803211423.jpg" class="img-circle img-responsive" width="200px" height="200px">
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
        el: '#main',
        data: {
            id: ${userId}
        },
        created: function () {
            console.log(this.id)
        },
        mounted: function () {
        },
        methods: {

        }
    });
</script>
</body>
</html>
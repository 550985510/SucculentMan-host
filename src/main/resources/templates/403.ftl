<#import "/spring.ftl" as s>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>403错误页面</title>
    <link rel="stylesheet" type="text/css" href="<@s.url '/css/error_page.css'/>">
</head>
<body>
<#include 'header.ftl'/>
<div class="container" style=" margin-top:8%;"> 
   <div class="panel margin-big-top">
      <div class="text-center">
         <br>
         <h4 class="padding-top">
             <stong>403错误！抱歉您没有访问权限</stong>
         </h4>
         <div>
            <div class="float-left">
                <img src="/img/ds-1.gif">
                <div class="alert"> 艾玛！没有访问权限！ </div>
            </div>
            <div class="float-right">
               <img src="/img/ds-2.png" width="260">
            </div>
          </div>
          <div class="padding-big">
               <a href="/index" class="button bg-yellow">返回首页</a>
               <a href="" class="button">保证不打死管理员</a>
          </div> 
      </div> 
   </div> 
</div>
</body>
</html>

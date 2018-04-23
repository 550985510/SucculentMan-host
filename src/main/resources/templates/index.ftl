<#import "/spring.ftl" as s>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>多肉达人一站式服务品牌</title>
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/index.css">
    <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="http://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style>
        .carousel-title {
            left: 7% !important;
            width: 600px;
            border-radius: 5px;
            height: 64px;
            position: absolute;
            line-height: 12px;
            color: #fff;
            font-size: 28px;
            padding-left: 17px;
            background-color: rgba(0, 0, 0, 0.65);
        }
    </style>
</head>
<body>
<#include 'header.ftl'/>
<div id="app">
    <div class="main">
        <div class="main-inner body-width">
            <div class="banner clearfix">
                <div id="Carousel" data-ride="carousel" class="carousel slide carousel-fade"
                     style="width: 712px; height: 445px; float: left">
                    <!-- 圆点 -->
                    <ol class="carousel-indicators">
                        <li data-target="#Carousel" data-slide-to="0" class="active"></li>
                        <li data-target="#Carousel" data-slide-to="1"></li>
                        <li data-target="#Carousel" data-slide-to="2"></li>
                        <li data-target="#Carousel" data-slide-to="3"></li>
                        <li data-target="#Carousel" data-slide-to="4"></li>
                    </ol>
                    <!-- 图片 -->
                    <div class="carousel-inner">
                        <div class="item active">
                            <a href="#"><img class="img-responsive" :src="bannerArticles[0].img" alt=""
                                             style="width: 712px; height: 445px"></a>
                            <div class="carousel-caption carousel-title">{{bannerArticles[0].title}}</div>
                        </div>
                        <div class="item">
                            <a href="#"><img class="img-responsive" :src="bannerArticles[1].img" alt=""
                                             style="width: 712px; height: 445px"></a>
                            <div class="carousel-caption carousel-title">{{bannerArticles[1].title}}</div>
                        </div>
                        <div class="item">
                            <a href="#"><img class="img-responsive" :src="bannerArticles[2].img" alt=""
                                             style="width: 712px; height: 445px"></a>
                            <div class="carousel-caption carousel-title">{{bannerArticles[2].title}}</div>
                        </div>
                        <div class="item">
                            <a href="#"><img class="img-responsive" :src="bannerArticles[3].img" alt=""
                                             style="width: 712px; height: 445px"></a>
                            <div class="carousel-caption carousel-title">{{bannerArticles[3].title}}</div>
                        </div>
                        <div class="item">
                            <a href="#"><img class="img-responsive" :src="bannerArticles[4].img" alt=""
                                             style="width: 712px; height: 445px"></a>
                            <div class="carousel-caption carousel-title">{{bannerArticles[4].title}}</div>
                        </div>
                    </div>
                    <a href="#Carousel" class="left carousel-control" data-slide="prev">
                        <!-- 箭头图片 -->
                        <span class="glyphicon glyphicon-chevron-left"></span>
                    </a>
                    <a href="#Carousel" class="right carousel-control" data-slide="next">
                        <!-- 箭头图片 -->
                        <span class="glyphicon glyphicon-chevron-right"></span>
                    </a>
                </div>
                <div class="banner-info">
                    <div class="news body-border">
                        <ul>
                            <li class="title">社区热点</li>
                            <li class="link">
                                <a href="#">冬天</a>
                                <span></span>
                                <a href="#">把生活过成一首诗</a>
                                <span></span>
                                <a href="#">早餐</a>
                                <span></span>
                                <a href="#">记下时间走过的路</a>
                                <span></span>
                                <a href="#">穿搭</a>
                                <span></span>
                                <a href="#">家居</a>
                                <span></span>
                                <a href="#">原创</a>
                                <span></span>
                            </li>
                            <li class="choose">
                                <a href="#">『人气连衣裙精选』 大合集</a>
                                <span class="icon-text__pink">精选</span>
                            </li>
                            <li class="assistant">
                                <p>收图小助手: <a href="#">tang收集工具</a></p>
                            </li>
                        </ul>
                    </div>
                    <div class="app body-border"><a href="#"></a></div>
                </div>
            </div>
            <div class="main-cont main-album">
                <div class="main-cont__title">
                    <h3>专辑精选</h3>
                    <a href="#" class="more">往期回顾 ></a>
                </div>
                <ul class="main-cont__list clearfix">
                    <li class="item">
                        <a href="#" class="pic"><img src="img/cont/main_img1.jpg" alt="#"></a>
                        <div class="info">
                            <a href="#" class="title">你的书写工具需要一个庇护所</a>
                            <p>68张图片 · 2255人收藏</p>
                            <p>by <a href="#" class="author">Moollly</a></p>
                        </div>
                    </li>
                    <li class="item">
                        <a href="#" class="pic"><img src="img/cont/main_img2.jpg" alt="#"></a>
                        <div class="info">
                            <a href="#" class="title">你的书写工具需要一个庇护所</a>
                            <p>68张图片 · 2255人收藏</p>
                            <p>by <a href="#" class="author">Moollly</a></p>
                        </div>
                    </li>
                    <li class="item">
                        <a href="#" class="pic"><img src="img/cont/main_img3.jpg" alt="#"></a>
                        <div class="info">
                            <a href="#" class="title">你的书写工具需要一个庇护所</a>
                            <p>68张图片 · 2255人收藏</p>
                            <p>by <a href="#" class="author">Moollly</a></p>
                        </div>
                    </li>
                    <li class="item">
                        <a href="#" class="pic"><img src="img/cont/main_img4.jpg" alt="#"></a>
                        <div class="info">
                            <a href="#" class="title">你的书写工具需要一个庇护所</a>
                            <p>68张图片 · 2255人收藏</p>
                            <p>by <a href="#" class="author">Moollly</a></p>
                        </div>
                    </li>
                    <li class="item">
                        <a href="#" class="pic"><img src="img/cont/main_img5.jpg" alt="#"></a>
                        <div class="info">
                            <a href="#" class="title">你的书写工具需要一个庇护所</a>
                            <p>68张图片 · 2255人收藏</p>
                            <p>by <a href="#" class="author">Moollly</a></p>
                        </div>
                    </li>
                </ul>
            </div>
            <div class="main-cont main-recommend">
                <div class="main-cont__title">
                    <h3>单品推荐</h3>
                    <p class="list">
                        <em>良品购：</em>
                        <a href="#">全部</a>
                        <span>|</span>
                        <a href="#">上衣</a>
                        <span>|</span>
                        <a href="#">裙裤</a>
                        <span>|</span>
                        <a href="#">配饰</a>
                        <span>|</span>
                        <a href="#">鞋子</a>
                        <span>|</span>
                        <a href="#">包袋</a>
                        <span>|</span>
                        <a href="#">日杂</a>
                    </p>
                </div>
                <ul class="main-cont__list clearfix">
                    <li class="item">
                        <a href="#" class="pic"><img src="img/cont/main_img6.jpg" alt="#"></a>
                        <div class="info">
                            <a href="#" class="title">夹克</a>
                            <span>18739人在逛</span>
                            <a href="#" class="icon-text__pink purchase">良品购</a>
                        </div>
                    </li>
                    <li class="item">
                        <a href="#" class="pic"><img src="img/cont/main_img7.jpg" alt="#"></a>
                        <div class="info">
                            <a href="#" class="title">夹克</a>
                            <span>18739人在逛</span>
                            <a href="#" class="icon-text__pink purchase">良品购</a>
                        </div>
                    </li>
                    <li class="item">
                        <a href="#" class="pic"><img src="img/cont/main_img8.jpg" alt="#"></a>
                        <div class="info">
                            <a href="#" class="title">夹克</a>
                            <span>18739人在逛</span>
                            <a href="#" class="icon-text__pink purchase">良品购</a>
                        </div>
                    </li>
                    <li class="item">
                        <a href="#" class="pic"><img src="img/cont/main_img9.jpg" alt="#"></a>
                        <div class="info">
                            <a href="#" class="title">夹克</a>
                            <span>18739人在逛</span>
                            <a href="#" class="icon-text__pink purchase">良品购</a>
                        </div>
                    </li>
                    <li class="item">
                        <a href="#" class="pic"><img src="img/cont/main_img10.jpg" alt="#"></a>
                        <div class="info">
                            <a href="#" class="title">夹克</a>
                            <span>18739人在逛</span>
                            <a href="#" class="icon-text__pink purchase">良品购</a>
                        </div>
                    </li>
                </ul>
            </div>
            <div class="main-cont main-user">
                <div class="main-cont__title">
                    <h3>达人推荐</h3>
                    <a href="#" class="more">更多达人 ></a>
                </div>
                <ul class="main-cont__list clearfix">
                    <li class="item">
                        <a href="#" class="pic"
                           style=" background: url(img/cont/user_img1.jpg) no-repeat; background-size: cover; "></a>
                        <a href="#" class="headImg"><img src="img/cont/head_img1.jpeg" alt="#"></a>
                        <div class="info">
                            <a href="#" class="info-title">虽虽酱</a>
                            <p><i class="icon-star"></i>9645</p>
                            <p>擅长领域: <b>Q版</b></p>
                        </div>
                    </li>
                    <li class="item">
                        <a href="#" class="pic"
                           style=" background: url(img/cont/user_img2.jpg) no-repeat; background-size: cover; "></a>
                        <a href="#" class="headImg"><img src="img/cont/head_img2.jpeg" alt="#"></a>
                        <div class="info">
                            <a href="#" class="info-title">虽虽酱</a>
                            <p><i class="icon-star"></i>9645</p>
                            <p>擅长领域: <b>Q版</b></p>
                        </div>
                    </li>
                    <li class="item">
                        <a href="#" class="pic"
                           style=" background: url(img/cont/user_img3.jpg) no-repeat; background-size: cover; "></a>
                        <a href="#" class="headImg"><img src="img/cont/head_img3.jpeg" alt="#"></a>
                        <div class="info">
                            <a href="#" class="info-title">虽虽酱</a>
                            <p><i class="icon-star"></i>9645</p>
                            <p>擅长领域: <b>Q版</b></p>
                        </div>
                    </li>
                    <li class="item">
                        <a href="#" class="pic"
                           style=" background: url(img/cont/user_img4.jpg) no-repeat; background-size: cover; "></a>
                        <a href="#" class="headImg"><img src="img/cont/head_img4.jpeg" alt="#"></a>
                        <div class="info">
                            <a href="#" class="info-title">虽虽酱</a>
                            <p><i class="icon-star"></i>9645</p>
                            <p>擅长领域: <b>Q版</b></p>
                        </div>
                    </li>
                    <li class="item">
                        <a href="#" class="pic"
                           style=" background: url(img/cont/user_img5.jpg) no-repeat; background-size: cover; "></a>
                        <a href="#" class="headImg"><img src="img/cont/head_img5.jpeg" alt="#"></a>
                        <div class="info">
                            <a href="#" class="info-title">虽虽酱</a>
                            <p><i class="icon-star"></i>9645</p>
                            <p>擅长领域: <b>Q版</b></p>
                        </div>
                    </li>
                </ul>
            </div>
            <div class="main-cont main-waterfall">
                <div class="main-cont__title">
                    <h3>大家正在逛</h3>
                </div>
                <ul class="main-cont__list clearfix">
                    <li class="item item-cur">
                        <a href="#" class="pic">
                            <img src="img/cont/waterfall_img1.jpg" alt="#">
                        </a>
                        <div class="waterfall-hover">
                            <span class="mask"></span>
                            <a href="#" class="btn-collect">收集 45</a>
                            <a href="#" class="btn-white btn-like"></a>
                            <a href="#" class="btn-white btn-comment"></a>
                        </div>
                        <div class="waterfall-info">
                            <p class="title">Fendi（芬迪） 2017早春度假系列</p>
                            <p class="icon"><span class="icon-star">89</span><span class="icon-like">10</span></p>
                        </div>
                        <div class="collect-info">
                            <a href="#" class="headImg"><img src="img/cont/waterfall_headImg1.jpeg" alt="#"></a>
                            <p class="title"><a href="#">大祁Y</a></p>
                            <p class="to">收集到<a href="#">时尚语型录</a></p>
                        </div>
                    </li>
                    <li class="item">
                        <a href="#" class="pic">
                            <img src="img/cont/waterfall_img2.jpg" alt="#">
                        </a>
                        <div class="waterfall-hover">
                            <span class="mask"></span>
                            <a href="#" class="btn-collect">收集 45</a>
                            <a href="#" class="btn-white btn-like"></a>
                            <a href="#" class="btn-white btn-comment"></a>
                        </div>
                        <div class="waterfall-info">
                            <p class="title">Fendi（芬迪） 2017早春度假系列</p>
                            <p class="icon"><span class="icon-star">89</span><span class="icon-like">10</span></p>
                        </div>
                        <div class="collect-info">
                            <a href="#" class="headImg"><img src="img/cont/waterfall_headImg1.jpeg" alt="#"></a>
                            <p class="title"><a href="#">大祁Y</a></p>
                            <p class="to">收集到<a href="#">时尚语型录</a></p>
                        </div>
                    </li>
                    <li class="item">
                        <a href="#" class="pic">
                            <img src="img/cont/waterfall_img3.jpg" alt="#">
                        </a>
                        <div class="waterfall-hover">
                            <span class="mask"></span>
                            <a href="#" class="btn-collect">收集 45</a>
                            <a href="#" class="btn-white btn-like"></a>
                            <a href="#" class="btn-white btn-comment"></a>
                        </div>
                        <div class="waterfall-info">
                            <p class="title">Fendi（芬迪） 2017早春度假系列</p>
                            <p class="icon"><span class="icon-star">89</span><span class="icon-like">10</span></p>
                        </div>
                        <div class="collect-info">
                            <a href="#" class="headImg"><img src="img/cont/waterfall_headImg1.jpeg" alt="#"></a>
                            <p class="title"><a href="#">大祁Y</a></p>
                            <p class="to">收集到<a href="#">时尚语型录</a></p>
                        </div>
                    </li>
                    <li class="item">
                        <a href="#" class="pic">
                            <img src="img/cont/waterfall_img4.jpg" alt="#">
                        </a>
                        <div class="waterfall-hover">
                            <span class="mask"></span>
                            <a href="#" class="btn-collect">收集 45</a>
                            <a href="#" class="btn-white btn-like"></a>
                            <a href="#" class="btn-white btn-comment"></a>
                        </div>
                        <div class="waterfall-info">
                            <p class="title">Fendi（芬迪） 2017早春度假系列</p>
                            <p class="icon"><span class="icon-star">89</span><span class="icon-like">10</span></p>
                        </div>
                        <div class="collect-info">
                            <a href="#" class="headImg"><img src="img/cont/waterfall_headImg1.jpeg" alt="#"></a>
                            <p class="title"><a href="#">大祁Y</a></p>
                            <p class="to">收集到<a href="#">时尚语型录</a></p>
                        </div>
                    </li>
                    <li class="item">
                        <a href="#" class="pic">
                            <img src="img/cont/waterfall_img5.jpg" alt="#">
                        </a>
                        <div class="waterfall-hover">
                            <span class="mask"></span>
                            <a href="#" class="btn-collect">收集 45</a>
                            <a href="#" class="btn-white btn-like"></a>
                            <a href="#" class="btn-white btn-comment"></a>
                        </div>
                        <div class="waterfall-info">
                            <p class="title">Fendi（芬迪） 2017早春度假系列</p>
                            <p class="icon"><span class="icon-star">89</span><span class="icon-like">10</span></p>
                        </div>
                        <div class="collect-info">
                            <a href="#" class="headImg"><img src="img/cont/waterfall_headImg1.jpeg" alt="#"></a>
                            <p class="title"><a href="#">大祁Y</a></p>
                            <p class="to">收集到<a href="#">时尚语型录</a></p>
                        </div>
                    </li>
                    <li class="item">
                        <a href="#" class="pic">
                            <img src="img/cont/waterfall_img1.jpg" alt="#">
                        </a>
                        <div class="waterfall-hover">
                            <span class="mask"></span>
                            <a href="#" class="btn-collect">收集 45</a>
                            <a href="#" class="btn-white btn-like"></a>
                            <a href="#" class="btn-white btn-comment"></a>
                        </div>
                        <div class="waterfall-info">
                            <p class="title">Fendi（芬迪） 2017早春度假系列</p>
                            <p class="icon"><span class="icon-star">89</span><span class="icon-like">10</span></p>
                        </div>
                        <div class="collect-info">
                            <a href="#" class="headImg"><img src="img/cont/waterfall_headImg1.jpeg" alt="#"></a>
                            <p class="title"><a href="#">大祁Y</a></p>
                            <p class="to">收集到<a href="#">时尚语型录</a></p>
                        </div>
                    </li>
                    <li class="item">
                        <a href="#" class="pic">
                            <img src="img/cont/waterfall_img2.jpg" alt="#">
                        </a>
                        <div class="waterfall-hover">
                            <span class="mask"></span>
                            <a href="#" class="btn-collect">收集 45</a>
                            <a href="#" class="btn-white btn-like"></a>
                            <a href="#" class="btn-white btn-comment"></a>
                        </div>
                        <div class="waterfall-info">
                            <p class="title">Fendi（芬迪） 2017早春度假系列</p>
                            <p class="icon"><span class="icon-star">89</span><span class="icon-like">10</span></p>
                        </div>
                        <div class="collect-info">
                            <a href="#" class="headImg"><img src="img/cont/waterfall_headImg1.jpeg" alt="#"></a>
                            <p class="title"><a href="#">大祁Y</a></p>
                            <p class="to">收集到<a href="#">时尚语型录</a></p>
                        </div>
                    </li>
                    <li class="item">
                        <a href="#" class="pic">
                            <img src="img/cont/waterfall_img3.jpg" alt="#">
                        </a>
                        <div class="waterfall-hover">
                            <span class="mask"></span>
                            <a href="#" class="btn-white btn-comment"></a>
                            <a href="#" class="btn-collect">收集 45</a>
                            <a href="#" class="btn-white btn-like"></a>
                        </div>
                        <div class="waterfall-info">
                            <p class="title">Fendi（芬迪） 2017早春度假系列</p>
                            <p class="icon"><span class="icon-star">89</span><span class="icon-like">10</span></p>
                        </div>
                        <div class="collect-info">
                            <a href="#" class="headImg"><img src="img/cont/waterfall_headImg1.jpeg" alt="#"></a>
                            <p class="title"><a href="#">大祁Y</a></p>
                            <p class="to">收集到<a href="#">时尚语型录</a></p>
                        </div>
                    </li>
                    <li class="item">
                        <a href="#" class="pic">
                            <img src="img/cont/waterfall_img4.jpg" alt="#">
                        </a>
                        <div class="waterfall-hover">
                            <span class="mask"></span>
                            <a href="#" class="btn-collect">收集 45</a>
                            <a href="#" class="btn-white btn-like"></a>
                            <a href="#" class="btn-white btn-comment"></a>
                        </div>
                        <div class="waterfall-info">
                            <p class="title">Fendi（芬迪） 2017早春度假系列</p>
                            <p class="icon"><span class="icon-star">89</span><span class="icon-like">10</span></p>
                        </div>
                        <div class="collect-info">
                            <a href="#" class="headImg"><img src="img/cont/waterfall_headImg1.jpeg" alt="#"></a>
                            <p class="title"><a href="#">大祁Y</a></p>
                            <p class="to">收集到<a href="#">时尚语型录</a></p>
                        </div>
                    </li>
                    <li class="item">
                        <a href="#" class="pic">
                            <img src="img/cont/waterfall_img5.jpg" alt="#">
                        </a>
                        <div class="waterfall-hover">
                            <span class="mask"></span>
                            <a href="#" class="btn-collect">收集 45</a>
                            <a href="#" class="btn-white btn-like"></a>
                            <a href="#" class="btn-white btn-comment"></a>
                        </div>
                        <div class="waterfall-info">
                            <p class="title">Fendi（芬迪） 2017早春度假系列</p>
                            <p class="icon"><span class="icon-star">89</span><span class="icon-like">10</span></p>
                        </div>
                        <div class="collect-info">
                            <a href="#" class="headImg"><img src="img/cont/waterfall_headImg1.jpeg" alt="#"></a>
                            <p class="title"><a href="#">大祁Y</a></p>
                            <p class="to">收集到<a href="#">时尚语型录</a></p>
                        </div>
                    </li>
                    <li class="item">
                        <a href="#" class="pic">
                            <img src="img/cont/waterfall_img1.jpg" alt="#">
                        </a>
                        <div class="waterfall-hover">
                            <span class="mask"></span>
                            <a href="#" class="btn-collect">收集 45</a>
                            <a href="#" class="btn-white btn-like"></a>
                            <a href="#" class="btn-white btn-comment"></a>
                        </div>
                        <div class="waterfall-info">
                            <p class="title">Fendi（芬迪） 2017早春度假系列</p>
                            <p class="icon"><span class="icon-star">89</span><span class="icon-like">10</span></p>
                        </div>
                        <div class="collect-info">
                            <a href="#" class="headImg"><img src="img/cont/waterfall_headImg1.jpeg" alt="#"></a>
                            <p class="title"><a href="#">大祁Y</a></p>
                            <p class="to">收集到<a href="#">时尚语型录</a></p>
                        </div>
                    </li>
                    <li class="item">
                        <a href="#" class="pic">
                            <img src="img/cont/waterfall_img2.jpg" alt="#">
                        </a>
                        <div class="waterfall-hover">
                            <span class="mask"></span>
                            <a href="#" class="btn-collect">收集 45</a>
                            <a href="#" class="btn-white btn-like"></a>
                            <a href="#" class="btn-white btn-comment"></a>
                        </div>
                        <div class="waterfall-info">
                            <p class="title">Fendi（芬迪） 2017早春度假系列</p>
                            <p class="icon"><span class="icon-star">89</span><span class="icon-like">10</span></p>
                        </div>
                        <div class="collect-info">
                            <a href="#" class="headImg"><img src="img/cont/waterfall_headImg1.jpeg" alt="#"></a>
                            <p class="title"><a href="#">大祁Y</a></p>
                            <p class="to">收集到<a href="#">时尚语型录</a></p>
                        </div>
                    </li>
                    <li class="item">
                        <a href="#" class="pic">
                            <img src="img/cont/waterfall_img3.jpg" alt="#">
                        </a>
                        <div class="waterfall-hover">
                            <span class="mask"></span>
                            <a href="#" class="btn-collect">收集 45</a>
                            <a href="#" class="btn-white btn-like"></a>
                            <a href="#" class="btn-white btn-comment"></a>
                        </div>
                        <div class="waterfall-info">
                            <p class="title">Fendi（芬迪） 2017早春度假系列</p>
                            <p class="icon"><span class="icon-star">89</span><span class="icon-like">10</span></p>
                        </div>
                        <div class="collect-info">
                            <a href="#" class="headImg"><img src="img/cont/waterfall_headImg1.jpeg" alt="#"></a>
                            <p class="title"><a href="#">大祁Y</a></p>
                            <p class="to">收集到<a href="#">时尚语型录</a></p>
                        </div>
                    </li>
                    <li class="item">
                        <a href="#" class="pic">
                            <img src="img/cont/waterfall_img4.jpg" alt="#">
                        </a>
                        <div class="waterfall-hover">
                            <span class="mask"></span>
                            <a href="#" class="btn-collect">收集 45</a>
                            <a href="#" class="btn-white btn-like"></a>
                            <a href="#" class="btn-white btn-comment"></a>
                        </div>
                        <div class="waterfall-info">
                            <p class="title">Fendi（芬迪） 2017早春度假系列</p>
                            <p class="icon"><span class="icon-star">89</span><span class="icon-like">10</span></p>
                        </div>
                        <div class="collect-info">
                            <a href="#" class="headImg"><img src="img/cont/waterfall_headImg1.jpeg" alt="#"></a>
                            <p class="title"><a href="#">大祁Y</a></p>
                            <p class="to">收集到<a href="#">时尚语型录</a></p>
                        </div>
                    </li>
                    <li class="item">
                        <a href="#" class="pic">
                            <img src="img/cont/waterfall_img5.jpg" alt="#">
                        </a>
                        <div class="waterfall-hover">
                            <span class="mask"></span>
                            <a href="#" class="btn-collect">收集 45</a>
                            <a href="#" class="btn-white btn-like"></a>
                            <a href="#" class="btn-white btn-comment"></a>
                        </div>
                        <div class="waterfall-info">
                            <p class="title">Fendi（芬迪） 2017早春度假系列</p>
                            <p class="icon"><span class="icon-star">89</span><span class="icon-like">10</span></p>
                        </div>
                        <div class="collect-info">
                            <a href="#" class="headImg"><img src="img/cont/waterfall_headImg1.jpeg" alt="#"></a>
                            <p class="title"><a href="#">大祁Y</a></p>
                            <p class="to">收集到<a href="#">时尚语型录</a></p>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
        <a href="#" id="readMore">浏览更多 ></a>
    </div>
</div>
<#include 'include/footer.ftl'/>
<script src="<@s.url '/js/jquery.pagination-1.2.7.js'/>"></script>
<script>
    var app = new Vue({
        el: '#app',
        data: {
            bannerInfo: {
                bannerStatus: 1,
                page: 1,
                pageSize: 5
            },
            bannerArticles: []
        },
        created: function () {
            this.query();
        },
        watch: {},
        methods: {
            query: function () {
                var url = "/api/article/list";
                this.$http.post(url, this.bannerInfo).then(function (response) {
                    this.bannerArticles = response.data.data.list;
                }, function (error) {
                    swal(error.body.msg);
                });
            }
        }
    });
</script>
</body>
</html>
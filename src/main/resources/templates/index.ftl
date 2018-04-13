<#import "/spring.ftl" as s>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>多肉达人一站式服务品牌</title>
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/index.css">
</head>
<body>
<#include 'header.ftl'/>
<div id="app">
    <div class="main">
        <div class="main-inner body-width">
            <div class="banner clearfix">
                <div class="slider" id="slider">
                    <ul class="slider-wrapper">
                        <li class="item" data-title="这位上神！速速到我的本子里来">
                            <a href="#" class="pic"><img src="img/cont/slider_img1.jpg" alt="#"></a>
                        </li>
                        <li class="item" data-title="想换上新衣去旅行！" data-author="by 占秋">
                            <a href="#" class="pic"><img src="img/cont/slider_img2.jpg" alt="#"></a>
                        </li>
                        <li class="item" data-title="你的书写工具需要一个庇护所" data-author="by Moollly">
                            <a href="#" class="pic"><img src="img/cont/slider_img3.jpg" alt="#"></a>
                        </li>
                        <li class="item" data-title="气温起伏，一件外套保护你" data-author="by 郑南音">
                            <a href="#" class="pic"><img src="img/cont/slider_img4.jpg" alt="#"></a>
                        </li>
                        <li class="item" data-title="鲜为人知的泰国小众小城——董里">
                            <a href="#" class="pic"><img src="img/cont/slider_img5.jpg" alt="#"></a>
                        </li>
                    </ul>
                    <a href="javascript:;" class="slider-prev"></a>
                    <a href="javascript:;" class="slider-next"></a>
                    <div class="slider-title">
                        <h2></h2>
                        <span></span>
                    </div>
                    <div class="slider-btns">
                        <span class="item"></span>
                        <span class="item"></span>
                        <span class="item"></span>
                        <span class="item"></span>
                        <span class="item"></span>
                    </div>
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
</body>
</html>
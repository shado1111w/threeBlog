<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>首页</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css" type="text/css"/>

<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/stylesheets/chromagallery.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/calendar.css">

<link href="${pageContext.request.contextPath}/css/owl.carousel.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/js/jquery-1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/owl.carousel.js"></script>

<!--头部show的js-->
<script>
$(function(){
    $('#owl-demo').owlCarousel({
        items: 1,
        autoPlay: true
    });
});
</script>
<!--消息栏显示-->
<script>
$(function() {
    $('li').hover(function() {
            $(this).find('ul').css({
                'display': 'block',
                'animation:': '2s'
            })
        },
        function() {
            $(this).find('ul').css({
                'display': 'none',
                'animation:': '2s'
            })
        });
});
</script>

</head>

<body>
<!--顶端栏begin-->
<div id="index_head">
  <div id="index_head_logo"> <img src="${pageContext.request.contextPath}/image/logo.png"> </div>
  <div id="index_head_menu">
    <ul>
      <li><a href="${pageContext.request.contextPath}/index.jsp" >首页</a></li>
      <li><a href="${pageContext.request.contextPath}/jsp/index/blog.jsp" >博文</a></li>
      <li><a href="${pageContext.request.contextPath}/jsp/index/pictures.jsp" >画廊</a></li>
      <li><a href="${pageContext.request.contextPath}/jsp/personal_center/personalcenter.jsp" >我的</a></li>
    </ul>
  </div>
  <div id="index_head_tools"> 
  <ul>
  	<li>
    	<a href="${pageContext.request.contextPath}/jsp/index/search.jsp">
        	<img  src="${pageContext.request.contextPath}/image/search.png" style="float:left;" />
       	</a> 
    </li>
    <li>
    	<a href="#">
        	<div style="float:left; position:relative;">
    			<img src="${pageContext.request.contextPath}/image/message.png"/>
                	<span  style="min-width: 20px;line-height:20px; text-align: center; position: absolute; background-color: #f00;  border-radius:15px; font-size:15px;color:#fff;width:10px;right:10px; top:15px; z-index:200;" >0</span>
             </div>
         </a> 
         <ul class="index_tools_messages">
         	<li><a href="#home">评论消息</a><span  style="min-width: 20px;line-height:20px; text-align: center; position: absolute; background-color: #f00;  border-radius:15px; font-size:15px;color:#fff;width:10px;right:5px; top:20px; z-index:200;" >0</span></li>
          	<li><a href="#home">关注消息</a><span  style="min-width: 20px;line-height:20px; text-align: center; position: absolute; background-color: #f00;  border-radius:15px; font-size:15px;color:#fff;width:10px;right:5px; top:80px; z-index:200;" >0</span></li>
            <li><a href="#home">收藏消息</a><span  style="min-width: 20px;line-height:20px; text-align: center; position: absolute; background-color: #f00;  border-radius:15px; font-size:15px;color:#fff;width:10px;right:5px; top:140px; z-index:200;" >0</span></li>
            <li><a href="#home">点赞消息</a><span  style="min-width: 20px;line-height:20px; text-align: center; position: absolute; background-color: #f00;  border-radius:15px; font-size:15px;color:#fff;width:10px;right:5px; top:200px; z-index:200;" >0</span></li>
            <li><a href="#home">举报消息</a><span  style="min-width: 20px;line-height:20px; text-align: center; position: absolute; background-color: #f00;  border-radius:15px; font-size:15px;color:#fff;width:10px;right:5px; top:265px; z-index:200;" >0</span></li>
         </ul>
    </li>
    <li>
    	<a href="#">
        	<img src="${pageContext.request.contextPath}/image/setting.png"/>
        </a>
        <ul class="index_tools_setting">
         	<li><a href="${pageContext.request.contextPath}/jsp/personal_center/personalcenter.jsp?id=5">&ensp;修改资料&ensp;</a></li>
          	<li><a href="${pageContext.request.contextPath}/jsp/personal_center/personalcenter.jsp?id=5">&ensp;修改头像&ensp;</a></li>
            <li><a href="${pageContext.request.contextPath}/jsp/personal_center/personalcenter.jsp?id=5">&ensp;更改密码&ensp;</a></li>
            <li><a href="${pageContext.request.contextPath}/jsp/personal_center/personalcenter.jsp">&ensp;个人中心&ensp;</a></li>
            <li><a href="#home">&ensp;举报中心&ensp;</a></li>
            <li><a href="#home">&ensp;退出账号&ensp;</a></li>
         </ul>
    </li>
     </ul>
     </div>
  <span style="color:#FFF; font-size:36px;float:left; margin-top:15px;"> |</span>
  <div id="index_head_signin">
    <ul>
      <li><a href="${pageContext.request.contextPath}/jsp/login/register.jsp">注册</a></li>
      <li><a href="${pageContext.request.contextPath}/jsp/login/sign_in.jsp">登录</a></li>
    </ul>
  </div>
</div>

<!--顶端栏end-->
<!--内容框begin-->
<div id="index_all">
    <!--右侧栏begin-->
    <div id="index_body_right">
    	<div id="index_body_enter">
        	<div id="index_body_enter_write">
            	<a href="${pageContext.request.contextPath}/jsp/article/publish.jsp"><img src="${pageContext.request.contextPath}/image/write.png" style="float:left;">
                <div style="margin-top:10px;width:260px;height:30px;float:left;">
                	<span style="font-size:18px;font-weight:bold;color:#000;">写博文</span>&emsp;
                    <span style="font-size:18px;font-weight:bold;color:#999;">|&emsp;记录你生活的剪影</span>
                </div>
                </a>
            </div>
            <div id="index_body_enter_guideboard">
            	<h3 style="margin-left:20px;padding-top:20px;">█ 指路牌</h3>
                  <a href="${pageContext.request.contextPath}/jsp/index/blog.jsp"><span style="margin-left:20px;color:#000;">博客文章欣赏</span></a><br/><br/>
                <a href="${pageContext.request.contextPath}/jsp/index/pictures.jsp"><span style="margin-left:20px;margin-top:20px;color:#000;">博客图片画廊</span></a><br /><br/>
                <a href="#"><span style="margin-left:20px;margin-top:20px;color:#000;">博客举报中心入口</span></a>
            </div>
        </div>
        
        <div id="index_body_calendar">
        	<div id="calendar" class="calendar"></div>
  			<script src="${pageContext.request.contextPath}/js/calendar.js"></script>
        </div>
        <div id="index_body_labels">
        	<h3 style="margin-left:20px;">█ 热门标签</h3>
            <a href="#" style="float:left;margin-top:10px;margin-left:20px;border:1px solid; border-radius:5px; width:55px; height:30px;font-size:14px; padding-top:5px; padding-left:12px;">关键词</a>
             <a href="#" style="float:left;margin-top:10px;margin-left:20px;border:1px solid; border-radius:5px; width:55px; height:30px;font-size:14px; padding-top:5px; padding-left:12px;">关键词</a>
              <a href="#" style="float:left;margin-top:10px;margin-left:20px;border:1px solid; border-radius:5px; width:55px; height:30px;font-size:14px; padding-top:5px; padding-left:12px;">关键词</a>
               <a href="#" style="float:left;margin-top:10px;margin-left:20px;border:1px solid; border-radius:5px; width:55px; height:30px;font-size:14px; padding-top:5px; padding-left:12px;">关键词</a>
                <a href="#" style="float:left;margin-top:10px;margin-left:20px;border:1px solid; border-radius:5px; width:55px; height:30px;font-size:14px; padding-top:5px; padding-left:12px;">关键词</a>
                 <a href="#" style="float:left;margin-top:10px;margin-left:20px;border:1px solid; border-radius:5px; width:55px; height:30px;font-size:14px; padding-top:5px; padding-left:12px;">关键词</a>
                  <a href="#" style="float:left;margin-top:10px;margin-left:20px;border:1px solid; border-radius:5px; width:55px; height:30px;font-size:14px; padding-top:5px; padding-left:12px;">关键词</a>
                   <a href="#" style="float:left;margin-top:10px;margin-left:20px;border:1px solid; border-radius:5px; width:55px; height:30px;font-size:14px; padding-top:5px; padding-left:12px;">关键词</a>
                    <a href="#" style="float:left;margin-top:10px;margin-left:20px;border:1px solid; border-radius:5px; width:55px; height:30px;font-size:14px; padding-top:5px; padding-left:12px;">关键词</a>
        </div>
        
    </div>
    <!--右侧栏end-->
    <!--左侧栏begin-->
    <div id="index_body_left">
    	
		<div class="content">
			<div class="chroma-gallery mygallery">
				<img src="${pageContext.request.contextPath}/images/thumbs/1.jpg" alt="Pic 1" data-largesrc="${pageContext.request.contextPath}/images/1.jpg">
				<img src="${pageContext.request.contextPath}/images/thumbs/2.jpg" alt="Pic 2" data-largesrc="${pageContext.request.contextPath}/images/2.jpg">
				<img src="${pageContext.request.contextPath}/images/thumbs/3.jpg" alt="Pic 3" data-largesrc="${pageContext.request.contextPath}/images/3.jpg">
				<img src="${pageContext.request.contextPath}/images/thumbs/4.jpg" alt="Pic 4" data-largesrc="${pageContext.request.contextPath}/images/4.jpg">
				<img src="${pageContext.request.contextPath}/images/thumbs/5.jpg" alt="Pic 5" data-largesrc="${pageContext.request.contextPath}/images/5.jpg">
				<img src="${pageContext.request.contextPath}/images/thumbs/6.jpg" alt="Pic 6" data-largesrc="${pageContext.request.contextPath}/images/6.jpg">
				<img src="${pageContext.request.contextPath}/images/thumbs/7.jpg" alt="Pic 7" data-largesrc="${pageContext.request.contextPath}/images/7.jpg">
				<img src="${pageContext.request.contextPath}/images/thumbs/8.jpg" alt="Pic 8" data-largesrc="${pageContext.request.contextPath}/images/8.jpg">
				<img src="${pageContext.request.contextPath}/images/thumbs/9.jpg" alt="Pic 9" data-largesrc="${pageContext.request.contextPath}/images/9.jpg">
				<img src="${pageContext.request.contextPath}/images/thumbs/10.jpg" alt="Pic 10" data-largesrc="${pageContext.request.contextPath}/images/10.jpg">
                <img src="${pageContext.request.contextPath}/images/thumbs/pic1.jpg" alt="Pic 10" data-largesrc="${pageContext.request.contextPath}/images/pic1.jpg">
                <img src="${pageContext.request.contextPath}/images/thumbs/pic2.jpg" alt="Pic 10" data-largesrc="${pageContext.request.contextPath}/images/pic2.jpg">
                <img src="${pageContext.request.contextPath}/images/thumbs/pic3.jpg" alt="Pic 10" data-largesrc="${pageContext.request.contextPath}/images/pic3.jpg">
                <img src="${pageContext.request.contextPath}/images/thumbs/pic4.jpg" alt="Pic 10" data-largesrc="${pageContext.request.contextPath}/images/pic4.jpg">
                <img src="${pageContext.request.contextPath}/images/thumbs/mao.jpg" alt="Pic 10" data-largesrc="${pageContext.request.contextPath}/images/mao.jpg">
                 <img src="${pageContext.request.contextPath}/images/thumbs/mao3.jpg" alt="Pic 10" data-largesrc="${pageContext.request.contextPath}/images/mao3.jpg">
                  <img src="${pageContext.request.contextPath}/images/thumbs/mao2.jpg" alt="Pic 10" data-largesrc="${pageContext.request.contextPath}/images/mao2.jpg">
			</div>
		</div>
	

	
	
	<script src="${pageContext.request.contextPath}/dist/scripts/chromagallery.pkgd.min.js"></script>
	<script type="text/javascript">

		$(document).ready(function(){
			$(".mygallery").chromaGallery
		    ({
		        color:'#000',
		        gridMargin:15,
		        maxColumns:5,
		        dof:true,
		        screenOpacity:0.8
		    });
		});
		
	</script>
    </div>
    <!--左侧栏end-->
</div>
<!--内容框end-->

<!--脚部begin-->
<footer>
	<img src="${pageContext.request.contextPath}/image/footer_logo.png">
    <div id="footer_about">
    <p>&emsp;关于我们 | 意见反馈 | 服务条例 | 隐私政策</p>
    <p>Copyright © 2018 | Three Blog | All Right Reserved</p>
    </div>
</footer>
<!--脚部end-->
</body>
</html>
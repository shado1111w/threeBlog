<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>首页</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css" type="text/css"/>

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
         	<li><a href="#home">&ensp;修改资料&ensp;</a></li>
          	<li><a href="#home">&ensp;修改头像&ensp;</a></li>
            <li><a href="#home">&ensp;更改密码&ensp;</a></li>
            <li><a href="#home">&ensp;个人中心&ensp;</a></li>
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
            	<a href="#"><img src="${pageContext.request.contextPath}/image/write.png" style="float:left;">
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
    	<div id="blog_title">
			<ul>
        		<li><a href="#">&emsp;最新&emsp;</a></li>
            	<li><a href="#">&emsp;关注&emsp;</a></li>
        	</ul>
        </div>
        <div id="blog_passages">
        	<!--具体N篇文章begin-->
        	<div class="passages_n">
        		<div class="passages_pic">
            		<img  src="${pageContext.request.contextPath}/image/pic1.jpg" style="width:200px;height:150px;">
                    <span style="font-size:14px;color:#000;margin-left:20px;">陌上行</span><br/>
                    <span style="font-size:14px;color:#000;margin-left:20px;">2018-05-18</span>
                </div>
            	<div class="passages_details">
                	<h1 style="margin-left:20px;">最爱的，还是这人和烟火</h1>
                    <p style="margin-left:20px;">关于孤独，到此为止。
天空很蓝，却很悲伤。 阳光很暖，却很刺眼。 花儿很美，却很碍眼。 世界很好，却不温柔。</p><br/>
					<span style="margin-left:20px;">阅读：xxx&emsp;|</span>
                    <span>评论：xxx&emsp;|</span>
                    <span>喜欢：xxx&emsp;|</span>
                    <span>收藏：xxx</span>
            	</div>
            </div>
            <div class="passages_n">
        		<div class="passages_pic">
            		<img  src="${pageContext.request.contextPath}/image/pic1.jpg" style="width:200px;height:150px;">
                    <span style="font-size:14px;color:#000;margin-left:20px;">陌上行</span><br/>
                    <span style="font-size:14px;color:#000;margin-left:20px;">2018-05-18</span>
                </div>
            	<div class="passages_details">
                	<h1 style="margin-left:20px;">最爱的，还是这人和烟火</h1>
                    <p style="margin-left:20px;">关于孤独，到此为止。
天空很蓝，却很悲伤。 阳光很暖，却很刺眼。 花儿很美，却很碍眼。 世界很好，却不温柔。</p><br/>
					<span style="margin-left:20px;">阅读：xxx&emsp;|</span>
                    <span>评论：xxx&emsp;|</span>
                    <span>喜欢：xxx&emsp;|</span>
                    <span>收藏：xxx</span>
            	</div>
            </div>
            <div class="passages_n">
        		<div class="passages_pic">
            		<img  src="${pageContext.request.contextPath}/image/pic1.jpg" style="width:200px;height:150px;">
                    <span style="font-size:14px;color:#000;margin-left:20px;">陌上行</span><br/>
                    <span style="font-size:14px;color:#000;margin-left:20px;">2018-05-18</span>
                </div>
            	<div class="passages_details">
                	<h1 style="margin-left:20px;">最爱的，还是这人和烟火</h1>
                    <p style="margin-left:20px;">关于孤独，到此为止。
天空很蓝，却很悲伤。 阳光很暖，却很刺眼。 花儿很美，却很碍眼。 世界很好，却不温柔。</p><br/>
					<span style="margin-left:20px;">阅读：xxx&emsp;|</span>
                    <span>评论：xxx&emsp;|</span>
                    <span>喜欢：xxx&emsp;|</span>
                    <span>收藏：xxx</span>
            	</div>
            </div>
            <div class="passages_n">
        		<div class="passages_pic">
            		<img  src="${pageContext.request.contextPath}/image/pic1.jpg" style="width:200px;height:150px;">
                    <span style="font-size:14px;color:#000;margin-left:20px;">陌上行</span><br/>
                    <span style="font-size:14px;color:#000;margin-left:20px;">2018-05-18</span>
                </div>
            	<div class="passages_details">
                	<h1 style="margin-left:20px;">最爱的，还是这人和烟火</h1>
                    <p style="margin-left:20px;">关于孤独，到此为止。
天空很蓝，却很悲伤。 阳光很暖，却很刺眼。 花儿很美，却很碍眼。 世界很好，却不温柔。</p><br/>
					<span style="margin-left:20px;">阅读：xxx&emsp;|</span>
                    <span>评论：xxx&emsp;|</span>
                    <span>喜欢：xxx&emsp;|</span>
                    <span>收藏：xxx</span>
            	</div>
            </div>
            <div class="passages_n">
        		<div class="passages_pic">
            		<img  src="${pageContext.request.contextPath}/image/pic1.jpg" style="width:200px;height:150px;">
                    <span style="font-size:14px;color:#000;margin-left:20px;">陌上行</span><br/>
                    <span style="font-size:14px;color:#000;margin-left:20px;">2018-05-18</span>
                </div>
            	<div class="passages_details">
                	<h1 style="margin-left:20px;">最爱的，还是这人和烟火</h1>
                    <p style="margin-left:20px;">关于孤独，到此为止。
天空很蓝，却很悲伤。 阳光很暖，却很刺眼。 花儿很美，却很碍眼。 世界很好，却不温柔。</p><br/>
					<span style="margin-left:20px;">阅读：xxx&emsp;|</span>
                    <span>评论：xxx&emsp;|</span>
                    <span>喜欢：xxx&emsp;|</span>
                    <span>收藏：xxx</span>
            	</div>
            </div>
            <div class="passages_n">
        		<div class="passages_pic">
            		<img  src="${pageContext.request.contextPath}/image/pic1.jpg" style="width:200px;height:150px;">
                    <span style="font-size:14px;color:#000;margin-left:20px;">陌上行</span><br/>
                    <span style="font-size:14px;color:#000;margin-left:20px;">2018-05-18</span>
                </div>
            	<div class="passages_details">
                	<h1 style="margin-left:20px;">最爱的，还是这人和烟火</h1>
                    <p style="margin-left:20px;">关于孤独，到此为止。
天空很蓝，却很悲伤。 阳光很暖，却很刺眼。 花儿很美，却很碍眼。 世界很好，却不温柔。</p><br/>
					<span style="margin-left:20px;">阅读：xxx&emsp;|</span>
                    <span>评论：xxx&emsp;|</span>
                    <span>喜欢：xxx&emsp;|</span>
                    <span>收藏：xxx</span>
            	</div>
            </div>
            <!--文章end-->
        </div>
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
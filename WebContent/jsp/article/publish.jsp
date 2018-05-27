<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="toTop" content="true">
<title>发表博文</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css" type="text/css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery-rebox.css"/>
<link href="${pageContext.request.contextPath}/css/owl.carousel.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/js/jquery-1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/owl.carousel.js"></script>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/city.js"></script>  



<script src="${pageContext.request.contextPath}/js/jquery-rebox.js"></script>

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

 <!--导航栏切换-->
<script>
	$(document).ready(function() {
		$("#bowen").click(function() {
			$('#othercenter_body') 
			.load('personalcenter_messages.html');
			$('#othercenter_down').show();
			})
		$("#shoucang").click(function() {
				$('#othercenter_body')
				.load('personalcenter_favorite.html');
				$('#othercenter_down').show();
				})
		$("#guanzhu").click(function() {
				$('#othercenter_body') 
				.load('personalcenter_follow.html');
				$('#othercenter_down').show();
				})
		$("#fenshi").click(function() {
				$('#othercenter_body') 
				.load('personalcenter_follower.html');
				$('#othercenter_down').show();
			})
		$("#changeinfo").click(function() {
				$('#othercenter_body') 
				.load('changeinfo.html');
				$('#othercenter_down').hide();
			})

})
</script>

</head>

<body>
<!--顶端栏begin-->
<div id="index_head">
  <div id="index_head_logo"> <img src="${pageContext.request.contextPath}/image/logo.png"> </div>
  <div id="index_head_menu">
    <ul>
      <li><a href="#" >首页</a></li>
      <li><a href="#" >博文</a></li>
      <li><a href="#" >画廊</a></li>
      <li><a href="#" >我的</a></li>
    </ul>
  </div>
  <div id="index_head_tools"> 
  <ul>
  	<li>
    	<a href="#">
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
      <li><a href="register.html">注册</a></li>
      <li><a href="signin.html">登录</a></li>
    </ul>
  </div>
</div>
</div>

<!--顶端栏end-->
<!--内容框begin-->
<div id="index_all">
	<div id="publish_all">
    	<h1 style=" font-size:24px; width:960px; margin-left:40px;">█ 发表博文</h1>
       <div style="width:960px;height:280px;overflow:hidden;position:relative;"></div>
       <div style="height:0px;">
        	<input type="file" id="publish_fm" accept="image/*">
            <img src="${pageContext.request.contextPath}/image/publish_fm.jpg" style="float:left;z-index: 9; position:absolute; top:160px;" >
       </div>
       <div style="margin-top:30px;">
       		 <span style="font-size:24px;">标题：</span>
       		 <input id="bt" type="text"   placeholder="请输入标题(限15字)"  maxlength="30" style="font-size:24px; color:#999; border:1px solid #39C; width:430px;">
              <span style="font-size:24px;">标签：</span>
             <input  type="text" placeholder="添加标签,例<热夏><酷暑>" style="font-size:24px;color:#999;width:350px; border:1px solid #39c;" >
             <span style="font-size:24px;">导语：</span>
       		<input id="pub_daoyu" maxlength="100" type="text" placeholder="请输入导语（限50字）" style="font-size:24px; color:#999;border:1px solid #39c; margin-top:30px; width:865px;" ><br>
    <textarea name="editor" id="editor" cols="30" rows="30" class="ckeditor" placeholder="点击输入正文" style="font-size:22px;color:#000; border:1px solid #39c;margin-left:27px; margin-top:50px;" ></textarea>
       </div>
        <input  type="button" value="发表" style="font-size:36px; border:1px solid #39c; background-color:#39c; color:#FFF; margin-left:400px;width:200px; margin-bottom:30px;" >
    </div>
</div>
<!--内容框end-->
<!--置顶框begin-->
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/toTop.js"></script>
<!--置顶框end-->
</body>
</html>

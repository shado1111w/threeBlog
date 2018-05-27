<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="toTop" content="true">
<title>发表博文</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css" type="text/css"/>
<link href="${pageContext.request.contextPath}/css/owl.carousel.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery-rebox.css"/>
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
		$("#message_pinglun").click(function() {
			$('#messagecenter_reviews') 
			.load('messagecenter_reviews.html');
			
			})
		$("#message_follow").click(function() {
				$('#messagecenter_reviews')
				.load('messagecenter_follow.html');
				
				})
		$("#message_favorite").click(function() {
				$('#messagecenter_reviews') 
				.load('messagecenter_favorite.html');
				
				})
		$("#message_zan").click(function() {
				$('#messagecenter_reviews') 
				.load('messagecenter_zan.html');
				
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
	<div id="messagecenter_all">
    	<h1 style=" font-size:24px; width:960px; margin-left:40px;">█ 消息中心</h1>
        <!--导航栏begin-->
        <div  id="messagecenter_label">
            	<ul>
                	<li>
                    <div style=" position:relative;">
                    	<span id="message_pinglun">&emsp;&ensp;&emsp;评论消息&emsp;&ensp;&emsp;|</span><span  style="min-width: 20px;line-height:20px; text-align: center; position: absolute; background-color: #f00;  border-radius:15px; font-size:15px;color:#fff;width:10px;right:25px; top:5px; z-index:200;" >0</span></div>
                    </li>
                    
                    <li>
                    <div style=" position:relative;">
                    	<span id="message_follow" >&emsp;&ensp;&emsp;关注消息&emsp;&ensp;&emsp;|</span><span  style="min-width: 20px;line-height:20px; text-align: center; position: absolute; background-color: #f00;  border-radius:15px; font-size:15px;color:#fff;width:10px;right:25px; top:5px; z-index:200;" >0</span>
                    </div>
                    </li>
                    <li>
                    <div style=" position:relative;">
                    	<span  id="message_favorite">&emsp;&ensp;&emsp;收藏消息&emsp;&ensp;&emsp;|</span><span  style="min-width: 20px;line-height:20px; text-align: center; position: absolute; background-color: #f00;  border-radius:15px; font-size:15px;color:#fff;width:10px;right:25px; top:5px; z-index:200;" >0</span>
                     </div>
                    </li>
                    <li>
                    <div style=" position:relative;">
                    	<span  id="message_zan">&emsp;&ensp;&emsp;点赞消息&emsp;&ensp;&emsp;</span><span  style="min-width: 20px;line-height:20px; text-align: center; position: absolute; background-color: #f00;  border-radius:15px; font-size:15px;color:#fff;width:10px;right:25px; top:5px; z-index:200;" >0</span>
                    </div>
                    </li>
                </ul>
            </div>
           
            <hr style="FILTER: alpha(opacity=100,finishopacity=0,style=3)" width="100%" color=#999 SIZE=3>
        <!--导航栏end-->
         <!--评论消息begin--> 
         <div id="messagecenter_reviews">
         	<span style="font-size:20px; width:500px;margin-left:40px; font-weight:bold;">█ 评论消息</span>
            <select style="width:100px; float:right; margin-right:50px; font-size:18px;">
    			<option value="notread">未读</option>
    			<option value="read">已读</option>
    			<option value="all">全部</option>
    	    </select>
            <table id="information_table" border="1">
    <tr>
    <th width="5%">#</th>
    <th width="55%">评论及回复</th>
    <th width="25%">时间</th>
    <th width="15%">操作</th>
    </tr>
    <tr>
    <td>1</td>
    <td>xxx评论了你的博文《我们是时间的旅行者》</td>
    <td>2018-05-20</td>
    <td><a href="http://www.baidu.com" target="_blank"><img  id="eye" src="${pageContext.request.contextPath}/image/eye.png"  style="width:40px; height:40px;"></a>
        <!--查看图标更换的jq-->
<script>
$('#eye').click(function(){  
          
        if($('#eye').attr('src')=='image/eye.png'){  
            $('#eye').attr('src','image/eyes.png');  
        }
          
});  
</script></td>
    </tr>
    <tr>
    <td>2</td>
    <td></td>
    <td></td>
    <td></td>
    </tr>
    </table>
         </div>
    <!--评论消息end--> 
    </div>
</div>
<!--内容框end-->
<!--置顶框begin-->
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/toTop.js"></script>
<!--置顶框end-->
</body>
</html>

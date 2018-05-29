<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="toTop" content="true">
<title>举报博文</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css" type="text/css"/>

<link href="${pageContext.request.contextPath}/css/owl.carousel.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/js/jquery-1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/owl.carousel.js"></script>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/city.js"></script>  

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery-rebox.css"/>

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
	<div id="reportcenter_all">
    	<h1 style=" font-size:20px; width:960px; margin-left:40px;">█ Three Blog举报平台</h1><br/>
        <form>
        <div  style="margin-left:100px;">
        <span style="font-size:20px;">您要举报的是&ensp;</span>
        <a href="#"><u style="font-size:20px;color:#09F; font-weight:bold;">jerry</u></a>
        <span style="font-size:20px;">&ensp;发表的&ensp;</span>
        <a href="#"><u style="font-size:20px;color:#09F; font-weight:bold;">我们都是时间的旅行者</u></a>
        <span style="font-size:20px;">&ensp;,摘要如下：&ensp;</span><br/><br/>
        <input type="text" style="width:800px; height:200px; border:1px solid;  color:#999; font-size:28px;" value="我们都是时间的旅行者"/>
        </div>
        <div style="clear:both; margin-left:100px;">
        <br/><br/>
        <span style="font-size:20px;">&ensp;选择举报类型（必选）：&ensp;</span><br/><br/>
        <input type="radio" name="radio" onclick="check(this.value)" value="色情" style="font-size:20px;width:20px;height:20px;">色情&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
		<input type="radio" name="radio" onclick="check(this.value)" value="广告" style="font-size:20px;width:20px;height:20px;">广告<br/><br/>
		<input type="radio" name="radio" onclick="check(this.value)" value="虚假信息" style="font-size:20px;width:20px;height:20px;">虚假信息&emsp;&emsp;&emsp;&emsp;
		<input type="radio" name="radio" onclick="check(this.value)" value="违反社会主义核心价值观" style="font-size:20px;width:20px;height:20px;">违反社会主义核心价值观<br/><br/>
        <input type="radio" name="radio" onclick="check(this.value)" value="其他（请在方框内填写）" style="font-size:20px;width:20px;height:20px;">其他<br/><br/>
       <span style="font-size:20px;"> 您的选择是：</span><input type="text" id="answer" size="50" style="border:1px solid; font-size:20px;" placeholder="若选择其他，请直接在此填写">
       <script type="text/javascript">
			function check(browser){
  				document.getElementById("answer").value=browser
  				}
		</script>
        </div>
        <div  style="margin-left:100px;">
        <br/><br/>
        <span style="font-size:20px;">填写详细违规说明：</span><br/><br/>
        <textarea style="width:800px; height:200px; border:1px solid;font-size:28px; resize:none;" placeholder="详细违规理由"></textarea>
        </div>
        <input type="submit" value="提交" style="margin-left:320px; width:80px; height:50px; font-size:20px; margin-top:30px; margin-bottom:30px; border:1px solid; font-weight:bold; background-color:#FFF; border-radius:5px;"/>
        <input type="submit" value="取消" style="margin-left:150px; width:80px; height:50px; font-size:20px; margin-top:30px; margin-bottom:30px; border:1px solid; font-weight:bold; background-color:#FFF; border-radius:5px;"/>
        </form>
    </div>
</div>
<!--内容框end-->
<!--置顶框begin-->
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/toTop.js"></script>
<!--置顶框end-->
</body>
</html>

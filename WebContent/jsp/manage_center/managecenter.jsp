<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="toTop" content="true">
<title>管理中心</title>
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
		$("#manage_report").click(function() {
			$('#messagecenter_reviews') 
			.load('managecenter_report.html');
			})
		$("#manage_recover").click(function() {
				$('#messagecenter_reviews')
				.load('managecenter_recover.html');
				})
		$("#manage_limit").click(function() {
				$('#messagecenter_reviews') 
				.load('managecenter_limit.html');
				})
		$("#manage_statistics").click(function() {
				$('#messagecenter_reviews') 
				.load('managecenter_statistics.html');
			})
		$("#limit").click(function() {
				$('#messagecenter_reviews') 
				.load('managecenter_limit.html');
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
            <li><a href="#home">通知消息</a><span  style="min-width: 20px;line-height:20px; text-align: center; position: absolute; background-color: #f00;  border-radius:15px; font-size:15px;color:#fff;width:10px;right:5px; top:265px; z-index:200;" >0</span></li>
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
            <li><a href="#home">&ensp;管理中心&ensp;</a></li>
            <li><a href="#home">&ensp;退出账号&ensp;</a></li>
         </ul>
    </li>
    </ul>
     </div>
  <span style="color:#FFF; font-size:36px;float:left; margin-top:15px;"> |</span>
  <div id="index_head_signin">
    <a href="#" style=" float:left;background-color:#FFF; width:55px;height:55px;margin:10px; position:relative;padding-top:5px; padding-left:5px;"><img src="${pageContext.request.contextPath}/image/head1.jpg"  style="width:50px;height:50px;"/></a><a href="#"><span style="width:90px;height:48px;overflow:hidden;float:left;margin-top:20px; font-size:18px; color:#FFF;">Admin</span></a>
  </div>
</div>
</div>

<!--顶端栏end-->
<!--内容框begin-->
<div id="index_all">
	<div id="managecenter_all">
    	<h1 style=" font-size:36px; width:920px; margin-left:40px;">█ 管理中心</h1>
        <!--导航栏begin-->
        <div  id="managecenter_label">
            	<ul>
                	<li>
                    <div style=" position:relative;">
                    	<span id="manage_report" style="cursor:pointer;">&emsp;&ensp;&emsp;举报管理&emsp;&ensp;&emsp;|</span><span  style="min-width: 20px;line-height:20px; text-align: center; position: absolute; background-color: #f00;  border-radius:15px; font-size:15px;color:#fff;width:10px;right:25px; top:5px; z-index:200;" >0</span></div>
                    </li>
                    
                    <li>
                    <div style=" position:relative;">
                    	<span id="manage_recover" style="cursor:pointer;">&emsp;&ensp;&emsp;恢复管理&emsp;&ensp;&emsp;|</span><span  style="min-width: 20px;line-height:20px; text-align: center; position: absolute; background-color: #f00;  border-radius:15px; font-size:15px;color:#fff;width:10px;right:25px; top:5px; z-index:200;" >0</span>
                    </div>
                    </li>
                    <li>
                    <div style=" position:relative;">
                    	<span  id="manage_limit" style="cursor:pointer;">&emsp;&ensp;&emsp;限制管理&emsp;&ensp;&emsp;|</span>
                     </div>
                    </li>
                    <li>
                    <div style=" position:relative;">
                    	<span  id="manage_statistics" style="cursor:pointer;">&emsp;&ensp;&emsp;用户统计&emsp;&ensp;&emsp;</span>
                    </div>
                    </li>
                </ul>
            </div>
           
            <hr style="FILTER: alpha(opacity=100,finishopacity=0,style=3)" width="100%" color=#999 SIZE=3>
        <!--导航栏end-->
       <!--举报管理begin--> 
         <div id="messagecenter_reviews">
         	<span style="font-size:20px; width:500px;margin-left:40px; font-weight:bold;">█ 举报管理</span>
            <select style="width:150px; float:right; margin-right:50px; font-size:18px;">
    			<option value="notread">未处理</option>
    			<option value="read">已处理</option>
    			<option value="all">全部</option>
    	    </select>
            <table id="information_table" border="1">
    <tr>
    <th width="30%">举报内容</th>
    <th width="20%">违规用户</th>
    <th width="30%">举报用户及理由</th>
    <th width="20%">处理</th>
    </tr>
    <tr>
    <td><a href="#">我们是时间的旅行者</a></td>
    <td>jerry</td>
    <td><span>&emsp;Tom</span>----<span>虚假信息</span>----<span>这篇文章很假，欺骗我感情，恶心！</span></td>
    <td><input type="button" value="删除" style="cursor:pointer;border:1px solid; background-color:#FFF;"/>
    <input type="button" id="limit" value="限制" style="cursor:pointer;border:1px solid #000; margin-left:20px;background-color:#FFF;"/></td>
    </tr>
    <tr>
    <td><a href="#">丢，*他*的</a></td>
    <td>jerry</td>
    <td><span>&emsp;Tom</span>----<span>违反社会主义核心价值观</span>----<span>人身攻击！</span></td>
    <td>已处理</td>
    </tr>
    </table>
         </div>
    <!--举报管理end--> 
        
    </div>
</div>
<!--内容框end-->
<!--置顶框begin-->
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/toTop.js"></script>
<!--置顶框end-->
</body>
</html>

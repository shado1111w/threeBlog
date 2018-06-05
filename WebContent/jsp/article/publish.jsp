<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="threeblog.entity.User" %>
<%@ page import="threeblog.service.Service" %>
<%
	boolean login_flag=false;
	User user = new User();
	Service service = new Service();
	int user_id = 10240;
	if (session.getAttribute("user_id") == null) {
		String phonenum="";
		String password="";
		Cookie[] cookies=request.getCookies();
		if(cookies!=null&&cookies.length>0){
			for(Cookie c:cookies){
				if(c.getName().equals("phonenum1")){
					phonenum=c.getValue();
					login_flag=true;
				}
				if(c.getName().equals("password1")){
					password=c.getValue();
				}			
			}	
		}
		if(login_flag){
			response.setContentType("text/html;charset=utf-8");
			String content = 0 + ";URL= " +request.getContextPath()+ "/servlet/Login?zh="+phonenum+"&mm="+password+"&li_url="+request.getRequestURL();
			response.setHeader("REFRESH ", content);
		}
		
	} else {
		user_id = Integer.valueOf((String) session.getAttribute("user_id"));
		user = service.getUserFromId(user_id);	
		login_flag=true;
	}
	
	int feedback_num=0;
	feedback_num=service.getReportNumFromStatus3();
	int comment_num=0;
	int follow_num=0;
	int collect_num=0;
	int zan_num=0;
	int all_num=0;
	int report_num=0;
	comment_num=service.getMessagesNumFromReceiver_id(user_id); 
	follow_num=service.getFollowNumFromFollower_idStatus(user_id);
	collect_num=service.getCollectNumFromAuthor_id(user_id);
	zan_num=service.getZanNumFromReceiver_id(user_id);
	report_num=service.getReportNum();
	all_num=comment_num+follow_num+collect_num+zan_num;
%> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="toTop" content="true">
<title>发表博文</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css" type="text/css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery-rebox.css"/>
<link href="${pageContext.request.contextPath}/css/owl.carousel.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/js/jquery-1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/owl.carousel.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/ckfinder/ckfinder.js"></script>
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
<script type="text/javascript">
	function change() {
		var pic = document.getElementById("img"), file = document
				.getElementById("publish_fm");

		var ext = file.value.substring(file.value.lastIndexOf(".") + 1)
				.toLowerCase();

		// gif在IE浏览器暂时无法显示
		if (ext != 'png' && ext != 'jpg' && ext != 'jpeg') {
			alert("图片的格式必须为png或者jpg或者jpeg格式！");
			return;
		}
		var isIE = navigator.userAgent.match(/MSIE/) != null, isIE6 = navigator.userAgent
				.match(/MSIE 6.0/) != null;

		if (isIE) {
			file.select();
			var reallocalpath = document.selection.createRange().text;

			// IE6浏览器设置img的src为本地路径可以直接显示图片
			if (isIE6) {
				pic.src = reallocalpath;
			} else {
				// 非IE6版本的IE由于安全问题直接设置img的src无法显示本地图片，但是可以通过滤镜来实现
				pic.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod='image',src=\""
						+ reallocalpath + "\")";
				// 设置img的src为base64编码的透明图片 取消显示浏览器默认图片
				pic.src = 'data:image/gif;base64,R0lGODlhAQABAIAAAP///wAAACH5BAEAAAAALAAAAAABAAEAAAICRAEAOw==';
			}
		} else {
			html5Reader(file);
		}
	}

	function html5Reader(file) {
		var file = file.files[0];
		var reader = new FileReader();
		reader.readAsDataURL(file);
		reader.onload = function(e) {
			var pic = document.getElementById("img");
			pic.src = this.result;
		}
	}
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
     <%if(login_flag){ %>
      <li><a href="${pageContext.request.contextPath}/jsp/personal_center/personalcenter.jsp" >我的</a></li>
      <%}else{ %>
      <li style="visibility:hidden"><a href="${pageContext.request.contextPath}/jsp/personal_center/personalcenter.jsp" >我的</a></li>
      <%} %>
    </ul>
  </div>
  <div id="index_head_tools"> 
  <ul>
  	<li>
    	<a href="${pageContext.request.contextPath}/jsp/index/search.jsp">
        	<img  src="${pageContext.request.contextPath}/image/search.png" style="float:left;" />
       	</a> 
    </li>
     <%if(login_flag&&user_id==3){ %>
    <li>
    	<a href="javascript:;">
        	<div style="float:left; position:relative;">
    			<img src="${pageContext.request.contextPath}/image/message.png"/>
                	<span  style="min-width: 20px;line-height:20px; text-align: center; position: absolute; background-color: #f00;  border-radius:15px; font-size:15px;color:#fff;width:10px;right:10px; top:15px; z-index:200;" ><%=all_num+report_num+feedback_num%></span>
             </div>
         </a> 
         
         <ul class="index_tools_messages">
         	<li><a href="${pageContext.request.contextPath}/jsp/message_center/messagecenter.jsp">评论消息</a><span  style="min-width: 20px;line-height:20px; text-align: center; position: absolute; background-color: #f00;  border-radius:15px; font-size:15px;color:#fff;width:10px;right:5px; top:20px; z-index:200;" ><%=comment_num %></span></li>
          	<li><a href="${pageContext.request.contextPath}/jsp/message_center/messagecenter.jsp?id=2">关注消息</a><span  style="min-width: 20px;line-height:20px; text-align: center; position: absolute; background-color: #f00;  border-radius:15px; font-size:15px;color:#fff;width:10px;right:5px; top:80px; z-index:200;" ><%=follow_num %></span></li>
            <li><a href="${pageContext.request.contextPath}/jsp/message_center/messagecenter.jsp?id=3">收藏消息</a><span  style="min-width: 20px;line-height:20px; text-align: center; position: absolute; background-color: #f00;  border-radius:15px; font-size:15px;color:#fff;width:10px;right:5px; top:140px; z-index:200;" ><%=collect_num %></span></li>
            <li><a href="${pageContext.request.contextPath}/jsp/message_center/messagecenter.jsp?id=4">点赞消息</a><span  style="min-width: 20px;line-height:20px; text-align: center; position: absolute; background-color: #f00;  border-radius:15px; font-size:15px;color:#fff;width:10px;right:5px; top:200px; z-index:200;" ><%=zan_num %></span></li>
            <li><a href="${pageContext.request.contextPath}/jsp/manage_center/managecenter.jsp">举报消息</a><span  style="min-width: 20px;line-height:20px; text-align: center; position: absolute; background-color: #f00;  border-radius:15px; font-size:15px;color:#fff;width:10px;right:5px; top:265px; z-index:200;" ><%=report_num +feedback_num%></span></li>
         </ul>
       
    </li>
      <%}else if(login_flag){
    %>
    <li>
    	<a href="javascript:;">
        	<div style="float:left; position:relative;">
    			<img src="${pageContext.request.contextPath}/image/message.png"/>
                	<span  style="min-width: 20px;line-height:20px; text-align: center; position: absolute; background-color: #f00;  border-radius:15px; font-size:15px;color:#fff;width:10px;right:10px; top:15px; z-index:200;" ><%=all_num %></span>
             </div>
         </a> 
         
         <ul class="index_tools_messages">
         	<li><a href="${pageContext.request.contextPath}/jsp/message_center/messagecenter.jsp">评论消息</a><span  style="min-width: 20px;line-height:20px; text-align: center; position: absolute; background-color: #f00;  border-radius:15px; font-size:15px;color:#fff;width:10px;right:5px; top:20px; z-index:200;" ><%=comment_num %></span></li>
          	<li><a href="${pageContext.request.contextPath}/jsp/message_center/messagecenter.jsp?id=2">关注消息</a><span  style="min-width: 20px;line-height:20px; text-align: center; position: absolute; background-color: #f00;  border-radius:15px; font-size:15px;color:#fff;width:10px;right:5px; top:80px; z-index:200;" ><%=follow_num %></span></li>
            <li><a href="${pageContext.request.contextPath}/jsp/message_center/messagecenter.jsp?id=3">收藏消息</a><span  style="min-width: 20px;line-height:20px; text-align: center; position: absolute; background-color: #f00;  border-radius:15px; font-size:15px;color:#fff;width:10px;right:5px; top:140px; z-index:200;" ><%=collect_num %></span></li>
            <li><a href="${pageContext.request.contextPath}/jsp/message_center/messagecenter.jsp?id=4">点赞消息</a><span  style="min-width: 20px;line-height:20px; text-align: center; position: absolute; background-color: #f00;  border-radius:15px; font-size:15px;color:#fff;width:10px;right:5px; top:200px; z-index:200;" ><%=zan_num %></span></li>
         </ul>
       
    </li>
    
    <%
      }else{ %>
         <li style="visibility:hidden">
    	<a href="javascript:;">
        	<div style="float:left; position:relative;">
    			<img src="${pageContext.request.contextPath}/image/message.png"/>
                	<span  style="min-width: 20px;line-height:20px; text-align: center; position: absolute; background-color: #f00;  border-radius:15px; font-size:15px;color:#fff;width:10px;right:10px; top:15px; z-index:200;" >0</span>
             </div>
         </a> 
         
         <ul class="index_tools_messages">
         	<li><a href="${pageContext.request.contextPath}/jsp/message_center/messagecenter.jsp">评论消息</a><span  style="min-width: 20px;line-height:20px; text-align: center; position: absolute; background-color: #f00;  border-radius:15px; font-size:15px;color:#fff;width:10px;right:5px; top:20px; z-index:200;" >0</span></li>
          	<li><a href="${pageContext.request.contextPath}/jsp/message_center/messagecenter.jsp?id=2">关注消息</a><span  style="min-width: 20px;line-height:20px; text-align: center; position: absolute; background-color: #f00;  border-radius:15px; font-size:15px;color:#fff;width:10px;right:5px; top:80px; z-index:200;" >0</span></li>
            <li><a href="${pageContext.request.contextPath}/jsp/message_center/messagecenter.jsp?id=3">收藏消息</a><span  style="min-width: 20px;line-height:20px; text-align: center; position: absolute; background-color: #f00;  border-radius:15px; font-size:15px;color:#fff;width:10px;right:5px; top:140px; z-index:200;" >0</span></li>
            <li><a href="${pageContext.request.contextPath}/jsp/message_center/messagecenter.jsp?id=4">点赞消息</a><span  style="min-width: 20px;line-height:20px; text-align: center; position: absolute; background-color: #f00;  border-radius:15px; font-size:15px;color:#fff;width:10px;right:5px; top:200px; z-index:200;" >0</span></li>
            <li><a href="${pageContext.request.contextPath}/jsp/manage_center/managecenter.jsp">举报消息</a><span  style="min-width: 20px;line-height:20px; text-align: center; position: absolute; background-color: #f00;  border-radius:15px; font-size:15px;color:#fff;width:10px;right:5px; top:265px; z-index:200;" >0</span></li>
         </ul>
       
    </li>
     <%} %>
    <%if(login_flag&&user_id==3){ %>
    <li>
    	<a href="javascript:;">
        	<img src="${pageContext.request.contextPath}/image/setting.png"/>
        </a>
        <ul class="index_tools_setting">
         	<li><a href="${pageContext.request.contextPath}/jsp/personal_center/personalcenter.jsp?id=5">&ensp;修改资料&ensp;</a></li>
          	<li><a href="${pageContext.request.contextPath}/jsp/personal_center/personalcenter.jsp?id=5">&ensp;修改头像&ensp;</a></li>
            <li><a href="${pageContext.request.contextPath}/jsp/personal_center/personalcenter.jsp?id=5">&ensp;更改密码&ensp;</a></li>
            <li><a href="${pageContext.request.contextPath}/jsp/personal_center/personalcenter.jsp">&ensp;个人中心&ensp;</a></li>
            <li><a href="${pageContext.request.contextPath}/jsp/manage_center/managecenter.jsp">&ensp;管理中心&ensp;</a></li>
            <li><a href="${pageContext.request.contextPath}/jsp/login/sign_out.jsp">&ensp;退出账号&ensp;</a></li>
         </ul>
    </li>
    <%}else if(login_flag){ %>
    <li>
    	<a href="javascript:;">
        	<img src="${pageContext.request.contextPath}/image/setting.png"/>
        </a>
        <ul class="index_tools_setting">
         	<li><a href="${pageContext.request.contextPath}/jsp/personal_center/personalcenter.jsp?id=5">&ensp;修改资料&ensp;</a></li>
          	<li><a href="${pageContext.request.contextPath}/jsp/personal_center/personalcenter.jsp?id=5">&ensp;修改头像&ensp;</a></li>
            <li><a href="${pageContext.request.contextPath}/jsp/personal_center/personalcenter.jsp?id=5">&ensp;更改密码&ensp;</a></li>
            <li><a href="${pageContext.request.contextPath}/jsp/personal_center/personalcenter.jsp">&ensp;个人中心&ensp;</a></li>
            <li><a href="${pageContext.request.contextPath}/jsp/report_center/reportcenter.jsp">&ensp;举报中心&ensp;</a></li>
            <li><a href="${pageContext.request.contextPath}/jsp/login/sign_out.jsp">&ensp;退出账号&ensp;</a></li>
         </ul>
    </li>
    
    <%}else{ %>
     <li style="visibility:hidden">
    	<a href="javascript:;">
        	<img src="${pageContext.request.contextPath}/image/setting.png"/>
        </a>
        <ul class="index_tools_setting">
         	<li><a href="${pageContext.request.contextPath}/jsp/personal_center/personalcenter.jsp?id=5">&ensp;修改资料&ensp;</a></li>
          	<li><a href="${pageContext.request.contextPath}/jsp/personal_center/personalcenter.jsp?id=5">&ensp;修改头像&ensp;</a></li>
            <li><a href="${pageContext.request.contextPath}/jsp/personal_center/personalcenter.jsp?id=5">&ensp;更改密码&ensp;</a></li>
            <li><a href="${pageContext.request.contextPath}/jsp/personal_center/personalcenter.jsp">&ensp;个人中心&ensp;</a></li>
            <li><a href="${pageContext.request.contextPath}/jsp/manage_center/managecenter.jsp">&ensp;管理中心&ensp;</a></li>
            <li><a href="${pageContext.request.contextPath}/jsp/report_center/reportcenter.jsp">&ensp;举报中心&ensp;</a></li>
            <li><a href="${pageContext.request.contextPath}/jsp/login/sign_out.jsp">&ensp;退出账号&ensp;</a></li>
         </ul>
    </li>
    <%} %>
    </ul>
     </div>
  <span style="color:#FFF; font-size:36px;float:left; margin-top:15px;"> |</span>
  <div id="index_head_signin">
    <%if(login_flag){ %>
		    <a href="${pageContext.request.contextPath}/jsp/personal_center/personalcenter.jsp" style=" float:left;background-color:#FFF; width:55px;height:55px;margin:10px; position:relative;padding-top:5px; padding-left:5px;"><img src="<%=user.getTouxiang() %>"  style="width:50px;height:50px;"/></a><a href="${pageContext.request.contextPath}/jsp/personal_center/personalcenter.jsp"><span style="width:90px;height:48px;overflow:hidden;float:left;margin-top:20px; font-size:18px; color:#FFF;"><%=user.getUsername() %></span></a>
		    <%}else{ %>
		    <ul>
		      <li><a href="${pageContext.request.contextPath}/jsp/login/register.jsp">注册</a></li>
		      <li><a href="${pageContext.request.contextPath}/jsp/login/sign_in.jsp">登录</a></li>
		    </ul>
		    <%} %>
  </div>
</div>


<!--顶端栏end-->
<!--内容框begin-->
<div id="index_all">
	<div id="publish_all">
    	<h1 style=" font-size:24px; width:960px; margin-left:40px;">█ 发表博文</h1>
       <div style="width:960px;height:280px;overflow:hidden;position:relative;"></div>
       	<form action="${pageContext.request.contextPath}/servlet/Publish"
				enctype="multipart/form-data" method="post">
       <div style="height:0px;">
        	<input  type="file" id="publish_fm" name="publish_fm" onchange="change()" accept="image/*">
            <img id="img" src="${pageContext.request.contextPath}/image/publish_fm.jpg" style="width:960px;height:270px;float:left;z-index: 9; position:absolute; top:160px;" >
       </div>
       <div style="margin-top:30px;">
       		 <span style="font-size:24px;">标题：</span>
       		 <input id="bt" type="text" name="bt"  placeholder="请输入标题(限15字)"  maxlength="30" style="font-size:24px; color:#999; border:1px solid #39C; width:430px;">
              <span style="font-size:24px;">标签：</span>
             <input  type="text" placeholder="添加标签,只能一个" name="lable" style="font-size:24px;color:#999;width:350px; border:1px solid #39c;" >
             <span style="font-size:24px;">导语：</span>
       		<input id="pub_daoyu" maxlength="100" type="text" name="pub_daoyu" placeholder="请输入导语（限50字）" style="font-size:24px; color:#999;border:1px solid #39c; margin-top:30px; width:865px;" ><br><br>
   			<textarea name="editor" id="editor" cols="30" rows="30" class="ckeditor" placeholder="点击输入正文" style="font-size:22px;color:#000; border:1px solid #39c;margin-left:27px; margin-top:50px;" ></textarea>
       </div>
        <input  type="submit" value="发表" style="font-size:36px; border:1px solid #39c; background-color:#39c; color:#FFF; margin-left:400px;width:200px; margin-bottom:30px;" >
    	<input type="hidden" name="author" value="<%=user.getUsername()%>">
    	</form>
    </div>
</div>
<!--内容框end-->
<!--置顶框begin-->
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/toTop.js"></script>
<!--置顶框end-->
</body>
</html>

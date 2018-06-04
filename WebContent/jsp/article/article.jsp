<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="threeblog.entity.*"%>
<%@ page import="threeblog.service.Service"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
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
	request.setCharacterEncoding("utf-8");
	int article_id = 10240;
	if (request.getParameter("id") != null) {
		article_id = Integer.parseInt(request.getParameter("id"));
	}
	Article article = service.getArticleFromId(article_id);//通过游记id获取游记表
	int author_id = article.getAuthor_id();
	User author = service.getUserFromId(author_id);//通过作者id获取作者表
	int click_num = article.getClick_num();
	click_num++;
	article.setClick_num(click_num);
	service.updateArticleClicknum(article);
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
<title>文章</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/main.css" type="text/css" />

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/calendar.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/comment.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css" type="text/css">


<link href="${pageContext.request.contextPath}/css/owl.carousel.css"
	rel="stylesheet">
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
				'display' : 'block',
				'animation:' : '2s'
			})
		}, function() {
			$(this).find('ul').css({
				'display' : 'none',
				'animation:' : '2s'
			})
		});
	});
</script>

</head>

<body>
	<!--顶端栏begin-->
	<div id="index_head">
		<div id="index_head_logo">
			<img src="${pageContext.request.contextPath}/image/logo.png">
		</div>
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
				<li><a href="${pageContext.request.contextPath}/jsp/index/search.jsp"> <img
						src="${pageContext.request.contextPath}/image/search.png"
						style="float: left;" />
				</a></li>
				

		

				 <%if(login_flag&&user_id==3){ %>
    <li>
    	<a href="javascript:;">
        	<div style="float:left; position:relative;">
    			<img src="${pageContext.request.contextPath}/image/message.png"/>
                	<span  style="min-width: 20px;line-height:20px; text-align: center; position: absolute; background-color: #f00;  border-radius:15px; font-size:15px;color:#fff;width:10px;right:10px; top:15px; z-index:200;" ><%=all_num+report_num+feedback_num %></span>
             </div>
         </a> 
         
         <ul class="index_tools_messages">
         	<li><a href="${pageContext.request.contextPath}/jsp/message_center/messagecenter.jsp">评论消息</a><span  style="min-width: 20px;line-height:20px; text-align: center; position: absolute; background-color: #f00;  border-radius:15px; font-size:15px;color:#fff;width:10px;right:5px; top:20px; z-index:200;" ><%=comment_num %></span></li>
          	<li><a href="${pageContext.request.contextPath}/jsp/message_center/messagecenter.jsp?id=2">关注消息</a><span  style="min-width: 20px;line-height:20px; text-align: center; position: absolute; background-color: #f00;  border-radius:15px; font-size:15px;color:#fff;width:10px;right:5px; top:80px; z-index:200;" ><%=follow_num %></span></li>
            <li><a href="${pageContext.request.contextPath}/jsp/message_center/messagecenter.jsp?id=3">收藏消息</a><span  style="min-width: 20px;line-height:20px; text-align: center; position: absolute; background-color: #f00;  border-radius:15px; font-size:15px;color:#fff;width:10px;right:5px; top:140px; z-index:200;" ><%=collect_num %></span></li>
            <li><a href="${pageContext.request.contextPath}/jsp/message_center/messagecenter.jsp?id=4">点赞消息</a><span  style="min-width: 20px;line-height:20px; text-align: center; position: absolute; background-color: #f00;  border-radius:15px; font-size:15px;color:#fff;width:10px;right:5px; top:200px; z-index:200;" ><%=zan_num %></span></li>
            <li><a href="${pageContext.request.contextPath}/jsp/manage_center/managecenter.jsp">举报消息</a><span  style="min-width: 20px;line-height:20px; text-align: center; position: absolute; background-color: #f00;  border-radius:15px; font-size:15px;color:#fff;width:10px;right:5px; top:265px; z-index:200;" ><%=report_num+feedback_num %></span></li>
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
		<span
			style="color: #FFF; font-size: 36px; float: left; margin-top: 15px;">
			|</span>
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
		<!--左侧栏begin-->
		<div id="article_left">
			<h2 style="width: 820px; font-weight: bold; margin-left: 70px;"><%=article.getTitle() %></h2>
			<a href="${pageContext.request.contextPath}/jsp/other_center/otherscenter.jsp?id=<%=author.getId()%>"><img src="<%=author.getTouxiang()%>"
				style="width: 40px; height: 40px; border-radius: 20px; float: left; margin-left: 70px;" /></a>
			<a style="color:#000" href="${pageContext.request.contextPath}/jsp/other_center/otherscenter.jsp?id=<%=author.getId()%>"><span style="float: left; margin-top: 10px; margin-left: 5px;"><%=author.getUsername()%></span></a>
			<span style="float: left; margin-top: 10px; margin-left: 20px;"><%=article.getPublishdate()%></span>
			<span style="float: left; margin-top: 10px; margin-left: 20px;"><%=article.getLable()%></span>
			<span style="float: left; margin-top: 10px; margin-left: 20px;">阅读&ensp;<%=article.getClick_num()%></span><br>
			<%if(!article.getStatus().equals("屏蔽")){ %>
			<div style="margin-left: 70px; margin-top: 30px; width: 820px;"><%=article.getText()%>
			</div>
			<%}else{ %>
			<div style="margin-left: 70px; margin-top: 30px; width: 820px;"> <p>该文章涉嫌违规内容，已被屏蔽！！</p>
			</div>
			<%} %>
			<%
				int last_article_id=service.getLastArticle_id(article_id,author_id);
				int next_article_id=service.getNextArticle_id(article_id,author_id);
			%>
			
			<div style="margin-top: 50px;">
				<%if(last_article_id!=-1){ %>
				<a href="${pageContext.request.contextPath }/jsp/article/article.jsp?id=<%=last_article_id %>" style="float: left; color: #666; margin-left: 70px;">◁上一篇 <%=service.getArticleFromId(last_article_id).getTitle() %></a> 
				<%}else{ %>
				<a href="javascript:;"
					style="float: left; color: #666; margin-left: 70px;">▷上一篇 没有了</a>
				<%} %>
				<%if(next_article_id!=-1){ %>	
				<a href="${pageContext.request.contextPath }/jsp/article/article.jsp?id=<%=next_article_id %>"
					style="float: right; color: #666; margin-right: 70px;">▷下一篇 <%=service.getArticleFromId(next_article_id).getTitle() %></a><br>
				<%}else{ %>
				<a href="javascript:;"
					style="float: right; color: #666; margin-right: 70px;">▷下一篇 没有了</a><br>
				<%} %>
			</div>

			<div style="margin-top: 50px; height: 50px;">

				<img id="like"
					src="${pageContext.request.contextPath}/image/unlike.png"
					style="cursor:pointer;width: 25px; float: left; margin-left: 520px;" title="喜欢">
				<%if(login_flag){ %>
				<!--喜欢图标更换的jq-->
				<script>
					$('#like').click(function() {
						var like=$("#liked").text();
						var article_id="<%=article.getId()%>";
						var receiver_id="<%=author_id%>";
						var sender_id="<%=user_id%>";
						if ($('#like').attr('src') == '${pageContext.request.contextPath}/image/unlike.png') {
							
							
							
							var url = "${pageContext.request.contextPath}/servlet/AddLiked";
							var args = {
								"article_id" : article_id,
								"receiver_id":receiver_id,
								"sender_id":sender_id,
								"liked":like,
								"status":"喜欢",
								"time" : new Date()
							};
							$.get(url, args,
									function(data) {
										$('#like').attr('src', '${pageContext.request.contextPath}/image/like.png');
										var liked=$("#liked").text();
										liked++;
										$("#liked").text(liked);
							});
							
							
						} else {
							var article_id="<%=article.getId()%>";
							var url = "${pageContext.request.contextPath}/servlet/AddLiked";
							var args = {
								"article_id" : article_id,
								"receiver_id":receiver_id,
								"sender_id":sender_id,
								"liked":like,
								"status":"不喜欢",
								"time" : new Date()
							};
							$.get(url, args,
									function(data) {
										
										$('#like').attr('src', '${pageContext.request.contextPath}/image/unlike.png');
										var liked=$("#liked").text();
										liked--;
										$("#liked").text(liked);
							});
							
							
						}

					});
				</script>
				<%}else{ %>
				<script>
					$('#like').click(function() {
						window.location.href='${pageContext.request.contextPath}/jsp/login/sign_in.jsp';
					});
				</script>
				<%} %>
				<span
					style="float: left; font-size: 18px; margin-bottom: 10px; color: #666; margin-left: 5px;">喜欢</span><span id="liked"
					style="float: left; font-size: 18px; margin-bottom: 10px; color: #666; margin-left: 10px;"><%=article.getLiked() %></span>
				<% if((service.getCollectFromUser_idArticle_id(user_id, article.getId())).getId()!=0){%>
				<img id="favor"
					src="${pageContext.request.contextPath}/image/favor.png"
					style="cursor:pointer;width: 25px; float: left; margin-left: 35px;" title="收藏">
					<%}else{ %>
					<img id="favor"
					src="${pageContext.request.contextPath}/image/unfavor.png"
					style="cursor:pointer;width: 25px; float: left; margin-left: 35px;" title="收藏">
					<%} %>
				<!--收藏图标更换的jq-->
				
				<span
					style="float: left; font-size: 18px; margin-bottom: 10px; color: #666;">收藏</span><span id="collected"
					style="float: left; font-size: 18px; margin-bottom: 10px; color: #666; margin-left: 10px;"><%=article.getCollected() %></span>
				<%if(login_flag){ %>
				<script>
				$('#favor').click(function() {
					var collect=$("#collected").text();
					var article_id="<%=article.getId()%>";
					var author_id="<%=author_id%>";	
					if ($('#favor').attr('src') == '${pageContext.request.contextPath}/image/unfavor.png') {
						
						
						
						var url2 = "${pageContext.request.contextPath}/servlet/CollectArticle";
						var args2 = {
							"article_id" : article_id,
							"author_id":author_id,
							"status":"收藏",
							"time" : new Date()
						};
						$.get(url2, args2,
								function(data) {
									var result=eval("("+data+")");
									if(result.bol==1) {
										alert("你不需要收藏自己的文章！");
									}
									else if(result.bol==2) {
										alert("收藏成功！");
										var url1 = "${pageContext.request.contextPath}/servlet/AddCollected";
										var args1 = {
											"article_id" : article_id,
											"collected":collect,
											"status":"收藏",
											"time" : new Date()
										};
										$.get(url1, args1,
												function(data) {
													$('#favor').attr('src', '${pageContext.request.contextPath}/image/favor.png');
													var collected=$("#collected").text();
													collected++;
													$("#collected").text(collected);
										});
									}
									else if(result.bol==3){alert("你已经收藏过了！");}
						});
						
						
					} else {
						var article_id="<%=article.getId()%>";
						
						
						var url2 = "${pageContext.request.contextPath}/servlet/CollectArticle";
						var args2 = {
							"article_id" : article_id,
							"author_id":author_id,
							"status":"取消收藏",
							"time" : new Date()
						};
						$.get(url2, args2,
								function(data) {
									var result=eval("("+data+")");
									if(result.bol==4) {
										alert("取消收藏成功");
										var url1 = "${pageContext.request.contextPath}/servlet/AddCollected";
										var args1 = {
											"article_id" : article_id,
											"collected":collect,
											"status":"不收藏",
											"time" : new Date()
										};
										$.get(url1, args1,
												function(data) {
													
													$('#favor').attr('src', '${pageContext.request.contextPath}/image/unfavor.png');
													var collected=$("#collected").text();
													collected--;
													$("#collected").text(collected);
										});
										
									}
						}); 
						
					}

				});
				</script>
				<%}else{ %>
				<script>
					$('#favor').click(function() {
						window.location.href='${pageContext.request.contextPath}/jsp/login/sign_in.jsp';
					});
				</script>
				<%} %>
				<%if(login_flag){ %>
				<a href="${pageContext.request.contextPath }/jsp/report_center/reportcenter_article.jsp?article_id=<%=article_id%>"><img
					src="${pageContext.request.contextPath}/image/report.png"
					style="width: 25px; float: left; margin-left: 35px;" title="举报"></a>
					<%}else{ %>
						<a href="${pageContext.request.contextPath }/jsp/login/sign_in.jsp"><img
					src="${pageContext.request.contextPath}/image/report.png"
					style="width: 25px; float: left; margin-left: 35px;" title="举报"></a>
					<%} %>
					<span
					style="margin-right: 115px; float: right; font-size: 18px; color: #666;">举报</span>
			</div>
			<div id="n_discuss">
				<!--
    此评论textarea文本框部分使用的https://github.com/alexdunphy/flexText此插件
-->
				<div class="commentAll">
					<!--评论区域 begin-->
					<div class="reviewArea clearfix">
						<div class="flex-text-wrap">
							<pre class="pre">
								<span></span><br>
							</pre>
							<textarea class="content comment-input" placeholder="留下你的评论..."
								onkeyup="keyUP(this)"></textarea>
						</div>
						<a href="javascript:;" class="plBtn">评论</a>
					</div>
					<!--评论区域 end-->
					<!--回复区域 begin-->
					<div class="comment-show">

						<%
							ArrayList<Comment> comments = service.getCommentsFromArticle_id(article_id);
							SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//定义格式，不显示毫秒
							int i;
							if(!comments.isEmpty()){
								for (i = 0; i < comments.size(); i++) {
									Comment comment = comments.get(i);
									User comment_author = service.getUserFromId(comment.getAuthor_id());
						%>
						<!--1-->
						<div class="comment-show-con clearfix">
							<!--这是头像div-->
							<div class="comment-show-con-img pull-left">
							<a href="${pageContext.request.contextPath}/jsp/other_center/otherscenter.jsp?id=<%=comment.getAuthor_id()%>">
								<img src="<%=comment_author.getTouxiang()%>" alt="">
							</a>
							</div>
							<div class="comment-show-con-list pull-left clearfix">
								<div class="pl-text clearfix">
									<!--用户名-->
									<a href="${pageContext.request.contextPath}/jsp/other_center/otherscenter.jsp?id=<%=comment.getAuthor_id()%>" class="comment-size-name"
										data="<%=comment.getId()%>"><%=comment_author.getUsername()%> : </a>
									<!--评论内容 -->
									<%if(!comment.getStatus().equals("屏蔽")){ %>	
									<span class="my-pl-con"><%=comment.getText()%></span>
									<%}else{ %>
									<span class="my-pl-con">该评论涉嫌违规内容，已被屏蔽！！</span>
									<%} %>
								</div>
								<div class="date-dz">
									<span class="date-dz-left pull-left comment-time"><%=df.format(comment.getAdd_time())%></span>
									<div class="date-dz-right pull-right comment-pl-block">
										
										<a href="javascript:;" class="removeBlock">举报</a>
										<%if(comment_author.getId()==user_id){ %>
										<a href="javascript:;" class="delete">删除</a>
										<%} %>
										<a href="javascript:;" class="date-dz-pl pl-hf pull-left">回复</a>
										<span class="pull-left date-dz-line">|</span>
										<!--赞-->
										<a href="javascript:;" class="date-dz-z pull-left"><i
											class="date-dz-z-click-red"></i>赞 (<i class="z-num"><%=comment.getZan() %></i>)</a>
									</div>
									<!--评论回复区域 begin-->

									<!--评论回复区域 end-->
								</div>
								<div class="hf-list-con">

									<!-- 评论回复内容区域begin -->

									<%
										ArrayList<Answer> answers=service.getAnswersFromArticle_idComment_id(comment.getId());
										for(int j=0;j<answers.size();j++){
											Answer answer=answers.get(j);
											User answer_author=service.getUserFromId(answer.getAuthor_id());
									%>

									<div class="all-pl-con">
										<div class="pl-text hfpl-text clearfix">
											<a href="${pageContext.request.contextPath}/jsp/other_center/otherscenter.jsp?id=<%=answer.getAuthor_id()%>" class="comment-size-name" data="<%=answer.getId()%>"><%=answer_author.getUsername() %> : </a> 
											
											<%if(!answer.getStatus().equals("屏蔽")){ %>
											<span class="my-pl-con"> &nbsp;<%=answer.getText() %></span>
											<%}else{ %>
											<span class="my-pl-con"> &nbsp;该回复涉嫌违规内容，已被屏蔽！！</span>
											<%} %>
										</div>
										<div class="date-dz">
											<span class="date-dz-left pull-left comment-time"><%=df.format(answer.getAdd_time() )%></span>
											<div class="date-dz-right pull-right comment-pl-block">
												
												<a href="javascript:;" class="removeBlock">举报</a>
												<%if(answer_author.getId()==user_id){ %>
												<a href="javascript:;" class="delete">删除</a>
												<%} %>
												<a href="javascript:;"
													class="date-dz-pl pl-hf hf-con-block pull-left">回复</a> <span
													class="pull-left date-dz-line">|</span> <a
													href="javascript:;" class="date-dz-z pull-left"> <i
													class="date-dz-z-click-red"></i>赞 (<i class="z-num"><%=answer.getZan() %></i>)
												</a>
											</div>
										</div>
									</div>
									<%} %>


									<!-- 评论回复内容区域end -->

								</div>
							</div>
						</div>
						<%
							}
							}
						%>






					</div>
				</div>



			</div>
			<!--回复区域 end-->
			
		<script type="text/javascript"
			src="${pageContext.request.contextPath}/js/jquery.flexText.js"></script>
		<!--textarea高度自适应-->
		<script type="text/javascript">
					$(function() {
						$('.content').flexText();
					});
				</script>
		<!--textarea限制字数-->
		<script type="text/javascript">
					function keyUP(t) {
						var len = $(t).val().length;
						if (len > 139) {
							$(t).val($(t).val().substring(0, 140));
						}
					}
				</script>
		<!--点击评论创建评论条-->
		<%if(login_flag){ %>
		<script type="text/javascript">
					$('.commentAll')
							.on(
									'click',
									'.plBtn',
									function() {
										//获取输入内容
										var oHtml;
										var oSize = $(this).siblings(
												'.flex-text-wrap').find(
												'.comment-input').val();
										console.log(oSize);
										//动态创建评论模块
										
										if (oSize.replace(/(^\s*)|(\s*$)/g, "") != '') {
											
											
											var url = "${pageContext.request.contextPath}/servlet/AddComment";
											var args = {
													
											
												"article_id" : "<%=article_id%>",	//文章id
												"author_id":"<%=user.getId()%>",    //从页面获得的用户id
												"receiver_id":"<%=author_id%>",		//从文章id获得的作者id
												"text1":"<%=article.getTitle()%>",  //文章标题
												"text2":oSize,                      //评论内容
												"time" : new Date()
											};
											$.ajaxSettings.async = false;  
											$.get(url, args,
													function(data) {
													var result=eval("("+data+")");
														var comment_id=result.comment_id;
														console.log(comment_id);
														var add_time=result.add_time;
														console.log(add_time);
												     	oHtml = '<div class="comment-show-con clearfix"><div class="comment-show-con-img pull-left" ><a href="${pageContext.request.contextPath}/jsp/other_center/otherscenter.jsp?id=<%=user_id%>"><img src="<%=user.getTouxiang()%>"</a>  alt=""></div> <div class="comment-show-con-list pull-left clearfix"><div class="pl-text clearfix"> <a href="${pageContext.request.contextPath}/jsp/other_center/otherscenter.jsp?id=<%=user_id%>" class="comment-size-name" data="'
															+comment_id+
														'"><%=user.getUsername()%> : </a> <span class="my-pl-con">&nbsp;'
															+ oSize
															+ '</span> </div> <div class="date-dz"> <span class="date-dz-left pull-left comment-time">'
															+ add_time
															+ '</span> <div class="date-dz-right pull-right comment-pl-block"><a href="javascript:;" class="removeBlock">举报</a><a href="javascript:;" class="delete">删除</a> <a href="javascript:;" class="date-dz-pl pl-hf hf-con-block pull-left">回复</a> <span class="pull-left date-dz-line">|</span> <a href="javascript:;" class="date-dz-z pull-left"><i class="date-dz-z-click-red"></i>赞 (<i class="z-num">0</i>)</a> </div> </div><div class="hf-list-con"></div></div> </div>';
														
												     
											}); 
											$.ajaxSettings.async = true;  
											
											$(this).parents('.reviewArea ')
											.siblings('.comment-show')
											.prepend(oHtml);
											$(this).siblings('.flex-text-wrap')
											.find('.comment-input')
											.prop('value', '')
											.siblings('pre').find(
													'span').text('');
											
											
											
											
											
										}
									});
				</script>
				<%}else{ %>
				<script type="text/javascript">
					$('.commentAll')
							.on(
									'click',
									'.plBtn',
									function() {
										window.location.href='${pageContext.request.contextPath}/jsp/login/sign_in.jsp';
									});
				</script>
				<%} %>


		<!--点击回复动态创建回复块-->
		<script type="text/javascript">
		 $('.comment-show').on('click','.pl-hf',function(){
		        //获取回复人的名字
		        var fhName = $(this).parents('.date-dz-right').parents('.date-dz').siblings('.pl-text').find('.comment-size-name').html();
		        //回复@
		        var fhN = '回复@'+fhName;
		        //var oInput = $(this).parents('.date-dz-right').parents('.date-dz').siblings('.hf-con');
		        var fhHtml = '<div class="hf-con pull-left"> <textarea class="content comment-input hf-input" placeholder="" onkeyup="keyUP(this)"></textarea> <a href="javascript:;" class="hf-pl">评论</a></div>';
		        //显示回复
		        if($(this).is('.hf-con-block')){
		            $(this).parents('.date-dz-right').parents('.date-dz').append(fhHtml);
		            $(this).removeClass('hf-con-block');
		            $('.content').flexText();
		            $(this).parents('.date-dz-right').siblings('.hf-con').find('.pre').css('padding','6px 15px');
		            //console.log($(this).parents('.date-dz-right').siblings('.hf-con').find('.pre'))
		            //input框自动聚焦
		            $(this).parents('.date-dz-right').siblings('.hf-con').find('.hf-input').val('').focus().val(fhN);
		        }else {
		            $(this).addClass('hf-con-block');
		            $(this).parents('.date-dz-right').siblings('.hf-con').remove();
		        }
		    });
				</script>
		<!--评论回复块创建-->
		<%if(login_flag){ %>
		<script type="text/javascript">
					$('.comment-show')
							.on(
									'click',
									'.hf-pl',
									function() {
										var oThis = $(this);
										//获取输入内容
										var oHfVal = $(this).siblings(
												'.flex-text-wrap').find(
												'.hf-input').val();
										console.log("oHfVal");
										console.log(oHfVal)
										var oHfName = $(this)
												.parents('.hf-con').parents(
														'.date-dz').siblings(
														'.pl-text').find(
														'.comment-size-name')
												.html();
										
										var alltext=$(this)
										.parents('.hf-con').parents(
										'.date-dz').siblings(
										'.pl-text').html();
										console.log("alltext:");
										console.log(alltext);
										var flag;
										var comment_id;
										var answer_id=$(this)
										.parents('.hf-con').parents(
										'.date-dz').siblings(
										'.pl-text').find(
										'.comment-size-name').attr("data");
										if(alltext.indexOf("@")==-1){
											flag=1;//代表comment_id和answer_id是相重叠的
											comment_id = $(this)
											.parents('.hf-con').parents(
													'.date-dz').siblings(
													'.pl-text').find(
													'.comment-size-name').attr("data");
											console.log("comment_id:");
											console.log(comment_id);
											
										}else{
										flag=0;//代表comment_id和answer_id是不相重叠的
										comment_id = $(this)
										.parents('.hf-con').parents(
												'.date-dz').parents('.all-pl-con').parents('.hf-list-con').
												siblings(
												'.pl-text').find(
												'.comment-size-name').attr("data");
										console.log("comment_id:");
										console.log(comment_id);
								
										
										}
										var username="<%=user.getUsername()%>"+" : ";
										
										
										if(oHfName==username){
											alert("想对自己说什么话，憋在心里就好了");
											oThis
											.parents(
													'.hf-con')
											.siblings(
													'.date-dz-right')
											.find(
													'.pl-hf')
											.addClass(
													'hf-con-block')
											&& oThis
													.parents(
															'.hf-con')
													.remove();
													return false;
										}
										
										var oAllVal = '回复@' + oHfName;
										if (oHfVal.replace(/^ +| +$/g, '') == ''
												|| oHfVal == oAllVal) {

										} else {
											$
													.getJSON(
															"${pageContext.request.contextPath}/json/pl.json",
															function(data) {
																var oAt = '';
																var oHf = '';
																$
																		.each(
																				data,
																				function(
																						n,
																						v) {
																					delete v.hfContent;
																					delete v.atName;
																					var arr;
																					var ohfNameArr;
																					if (oHfVal
																							.indexOf("@") == -1) {
																						data['atName'] = '';
																						data['hfContent'] = oHfVal;
																					} else {
																						arr = oHfVal
																								.split(':');
																						ohfNameArr = arr[0]
																								.split('@');
																						data['hfContent'] = arr[1];
																						data['atName'] = ohfNameArr[1];
																					}

																					if (data.atName == '') {
																						oAt = data.hfContent;
																					} else {
																						oAt = '回复<a href="javascript:;" class="atName">@'
																								+ data.atName
																								+ '</a> : '
																								+ data.hfContent;
																					}
																					oHf = data.hfName;
																				});

																var oHtml ;
																var url = "${pageContext.request.contextPath}/servlet/AddAnswer";
																var args = {
																	"author_id":"<%=user.getId()%>",
																	"comment_id":comment_id,
																	"flag":flag,
																	"last_answer_id":answer_id,
																	"article_id":"<%=article.getId()%>",
																	"text2":oAt,
																	"time" : new Date()
																};
																console.log("1");
																console.log(oAt);
																$.ajaxSettings.async = false;  
																$.get(url, args,
																		function(data) {
																		var result=eval("("+data+")");
																			var answer_id=result.answer_id;
																			console.log("answer_id");
																			console.log(answer_id);
																			var add_time=result.add_time;
																			console.log(add_time);
																			oHtml= '<div class="all-pl-con"><div class="pl-text hfpl-text clearfix"><a href="${pageContext.request.contextPath}/jsp/other_center/otherscenter.jsp?id=<%=user_id%>" class="comment-size-name" data="'
																				+answer_id+
																				'"><%=user.getUsername()%> : </a><span class="my-pl-con">'
																				+ oAt
																				+ '</span></div><div class="date-dz"> <span class="date-dz-left pull-left comment-time">'
																				+ add_time
																				+ '</span> <div class="date-dz-right pull-right comment-pl-block"> <a href="javascript:;" class="removeBlock">举报</a><a href="javascript:;" class="delete">删除</a><a href="javascript:;" class="date-dz-pl pl-hf hf-con-block pull-left">回复</a> <span class="pull-left date-dz-line">|</span> <a href="javascript:;" class="date-dz-z pull-left"><i class="date-dz-z-click-red"></i>赞 (<i class="z-num">0</i>)</a> </div> </div></div>';
																			
																	     
																}); 
																$.ajaxSettings.async = true;  
																
																
																
																		
																		
																		
																		
																		
																		
																		oThis
																		.parents(
																				'.hf-con')
																		.parents(
																				'.comment-show-con-list')
																		.find(
																				'.hf-list-con')
																		.css(
																				'display',
																				'block')
																		.prepend(
																				oHtml)
																		&& oThis
																				.parents(
																						'.hf-con')
																				.siblings(
																						'.date-dz-right')
																				.find(
																						'.pl-hf')
																				.addClass(
																						'hf-con-block')
																		&& oThis
																				.parents(
																						'.hf-con')
																				.remove();
																
																		
															});
										}
									});
				</script>
				<%}else{ %>
				<script type="text/javascript">
					$('.comment-show')
							.on(
									'click',
									'.hf-pl',
									function() {
										window.location.href='${pageContext.request.contextPath}/jsp/login/sign_in.jsp';
									});
				</script>
				<%} %>
		<!--举报评论块  -->
		<%if(login_flag){ %>
		<script type="text/javascript">
					 $('.commentAll').on('click','.removeBlock',function(){
						 	var alltext=$(this)
							.parents('.date-dz-right').parents(
							'.date-dz').siblings(
							'.pl-text').html();
						 	var article_id="<%=article_id%>";
							var comment_id = $(this)
							.parents('.date-dz-right').parents(
							'.date-dz').siblings(
							'.pl-text').find(
							'.comment-size-name').attr("data");
							if(alltext.indexOf("@")==-1){	
								<!--举报的是评论 -->
								window.location.href='${pageContext.request.contextPath}/jsp/report_center/reportcenter_comment.jsp?article_id='+article_id+"&comment_id="+comment_id;
	
							}else{
								<!--举报的是回复 -->
								window.location.href='${pageContext.request.contextPath}/jsp/report_center/reportcenter_answer.jsp?article_id='+article_id+"&answer_id="+comment_id;
							
							}

					}) 
				</script>
				<%}else{ %>
				<script type="text/javascript">
					 $('.commentAll').on('click','.removeBlock',function(){
						 	var alltext=$(this)
							.parents('.date-dz-right').parents(
							'.date-dz').siblings(
							'.pl-text').html();
						 	var article_id="<%=article_id%>";
							var comment_id = $(this)
							.parents('.date-dz-right').parents(
							'.date-dz').siblings(
							'.pl-text').find(
							'.comment-size-name').attr("data");
							if(alltext.indexOf("@")==-1){	
								<!--举报的是评论 -->
								window.location.href='${pageContext.request.contextPath}/jsp/login/sign_in.jsp;
	
							}else{
								<!--举报的是回复 -->
								window.location.href='${pageContext.request.contextPath}/jsp/login/sign_in.jsp;
							
							}

					}) 
				</script>
				<%} %>
		<!--删除评论块-->
		<script type="text/javascript">
		    $('.commentAll').on('click','.delete',function(){
		        
		    	 var oT = $(this).parents('.date-dz-right').parents('.date-dz').parents('.all-pl-con');
		    	 var flag=2;
		        var alltext=$(this)
				.parents('.date-dz-right').parents(
				'.date-dz').siblings(
				'.pl-text').html();
		        var comment_id = $(this)
				.parents('.date-dz-right').parents(
				'.date-dz').siblings(
				'.pl-text').find(
				'.comment-size-name').attr("data");
		        
		        if(alltext.indexOf("@")==-1){	
					<!--删除的是评论 -->
					var url = "${pageContext.request.contextPath}/servlet/DeleteComment";
					 var args={
				        		"comment_id" : comment_id,
								"time" : new Date()
				        }
					 
						 $.ajaxSettings.async = false; 
				        $.get(url, args,
								function(data) {
						        	var result=eval("("+data+")");
						        	if(result.bol==1){       
						        		flag=1;
						        	}else if(result.bol==2){
						        		alert("删除失败！由于收到用户举报，该评论暂时被锁定！");
						        	}
						        	
						}); 
				        $.ajaxSettings.async = true; 
			
				}else{
					<!--删除的是回复 -->
					var url = "${pageContext.request.contextPath}/servlet/DeleteAnswer";
					var args={
			        		"answer_id" : comment_id,
							"time" : new Date()
			        }
					
					$.ajaxSettings.async = false; 
			        $.get(url, args,
							function(data) {
					        	var result=eval("("+data+")");
					        	if(result.bol==1){
					        		 flag=1;
					        	}else if(result.bol==2){
					        		alert("删除失败！由于收到用户举报，该回复暂时被锁定！");
					        	}
					        	
					}); 
			        $.ajaxSettings.async = true; 
			
				}
		        if(flag==1){
		        	if(oT.siblings('.all-pl-con').length >= 1){
		                oT.remove();
		            }else {
		                $(this).parents('.date-dz-right').parents('.date-dz').parents('.all-pl-con').parents('.hf-list-con').css('display','none')
		                oT.remove();
		            }
		            $(this).parents('.date-dz-right').parents('.date-dz').parents('.comment-show-con-list').parents('.comment-show-con').remove();
		        }
		        
		        
		    })
		</script>		
				
		<!--点赞-->
		<script type="text/javascript">
					$('.comment-show').on(
							'click',
							'.date-dz-z',
							function() {
								var zNum = $(this).find('.z-num').html();
								var status;
								if ($(this).is('.date-dz-z-click')) {
									zNum--;
									status="取消点赞";
									$(this).removeClass('date-dz-z-click red');
									$(this).find('.z-num').html(zNum);
									$(this).find('.date-dz-z-click-red')
											.removeClass('red');
								} else {
									zNum++;
									status="点赞";
									$(this).addClass('date-dz-z-click');
									$(this).find('.z-num').html(zNum);
									$(this).find('.date-dz-z-click-red')
											.addClass('red');
								}
					
								var alltext=$(this)
								.parents('.date-dz-right').parents(
								'.date-dz').siblings(
								'.pl-text').html();
								var comment_id = $(this)
								.parents('.date-dz-right').parents(
								'.date-dz').siblings(
								'.pl-text').find(
								'.comment-size-name').attr("data");
								var sender_id="<%=user_id%>";
								var article_id="<%=article_id%>"
								if(alltext.indexOf("@")==-1){		
									<!--点赞的是评论表 -->
									var url = "${pageContext.request.contextPath}/servlet/AddZanToComment";
									var args = {
										"comment_id":comment_id,
										"sender_id":sender_id,
										"article_id":article_id,
										"status":status,
										"zan":zNum,
										"time" : new Date()
									};
									$.ajaxSettings.async = false;  
									$.get(url, args); 
									$.ajaxSettings.async = true;  					
								}else{
								
									var url = "${pageContext.request.contextPath}/servlet/AddZanToAnswer";
									var args = {
										"comment_id":comment_id,
										"sender_id":sender_id,
										"article_id":article_id,
										"status":status,
										"zan":zNum,
										"time" : new Date()
									};
									$.ajaxSettings.async = false;  
									$.get(url, args); 
									$.ajaxSettings.async = true;  
								
								}
					
								
								
							})
				</script>
			
			
		</div>
		<!--左侧栏end-->

	</div>
	<!--内容框end-->
	<!--置顶框begin-->
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/js/toTop.js"></script>
	<!--置顶框end-->
</body>
</html>

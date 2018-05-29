<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="threeblog.entity.*"%>
<%@ page import="threeblog.service.Service"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%
	User user = new User();
	Service service = new Service();
	int user_id = 10240;
	if (session.getAttribute("user_id") == null) {
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().print("<script>alert(`会话过期，将重新登录！`)</script>");
		String content = 0 + ";URL= " + request.getContextPath() + "/jsp/login/sign_in.jsp";
		response.setHeader("REFRESH ", content);
	} else {
		user_id = Integer.valueOf((String) session.getAttribute("user_id"));
		user = service.getUserFromId(user_id);
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
		      <li><a href="${pageContext.request.contextPath}/jsp/personal_center/personalcenter.jsp" >我的</a></li>
			</ul>
		</div>
		<div id="index_head_tools">
			<ul>
				<li><a href="${pageContext.request.contextPath}/jsp/index/search.jsp"> <img
						src="${pageContext.request.contextPath}/image/search.png"
						style="float: left;" />
				</a></li>
				<li><a href="#">
						<div style="float: left; position: relative;">
							<img src="${pageContext.request.contextPath}/image/message.png" />
							<span
								style="min-width: 20px; line-height: 20px; text-align: center; position: absolute; background-color: #f00; border-radius: 15px; font-size: 15px; color: #fff; width: 10px; right: 10px; top: 15px; z-index: 200;">0</span>
						</div>
				</a>
					<ul class="index_tools_messages">
						<li><a href="#home">评论消息</a><span
							style="min-width: 20px; line-height: 20px; text-align: center; position: absolute; background-color: #f00; border-radius: 15px; font-size: 15px; color: #fff; width: 10px; right: 5px; top: 20px; z-index: 200;">0</span></li>
						<li><a href="#home">关注消息</a><span
							style="min-width: 20px; line-height: 20px; text-align: center; position: absolute; background-color: #f00; border-radius: 15px; font-size: 15px; color: #fff; width: 10px; right: 5px; top: 80px; z-index: 200;">0</span></li>
						<li><a href="#home">收藏消息</a><span
							style="min-width: 20px; line-height: 20px; text-align: center; position: absolute; background-color: #f00; border-radius: 15px; font-size: 15px; color: #fff; width: 10px; right: 5px; top: 140px; z-index: 200;">0</span></li>
						<li><a href="#home">点赞消息</a><span
							style="min-width: 20px; line-height: 20px; text-align: center; position: absolute; background-color: #f00; border-radius: 15px; font-size: 15px; color: #fff; width: 10px; right: 5px; top: 200px; z-index: 200;">0</span></li>
						<li><a href="#home">举报消息</a><span
							style="min-width: 20px; line-height: 20px; text-align: center; position: absolute; background-color: #f00; border-radius: 15px; font-size: 15px; color: #fff; width: 10px; right: 5px; top: 265px; z-index: 200;">0</span></li>
					</ul></li>
				<li><a href="#"> <img
						src="${pageContext.request.contextPath}/image/setting.png" />
				</a>
					<ul class="index_tools_setting">
						<li><a href="${pageContext.request.contextPath}/jsp/personal_center/personalcenter.jsp?id=5">&ensp;修改资料&ensp;</a></li>
			          	<li><a href="${pageContext.request.contextPath}/jsp/personal_center/personalcenter.jsp?id=5">&ensp;修改头像&ensp;</a></li>
			            <li><a href="${pageContext.request.contextPath}/jsp/personal_center/personalcenter.jsp?id=5">&ensp;更改密码&ensp;</a></li>
			            <li><a href="${pageContext.request.contextPath}/jsp/personal_center/personalcenter.jsp">&ensp;个人中心&ensp;</a></li>
			            <li><a href="#home">&ensp;举报中心&ensp;</a></li>
			            <li><a href="#home">&ensp;退出账号&ensp;</a></li>
					</ul></li>
			</ul>
		</div>
		<span
			style="color: #FFF; font-size: 36px; float: left; margin-top: 15px;">
			|</span>
		<div id="index_head_signin">
			<ul>
				<li><a href="register.html">注册</a></li>
				<li><a href="signin.html">登录</a></li>
			</ul>
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
			<div style="margin-left: 70px; margin-top: 30px; width: 820px;"><%=article.getText()%>
			</div>
			<div style="margin-top: 50px;">
				<a href="#" style="float: left; color: #666; margin-left: 70px;">◁上一篇
					所有的你</a> <a href="#"
					style="float: right; color: #666; margin-right: 70px;">▷下一篇 没有了</a><br>
			</div>

			<div style="margin-top: 50px; height: 50px;">

				<img id="like"
					src="${pageContext.request.contextPath}/image/unlike.png"
					style="cursor:pointer;width: 25px; float: left; margin-left: 520px;" title="喜欢">

				<!--喜欢图标更换的jq-->
				<script>
					$('#like').click(function() {
						var like=$("#liked").text();
						if ($('#like').attr('src') == '${pageContext.request.contextPath}/image/unlike.png') {
							var article_id="<%=article.getId()%>";
							var url = "${pageContext.request.contextPath}/servlet/AddLiked";
							var args = {
								"article_id" : article_id,
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
								"liked":like,
								"status":"不喜欢",
								"time" : new Date()
							};
							$.get(url, args,
									function(data) {
										
										$('#like').attr('src', '${pageContext.request.contextPath}/image/like.png');
										var liked=$("#liked").text();
										liked--;
										$("#liked").text(liked);
							});
							
							
						}

					});
				</script>

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
				<script>
				$('#favor').click(function() {
					var collect=$("#collected").text();
					if ($('#favor').attr('src') == '${pageContext.request.contextPath}/image/unfavor.png') {
						var article_id="<%=article.getId()%>";
						
						
						
						var url2 = "${pageContext.request.contextPath}/servlet/CollectArticle";
						var args2 = {
							"article_id" : article_id,
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
													
													$('#favor').attr('src', '${pageContext.request.contextPath}/image/favor.png');
													var collected=$("#collected").text();
													collected--;
													$("#collected").text(collected);
										});
										
									}
						}); 
						
					}

				});
				</script>
				<a href="${pageContext.request.contextPath }/jsp/report_center/reportcenter_article.jsp?article_id=<%=article.getId()%>"><img
					src="${pageContext.request.contextPath}/image/report.png"
					style="width: 25px; float: left; margin-left: 35px;" title="举报"></a>
					<span
					style="margin-right: 135px; float: right; font-size: 18px; color: #666;">举报</span>
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
								<img src="<%=comment_author.getTouxiang()%>" alt="">
							</div>
							<div class="comment-show-con-list pull-left clearfix">
								<div class="pl-text clearfix">
									<!--用户名-->
									<a href="${pageContext.request.contextPath}/login_jsp/otherscenter.jsp?id=<%=comment.getAuthor_id()%>" class="comment-size-name"
										data="<%=comment.getId()%>"><%=comment_author.getUsername()%> : </a>
									<!--评论内容 -->
									<span class="my-pl-con"><%=comment.getText()%></span>
								</div>
								<div class="date-dz">
									<span class="date-dz-left pull-left comment-time"><%=df.format(comment.getAdd_time())%></span>
									<div class="date-dz-right pull-right comment-pl-block">
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
											<a href="${pageContext.request.contextPath}/login_jsp/otherscenter.jsp?id=<%=answer.getAuthor_id()%>" class="comment-size-name" data="<%=answer.getId()%>"><%=answer_author.getUsername() %> : </a> <span class="my-pl-con"> &nbsp;<%=answer.getText() %>
											</span>
										</div>
										<div class="date-dz">
											<span class="date-dz-left pull-left comment-time"><%=df.format(answer.getAdd_time() )%></span>
											<div class="date-dz-right pull-right comment-pl-block">
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
												     	oHtml = '<div class="comment-show-con clearfix"><div class="comment-show-con-img pull-left" ><img src="<%=user.getTouxiang()%>"  alt=""></div> <div class="comment-show-con-list pull-left clearfix"><div class="pl-text clearfix"> <a href="${pageContext.request.contextPath}/login_jsp/otherscenter.jsp?id=<%=user_id%>" class="comment-size-name" data="'
															+comment_id+
														'"><%=user.getUsername()%> : </a> <span class="my-pl-con">&nbsp;'
															+ oSize
															+ '</span> </div> <div class="date-dz"> <span class="date-dz-left pull-left comment-time">'
															+ add_time
															+ '</span> <div class="date-dz-right pull-right comment-pl-block"> <a href="javascript:;" class="date-dz-pl pl-hf hf-con-block pull-left">回复</a> <span class="pull-left date-dz-line">|</span> <a href="javascript:;" class="date-dz-z pull-left"><i class="date-dz-z-click-red"></i>赞 (<i class="z-num">0</i>)</a> </div> </div><div class="hf-list-con"></div></div> </div>';
														
												     
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
																			oHtml= '<div class="all-pl-con"><div class="pl-text hfpl-text clearfix"><a href="${pageContext.request.contextPath}/login_jsp/otherscenter.jsp?id=<%=user_id%>" class="comment-size-name" data="'
																				+answer_id+
																				'"><%=user.getUsername()%> : </a><span class="my-pl-con">'
																				+ oAt
																				+ '</span></div><div class="date-dz"> <span class="date-dz-left pull-left comment-time">'
																				+ add_time
																				+ '</span> <div class="date-dz-right pull-right comment-pl-block"> <a href="javascript:;" class="date-dz-pl pl-hf hf-con-block pull-left">回复</a> <span class="pull-left date-dz-line">|</span> <a href="javascript:;" class="date-dz-z pull-left"><i class="date-dz-z-click-red"></i>赞 (<i class="z-num">0</i>)</a> </div> </div></div>';
																			
																	     
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
		<!--删除评论块  已屏蔽-->
		<script type="text/javascript">
					/* $('.commentAll').on('click','.removeBlock',function(){
					    var oT = $(this).parents('.date-dz-right').parents('.date-dz').parents('.all-pl-con');
					    if(oT.siblings('.all-pl-con').length >= 1){
					        oT.remove();
					    }else {
					        $(this).parents('.date-dz-right').parents('.date-dz').parents('.all-pl-con').parents('.hf-list-con').css('display','none')
					        oT.remove();
					    }
					    $(this).parents('.date-dz-right').parents('.date-dz').parents('.comment-show-con-list').parents('.comment-show-con').remove();

					}) */
				</script>
		<!--点赞-->
		<script type="text/javascript">
					$('.comment-show').on(
							'click',
							'.date-dz-z',
							function() {
								var zNum = $(this).find('.z-num').html();
								if ($(this).is('.date-dz-z-click')) {
									zNum--;
									$(this).removeClass('date-dz-z-click red');
									$(this).find('.z-num').html(zNum);
									$(this).find('.date-dz-z-click-red')
											.removeClass('red');
								} else {
									zNum++;
									$(this).addClass('date-dz-z-click');
									$(this).find('.z-num').html(zNum);
									$(this).find('.date-dz-z-click-red')
											.addClass('red');
								}
					
								var alltext=$(this)
								.parents('.date-dz-right').parents(
								'.date-dz').siblings(
								'.pl-text').html();
								console.log("alltext:");
								console.log(alltext);
								var comment_id = $(this)
								.parents('.date-dz-right').parents(
								'.date-dz').siblings(
								'.pl-text').find(
								'.comment-size-name').attr("data");
								if(alltext.indexOf("@")==-1){
									console.log("comment_id:");
									console.log(comment_id);
									
									<!--点赞的是评论表 -->
									var url = "${pageContext.request.contextPath}/servlet/AddZanToComment";
									var args = {
										"comment_id":comment_id,
										"zan":zNum,
										"time" : new Date()
									};
									$.ajaxSettings.async = false;  
									$.get(url, args); 
									$.ajaxSettings.async = true;  
									
									
									
									
									
									
								}else{
								
									console.log("comment_id:");
									console.log(comment_id);
									var url = "${pageContext.request.contextPath}/servlet/AddZanToAnswer";
									var args = {
										"comment_id":comment_id,
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

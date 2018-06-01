<%@page import="threeblog.entity.Report"%>
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
<title>反馈</title>
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
       <li><a href="${pageContext.request.contextPath}/index.jsp" >首页</a></li>
      <li><a href="${pageContext.request.contextPath}/jsp/index/blog.jsp" >博文</a></li>
      <li><a href="${pageContext.request.contextPath}/jsp/index/pictures.jsp" >画廊</a></li>
      <li><a href="${pageContext.request.contextPath}/jsp/personal_center/personalcenter.jsp" >我的</a></li>
    </ul>
  </div>
  <div id="index_head_tools"> 
  <ul>
  	<li>
    	<a href="#">
        	<img  src="${pageContext.request.contextPath}/image/search.png" style="float:left;" />
       	</a> 
    </li>
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
<% 
	int report_id=Integer.valueOf(request.getParameter("id"));
	Report report=service.getReportFromId(report_id); 
%>
<div id="index_all">
	<div id="reportcenter_all">
    	<h1 style=" font-size:20px; width:960px; margin-left:40px;">█ Three Blog反馈平台</h1><br/>
        <%if(report.getType().equals("举报文章")){ %>
        
        <form action="${pageContext.request.contextPath}/servlet/UpdateReport">
        <div  style="margin-left:100px;">
        <span style="font-size:20px;">您要申请恢复是博文&ensp;</span>
        <a href="<%=report.getUrl()%>"><u style="font-size:20px;color:#09F; font-weight:bold;"><%=service.getArticleFromId(report.getContent_id()).getTitle() %></u></a>
        <span style="font-size:20px;">&ensp;摘要如下：&ensp;</span><br/><br/>
        <textarea  style="width:800px; height:200px; border:1px solid;  color:#999; font-size:28px;" ><%=report.getContent()%></textarea>
        </div>
        
        <div  style="margin-left:100px;">
        <br/><br/>
        <span style="font-size:20px;">填写详细恢复说明：</span><br/><br/>
        <textarea style="width:800px; height:200px; border:1px solid;font-size:28px; resize:none;" placeholder="详细恢复理由" name="feedback_reason"></textarea>
        </div>
        
         <input type="hidden"  name="status3" value="反馈等待审核"> 
         <input type="hidden"  name="report_id" value="<%=report_id%>">
        <input type="submit" value="提交" style="margin-left:320px; width:80px; height:50px; font-size:20px; margin-top:30px; margin-bottom:30px; border:1px solid; font-weight:bold; background-color:#FFF; border-radius:5px;"/>
        <input type="reset" value="取消" style="margin-left:150px; width:80px; height:50px; font-size:20px; margin-top:30px; margin-bottom:30px; border:1px solid; font-weight:bold; background-color:#FFF; border-radius:5px;"/>
        </form>
        
        <%}else if(report.getType().equals("举报评论")){ %>
        <form action="${pageContext.request.contextPath}/servlet/UpdateReport">
        <div  style="margin-left:100px;">
        <span style="font-size:20px;">您要申请恢复在博文&ensp;</span>
        <a href="<%=report.getUrl()%>"><u style="font-size:20px;color:#09F; font-weight:bold;"><%=service.getArticleFromId(service.getCommentFromComment_id(report.getContent_id()).getArticle_id()).getTitle()%></u></a>
        <span style="font-size:20px;">&ensp;下的评论，摘要如下：&ensp;</span><br/><br/>
        <textarea  style="width:800px; height:200px; border:1px solid;  color:#999; font-size:28px;" ><%=report.getContent()%></textarea>
        </div>
        
        <div  style="margin-left:100px;">
        <br/><br/>
        <span style="font-size:20px;">填写详细恢复说明：</span><br/><br/>
        <textarea style="width:800px; height:200px; border:1px solid;font-size:28px; resize:none;" placeholder="详细恢复理由" name="feedback_reason"></textarea>
        </div>
        
         <input type="hidden"  name="status3" value="反馈等待审核"> 
          <input type="hidden"  name="report_id" value="<%=report_id%>"> 
        <input type="submit" value="提交" style="margin-left:320px; width:80px; height:50px; font-size:20px; margin-top:30px; margin-bottom:30px; border:1px solid; font-weight:bold; background-color:#FFF; border-radius:5px;"/>
        <input type="reset" value="取消" style="margin-left:150px; width:80px; height:50px; font-size:20px; margin-top:30px; margin-bottom:30px; border:1px solid; font-weight:bold; background-color:#FFF; border-radius:5px;"/>
        </form>
        <%}else if(report.getType().equals("举报回复")){ %>
	         <form action="${pageContext.request.contextPath}/servlet/UpdateReport">
	        <div  style="margin-left:100px;">
	        <span style="font-size:20px;">您要申请恢复在博文&ensp;</span>
	        <a href="<%=report.getUrl()%>"><u style="font-size:20px;color:#09F; font-weight:bold;"><%=service.getArticleFromId(service.getCommentFromComment_id(service.getAnswertFromAnswer_id(report.getContent_id()).getComment_id()).getArticle_id()).getTitle()%></u></a>
	        <span style="font-size:20px;">&ensp;下的回复，摘要如下：&ensp;</span><br/><br/>
	        <textarea  style="width:800px; height:200px; border:1px solid;  color:#999; font-size:28px;" ><%=report.getContent()%></textarea>
	        </div>
	        
	        <div  style="margin-left:100px;">
	        <br/><br/>
	        <span style="font-size:20px;">填写详细恢复说明：</span><br/><br/>
	        <textarea style="width:800px; height:200px; border:1px solid;font-size:28px; resize:none;" placeholder="详细恢复理由" name="feedback_reason"></textarea>
	        </div>
	        
	         <input type="hidden"  name="status3" value="反馈等待审核"> 
	         <input type="hidden"  name="report_id" value="<%=report_id%>">
	        <input type="submit" value="提交" style="margin-left:320px; width:80px; height:50px; font-size:20px; margin-top:30px; margin-bottom:30px; border:1px solid; font-weight:bold; background-color:#FFF; border-radius:5px;"/>
	        <input type="reset" value="取消" style="margin-left:150px; width:80px; height:50px; font-size:20px; margin-top:30px; margin-bottom:30px; border:1px solid; font-weight:bold; background-color:#FFF; border-radius:5px;"/>
	        </form>
	        <%} %>
    </div>
</div>
<!--内容框end-->
<!--置顶框begin-->
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/toTop.js"></script>
<!--置顶框end-->
</body>
</html>

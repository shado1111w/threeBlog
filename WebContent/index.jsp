<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="threeblog.entity.*" %>
<%@ page import="threeblog.service.Service" %>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
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
	List lable=service.getLable();  //获取热门标签 top 9 
	//request.setAttribute("lable", lable);
	
	ArrayList<Article> articles=service.getAllArticlesOrderByClicknumDESC();
	int allUserNum=service.getAllUserNum();
	
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
<title>首页</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css" type="text/css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/calendar.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/pagination.css" type="text/css" />
<link href="${pageContext.request.contextPath}/css/owl.carousel.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/js/jquery-1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/owl.carousel.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.pagination.js"></script>

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

<script>
	

$(function(){	
	$('.M-box').pagination({
		totalData:<%=articles.size()%>,
	    current:1,
		showData:5,
	    jump: false,
	    coping: true,
	    homePage: '首页',
	    endPage: '末页',
	    prevContent: '上页',
	    nextContent: '下页',
	    callback: function (api) {
	    	var new_content = $("#hiddenresult div.result:eq("+api.getCurrent()+")").clone();
			$("#index_body_middle_article").empty().append(new_content); //装载对应分页的内容
			return false;
	    }
	},
	   function (api) {
	    	var new_content = $("#hiddenresult div.result:eq("+api.getCurrent()+")").clone();
			$("#index_body_middle_article").empty().append(new_content); //装载对应分页的内容
	    
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
      <li><a href="javascript:;" >首页</a></li>
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
<div id="index_all">
	<!--内容头部begin-->
    <div id="index_body_head">
		<div id="index_body_total">
        	<h2 style="font-size:28px;margin:20px 10px;color:#FFF;">记录生活，分享快乐。</h2>
            <span style="font-size:28px;margin:25px 15px;color:#FFF;">Life is short,</span><br/>
            <span style="font-size:28px;margin:25px 15px;color:#FFF;">have some pride.</span><br/><br/>
            <span style="color:#FFF;margin-left:15px;">已经有<%=allUserNum %>位朋友</span><br/>
             <span style="color:#FFF;margin-left:15px;">在这里</span><br/>
              <span style="color:#FFF;margin-left:15px;">留下他们生活的剪影</span>
    	</div>
        <div id="index_body_show">
    		<div id="owl-demo" class="owl-carousel">
    		<a class="item"><img src="${pageContext.request.contextPath}/image/pic1.jpg" alt=""></a>
    		<a class="item"><img src="${pageContext.request.contextPath}/image/pic2.jpg" alt=""></a>
            <a class="item"><img src="${pageContext.request.contextPath}/image/pic3.jpg" alt=""></a>
			<a class="item"><img src="${pageContext.request.contextPath}/image/pic4.jpg" alt=""></a>
			<a class="item"><img src="${pageContext.request.contextPath}/image/pic5.jpg" alt=""></a>
			</div>
    	</div>
    </div>
	<!--内容头部end-->
    <!--右侧栏begin-->
    <div id="index_body_right">
    	<div id="index_body_enter">
    		<%if(login_flag){ %>
        	<div id="index_body_enter_write">
            	<a href="${pageContext.request.contextPath}/jsp/article/publish.jsp"><img src="${pageContext.request.contextPath}/image/write.png" style="float:left;">
                <div style="margin-top:10px;width:260px;height:30px;float:left;">
                	<span style="font-size:18px;font-weight:bold;color:#000;">写博文</span>&emsp;
                    <span style="font-size:18px;font-weight:bold;color:#999;">|&emsp;记录你生活的剪影</span>
                </div>
                </a>
            </div>
            <%}else{ %>
            <div id="index_body_enter_write">
            	<a href="${pageContext.request.contextPath}/jsp/login/sign_in.jsp"><img src="${pageContext.request.contextPath}/image/write.png" style="float:left;">
                <div style="margin-top:10px;width:260px;height:30px;float:left;">
                	<span style="font-size:18px;font-weight:bold;color:#000;">写博文</span>&emsp;
                    <span style="font-size:18px;font-weight:bold;color:#999;">|&emsp;记录你生活的剪影</span>
                </div>
                </a>
            </div>
            <%} %>
            <div id="index_body_enter_guideboard">
            	<h3 style="margin-left:20px;padding-top:20px;">█ 指路牌</h3>
                <a href="${pageContext.request.contextPath}/jsp/index/blog.jsp"><span style="margin-left:20px;color:#000;">博客文章欣赏</span></a><br/><br/>
                <a href="${pageContext.request.contextPath}/jsp/index/pictures.jsp"><span style="margin-left:20px;margin-top:20px;color:#000;">博客图片画廊</span></a><br /><br/>
                <%if(login_flag){ %>
                <a href="${pageContext.request.contextPath}/jsp/report_center/reportcenter.jsp"><span style="margin-left:20px;margin-top:20px;color:#000;">博客举报中心入口</span></a>
            	<%}else{ %>
            	<a href="${pageContext.request.contextPath}/jsp/login/sign_in.jsp"><span style="margin-left:20px;margin-top:20px;color:#000;">博客举报中心入口</span></a>
            	<%} %>
            </div>
        </div>
        
        <div id="index_body_calendar">
        	<div id="calendar" class="calendar"></div>
  			<script src="${pageContext.request.contextPath}/js/calendar.js"></script>
        </div>
        
           <div id="index_body_labels">
        	<h3 style="margin-left:20px;">█ 热门标签</h3>
        	 <%
 	        int num_lable=lable.size();
 	       for(int i=0;i<num_lable;i++){	
 	        %>  
 	           
                 <form  action="${pageContext.request.contextPath}/jsp/index/searchLable_result.jsp">
				
							<!-- lable 的值 -->
							<input type="hidden" value="<%=lable.get(i)%>" name="lable">	     				
						    <input  type="submit" value="<%=lable.get(i)%>"  style="float:left;margin-top:10px;margin-left:20px;border:1px solid; border-radius:5px; height:30px;font-size:14px;background-color:#FFF;">
							</form>
                 
            <%
                
                  if(i==8) break;
						}
			%>
             </div>
        
        
        
    </div>
    <!--右侧栏end-->
    <!--内容中部begin-->
    <div id="index_body_middle">
    	<h3 style="padding-top:20px;">█ 热门</h3>
    	<div id="index_body_middle_article">
        	<!--具体N篇文章begin-->    
           
            <!--文章end-->
        </div>
        
        <div id="hiddenresult" style="display: none;">
			<!-- 列表元素 -->
			<div class="result"></div>
			<%
			int num=articles.size();
			int time=num/4;
			if(num%4>0) time+=1;
			int j=0;
	    	for(int i=0;i<time;i++){
    		%>
			<div class="result">
				<ul style="padding:0;">
					<%
					int k=0;
					while(j<articles.size()&&k<5){
						Article article=articles.get(j);
		    			int author_id=article.getAuthor_id();
		    			User author=service.getUserFromId(author_id);
		
					%>
					
				<div class="article_n">
	        		<div class="article_pic">
	            		<img  src="<%=article.getPic() %>" style="width:200px;height:150px;">
	                    <a href="${pageContext.request.contextPath }/jsp/other_center/otherscenter.jsp?id=<%=author.getId() %>"><span style="font-size:14px;color:#000;margin-left:20px;"><%=article.getAuthor() %></span></a><br/>
	                    <span style="font-size:14px;color:#000;margin-left:20px;"><%=article.getPublishdate() %></span>
	                </div>
	            	<div class="passages_details">
                	<div style="width:430px; float:right;height:60px;padding-top:10px;">
                	<a style="color:#000" href="${pageContext.request.contextPath}/jsp/article/article.jsp?id=<%=article.getId()%>"><span style="margin-left:20px; font-size:24px; font-weight:bold;"><%=article.getTitle() %></span></a>
                    </div>
                    <div style="width:430px; margin-left:20px;float:right; height:85px;overflow:hidden; margin-top:10px;">
                    <a style="color:#000" href="${pageContext.request.contextPath}/jsp/article/article.jsp?id=<%=article.getId()%>"><span><%=article.getIntroduction() %></span></a>
					</div>
                    <div style="margin-top:10px; float:right;">
					<span >阅读：<%=article.getClick_num() %>&emsp;|</span>
                    <span>评论：<%=article.getComment_num() %>&emsp;|</span>
                    <span>喜欢：<%=article.getLiked() %>&emsp;|</span>
                    <span style="margin-right:65px;">收藏：<%=article.getCollected() %></span>
                    </div>
            	</div>
          	  </div>
						
					<%
						j++;k++;}
					%>
				</ul>
			</div>

			<%} %>
		</div>
        <div class="m-style M-box" ></div>
    </div>
    <!--内容中部end-->
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
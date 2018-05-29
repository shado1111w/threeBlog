<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="threeblog.entity.*" %>
<%@ page import="threeblog.service.Service" %>
<%@page import="java.util.ArrayList"%>
<%
	User user = new User();
	Service service = new Service();
	int user_id = 10240;
	if (session.getAttribute("user_id") == null) {
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().print("<script>alert(`会话过期，将重新登录！`)</script>");
		String content = 0 + ";URL= " +request.getContextPath()+ "/jsp/login/sign_in.jsp";
		response.setHeader("REFRESH ", content);
	} else {
		user_id = Integer.valueOf((String) session.getAttribute("user_id"));
		user = service.getUserFromId(user_id);	
	}
	int other_id=Integer.valueOf(request.getParameter("id"));
	int myArticleNum=service.getMyArticleNum(other_id);
	User other=service.getUserFromId(other_id);
	ArrayList<Article> articles = new ArrayList<Article>();
	articles = service.getArticlesFromId(other_id);
%>  
<!DOCTYPE html>
<html >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="toTop" content="true">
<title>他人主页</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css" type="text/css"/>

<link href="${pageContext.request.contextPath}/css/owl.carousel.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/js/jquery-1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/owl.carousel.js"></script>

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
			.load('${pageContext.request.contextPath}/jsp/other_center/othercenter_messages.jsp?id=<%=other_id%>');
			})
		$("#shoucang").click(function() {
				$('#othercenter_body')
				.load('${pageContext.request.contextPath}/jsp/other_center/othercenter_favorite.jsp?id=<%=other_id%>');
				})
		$("#guanzhu").click(function() {
				$('#othercenter_body') 
				.load('${pageContext.request.contextPath}/jsp/other_center/othercenter_follow.jsp?id=<%=other_id%>');
				})
		$("#fenshi").click(function() {
				$('#othercenter_body') 
				.load('${pageContext.request.contextPath}/jsp/other_center/othercenter_follower.jsp?id=<%=other_id%>');
			})

})
</script>

</head>

<body >
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
            <li><a href="#home">举报消息</a><span  style="min-width: 20px;line-height:20px; text-align: center; position: absolute; background-color: #f00;  border-radius:15px; font-size:15px;color:#fff;width:10px;right:5px; top:265px; z-index:200;" >0</span></li>
         </ul>
    </li>
    <li>
    	<a href="#">
        	<img src="${pageContext.request.contextPath}/image/setting.png"/>
        </a>
        <ul class="index_tools_setting">
         		<li><a href="${pageContext.request.contextPath}/jsp/personal_center/personalcenter.jsp?id=5">&ensp;修改资料&ensp;</a></li>
          	<li><a href="${pageContext.request.contextPath}/jsp/personal_center/personalcenter.jsp?id=5">&ensp;修改头像&ensp;</a></li>
            <li><a href="${pageContext.request.contextPath}/jsp/personal_center/personalcenter.jsp?id=5">&ensp;更改密码&ensp;</a></li>
            <li><a href="${pageContext.request.contextPath}/jsp/personal_center/personalcenter.jsp">&ensp;个人中心&ensp;</a></li>
            <li><a href="${pageContext.request.contextPath}/jsp/report_center/reportcenter.jsp">&ensp;举报中心&ensp;</a></li>
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

<!--顶端栏end-->
<!--内容框begin-->
<div id="index_all">
	<div id="othercenter_all">
    	<!--头部栏begin-->
    	<div id="othercenter_head" style="margin-bottom:30px;">
    		
          	<img src="<%=other.getTouxiang() %>"  style="width:120px; margin-top:30px;margin-left:200px;margin-right:50px; float:left;">				   			
            <div style="float:left; margin-top:40px; margin-bottom:10px;">
            	<span style="font-size:36px;"><%=other.getUsername() %></span><br>		 				
                <span style="font-size:24px;">博文&emsp;|&emsp;关注&emsp;|&emsp;粉丝</span><br>
                <span style="font-size:24px;">&ensp;<%=myArticleNum %>&emsp;</span><span style="font-size:24px;">&emsp;&emsp;333&emsp;&emsp;</span><span style="font-size:24px;">&ensp;500</span>
            </div>
            <!--关注图标的更换有五种情况：1.未关注、2.我关注ta、3.ta关注我、4.互相关注、5.取消关注-->
            <!--对应图标名称：1.canfollow.png、2.follow.png、3.Tafollow.png、4.followtogether、5.cancelfollow.png-->
            <a href="#" style=" border:1px solid;background-color:#09f; float:right;width:100px; height:50px;;margin-top:50px; margin-right:100px; position:relative; border-radius:5px;"><img title="关注" src="${pageContext.request.contextPath}/image/Tafollow.png"  style=" position:relative;width:30px;margin-left:35px; padding-top:10px;"></a>
            <a href="#" style=" border:1px solid;background-color:#09f; float:right;width:100px; height:50px;;margin-top:50px; margin-right:100px; position:relative; border-radius:5px;"><img title="关注" src="${pageContext.request.contextPath}/image/canfollow.png"  style=" position:relative;width:30px;margin-left:35px; padding-top:10px;"></a>
            <div style="width:500px; height:100px; margin-left:200px;margin-top:180px;">
              <div style="width:250px; float:left;height:100px;">
              	<span>性别：</span>
                <span><%=other.getSex() %></span><br>
                <span>年龄：</span>
                <span><%=other.getAge() %></span><br>
            	<span>注册时间：</span>
                <span><%=other.getRegister_time() %></span><br>
                <span>所在地区：</span>
                <span><%=other.getProvince() %><%=other.getCity() %></span>
              </div>
              <div >
              	<span>个人简介：</span><br>
                <span><br>
					<%=other.getIntroduction() %> 
                </span>
              </div>
            </div>
    	</div>
    	<!--头部栏end-->
        <!--导航栏begin-->
        <div  id="othercenter_label">
            	<ul>
                	<li>
                    	<span style="cursor:pointer" id="bowen">&emsp;&ensp;&emsp;Ta的博文&emsp;&ensp;&emsp;|</span>
                    </li>
                    
                    <li>
                    	<span style="cursor:pointer" id="shoucang" >&emsp;&ensp;&emsp;Ta的收藏&emsp;&ensp;&emsp;|</span>
                    </li>
                    <li>
                    	<span style="cursor:pointer" id="guanzhu">&emsp;&ensp;&emsp;Ta的关注&emsp;&ensp;&emsp;|</span>
                    </li>
                    <li>
                    	<span style="cursor:pointer" id="fenshi">&emsp;&ensp;&emsp;Ta的粉丝&emsp;&ensp;&emsp;</span>
                    </li>
                </ul>
            </div>
           
            <hr style="FILTER: alpha(opacity=100,finishopacity=0,style=3)" width="100%" color=#999 SIZE=3>
        <!--导航栏end-->
        <!--中间栏begin-->
        <div id="othercenter_body">
        	<div id="othercenter_info">
        		<h1 style=" font-size:24px; width:960px; margin-left:40px;">█ Ta的博文</h1>
            	<table class="zebra">
    <thead>
    <tr>
        <th >#</th>        
        <th>标题</th>
        <th>发布时间</th>
        <th>操作</th>

    </tr>
    </thead>
    <tfoot>
    <tr>
        <td>&nbsp;</td>        
        <td></td>
        <td></td>
        <td></td>
    </tr>
    </tfoot>    
    <tbody>
    <%
							if (!articles.isEmpty()) {
								for (int i = 0; i < articles.size(); i++) {
									Article article = articles.get(i);
						%>
    <tr>
				
        <td><%=i+1 %></td>        
        <td><%=article.getTitle() %></td>
        <td><%=article.getPublishdate() %></td>
        <td><a href="${pageContext.request.contextPath}/jsp/article/article.jsp?id=<%=article.getId() %>" target="_blank"><img  id="eye<%=i %>" src="${pageContext.request.contextPath}/image/eye.png"  style="width:40px; height:40px;"></a>
        <!--查看图标更换的jq-->
<script>
$('#eye<%=i %>').click(function(){  
          
        if($('#eye<%=i %>').attr('src')=='${pageContext.request.contextPath}/image/eye.png'){  
            $('#eye<%=i %>').attr('src','${pageContext.request.contextPath}/image/eyes.png');  
        }
          
});  
</script>
        </td>
    </tr>  
          <%
							}
							}
						%>
   
</tbody></table>
            	
            </div>
        </div>
        <!--中间栏end-->
        <!--相册栏begin-->
    <div id="othercenter_down">
      <h1 style="font-size:24px; width:960px;margin-left:40px;">█ Ta的图片</h1>
      <div style="width:960px; margin-left:30px;">
      <!-- 代码 开始 -->
<div id="gallery2" class="gallery">
	
	<%
        	String album= service.getAlbumFromUser_id(other_id);
        	String[] photos=album.split("#");
        	if (photos[0] != ""){
        	for(int i=0;i<photos.length;i++){
        %>
	<a href="<%=photos[i] %>" title="2018-05-04"><img src="<%=photos[i] %>" width="280" height="210" style="border:1px solid;  margin:10px;"></a>
	<%} 
      }%>
</div>
<script>
$('#gallery2').rebox({ selector: 'a' });
</script>
</div>
    
  </div>
</div>
<!--相册栏end-->
    </div>
<!--内容框end-->
<!--置顶框begin-->
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/toTop.js"></script>
<!--置顶框end-->
</body>
</html>

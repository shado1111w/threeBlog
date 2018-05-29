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
	ArrayList<Article> articles=service.getAllArticlesOrderByPublishdateDESC();
%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>最新</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/pagination.css" type="text/css" />
<script src="${pageContext.request.contextPath}/js/jquery.pagination.js"></script>
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
			$("#blog_passages1").empty().append(new_content); //装载对应分页的内容
			return false;
	    }
	},
	   function (api) {
	    	var new_content = $("#hiddenresult div.result:eq("+api.getCurrent()+")").clone();
			$("#blog_passages1").empty().append(new_content); //装载对应分页的内容
	    
	}); 

});	
</script>
</head>

<body>
	<div id="blog_passages1">
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
	                    <span style="font-size:14px;color:#000;margin-left:20px;"><%=article.getAuthor() %></span><br/>
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
                    <span>评论：xxx&emsp;|</span>
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
</body>
</html>

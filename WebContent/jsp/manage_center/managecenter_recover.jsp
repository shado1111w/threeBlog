<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="threeblog.entity.*" %>
<%@ page import="threeblog.service.Service" %>
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
	ArrayList<Report> reports=service.getReport();

%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>恢复管理</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css" type="text/css"/>

<script>

	$(document)
	.ready(
			function() {	
				for (var i=0; i<<%=reports.size()%>; i++){  
					$("[id=current__"+i+"]").bind("click", {index: i}, clickHandler);  
			    }  
			  	
			    function clickHandler(event) {  
			        var i= event.data.index;  
			        var report_id=$("#current"+i).attr("data");
			        
			        
			        var type=$("#current_____"+i).attr("data");   
			        var content_id=$("#current______"+i).attr("data");   
			        var url;
			        if(type=="举报文章") url="${pageContext.request.contextPath}/servlet/UpdateArticle";
			        else if(type=="举报评论") url="${pageContext.request.contextPath}/servlet/UpdateComment";
			        else if(type=="举报回复") url="${pageContext.request.contextPath}/servlet/UpdateAnswer";
			        var args={
			        		"content_id" : content_id,
			        		"status":"正常",
							"time" : new Date()
			        }   
			        $.ajaxSettings.async = false; 
			        $.get(url, args); 
			        $.ajaxSettings.async = true; 
			        
			        var url2="${pageContext.request.contextPath}/servlet/UpdateReport";
			        var args2={
			        		"report_id" : report_id,
			        		"status3":"审核通过",
							"time" : new Date()
			        }
			        $.ajaxSettings.async = false; 
			        $.get(url2, args2,
							function(data) {
			        	$("#current___"+i).empty().append('<span>审核通过</span>');
			        	var new_content=$("#all_result").find("#current____"+i).clone();
			        	//删除未处理信息列表里的
			        	$("#all_result").find("#current____"+i).remove();
			        	//删除未处理信息列表里的
			        	$("#hiddenresult").find("#current____"+i).remove();
			        	$("#hiddenresult2").find("#information_table").append(new_content);		
					}); 
			        $.ajaxSettings.async = true; 
			        
			        
			        var args3={
			        		"report_id" : report_id,
			        		"status":"已处理",
			        		"status2":"正常",
							"time" : new Date()
			        }
			        $.ajaxSettings.async = false; 
			        $.get(url2, args3); 
			        $.ajaxSettings.async = true; 
			    }
			    
			});
</script>

<script>

	$(document)
	.ready(
			function() {	
				for (var i=0; i<<%=reports.size()%>; i++){  
					$("[id=current_"+i+"]").bind("click", {index: i}, clickHandler);  
			    }  
			  	
			    function clickHandler(event) {  
			        var i= event.data.index;  
			        var report_id=$("#current"+i).attr("data");
			        
			        
			        var type=$("#current_____"+i).attr("data");   
			        var content_id=$("#current______"+i).attr("data");   
			        var url;
			        if(type=="举报文章") url="${pageContext.request.contextPath}/servlet/UpdateArticle";
			        else if(type=="举报评论") url="${pageContext.request.contextPath}/servlet/UpdateComment";
			        else if(type=="举报回复") url="${pageContext.request.contextPath}/servlet/UpdateAnswer";
			        var args={
			        		"content_id" : content_id,
			        		"status":"屏蔽",
							"time" : new Date()
			        }   
			        $.ajaxSettings.async = false; 
			        $.get(url, args); 
			        $.ajaxSettings.async = true; 
			        
			        var url2="${pageContext.request.contextPath}/servlet/UpdateReport";
			        var args2={
			        		"report_id" : report_id,
			        		"status3":"审核不通过",
							"time" : new Date()
			        }
			        $.ajaxSettings.async = false; 
			        $.get(url2, args2,
							function(data) {
			        	$("#current___"+i).empty().append('<span>审核不通过</span>');
			        	var new_content=$("#all_result").find("#current____"+i).clone();
			        	//删除未处理信息列表里的
			        	$("#all_result").find("#current____"+i).remove();
			        	//删除未处理信息列表里的
			        	$("#hiddenresult").find("#current____"+i).remove();
			        	$("#hiddenresult2").find("#information_table").append(new_content);		
					}); 
			        $.ajaxSettings.async = true; 
			        
			        
			       
			    }
			    
			});
</script>
</head>

<body>
<!--恢复管理begin--> 
         <div id="messagecenter_reviews">
         	<span style="font-size:20px; width:500px;margin-left:40px; font-weight:bold;">█ 恢复管理</span>
            <select id="select" style="width:150px; float:right; margin-right:50px; font-size:18px;">
    			<option value="notread">未审核</option>
    			<option value="read">已审核</option>
    	    </select>


<div id="all_result" >
   
    		<div class="result">
		<table id="information_table" border="1">
	   <tr>
	    <th width="60%">申请内容</th>
	    <th width="20%">是否通过</th>
	    </tr>
		 <%
							
		if (!reports.isEmpty()) {
			int j=0;
			for (int i = 0; i < reports.size(); i++) {
				Report report= reports.get(i);
				String url=report.getUrl();
				int user_id2=report.getUser_id();
				User user2 = service.getUserFromId(user_id2);	
				
			%>
		
			<%
				if (report.getStatus().equals("已处理")&&report.getStatus3().equals("反馈等待审核")) {
					if(report.getType().equals("举报文章")){
			%>
			
			<tr id="current____<%=j%>">
			
			<td>
			<span><%=user2.getUsername() %></span>
			申请恢复其《<a href="<%=report.getUrl()%>"><span><%=service.getArticleFromId(report.getContent_id()).getTitle() %>》博文</span
			></a>----
			<span><%=report.getFeedback_reason() %></span>
			<span style="display:none;" id="current<%=j%>" data="<%=report.getId()%>"></span>
			<span style="display:none;" id="current_____<%=j%>" data="<%=report.getType()%>"></span>
			<span style="display:none;" id="current______<%=j%>" data="<%=report.getContent_id()%>"></span>
			</td>
		  	<td id="current___<%=j%>">
		 	 <a id="current__<%=j %>" href="javascript:;" style="border:1px solid; background-color:#FFF; cursor:pointer;" >是</a>
			<a id="current_<%=j %>" href="javascript:;"   style="border:1px solid; margin-left:20px;background-color:#FFF; cursor:pointer;">否</a>
			
			</td>
		
			</tr>
			<%
			++j;}else if(report.getType().equals("举报评论")){
			%>
			<tr id="current____<%=j%>">
		
			<td><span><%=user2.getUsername() %></span>申请恢复其“<a href="<%=report.getUrl()%>"><span><%=report.getContent() %>”评论</span></a>----<span><%=report.getFeedback_reason() %></span>
			<span style="display:none;" id="current<%=j%>" data="<%=report.getId()%>"></span>
			<span style="display:none;" id="current_____<%=j%>" data="<%=report.getType()%>"></span>
			<span style="display:none;" id="current______<%=j%>" data="<%=report.getContent_id()%>"></span>
			</td>
		  	<td id="current___<%=j%>">
		 	 <a id="current__<%=j %>" href="javascript:;" style="border:1px solid; background-color:#FFF; cursor:pointer;" >是</a>
			<a id="current_<%=j %>" href="javascript:;"   style="border:1px solid; margin-left:20px;background-color:#FFF; cursor:pointer;">否</a>
			
			</td>
		
			</tr>
			<%++j;}else if(report.getType().equals("举报回复")){ %>
				<tr id="current____<%=j%>">
			
				<td><span><%=user2.getUsername() %></span>申请恢复其“<a href="<%=report.getUrl()%>"><span><%=report.getContent() %>”回复</span></a>----<span><%=report.getFeedback_reason() %></span>
				<span style="display:none;" id="current<%=j%>" data="<%=report.getId()%>"></span>
				<span style="display:none;" id="current_____<%=j%>" data="<%=report.getType()%>"></span>
				<span style="display:none;" id="current______<%=j%>" data="<%=report.getContent_id()%>"></span>
				</td>
			  	<td id="current___<%=j%>">
			 	 <a id="current__<%=j %>" href="javascript:;" style="border:1px solid; background-color:#FFF; cursor:pointer;" >是</a>
				<a id="current_<%=j %>" href="javascript:;"   style="border:1px solid; margin-left:20px;background-color:#FFF; cursor:pointer;">否</a>
				
				</td>
			
				</tr>
			
			<%++j;} %>
			
			<%} %>
			
			<%
				}
				}
			%>
		</table>
		</div>
				    
    
    
    </div>	      


         </div>
    <!--恢复管理end--> 
    
     <!-- 未读关注消息 -->
    <div id="hiddenresult" style="display: none;">
		
		<div class="result">
		<table id="information_table" border="1">
	   <tr>
	    <th width="60%">申请内容</th>
	    <th width="20%">是否通过</th>
	    </tr>
		 <%
							
		if (!reports.isEmpty()) {
			int j=0;
			for (int i = 0; i < reports.size(); i++) {
				Report report= reports.get(i);
				String url=report.getUrl();
				int user_id2=report.getUser_id();
				User user2 = service.getUserFromId(user_id2);	
				
			%>
		
			<%
				if (report.getStatus().equals("已处理")&&report.getStatus3().equals("反馈等待审核")) {
					if(report.getType().equals("举报文章")){
			%>
			
			<tr id="current____<%=j%>">
			
			<td>
			<span><%=user2.getUsername() %></span>
			申请恢复其《<a href="<%=report.getUrl()%>"><span><%=service.getArticleFromId(report.getContent_id()).getTitle() %>》博文</span
			></a>----
			<span><%=report.getFeedback_reason() %></span>
			<span style="display:none;" id="current<%=j%>" data="<%=report.getId()%>"></span>
			</td>
		  	<td id="current___<%=j%>">
		 	 <a id="current__<%=j %>" href="javascript:;" style="border:1px solid; background-color:#FFF; cursor:pointer;" >是</a>
			<a id="current_<%=j %>" href="javascript:;"   style="border:1px solid; margin-left:20px;background-color:#FFF; cursor:pointer;">否</a>
			
			</td>
		
			</tr>
			<%
			++j;}else if(report.getType().equals("举报评论")){
			%>
			<tr id="current____<%=j%>">
		
			<td><span><%=user2.getUsername() %></span>申请恢复其“<a href="<%=report.getUrl()%>"><span><%=report.getContent() %>”评论</span></a>----<span><%=report.getFeedback_reason() %></span>
			<span style="display:none;" id="current<%=j%>" data="<%=report.getId()%>"></span>
			</td>
		  	<td id="current___<%=j%>">
		 	 <a id="current__<%=j %>" href="javascript:;" style="border:1px solid; background-color:#FFF; cursor:pointer;" >是</a>
			<a id="current_<%=j %>" href="javascript:;"   style="border:1px solid; margin-left:20px;background-color:#FFF; cursor:pointer;">否</a>
			
			</td>
		
			</tr>
			<%++j;}else if(report.getType().equals("举报回复")){ %>
				<tr id="current____<%=j%>">
			
				<td><span><%=user2.getUsername() %></span>申请恢复其“<a href="<%=report.getUrl()%>"><span><%=report.getContent() %>”回复</span></a>----<span><%=report.getFeedback_reason() %></span>
				<span style="display:none;" id="current<%=j%>" data="<%=report.getId()%>"></span>
				</td>
			  	<td id="current___<%=j%>">
			 	 <a id="current__<%=j %>" href="javascript:;" style="border:1px solid; background-color:#FFF; cursor:pointer;" >是</a>
				<a id="current_<%=j %>" href="javascript:;"   style="border:1px solid; margin-left:20px;background-color:#FFF; cursor:pointer;">否</a>
				
				</td>
			
				</tr>
			
			<%++j;} %>
			
			<%} %>
			
			<%
				}
				}
			%>
		</table>
		</div>
			    
		
		</div>
		
		  <!-- 已读关注消息 -->
    <div id="hiddenresult2" style="display: none;">
		
		<div class="result">
		<table id="information_table" border="1">
	   <tr>
	    <th width="60%">申请内容</th>
	    <th width="20%">是否通过</th>
	    </tr>
		 <%
							
		if (!reports.isEmpty()) {
			int j=0;
			for (int i = 0; i < reports.size(); i++) {
				Report report= reports.get(i);
				String url=report.getUrl();
				int user_id2=report.getUser_id();
				User user2 = service.getUserFromId(user_id2);	
				
			%>
		
			<%
				if (report.getStatus().equals("已处理")&&(report.getStatus3().equals("审核不通过")||report.getStatus3().equals("审核通过"))) {
					if(report.getType().equals("举报文章")){
			%>
			
			<tr id="current____<%=j%>">
			
			<td>
			<span><%=user2.getUsername() %></span>
			申请恢复其《<a href="<%=report.getUrl()%>"><span><%=service.getArticleFromId(report.getContent_id()).getTitle() %>》博文</span
			></a>----
			<span><%=report.getFeedback_reason() %></span>
			<span style="display:none;" id="current<%=j%>" data="<%=report.getId()%>"></span>
			</td>
		  	<td >
		 	<span><%=report.getStatus3() %></span>
			
			</td>
		
			</tr>
			<%
			++j;}else if(report.getType().equals("举报评论")){
			%>
			<tr id="current____<%=j%>">
		
			<td><span><%=user2.getUsername() %></span>申请恢复其“<a href="<%=report.getUrl()%>"><span><%=report.getContent() %>”评论</span></a>----<span><%=report.getFeedback_reason() %></span>
			<span style="display:none;" id="current<%=j%>" data="<%=report.getId()%>"></span>
			</td>
		  	<td >
		 	<span><%=report.getStatus3() %></span>
			
			</td>
		
			</tr>
			<%++j;}else if(report.getType().equals("举报回复")){ %>
				<tr id="current____<%=j%>">
			
				<td><span><%=user2.getUsername() %></span>申请恢复其“<a href="<%=report.getUrl()%>"><span><%=report.getContent() %>”回复</span></a>----<span><%=report.getFeedback_reason() %></span>
				<span style="display:none;" id="current<%=j%>" data="<%=report.getId()%>"></span>
				</td>
			  	<td >
				 <span><%=report.getStatus3() %></span>
				</td>
			
				</tr>
			
			<%++j;} %>
			
			<%} %>
			
			<%
				}
				}
			%>
		</table>
		</div>
			    
		
		</div>
		
		<script>
			$('#select').change(function(){ 
				if($("#select").val()=="read"){
					var new_content = $("#hiddenresult2 div.result").clone();
					$("#all_result").empty().append(new_content); //装载对应分页的内容
				}else if($("#select").val()=="notread"){
					var new_content = $("#hiddenresult div.result").clone();
					$("#all_result").empty().append(new_content); //装载对应分页的内容
				}
				$(document)
				.ready(
						function() {	
							for (var i=0; i<<%=reports.size()%>; i++){  
								$("[id=current__"+i+"]").bind("click", {index: i}, clickHandler);  
						    }  
						  	
						    function clickHandler(event) {  
						        var i= event.data.index;  
						        var report_id=$("#current"+i).attr("data");
						        
						        
						        var type=$("#current_____"+i).attr("data");   
						        var content_id=$("#current______"+i).attr("data");   
						        var url;
						        if(type=="举报文章") url="${pageContext.request.contextPath}/servlet/UpdateArticle";
						        else if(type=="举报评论") url="${pageContext.request.contextPath}/servlet/UpdateComment";
						        else if(type=="举报回复") url="${pageContext.request.contextPath}/servlet/UpdateAnswer";
						        var args={
						        		"content_id" : content_id,
						        		"status":"正常",
										"time" : new Date()
						        }   
						        $.ajaxSettings.async = false; 
						        $.get(url, args); 
						        $.ajaxSettings.async = true; 
						        
						        var url2="${pageContext.request.contextPath}/servlet/UpdateReport";
						        var args2={
						        		"report_id" : report_id,
						        		"status3":"审核通过",
										"time" : new Date()
						        }
						        $.ajaxSettings.async = false; 
						        $.get(url2, args2,
										function(data) {
						        	$("#current___"+i).empty().append('<span>审核通过</span>');
						        	var new_content=$("#all_result").find("#current____"+i).clone();
						        	//删除未处理信息列表里的
						        	$("#all_result").find("#current____"+i).remove();
						        	//删除未处理信息列表里的
						        	$("#hiddenresult").find("#current____"+i).remove();
						        	$("#hiddenresult2").find("#information_table").append(new_content);		
								}); 
						        $.ajaxSettings.async = true; 
						        
						        
						        var args3={
						        		"report_id" : report_id,
						        		"status":"已处理",
						        		"status2":"正常",
										"time" : new Date()
						        }
						        $.ajaxSettings.async = false; 
						        $.get(url2, args3); 
						        $.ajaxSettings.async = true; 
						        
						    }  
						});
				
				$(document)
				.ready(
						function() {	
							for (var i=0; i<<%=reports.size()%>; i++){  
								$("[id=current_"+i+"]").bind("click", {index: i}, clickHandler);  
						    }  
						  	
						    function clickHandler(event) {  
						        var i= event.data.index;  
						        var report_id=$("#current"+i).attr("data");
						        
						        
						        var type=$("#current_____"+i).attr("data");   
						        var content_id=$("#current______"+i).attr("data");   
						        var url;
						        if(type=="举报文章") url="${pageContext.request.contextPath}/servlet/UpdateArticle";
						        else if(type=="举报评论") url="${pageContext.request.contextPath}/servlet/UpdateComment";
						        else if(type=="举报回复") url="${pageContext.request.contextPath}/servlet/UpdateAnswer";
						        var args={
						        		"content_id" : content_id,
						        		"status":"屏蔽",
										"time" : new Date()
						        }   
						        $.ajaxSettings.async = false; 
						        $.get(url, args); 
						        $.ajaxSettings.async = true; 
						        
						        var url2="${pageContext.request.contextPath}/servlet/UpdateReport";
						        var args2={
						        		"report_id" : report_id,
						        		"status3":"审核不通过",
										"time" : new Date()
						        }
						        $.ajaxSettings.async = false; 
						        $.get(url2, args2,
										function(data) {
						        	$("#current___"+i).empty().append('<span>审核不通过</span>');
						        	var new_content=$("#all_result").find("#current____"+i).clone();
						        	//删除未处理信息列表里的
						        	$("#all_result").find("#current____"+i).remove();
						        	//删除未处理信息列表里的
						        	$("#hiddenresult").find("#current____"+i).remove();
						        	$("#hiddenresult2").find("#information_table").append(new_content);		
								}); 
						        $.ajaxSettings.async = true; 
						        
						        
						    } 
						});
				
			})
		</script>
</body>
</html>

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
<title>举报管理</title>
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
		        var content_id=$("#current_"+i).attr("data");
		        var type=$("#current_____"+i).attr("data");
		        var url="${pageContext.request.contextPath}/servlet/UpdateReport";
		        var args={
		        		"report_id" : report_id,
		        		"status":"已处理",
		        		"status2":"正常",
						"time" : new Date()
		        }
		        $.ajaxSettings.async = false; 
		        $.get(url, args,
						function(data) {
			        	$("#current___"+i).empty().append('<span>已处理</span>');
			        	var new_content=$("#all_result").find("#current____"+i).clone();
			        	//删除未处理信息列表里的
			        	$("#all_result").find("#current____"+i).remove();
			        	//删除未处理信息列表里的
			        	$("#hiddenresult").find("#current____"+i).remove();
			        	$("#hiddenresult2").find("#information_table").append(new_content);	
				}); 
		        $.ajaxSettings.async = true; 
		        
		        if(type=="举报文章") url2="${pageContext.request.contextPath}/servlet/UpdateArticle";
		        else if(type=="举报评论") url2="${pageContext.request.contextPath}/servlet/UpdateComment";
		        else if(type=="举报回复") url2="${pageContext.request.contextPath}/servlet/UpdateAnswer";
		        var args2={
		        		"content_id" : content_id,
		        		"status":"正常",
						"time" : new Date()
		        }
		        $.ajaxSettings.async = false; 
		        $.get(url2, args2); 
		        $.ajaxSettings.async = true; 
		    }  
		});
</script>

<script>

$(document)
.ready(
		function() {	
			for (var i=0; i<<%=reports.size()%>; i++){  
				$("[id=current______"+i+"]").bind("click", {index: i}, clickHandler);  
		    }  
		  	
		    function clickHandler(event) {  
		        var i= event.data.index;  
		        var content_id=$("#current_"+i).attr("data");
		        var type=$("#current_____"+i).attr("data");
		        
		        var report_id=$("#current"+i).attr("data");
		        var url="${pageContext.request.contextPath}/servlet/UpdateReport";
		        var args={
		        		"report_id" : report_id,
		        		"status":"已处理",
		        		"status2":"屏蔽",
						"time" : new Date()
		        }
		        $.ajaxSettings.async = false; 
		        $.get(url, args); 
		        $.ajaxSettings.async = true; 
		        
		        var url2;
		        console.log("type:"+type);
		        if(type=="举报文章") url2="${pageContext.request.contextPath}/servlet/UpdateArticle";
		        else if(type=="举报评论") url2="${pageContext.request.contextPath}/servlet/UpdateComment";
		        else if(type=="举报回复") url2="${pageContext.request.contextPath}/servlet/UpdateAnswer";
		        var args2={
		        		"content_id" : content_id,
		        		"status":"屏蔽",
						"time" : new Date()
		        }
		        
		        
		        
		        $.ajaxSettings.async = false; 
		        $.get(url2, args2,
						function(data) {
			        	$("#current___"+i).empty().append('<span>已处理</span>');
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

<script>

$(document)
.ready(
		function() {	
			for (var i=0; i<<%=reports.size()%>; i++){  
				$("[id=current_______"+i+"]").bind("click", {index: i}, clickHandler);  
		    }  
		  	
		    function clickHandler(event) {  
		        var i= event.data.index;  
		        var user_id=$("#current_______"+i).attr("data");
		        $('#messagecenter_reviews') 
				.load('${pageContext.request.contextPath}/jsp/manage_center/managecenter_limit.jsp?user_id='+user_id);
		       
		      
		    }  
		});
</script>
</head>

<body>
<!--举报管理begin--> 
         <div id="messagecenter_reviews">
         	<span style="font-size:20px; width:500px;margin-left:40px; font-weight:bold;">█ 举报管理</span>
           <select id="select" style="width:150px; float:right; margin-right:50px; font-size:18px;">
    			<option value="notread">未处理</option>
    			<option value="read">已处理</option>
    	    </select>
    	    
    	 <div id="all_result" >
   
    		<div class="result">
		<table id="information_table" border="1">
	    <tr>
	    <th width="30%">举报内容</th>
	    <th width="20%">违规用户</th>
	    <th width="30%">举报用户及理由</th>
	    <th width="20%">处理</th>
	    </tr>
		 <%
							
							if (!reports.isEmpty()) {
								int j=0;
								for (int i = 0; i < reports.size(); i++) {
									Report report= reports.get(i);
									String url=report.getUrl();
									int user_id2=report.getUser_id();
									User user2 = service.getUserFromId(user_id2);
									int author_id=report.getAuthor_id();
									User author=service.getUserFromId(author_id);
									
						%>

						<%
							if (report.getStatus().equals("未处理")) {
						%>
						
						<tr id="current____<%=j%>">

							<td><a href="<%=url%>" target="_blank"><%=report.getContent() %></a><span style="display:none;" id="current_<%=j%>" data="<%=report.getContent_id()%>"></span></td>
						    <td><%=user2.getUsername() %><span style="display:none;" id="current<%=j%>" data="<%=report.getId()%>"></span></td>
						    <td>
						    <span style="display:none;" id="current_____<%=j%>" data="<%=report.getType()%>"></span>
						    <span>&emsp;<%=author.getUsername()%></span>----<span><%=report.getSimple_reason() %></span>----<span><%=report.getAll_reason() %></span></td>
						    <td id="current___<%=j%>">
						    <a id="current______<%=j%>" href="javascript:;"  style="cursor:pointer;border:1px solid; background-color:#FFF;">屏蔽</a>
						    <a href="javascript:;" id="current_______<%=j%>" data="<%=report.getUser_id()%>" style="cursor:pointer;border:1px solid #000; margin-left:20px;background-color:#FFF;">限制</a>
						     <a href="javascript:;" id="current__<%=j %>" style="cursor:pointer;border:1px solid #000; margin-left:20px;background-color:#FFF;">已阅</a>
						     </td>

						</tr>
						<%
						++j;}
						%>
						
						<%
							}
							}
						%>
		</table>
		</div>
				    
    
    
    </div>	       
   
         </div>
    <!--举报管理end--> 
        <!-- 未读关注消息 -->
    <div id="hiddenresult" style="display: none;">
		
		<div class="result">
		<table id="information_table" border="1">
	    <tr>
	    <th width="30%">举报内容</th>
	    <th width="20%">违规用户</th>
	    <th width="30%">举报用户及理由</th>
	    <th width="20%">处理</th>
	    </tr>
		 <%
							
							if (!reports.isEmpty()) {
								int j=0;
								for (int i = 0; i < reports.size(); i++) {
									Report report= reports.get(i);
									String url=report.getUrl();
									int user_id2=report.getUser_id();
									User user2 = service.getUserFromId(user_id2);
									int author_id=report.getAuthor_id();
									User author=service.getUserFromId(author_id);
									
						%>

						<%
							if (report.getStatus().equals("未处理")) {
						%>
						
						<tr id="current____<%=j%>">

							<td><a href="<%=url%>" target="_blank"><%=report.getContent() %></a><span style="display:none;" id="current_<%=j%>" data="<%=report.getContent_id()%>"></span></td>
						    <td><%=user2.getUsername() %><span style="display:none;" id="current<%=j%>" data="<%=report.getId()%>"></span></td>
						    <td>
						    <span style="display:none;" id="current_____<%=j%>" data="<%=report.getType()%>"></span>
						    <span>&emsp;<%=author.getUsername()%></span>----<span><%=report.getSimple_reason() %></span>----<span><%=report.getAll_reason() %></span></td>
						    <td id="current___<%=j%>">
						    <a id="current______<%=j%>" href="javascript:;"  style="cursor:pointer;border:1px solid; background-color:#FFF;">屏蔽</a>
						    <a href="javascript:;" id="current_______<%=j%>"  data="<%=report.getUser_id()%>" style="cursor:pointer;border:1px solid #000; margin-left:20px;background-color:#FFF;">限制</a>
						     <a href="javascript:;" id="current__<%=j %>" style="cursor:pointer;border:1px solid #000; margin-left:20px;background-color:#FFF;">已阅</a>
						     </td>

						</tr>
						<%
						++j;}
						%>
						
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
	    <th width="30%">举报内容</th>
	    <th width="20%">违规用户</th>
	    <th width="30%">举报用户及理由</th>
	    <th width="20%">处理</th>
	    </tr>
		 <%
							
							if (!reports.isEmpty()) {
								int j=0;
								for (int i = 0; i < reports.size(); i++) {
									Report report= reports.get(i);
									String url=report.getUrl();
									int user_id2=report.getUser_id();
									User user2 = service.getUserFromId(user_id2);
									int author_id=report.getAuthor_id();
									User author=service.getUserFromId(author_id);
									
						%>

						<%
							if (report.getStatus().equals("已处理")) {
						%>
						
						<tr id="current____<%=j%>">

							<td><a href="<%=url%>" target="_blank"><%=report.getContent() %></a></td>
						    <td><%=user2.getUsername() %></td>
						    <td><span>&emsp;<%=author.getUsername()%></span>----<span><%=report.getSimple_reason() %></span>----<span><%=report.getAll_reason() %></span></td>
						    <td><span>已处理</span>
						     </td>

						</tr>
						<%
						++j;}
						%>
						
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
						        var url2="${pageContext.request.contextPath}/servlet/UpdateReport";
						        var args={
						        		"report_id" : report_id,
						        		"status":"已处理",
						        		"status2":"正常",
										"time" : new Date()
						        }
						        $.ajaxSettings.async = false; 
						        $.get(url2, args,
										function(data) {
							        	$("#current___"+i).empty().append('<span>已处理</span>');
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
				
				$(document)
				.ready(
						function() {	
							for (var i=0; i<<%=reports.size()%>; i++){  
								$("[id=current______"+i+"]").bind("click", {index: i}, clickHandler);  
						    }  
						  	
						    function clickHandler(event) {  
						        var i= event.data.index;  
						        var content_id=$("#current_"+i).attr("data");
						        var type=$("#current_____"+i).attr("data");
						        
						        var report_id=$("#current"+i).attr("data");
						        var url="${pageContext.request.contextPath}/servlet/UpdateReport";
						        var args={
						        		"report_id" : report_id,
						        		"status":"已处理",
						        		"status2":"屏蔽",
										"time" : new Date()
						        }
						        $.ajaxSettings.async = false; 
						        $.get(url, args); 
						        $.ajaxSettings.async = true; 
						        
						        var url2;
						        console.log("type:"+type);
						        if(type=="举报文章") url2="${pageContext.request.contextPath}/servlet/UpdateArticle";
						        else if(type=="举报评论") url2="${pageContext.request.contextPath}/servlet/UpdateComment";
						        else if(type=="举报回复") url2="${pageContext.request.contextPath}/servlet/UpdateAnswer";
						        var args2={
						        		"content_id" : content_id,
						        		"status":"屏蔽",
										"time" : new Date()
						        }
						        
						        
						        
						        $.ajaxSettings.async = false; 
						        $.get(url2, args2,
										function(data) {
							        	$("#current___"+i).empty().append('<span>已处理</span>');
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

<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="threeblog.entity.*" %>
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
	ArrayList<Report> reports=service.getReportFromUser_id(user_id);
%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>我的举报</title>
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
		        var url2="${pageContext.request.contextPath}/servlet/UpdateReport";
		        var args={
		        		"report_id" : report_id,
		        		"status3":"已确定",
						"time" : new Date()
		        }
		        $.ajaxSettings.async = false; 
		        $.get(url2, args,
						function(data) {
			        	$("#current___"+i).empty().append('<span>已确定</span>');
			        	var new_content=$("#report_table").find("#current____"+i).clone();
			        	//删除
			        	$("#report_table").find("#current____"+i).remove();
			        	//添加
			        	$("#report_table").append(new_content);	
				}); 
		       
		        $.ajaxSettings.async = true; 
		    }  
		});
</script>
</head>

<body>
<div id="report_details" style="border:1px solid;border-style:solid;width:960px;background-color:#FFF;">
       
   
        <table id="report_table" border="1">
   	
    <tr>
    <th width="60%">违规通知</th>
    <th width="20%">违规类型</th>
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
		if (report.getStatus().equals("已处理")&&report.getStatus2().equals("屏蔽")&&report.getStatus3().equals("未确定")) {
			if(report.getType().equals("举报文章")){
	%>
	
		<tr id="current____<%=j%>">
	
		<td>你的博文<a href="<%=report.getUrl()%>">“<%=report.getContent() %>”</a>因涉嫌违规，已被屏蔽</td>
	    <td><%=report.getSimple_reason() %><span style="display:none;" id="current<%=j%>" data="<%=report.getId()%>"></span></td>
	    <td id="current___<%=j%>">
	    <a href="javascript:;" id="current__<%=j %>" style="cursor:pointer;background-color:#FFF;font-size:14px;margin-right:20px;border:1px solid;">确定</a>
	    <a href="${pageContext.request.contextPath}/jsp/feedback/feedback.jsp?id=<%=report.getId() %>" style="border:1px solid; color:#000;">反馈</a>
	    </td>

		</tr>
	<%
	++j;}else if(report.getType().equals("举报评论")){
	%>
	
	<tr id="current____<%=j%>">
	
		<td>你的评论<a href="<%=report.getUrl()%>">“<%=report.getContent() %>”</a>因涉嫌违规，已被屏蔽</td>
	    <td><%=report.getSimple_reason() %><span style="display:none;" id="current<%=j%>" data="<%=report.getId()%>"></span></td>
	    <td id="current___<%=j%>">
	    <a href="javascript:;" id="current__<%=j %>" style="cursor:pointer;background-color:#FFF;font-size:14px;margin-right:20px;border:1px solid;">确定</a>
	    <a href="${pageContext.request.contextPath}/jsp/feedback/feedback.jsp?id=<%=report.getId() %>" style="border:1px solid; color:#000;">反馈</a>
	    </td>

		</tr>
	
	<%++j;}else if(report.getType().equals("举报回复")){ %>
		
		<tr id="current____<%=j%>">
	
		<td>你的回复<a href="<%=report.getUrl()%>">“<%=report.getContent() %>”</a>因涉嫌违规，已被屏蔽</td>
	    <td><%=report.getSimple_reason() %><span style="display:none;" id="current<%=j%>" data="<%=report.getId()%>"></span></td>
	    <td id="current___<%=j%>">
	    <a href="javascript:;" id="current__<%=j %>" style="cursor:pointer;background-color:#FFF;font-size:14px;margin-right:20px;border:1px solid;">确定</a>
	    <a href="${pageContext.request.contextPath}/jsp/feedback/feedback.jsp?id=<%=report.getId() %>" style="border:1px solid; color:#000;">反馈</a>
	    </td>

		</tr>
	<%++j;} %>

	<%
		}else if (report.getStatus().equals("已处理")&&report.getStatus2().equals("屏蔽")&&report.getStatus3().equals("已确定")) {
			if(report.getType().equals("举报文章")){
	%>
	
		<tr id="current____<%=j%>">
	
		<td>你的博文<a href="<%=report.getUrl()%>">“<%=report.getContent() %>”</a>因涉嫌违规，已被屏蔽</td>
	    <td><%=report.getSimple_reason() %></td>
	    <td>
	    <span>已确定</span>
	    </td>

		</tr>
	<%
	++j;}else if(report.getType().equals("举报评论")){
	%>
	
	<tr id="current____<%=j%>">
	
		<td>你的评论<a href="<%=report.getUrl()%>">“<%=report.getContent() %>”</a>因涉嫌违规，已被屏蔽</td>
	    <td><%=report.getSimple_reason() %></td>
	    <td>
		<span>已确定</span>
	    </td>

		</tr>
	
	<%++j;}else if(report.getType().equals("举报回复")){ %>
		
		<tr id="current____<%=j%>">
	
		<td>你的回复<a href="<%=report.getUrl()%>">“<%=report.getContent() %>”</a>因涉嫌违规，已被屏蔽</td>
	    <td><%=report.getSimple_reason() %></td>
	    <td>
		<span>已确定</span>
	    </td>

		</tr>
	<%++j;} %>
	
	<%}else if (report.getStatus().equals("已处理")&&report.getStatus2().equals("屏蔽")&&report.getStatus3().equals("反馈等待审核")) {
		if(report.getType().equals("举报文章")){
	%>
	
		<tr id="current____<%=j%>">
	
		<td>你的博文<a href="<%=report.getUrl()%>">“<%=report.getContent() %>”</a>因涉嫌违规，已被屏蔽</td>
	    <td><%=report.getSimple_reason() %></td>
	    <td>
	 	 <span>反馈等待审核</span>
	    </td>
	
		</tr>
	<%
	++j;}else if(report.getType().equals("举报评论")){
	%>
	
	<tr id="current____<%=j%>">
	
		<td>你的评论<a href="<%=report.getUrl()%>">“<%=report.getContent() %>”</a>因涉嫌违规，已被屏蔽</td>
	    <td><%=report.getSimple_reason() %></td>
	    <td>
	    <span>反馈等待审核</span>
	    </td>
	
		</tr>
	
	<%++j;}else if(report.getType().equals("举报回复")){ %>
		
		<tr id="current____<%=j%>">
	
		<td>你的回复<a href="<%=report.getUrl()%>">“<%=report.getContent() %>”</a>因涉嫌违规，已被屏蔽</td>
	    <td><%=report.getSimple_reason() %></td>
	    <td>
	    <span>反馈等待审核</span>
	    </td>
	
		</tr>
	<%++j;} %>
	
	<%}else if (report.getStatus().equals("已处理")&&report.getStatus2().equals("屏蔽")&&report.getStatus3().equals("审核不通过")) {
		if(report.getType().equals("举报文章")){
	%>
	
		<tr id="current____<%=j%>">
	
		<td>你的博文<a href="<%=report.getUrl()%>">“<%=report.getContent() %>”</a>因涉嫌违规，已被屏蔽</td>
	    <td><%=report.getSimple_reason() %></td>
	    <td>
	 	 <span>审核不通过</span>
	    </td>
	
		</tr>
	<%
	++j;}else if(report.getType().equals("举报评论")){
	%>
	
	<tr id="current____<%=j%>">
	
		<td>你的评论<a href="<%=report.getUrl()%>">“<%=report.getContent() %>”</a>因涉嫌违规，已被屏蔽</td>
	    <td><%=report.getSimple_reason() %></td>
	    <td>
	    <span>审核不通过</span>
	    </td>
	
		</tr>
	
	<%++j;}else if(report.getType().equals("举报回复")){ %>
		
		<tr id="current____<%=j%>">
	
		<td>你的回复<a href="<%=report.getUrl()%>">“<%=report.getContent() %>”</a>因涉嫌违规，已被屏蔽</td>
	    <td><%=report.getSimple_reason() %></td>
	    <td>
	    <span>审核不通过</span>
	    </td>
	
		</tr>
	<%++j;} %>
	
	<%}else if (report.getStatus().equals("已处理")&&report.getStatus2().equals("正常")&&report.getStatus3().equals("审核通过")) {
		if(report.getType().equals("举报文章")){
	%>
	
		<tr id="current____<%=j%>">
	
		<td>你的博文<a href="<%=report.getUrl()%>">“<%=report.getContent() %>”</a>因涉嫌违规，已被屏蔽</td>
	    <td><%=report.getSimple_reason() %></td>
	    <td>
	 	 <span>审核通过</span>
	    </td>
	
		</tr>
	<%
	++j;}else if(report.getType().equals("举报评论")){
	%>
	
	<tr id="current____<%=j%>">
	
		<td>你的评论<a href="<%=report.getUrl()%>">“<%=report.getContent() %>”</a>因涉嫌违规，已被屏蔽</td>
	    <td><%=report.getSimple_reason() %></td>
	    <td>
	    <span>审核通过</span>
	    </td>
	
		</tr>
	
	<%++j;}else if(report.getType().equals("举报回复")){ %>
		
		<tr id="current____<%=j%>">
	
		<td>你的回复<a href="<%=report.getUrl()%>">“<%=report.getContent() %>”</a>因涉嫌违规，已被屏蔽</td>
	    <td><%=report.getSimple_reason() %></td>
	    <td>
	    <span>审核通过</span>
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
</body>
</html>
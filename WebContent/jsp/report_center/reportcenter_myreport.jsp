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
	ArrayList<Report> reports=service.getReportFromAuthor_id(user_id);
%>     
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>我的举报</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css" type="text/css"/>
</head>

<body>
 <div id="report_details" style="border:1px;border-style:solid;width:960px;background-color:#FFF;">
        <table id="report_table" border="1">
    <tr>
    <th width="15%">被举报人</th>
    <th width="45%">被举报内容与说明</th>
    <th width="20%">举报类型</th>
    <th width="20%">处理状态</th>
    </tr>
    <%
    if(!reports.isEmpty()){ 
    	for(int i=0;i<reports.size();i++){
    		Report report=reports.get(i);
    		if(report.getStatus().equals("已处理")&&report.getStatus2().equals("正常")){
    		 if(report.getType().equals("举报文章")){	
    %>
    <tr>
    <td><%=report.getUsername() %></td>
    <td>被举报文章：<a style="color:#000" href="<%=report.getUrl()%>">“<%=report.getContent() %>”</a><br>详细理由：<%=report.getAll_reason() %></td>
    <td><%=report.getSimple_reason() %></td>
    <td>管理员已处理 判定结果：正常用户行为</td>
    </tr>
    <%}else if(report.getType().equals("举报评论")){ %>
    <tr>
    <td><%=report.getUsername() %></td>
    <td>被举报评论：<a style="color:#000" href="<%=report.getUrl()%>">“<%=report.getContent() %>”</a><br>详细理由：<%=report.getAll_reason() %></td>
    <td><%=report.getSimple_reason() %></td>
    <td>管理员已处理 判定结果：正常用户行为</td>
    </tr>
    <%}else{ %>
    <tr>
    <td><%=report.getUsername() %></td>
    <td>被举报回复：<a style="color:#000" href="<%=report.getUrl()%>">“<%=report.getContent() %>”</a><br>详细理由：<%=report.getAll_reason() %></td>
    <td><%=report.getSimple_reason() %></td>
    <td>管理员已处理 判定结果：正常用户行为</td>
    </tr>
    <%} %>
    

    <%}else if(report.getStatus().equals("已处理")&&report.getStatus2().equals("屏蔽")){
		 if(report.getType().equals("举报文章")){	
			    %>
			    <tr>
			    <td><%=report.getUsername() %></td>
			    <td>被举报文章：<a style="color:#000" href="<%=report.getUrl()%>">“<%=report.getContent() %>”</a><br>详细理由：<%=report.getAll_reason() %></td>
			    <td><%=report.getSimple_reason() %></td>
			    <td>管理员已处理 判定结果：内容已屏蔽</td>
			    </tr>
			    <%}else if(report.getType().equals("举报评论")){ %>
			    <tr>
			    <td><%=report.getUsername() %></td>
			    <td>被举报评论：<a style="color:#000" href="<%=report.getUrl()%>">“<%=report.getContent() %>”</a><br>详细理由：<%=report.getAll_reason() %></td>
			    <td><%=report.getSimple_reason() %></td>
			    <td>管理员已处理 判定结果：内容已屏蔽</td>
			    </tr>
			    <%}else{ %>
			    <tr>
			    <td><%=report.getUsername() %></td>
			    <td>被举报回复：<a style="color:#000" href="<%=report.getUrl()%>">“<%=report.getContent() %>”</a><br>详细理由：<%=report.getAll_reason() %></td>
			    <td><%=report.getSimple_reason() %></td>
			    <td>管理员已处理 判定结果：内容已屏蔽</td>
			    </tr>
			    <%} %>
    
    
    <%}else if(report.getStatus().equals("未处理")){
    	 if(report.getType().equals("举报文章")){	
    		    %>
    		    <tr>
    		    <td><%=report.getUsername() %></td>
    		    <td>被举报文章：<a style="color:#000" href="<%=report.getUrl()%>">“<%=report.getContent() %>”</a><br>详细理由：<%=report.getAll_reason() %></td>
    		    <td><%=report.getSimple_reason() %></td>
    		    <td>等待处理</td>
    		    </tr>
    		    <%}else if(report.getType().equals("举报评论")){ %>
    		    <tr>
    		    <td><%=report.getUsername() %></td>
    		    <td>被举报评论：<a style="color:#000" href="<%=report.getUrl()%>">“<%=report.getContent() %>”</a><br>详细理由：<%=report.getAll_reason() %></td>
    		    <td><%=report.getSimple_reason() %></td>
    		    <td>等待处理</td>
    		    </tr>
    		    <%}else{ %>
    		    <tr>
    		    <td><%=report.getUsername() %></td>
    		    <td>被举报回复：<a style="color:#000" href="<%=report.getUrl()%>">“<%=report.getContent() %>”</a><br>详细理由：<%=report.getAll_reason() %></td>
    		    <td><%=report.getSimple_reason() %></td>
    		    <td>等待处理</td>
    		    </tr>
    		    <%} %>	
    <%}%>
    	
    <%}} %>
    
    </table>
            	
        
      </div>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="threeblog.entity.*" %>
<%@ page import="threeblog.service.Service" %>
<%@page import="java.util.ArrayList"%>
<%
	int user_id = 10240;
	user_id = Integer.valueOf((String) session.getAttribute("user_id"));
	Service service=new Service();
	ArrayList<Follow> follows = service.getFollowFromFollower_id(user_id);
%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>我的粉丝</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css" type="text/css"/>
</head>

<body>
	<!--中间栏begin-->
        <div id="othercenter_body">
        	<div id="othercenter_info">
        		<h1 style=" font-size:24px; width:960px; margin-left:40px;">█ 我的粉丝</h1>
            	<table class="zebra">
    <thead>
    <tr>
        <th >#</th>        
        <th>用户名</th>
        <th>被关注时间</th>
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
    if(!follows.isEmpty()){
    	for(int i=0;i<follows.size();i++){
    		Follow follow=follows.get(i);
    		User following=service.getUserFromId(follow.getFollowing_id());
    %>
    <tr>

        <td><%=i+1 %></td>   
        <td><%=following.getUsername() %></td>
        <td><%=follow.getFollow_date() %></td>
        <td><a href="${pageContext.request.contextPath}/jsp/other_center/otherscenter.jsp?id=<%=follow.getFollowing_id() %>" target="_blank"><span>查看Ta的个人主页&emsp;</span></a>
        </td>
    </tr>  
       <%}} %>   
   
</tbody></table>
            	
            </div>
        </div>
        <!--中间栏end-->
</body>
</html>

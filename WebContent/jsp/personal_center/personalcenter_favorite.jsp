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
	ArrayList<Collect> collects = service.getCollectFromUser_id(user_id);
%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>我的收藏</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css" type="text/css"/>
</head>

<body>
	<!--中间栏begin-->
        <div id="othercenter_body">
        	<div id="othercenter_info">
        		<h1 style=" font-size:24px; width:960px; margin-left:40px;">█ 我的收藏</h1>
            	<table class="zebra">
    <thead>
    <tr>
        <th >#</th>        
        <th>标题</th>
        <th>收藏时间</th>
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
							if (!collects.isEmpty()) {
								for (int i = 0; i < collects.size(); i++) {
									Collect collect = collects.get(i);
									Article article = service.getArticleFromId(collect.getArticle_id());
						%>
						
						
						<tr>
					        <td><%=i + 1%></td>        
					        <td><%=article.getTitle() %></td>
					        <td><%=article.getPublishdate() %></td>
					        <td><a href="${pageContext.request.contextPath}/jsp/article/article.jsp?id=<%=article.getId() %>" target="_blank"><span>查看&emsp;</span></a><span>取消</span>
					       
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
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ListIterator"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="threeblog.entity.Article" %>
<%@ page import="threeblog.service.Service" %>
<%
	int user_id = 10240;
	user_id = Integer.valueOf((String) session.getAttribute("user_id"));

	ArrayList<Article> articles = new ArrayList<Article>();
	Service service = new Service();
	articles = service.getArticlesFromId(user_id);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>我的博文</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css" type="text/css"/>
</head>

<body>
	<!--中间栏begin-->
        <div id="othercenter_body">
        	<div id="othercenter_info">
            	<br/>
        		 <span style="font-size:24px; width:500px;margin-left:40px; font-weight:bold;">█ 我的博文</span>
                  <a href="${pageContext.request.contextPath}/jsp/article/publish.jsp"><span style="font-size:20px; width:100px;margin-right:30px; font-weight:bold; float:right; color:#000;">+写博文</span></a><br/><br/>
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
    <tbody><%
							if (!articles.isEmpty()) {
								for (int i = 0; i < articles.size(); i++) {
									Article article = articles.get(i);
						%>
						<tr>

							<td><%=i + 1%></td>
							<td><%=article.getTitle()%></td>
							<td><%=article.getPublishdate()%></td>
							 <td><a href="${pageContext.request.contextPath}/jsp/article/article.jsp?id=<%=article.getId() %>" target="_blank"><span>查看&emsp;</span></a>
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

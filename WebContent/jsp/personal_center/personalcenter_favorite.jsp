<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="threeblog.entity.*" %>
<%@ page import="threeblog.service.Service" %>
<%@page import="java.util.ArrayList"%>
<%
	int user_id = 10240;
	user_id = Integer.valueOf((String) session.getAttribute("user_id"));
	Service service=new Service();
	ArrayList<Collect> collects = service.getCollectFromUser_id(user_id);
%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>我的收藏</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css" type="text/css"/>

<script>

$(document)
.ready(
		function() {	
			for (var i=0; i<<%=collects.size()%>; i++){  
				$("[id=current_"+i+"]").bind("click", {index: i}, clickHandler);  
		    }  
		  
		    function clickHandler(event) {  
		        var i= event.data.index;  
		        var collect_id=$("#current_"+i).attr("data");
		        
		        var url2="${pageContext.request.contextPath}/servlet/DeleteCollect";
		        var args={
		        		"collect_id" : collect_id,
						"time" : new Date()
		        }
		        $.ajaxSettings.async = false; 
		        $.get(url2, args,
						function(data) {
		        	$("#current"+i).remove();
				}); 
		       
		        $.ajaxSettings.async = true; 
		    }  
		});

</script>
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
						
						
						<tr id="current<%=i%>">
					        <td><%=i + 1%></td>        
					        <td><%=article.getTitle() %></td>
					        <td><%=article.getPublishdate() %></td>
					        <td><a href="${pageContext.request.contextPath}/jsp/article/article.jsp?id=<%=article.getId() %>" target="_blank"><span>查看&emsp;</span></a>
					        <a href="javascript:;" id="current_<%=i%>" data="<%=collect.getId()%>" target="_blank"><span>取消</span></a>
					       
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

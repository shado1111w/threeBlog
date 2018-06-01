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
	if(request.getParameter("user_id")!=null){
		int u_id=Integer.valueOf(request.getParameter("user_id"));
		System.out.println(u_id);
	}
	int user_id2=10240;
	if(request.getParameter("user_id")!=null)
		user_id2=Integer.valueOf(request.getParameter("user_id"));
	User user2=service.getUserFromId(user_id2);
	
%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>限制管理</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css" type="text/css"/>
</head>

<body>
<!--限制管理begin--> 
         <div id="messagecenter_reviews">
         	<span style="font-size:20px; width:500px;margin-left:40px; font-weight:bold;">█ 限制管理</span><br/>
            <form action="${pageContext.request.contextPath}/servlet/UpdateUser">
            <div style="margin:20px 100px;margin-right:20px;">
            <%if(user_id2!=10240){ %>
           <span style=" font-size:24px;"> 这个人：</span> <input name="username" type="text" style=" font-size:24px;width:400px; border:1px solid;" placeholder="用户名" value="<%=user2.getUsername()%>"/><br/><br/>
   			<%}else{ %>
   		 <span style=" font-size:24px;"> 这个人：</span> <input name="username" type="text" style=" font-size:24px;width:400px; border:1px solid;" placeholder="用户名" /><br/><br/>
   			<%} %>
   			<span style=" font-size:24px;"> 将被限制登录直到：</span> <input type="date" name="ban_time" style="border:1px solid;margin-left:160px;"/>
           </div>
           
           <input type="submit" value="封印" style="margin-left:320px; width:80px; height:50px; font-size:20px; margin-top:30px; margin-bottom:30px; border:1px solid;  background-color:#FFF; border-radius:5px;"/>
       		
           </form>
 </div>
    <!--限制管理end--> 
</body>
</html>

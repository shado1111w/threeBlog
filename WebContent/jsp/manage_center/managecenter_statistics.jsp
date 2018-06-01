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
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>用户统计</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css" type="text/css"/>
</head>

<body>
 <!--用户统计begin--> 
         <div id="messagecenter_reviews">
         	<span style="font-size:20px; width:500px;margin-left:40px; font-weight:bold;">█ 用户统计</span><br/>
           <div style="margin:20px 100px;">
            <span style="font-size:24px;">注册用户统计</span><br/>
            <ul>
            <li    style="font-size:20px;height:20px;margin-left:150px;margin-bottom:20px;">当天新增注册用户：<%=service.getRegisterNum1() %></li>
            <li  style="font-size:20px;height:20px;margin-left:150px;margin-bottom:20px;">近七天新增注册用户：<%=service.getRegisterNum2() %></li>
            <li   style="font-size:20px;height:20px;margin-left:150px;margin-bottom:20px;">近一月新增注册用户：<%=service.getRegisterNum3() %></li>
            </ul>
            </div>
            <div style="margin:20px 100px;margin-bottom:50px;">
            <span style="font-size:24px;">登录用户统计</span><br/>
             <ul>
            <li    style="font-size:20px;height:20px;margin-left:150px;margin-bottom:20px;">当天登录用户：<%=service.getRegisterNum4() %></li>
            <li  style="font-size:20px;height:20px;margin-left:150px;margin-bottom:20px;">近七天登录用户：<%=service.getRegisterNum5() %></li>
            <li   style="font-size:20px;height:20px;margin-left:150px;margin-bottom:20px;">近一月登录用户：<%=service.getRegisterNum6() %></li>
            </ul>
      
            </div>
         </div>  
    <!--用户统计end--> 
</body>
</html>

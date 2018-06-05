<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>登录</title>
<link href="${pageContext.request.contextPath}/css/main.css" rel="stylesheet" type="text/css"/>
</head>

<body>
	<div id="signin">
    	<div id="signin_logo">
    	<img src="${pageContext.request.contextPath}/image/footer_logo.png" />
    	</div>
        <hr style="FILTER: alpha(opacity=100,finishopacity=0,style=3)" width="80%" color=#987cb9 SIZE=3>
        <div id="signin_input">
        	<form action="${pageContext.request.contextPath}/servlet/Login" method="post">
	        	<div id="signin_zhmm">
	            	<span>账号 ：</span><input type="text" name="zh" style="height:23px;width:250px"  required><br><br>
	                <span>密码 ：</span><input type="password" name="mm" style="height:23px;width:250px" required>
	            </div>
	            <div id="signin_forgetps">
	           		 <a href="${pageContext.request.contextPath}/jsp/login/forget_password.jsp">忘记密码？</a><br>
	            	<input type="checkbox" id="yanzheng" checked style="width:20px;height:20px;"/><label for="yanzheng">登录/注册表示你同意 服务条款 与 隐私政策</label>
	            </div>
	       
	        		<input type="submit" name="submit" class="signin_dlzc" style="font-weight:bold;font-size: 36px;color:#fff;" value="登录" />
	           		<div class="signin_dlzc"><a href="${pageContext.request.contextPath}/jsp/login/register.jsp" >注册</a></div>
	           		<%if(request.getHeader("Referer")!=null){ %>
	           		<input type="hidden"  name="li_url" value="<%=request.getHeader("Referer")%>">   
	           		<%}else{ %>
	           		<input type="hidden"  name="li_url" value="">  
	           		<%} %>
             </form>
        </div>
    </div>
</body>
</html>

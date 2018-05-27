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
    	<img src="image/footer_logo.png" />
    	</div>
        <hr style="FILTER: alpha(opacity=100,finishopacity=0,style=3)" width="80%" color=#987cb9 SIZE=3>
        <div id="signin_input">
        	<div id="signin_zhmm">
            	<span>账号 ：</span><input type="text" name="zh" style="height:23px;width:250px;" placeholder="请输入手机号" ><br><br>
                <span>密码 ：</span><input type="password" name="mm" style="height:23px;width:250px" placeholder="请输入密码" >
            </div>
            <div id="signin_forgetps">
           		 <a href="forget password.html">忘记密码？</a><br>
            	<input type="checkbox" id="yanzheng" checked style="width:20px;height:20px;"/><label for="yanzheng">登录/注册表示你同意 服务条款 与 隐私政策</label>
            </div>
            <div class="signin_dlzc1">
        		<a  href="#">登 录</a></div>
            <div class="signin_dlzc">
            	<a  href="register.html">注 册</a> </div>
             
        </div>
    </div>
</body>
</html>

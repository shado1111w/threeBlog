<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>注册</title>
<link rel="stylesheet"href="${pageContext.request.contextPath}/css/main.css" type="text/css"/>
</head>

<body>
	<div id="signin">
    	<div id="signin_logo"><img src="image/footer_logo.png" /></div>
        <hr style="FILTER: alpha(opacity=100,finishopacity=0,style=3)" width="80%" color=#987cb9 SIZE=3>
        <div id="signin_input">
        	<form action="servlet/Register" action="" method="post">
	        	<div id="signin_zcmm1">
	            	<span>手 机 号 ：</span>
	            	<input type="text" id="zh" name="username" style="height:23px;width:325px;margin-left:8px;" required ><br><br>
	                <span>验 证 码 ：</span> 
	                <input type="text" id="yzm" name="ranks" style="height:23px;width:235px;margin-left:8px;" required> 
	                  <a href="javascript:;" method="post"
						class="send1" onclick="return sends.send();">发送验证码</a><br><br>
	                <span>密  &emsp; 码 ：</span> 
	                <input type="password" id="xmm" name="pass1" style="height:23px;width:325px;margin-left:8px;" required><br><br>
	                <span>确认密码 ：</span><input type="password" id="zcsrmm" name="pass2" style="height:23px;width:325px" required>
	            </div>
	            
	            <div id="xieyi">
	            	<input type="checkbox" id="yanzheng1" checked style="width:20px;height:20px;"/><label for="yanzheng1">登录/注册表示你同意 服务条款 与 隐私政策</label>
	            </div>
	        	<input type="submit" name="submit" id="signin_zhuce" value="注册" />
                 
	        </form>	
            
            <a href="signin.html" style="font-size:20px; font-weight:bold;color:#000;margin-left:150px;margin-top:50px;;">已有账号？立即登录</a>
        </div>
    </div>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>忘记密码</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css" type="text/css" />
</head>

<body>
	<div id="signin">
    	<div id="signin_logo">
    	<img src="${pageContext.request.contextPath}/image/footer_logo.png" />
    	</div>
        <hr style="FILTER: alpha(opacity=100,finishopacity=0,style=3)" width="80%" color=#987cb9 SIZE=3>
        <div id="signin_input">
        	<div id="signin_xgmm">
            	<span>账   &nbsp;&nbsp; 号 ：</span>
            	<input type="text" id="zh" style="height:23px;width:340px" ><br><br>
                <span>验证码 ：</span> 
                <input type="text" id="yzm" style="height:23px;width:250px" > 
                  <a href="javascript:;" method="post"
						class="send1" onclick="return sends.send();">发送验证码</a><br><br>
                <span>新密码 ：</span> 
                <input type="password" id="xmm" style="height:23px;width:340px" ><br><br>
                <span>再次输入新密码 ：</span><input type="password" id="zcsrmm" style="height:23px;width:225px" >
            </div>
            <div id="signin_xg">
        		<a  href="#">修改</a></div>
        </div>
    </div>
</body>
</html>

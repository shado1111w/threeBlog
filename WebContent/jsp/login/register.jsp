<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>注册</title>
<script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
<link rel="stylesheet"href="${pageContext.request.contextPath}/css/main.css" type="text/css"/>
<script>
	var sends = {
		checked : 1,
		send : function() {
			var numbers = /^1\d{10}$/;
			var val = $('#zh').val().replace(/\s+/g, ""); //获取输入手机号码
			if ($('#signin_zcmm1 a').attr('class') == 'send1') {
				if (!numbers.test(val) || val.length == 0) {
					alert("手机号码格式错误,请重新输入");	
				}	
				
			}
			if (numbers.test(val)) {
				
				var url = "${pageContext.request.contextPath}/servlet/Zhucheguoma";
				var args = {
					"phone" : val,
					"time" : new Date()
				};
				$.get(url, args,function(data) {
					var result=eval("("+data+")");
					if(result.bol){
						var url = "${pageContext.request.contextPath}/servlet/Ranks";
						var args = {
							"phone" : val,
							"time" : new Date()
						};
						$.get(url, args);
						alert("已将验证码发送到你的手机，请注意查收");
					}
					else{
						alert("该手机号已注册，请重新输入");
						$("#zh").val("");
						$("#zh").focus();
						}
				});
				
				var time = 30;
				function timeCountDown() {
					if (time == 0) {
						clearInterval(timer);
						$('#signin_zcmm1 a').removeClass('send0').addClass('send1').html("发送验证码");
						$('#signin_zcmm1 a').attr('onclick','return sends.send();'); 
						sends.checked = 1;
						return true;
					}
					$('#signin_zcmm1 a').html(time + "S后再次发送");
					time--;
					return false;
					sends.checked = 0;
				}
				$('#signin_zcmm1 a').removeClass('send1').addClass('send0');
				$('#signin_zcmm1 a').attr('onclick',''); 
				timeCountDown();
				var timer = setInterval(timeCountDown, 1000);
			}
		}
	}
</script>
<script type="text/javascript">
	$(document)
	.ready(
			function() {
				
				$("#zcsrmm")
						.blur(
								function() {
									var pass1 = $("#xmm").val();
									var pass2 = $("#zcsrmm").val();
									if(pass1!=""){
										
										if(pass1!=pass2){
											alert("输入密码不一致，请重新输入");
											$("#xmm").val("");
											$("#zcsrmm").val("");
											$("#xmm").focus();
											
										}
										
									}
								});
			});
	$(document)
	.ready(
			function() {
				$("#xmm")
						.blur(
								function() {
									var pass1 = $("#xmm").val();
									var pass2 = $("#zcsrmm").val();
									if(pass2!=""){
										
										if(pass1!=pass2){
											alert("输入密码不一致，请重新输入");
											$("#xmm").val("");
											$("#zcsrmm").val("");
											$("#zcsrmm").focus();
										}
										
									}
								});
			});
	
</script>

<script type="text/javascript">
$(document)
.ready(
		function() {
			$("#yzm")
					.blur(
							function() {
							
								var val = $("#yzm").val();
								val = $.trim(val);
								 if (val != "") {
									var url = "${pageContext.request.contextPath}/servlet/ValiateRanks";
									var args = {
										"mobile_code" : val,
										"time" : new Date()
									};
									$.get(url, args,
											function(data) {
												var result=eval("("+data+")");
												if(result.bol==1){
													alert("请先获取验证码！");
													$("#yzm").val("");
													$("#yzm").focus();
												}else if(result.bol==3){
													alert("验证码错误，请重新输入！");
													$("#yzm").val("");
													$("#yzm").focus();
												}else{
													alert("验证成功！");
												}
									});
								} 
								
							});
		});
</script>
<script>
$(document)
.ready(
		function() {
			$("#username")
					.blur(
							function() {
							
								var val = $("#username").val();
								val = $.trim(val);
								 if (val != "") {
									var url = "${pageContext.request.contextPath}/servlet/Shiyongguoma";
									var args = {
										"username" : val,
										"time" : new Date()
									};
									$.get(url, args,
											function(data) {
												var result=eval("("+data+")");
												if(result.bol){
													alert("该用户名未被使用");
												}
												else{
													alert("该用户名已被使用，请重新输入");
													$("#username").val("");
													$("#username").focus();
												}
									});
								} 
								
							});
		});
	
</script>
</head>

<body>
	<div id="signin">
    	<div id="signin_logo"><img src="${pageContext.request.contextPath}/image/footer_logo.png" /></div>
        <hr style="FILTER: alpha(opacity=100,finishopacity=0,style=3)" width="80%" color=#987cb9 SIZE=3>
        <div id="signin_input">
        	<form action="${pageContext.request.contextPath}/servlet/Register" action="" method="post">
	        	<div id="signin_zcmm1">
	            	<span>手 机 号 ：</span>
	            	<input type="text" id="zh" name="phonenum" style="height:23px;width:325px;margin-left:8px;" required ><br><br>
	            	<span>用 户 名 ：</span>
	            	<input type="text" id="username" name="username" style="height:23px;width:325px;margin-left:8px;" placeholder="注册后不可修改！" required ><br><br>
	                <span>验 证 码 ：</span> 
	                <input type="text" id="yzm" name="ranks" style="height:23px;width:235px;margin-left:8px;" required> 
	                  <a href="javascript:;" method="post"
						class="send1" onclick="return sends.send();">发送验证码</a><br><br>
	                <span>密  &emsp; 码 ：</span> 
	                <input type="password" id="xmm" name="pass1" style="height:23px;width:325px;margin-left:8px;" required><br><br>
	                <span>确认密码 ：</span><input type="password" id="zcsrmm" name="pass2" style="height:23px;width:325px;margin-left:5px;" required>
	            </div>

	            
	            <div id="xieyi">
	            	<input type="checkbox" id="yanzheng1" checked style="width:20px;height:20px;"/><label for="yanzheng1">登录/注册表示你同意 服务条款 与 隐私政策</label>
	            </div>
	        	<input type="submit" name="submit" id="signin_zhuce" value="注册" /> 
	        </form>	
            
            <a href="${pageContext.request.contextPath}/jsp/login/sign_in.jsp" style="font-size:20px; font-weight:bold;color:#000;margin-left:150px;margin-top:50px;;">已有账号？立即登录</a>
        </div>
    </div>
</body>
</html>
